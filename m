Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2FF70100
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 15:53:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 07 Feb 2017 07:53:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1091910330"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.7.54])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2017 07:53:12 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 15:53:00 +0000
Message-Id: <20170207155300.2830-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] pseudo: update to 1.8.2
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
X-List-Received-Date: Tue, 07 Feb 2017 15:53:15 -0000

Update to the newly minted 1.8.2, dropping several patches we'd
backported since the last release.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../files/0001-Don-t-send-SIGUSR1-to-init.patch    |  48 ---------
 ...t-diagnostics-during-startup-for-pseudo-d.patch |  54 ----------
 .../files/0002-Use-correct-file-descriptor.patch   |  53 ----------
 ...nameat-parallel-to-previous-fix-to-rename.patch |  64 -----------
 .../pseudo/files/Fix-xattr-performance.patch       | 117 ---------------------
 .../pseudo/files/More-correctly-fix-xattrs.patch   |  37 -------
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  17 ---
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  11 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
 9 files changed, 13 insertions(+), 392 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb

diff --git a/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch b/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
deleted file mode 100644
index 6c694ce..0000000
--- a/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Thu, 22 Sep 2016 14:35:04 -0500
-Subject: [PATCH] Don't send SIGUSR1 to init.
-
-If the parent exits due to child process being slow, getppid() will return
-1, and we'll send SIGUSR1 to init, which can break things like dumbinit
-which aren't adequately protected against non-root processes sending them
-signals.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport (commit befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae)
-
-[YOCTO #10324]
-
-This resolves an issue where a docker container running builds would die
-due to it's 'mini init' being signaled by pseudo.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
----
- pseudo_server.c | 11 ++++++++---
-
-diff --git a/pseudo_server.c b/pseudo_server.c
-index 65102dd..8731d20 100644
---- a/pseudo_server.c
-+++ b/pseudo_server.c
-@@ -358,9 +358,14 @@ pseudo_server_start(int daemonize) {
- 	signal(SIGTERM, quit_now);
- 	/* tell parent process to stop waiting */
- 	if (daemonize) {
--		pseudo_diag("Setup complete, sending SIGUSR1 to pid %d.\n",
--			getppid());
--		kill(getppid(), SIGUSR1);
-+		pid_t ppid = getppid();
-+		if (ppid == 1) {
-+			pseudo_diag("Setup complete, but parent is init, not sending SIGUSR1.\n");
-+		} else {
-+			pseudo_diag("Setup complete, sending SIGUSR1 to pid %d.\n",
-+				ppid);
-+			kill(ppid, SIGUSR1);
-+		}
- 	}
- 	pseudo_server_loop();
- 	return 0;
--- 
-2.5.5
-
diff --git a/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch b/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
deleted file mode 100644
index d4b9f6a..0000000
--- a/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From eead8a505245a292c43f070c0e836cdfeb7bd7bd Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Wed, 28 Sep 2016 17:05:17 -0500
-Subject: [PATCH 1/2] Quiet diagnostics during startup for pseudo -d
-
-When the client spawns a pseudo server, it starts out sending diagnostics
-to stderr. This can be spammy in some cases with races during startup;
-everything resolves, but we get scary-looking diagnostics. So shove
-those into a log file.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- ChangeLog.txt   | 5 +++++
- pseudo_server.c | 4 +++-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index d6359ca..4cc24de 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,8 @@
-+2016-09-28:
-+	* (seebs) Send errors to log when daemonizing, but do that a lot
-+	  sooner to prevent startup messages which can show up spuriously
-+	  with multiple clients.
-+
- 2016-07-28:
- 	* (seebs) Fix performance issue on deletion with xattr changes.
- 
-diff --git a/pseudo_server.c b/pseudo_server.c
-index 8731d20..7c2db2f 100644
---- a/pseudo_server.c
-+++ b/pseudo_server.c
-@@ -162,6 +162,9 @@ pseudo_server_start(int daemonize) {
- 	 * SIGUSR1, or until too much time has passed. */
- 	if (daemonize) {
- 		int child;
-+
-+		/* make startup messages go away when invoked-as-daemon */
-+		pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
- 		child = fork();
- 		if (child == -1) {
- 			pseudo_diag("Couldn't fork child process: %s\n",
-@@ -231,7 +234,6 @@ pseudo_server_start(int daemonize) {
- 			setsid();
- 			fclose(stdin);
- 			fclose(stdout);
--			pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
- 			/* and then just execute the server code normally.  */
- 			/* Any logging will presumably go to logfile, but
- 			 * exit status will make it back to the parent for
diff --git a/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch b/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
deleted file mode 100644
index dd6fd87..0000000
--- a/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7a0632cad851826d804db0540d9a59773e6bf29c Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Wed, 28 Sep 2016 22:12:29 -0500
-Subject: [PATCH 2/2] Use correct file descriptor
-
-So it turns out that pseudo_logfile() was returning 0 or -1, and
-pseudo_debug_logfile() was expecting it to be the correct file descriptor
-to use. And it's basically a mystery that any of that ever worked.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- ChangeLog.txt | 3 +++
- pseudo_util.c | 3 ++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 4cc24de..49a6c36 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -2,6 +2,9 @@
- 	* (seebs) Send errors to log when daemonizing, but do that a lot
- 	  sooner to prevent startup messages which can show up spuriously
- 	  with multiple clients.
-+	* (seebs) return file descriptor from pseudo_logfile, so we set
-+	  pseudo_util_debug_fd to the right value instead of to stdin.
-+	  Nice bug.
- 
- 2016-07-28:
- 	* (seebs) Fix performance issue on deletion with xattr changes.
-diff --git a/pseudo_util.c b/pseudo_util.c
-index 0c156cf..a60c74b 100644
---- a/pseudo_util.c
-+++ b/pseudo_util.c
-@@ -1569,7 +1569,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
- 	if (fd == -1)
- 		return -1;
- 	else
--		return 0;
-+		return fd;
- }
- 
- int
-@@ -1579,6 +1579,7 @@ pseudo_debug_logfile(char *defname, int prefer_fd) {
- 
- 	fd = pseudo_logfile(filename, defname, prefer_fd);
- 	if (fd > -1) {
-+		pseudo_diag("debug_logfile: fd %d\n", fd);
- 		pseudo_util_debug_fd = fd;
- 		return 0;
- 	}
diff --git a/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch b/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
deleted file mode 100644
index 739c03e..0000000
--- a/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From d9ab3a0acc94151048498b1ea4d69e7707df1526 Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Fri, 30 Sep 2016 10:56:35 -0500
-Subject: [PATCH 3/3] Fix renameat (parallel to previous fix to rename)
-
-There was a bug in rename(), which was duplicated when renameat() was
-implemented, and which got fixed two years ago for rename(), but no
-one ever uses renameat() so it didn't get fixed there. Thanks
-to Anton Gerasimov <anton@advancedtelematic.com> for the bug report
-and patch.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
----
- ChangeLog.txt              | 4 ++++
- ports/unix/guts/renameat.c | 7 ++++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 65b9759..ca04cc0 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,7 @@
-+2016-09-30:
-+	* (seebs) Fix rename at, matching fix from ee00f63d for rename. Bug
-+	  and fix provided by Anton Gerasimov <anton@advancedtelematic.com>.
-+
- 2016-09-28:
- 	* (seebs) Send errors to log when daemonizing, but do that a lot
- 	  sooner to prevent startup messages which can show up spuriously
-diff --git a/ports/unix/guts/renameat.c b/ports/unix/guts/renameat.c
-index ade0509..d5e36fa 100644
---- a/ports/unix/guts/renameat.c
-+++ b/ports/unix/guts/renameat.c
-@@ -11,6 +11,7 @@
- 	int oldrc, newrc;
- 	int save_errno;
- 	int old_db_entry = 0;
-+	int may_unlinked = 0;
- 
- 	pseudo_debug(PDBGF_FILE, "renameat: %d,%s->%d,%s\n",
- 		olddirfd, oldpath ? oldpath : "<nil>",
-@@ -44,10 +45,14 @@
- 	/* as with unlink, we have to mark that the file may get deleted */
- 	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, newdirfd, newpath, newrc ? NULL : &newbuf);
- 	if (msg && msg->result == RESULT_SUCCEED)
-+		may_unlinked = 1;
-+	msg = pseudo_client_op(OP_STAT, 0, -1, olddirfd, oldpath, oldrc ? NULL : &oldbuf);
-+	if (msg && msg->result == RESULT_SUCCEED)
- 		old_db_entry = 1;
-+
- 	rc = real_renameat(olddirfd, oldpath, newdirfd, newpath);
- 	save_errno = errno;
--	if (old_db_entry) {
-+	if (may_unlinked) {
- 		if (rc == -1) {
- 			/* since we failed, that wasn't really unlinked -- put
- 			 * it back.
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch b/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
deleted file mode 100644
index 4e072e6..0000000
--- a/meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 0d9071f3090bbd7880558f3b488b236ac19b44fc Mon Sep 17 00:00:00 2001
-From: seebs <seebs@seebs.net>
-Date: Thu, 28 Jul 2016 14:02:12 -0500
-Subject: [PATCH 1/2] Fix xattr performance
-
-When deleting files, we *do* know the inode and attribute, most of the
-time, so we pass those in whenever possible. The full purge of unmatched
-xattrs should not happen when the correct dev/ino are believed to be known.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-[YOCTO #9929]
-Upstream-Status: Backport (0d9071f3090bbd7880558f3b488b236ac19b44fc)
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
----
- ChangeLog.txt |  3 +++
- pseudo.c      | 11 ++++++++---
- pseudo_db.c   | 15 +++++++++------
- pseudo_db.h   |  2 +-
- 4 files changed, 21 insertions(+), 10 deletions(-)
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index 131f163..d6359ca 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,6 @@
-+2016-07-28:
-+	* (seebs) Fix performance issue on deletion with xattr changes.
-+
- 2016-07-08:
- 	* (RP) release 1.8.1
- 	* (joshuagl) Fix log table creation issue
-diff --git a/pseudo.c b/pseudo.c
-index 52f649f..db1c400 100644
---- a/pseudo.c
-+++ b/pseudo.c
-@@ -600,7 +600,12 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
- 				if (by_path.deleting != 0) {
- 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion, deleting.\n",
- 						msg->path);
--					pdb_did_unlink_file(msg->path, by_path.deleting);
-+					/* in this case, we don't trust the
-+					 * existing entries, so we will do the
-+					 * more expensive sweep for stray
-+					 * xattrs.
-+					 */
-+					pdb_did_unlink_file(msg->path, NULL, by_path.deleting);
- 				} else {
- 					pseudo_diag("inode mismatch: '%s' ino %llu in db, %llu in request.\n",
- 						msg->path,
-@@ -698,7 +703,7 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
- 				if (by_ino.deleting != 0) {
- 					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion, deleting.\n",
- 						msg->path);
--					pdb_did_unlink_file(path_by_ino, by_ino.deleting);
-+					pdb_did_unlink_file(path_by_ino, &by_ino, by_ino.deleting);
- 				} else {
- 					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
- 						msg->nlink,
-@@ -930,7 +935,7 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
- 		}
- 		break;
- 	case OP_DID_UNLINK:
--		pdb_did_unlink_file(msg->path, msg->client);
-+		pdb_did_unlink_file(msg->path, msg, msg->client);
- 		break;
- 	case OP_CANCEL_UNLINK:
- 		pdb_cancel_unlink_file(msg);
-diff --git a/pseudo_db.c b/pseudo_db.c
-index 289bb29..e7dd193 100644
---- a/pseudo_db.c
-+++ b/pseudo_db.c
-@@ -1848,7 +1848,7 @@ pdb_did_unlink_files(int deleting) {
- 
- /* confirm deletion of a specific file by a given client */
- int
--pdb_did_unlink_file(char *path, int deleting) {
-+pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting) {
- 	static sqlite3_stmt *delete_exact;
- 	int rc, exact;
- 	char *sql_delete_exact = "DELETE FROM files WHERE path = ? AND deleting = ?;";
-@@ -1878,11 +1878,14 @@ pdb_did_unlink_file(char *path, int deleting) {
- 	exact = sqlite3_changes(file_db);
- 	pseudo_debug(PDBGF_DB, "(exact %d)\n", exact);
- 	sqlite3_reset(delete_exact);
--	sqlite3_clear_bindings(delete_exact);
--	/* we have to clean everything because we don't know for sure the
--	 * device/inode...
--	 */
--	pdb_clear_unused_xattrs();
-+	if (msg) {
-+		pdb_clear_xattrs(msg);
-+	} else {
-+		/* we have to clean everything because we don't know for sure the
-+		 * device/inode...
-+		 */
-+		pdb_clear_unused_xattrs();
-+	}
- 	return rc != SQLITE_DONE;
- }
- 
-diff --git a/pseudo_db.h b/pseudo_db.h
-index a54f3c1..1b2599c 100644
---- a/pseudo_db.h
-+++ b/pseudo_db.h
-@@ -39,7 +39,7 @@ typedef struct {
- 
- extern int pdb_maybe_backup(void);
- extern int pdb_cancel_unlink_file(pseudo_msg_t *msg);
--extern int pdb_did_unlink_file(char *path, int deleting);
-+extern int pdb_did_unlink_file(char *path, pseudo_msg_t *msg, int deleting);
- extern int pdb_did_unlink_files(int deleting);
- extern int pdb_link_file(pseudo_msg_t *msg);
- extern int pdb_may_unlink_file(pseudo_msg_t *msg, int deleting);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch b/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
deleted file mode 100644
index 3d178f9..0000000
--- a/meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 45eca34c754d416a38bee90fb2d3c110a0b6cc5f Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Thu, 3 Nov 2016 11:36:12 -0500
-Subject: [PATCH] More-correctly fix xattrs
-
-Fix provided by Patrick Ohly <patrick.ohly@intel.com>. This resolves
-the actual cause of the path length mismatches, and explains why
-I couldn't quite explain why the previous one had only sometimes
-worked, also why it showed up on directories but not plain files.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Fixes [YOCTO #10623]
-
-Upstream-Status: Backport [commit 45eca34c754d416a38bee90fb2d3c110a0b6cc5f]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
----
- pseudo_client.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pseudo_client.c b/pseudo_client.c
-index 6a08df3..b1a00fa 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -1676,7 +1676,7 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
- 	 * empty path for that.
- 	 */
- 	if (path_extra_1) {
--		size_t full_len = path_extra_1len + 1 + pathlen;
-+		size_t full_len = path_extra_1len + 1 + pathlen - strip_slash;
- 		size_t partial_len = pathlen - 1 - strip_slash;
- 		if (path_extra_2) {
- 			full_len += path_extra_2len + 1;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
deleted file mode 100644
index 90b53c0..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require pseudo.inc
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
-           file://0001-configure-Prune-PIE-flags.patch \
-           file://fallback-passwd \
-           file://fallback-group \
-           file://moreretries.patch \
-           file://Fix-xattr-performance.patch \
-           file://0001-Don-t-send-SIGUSR1-to-init.patch \
-           file://0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch \
-           file://0002-Use-correct-file-descriptor.patch \
-           file://0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch \
-           file://More-correctly-fix-xattrs.patch \
-           "
-
-SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
-SRC_URI[sha256sum] = "dac4ad2d21228053151121320f629d41dd5c0c87695ac4e7aea286c414192ab5"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
new file mode 100644
index 0000000..9e0213a
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
@@ -0,0 +1,11 @@
+require pseudo.inc
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
+           file://0001-configure-Prune-PIE-flags.patch \
+           file://fallback-passwd \
+           file://fallback-group \
+           file://moreretries.patch \
+           "
+
+SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
+SRC_URI[sha256sum] = "ceb456bd47770a37ca20784a91d715c5a7601e07e26ab11b0c77e9203ed3d196"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ac923bb..42c7b2e 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "45eca34c754d416a38bee90fb2d3c110a0b6cc5f"
-PV = "1.8.1+git${SRCPV}"
+SRCREV = "02168305b0a19f981ffe857f36eb256ba8810b77"
+PV = "1.8.2+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.9.3


