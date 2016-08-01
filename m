Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 20C0E6AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:00:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 01 Aug 2016 04:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,454,1464678000"; d="scan'208";a="1006219484"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.213])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2016 04:00:34 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 12:00:26 +0100
Message-Id: <eb1e2c02aa1135d8f673d775ee628d9ee5479dfe.1470049100.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470049100.git.joshua.g.lock@intel.com>
References: <cover.1470049100.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1470049100.git.joshua.g.lock@intel.com>
References: <cover.1470049100.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/2] pseudo: backport patch to fix xattr performance
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 11:00:35 -0000

In the 1.8 series of pseudo extended attribute handling was reworked
to be a property of inodes, not paths, and as a product fixed extended
attribute semantics on hardlinks. Unfortunately this rework introduced
a slow path around file deletion.

Add a patch for use by the pseudo 1.8.1 recipe which backports a fix
for this regression from the master branch of pseudo.

[YOCTO #9929]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../pseudo/files/Fix-xattr-performance.patch       | 117 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch

diff --git a/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch b/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
new file mode 100644
index 0000000..4e072e6
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
@@ -0,0 +1,117 @@
+From 0d9071f3090bbd7880558f3b488b236ac19b44fc Mon Sep 17 00:00:00 2001
+From: seebs <seebs@seebs.net>
+Date: Thu, 28 Jul 2016 14:02:12 -0500
+Subject: [PATCH 1/2] Fix xattr performance
+
+When deleting files, we *do* know the inode and attribute, most of the
+time, so we pass those in whenever possible. The full purge of unmatched
+xattrs should not happen when the correct dev/ino are believed to be known.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+[YOCTO #9929]
+Upstream-Status: Backport (0d9071f3090bbd7880558f3b488b236ac19b44fc)
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+---
+ ChangeLog.txt |  3 +++
+ pseudo.c      | 11 ++++++++---
+ pseudo_db.c   | 15 +++++++++------
+ pseudo_db.h   |  2 +-
+ 4 files changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 131f163..d6359ca 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,6 @@
++2016-07-28:
++	* (seebs) Fix performance issue on deletion with xattr changes.
++
+ 2016-07-08:
+ 	* (RP) release 1.8.1
+ 	* (joshuagl) Fix log table creation issue
+diff --git a/pseudo.c b/pseudo.c
+index 52f649f..db1c400 100644
+--- a/pseudo.c
++++ b/pseudo.c
+@@ -600,7 +600,12 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
+ 				if (by_path.deleting != 0) {
+ 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion, deleting.\n",
+ 						msg->path);
+-					pdb_did_unlink_file(msg->path, by_path.deleting);
++					/* in this case, we don't trust the
++					 * existing entries, so we will do the
++					 * more expensive sweep for stray
++					 * xattrs.
++					 */
++					pdb_did_unlink_file(msg->path, NULL, by_path.deleting);
+ 				} else {
+ 					pseudo_diag("inode mismatch: '%s' ino %llu in db, %llu in request.\n",
+ 						msg->path,
+@@ -698,7 +703,7 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
+ 				if (by_ino.deleting != 0) {
+ 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion, deleting.\n",
+ 						msg->path);
+-					pdb_did_unlink_file(path_by_ino, by_ino.deleting);
++					pdb_did_unlink_file(path_by_ino, &by_ino, by_ino.deleting);
+ 				} else {
+ 					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
+ 						msg->nlink,
+@@ -930,7 +935,7 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
+ 		}
+ 		break;
+ 	case OP_DID_UNLINK:
+-		pdb_did_unlink_file(msg->path, msg->client);
++		pdb_did_unlink_file(msg->path, msg, msg->client);
+ 		break;
+ 	case OP_CANCEL_UNLINK:
+ 		pdb_cancel_unlink_file(msg);
+diff --git a/pseudo_db.c b/pseudo_db.c
+index 289bb29..e7dd193 100644
+--- a/pseudo_db.c
++++ b/pseudo_db.c
+@@ -1848,7 +1848,7 @@ pdb_did_unlink_files(int deleting) {
+ 
+ /* confirm deletion of a specific file by a given client */
+ int
+-pdb_did_unlink_file(char *path, int deleting) {
++pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting) {
+ 	static sqlite3_stmt *delete_exact;
+ 	int rc, exact;
+ 	char *sql_delete_exact = "DELETE FROM files WHERE path = ? AND deleting = ?;";
+@@ -1878,11 +1878,14 @@ pdb_did_unlink_file(char *path, int deleting) {
+ 	exact = sqlite3_changes(file_db);
+ 	pseudo_debug(PDBGF_DB, "(exact %d)\n", exact);
+ 	sqlite3_reset(delete_exact);
+-	sqlite3_clear_bindings(delete_exact);
+-	/* we have to clean everything because we don't know for sure the
+-	 * device/inode...
+-	 */
+-	pdb_clear_unused_xattrs();
++	if (msg) {
++		pdb_clear_xattrs(msg);
++	} else {
++		/* we have to clean everything because we don't know for sure the
++		 * device/inode...
++		 */
++		pdb_clear_unused_xattrs();
++	}
+ 	return rc != SQLITE_DONE;
+ }
+ 
+diff --git a/pseudo_db.h b/pseudo_db.h
+index a54f3c1..1b2599c 100644
+--- a/pseudo_db.h
++++ b/pseudo_db.h
+@@ -39,7 +39,7 @@ typedef struct {
+ 
+ extern int pdb_maybe_backup(void);
+ extern int pdb_cancel_unlink_file(pseudo_msg_t *msg);
+-extern int pdb_did_unlink_file(char *path, int deleting);
++extern int pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting);
+ extern int pdb_did_unlink_files(int deleting);
+ extern int pdb_link_file(pseudo_msg_t *msg);
+ extern int pdb_may_unlink_file(pseudo_msg_t *msg, int deleting);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index 3381df0..f45912a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -5,6 +5,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://fallback-passwd \
            file://fallback-group \
            file://moreretries.patch \
+           file://Fix-xattr-performance.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
-- 
2.7.4


