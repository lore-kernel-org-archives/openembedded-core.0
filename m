Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 164CD60102
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 15:45:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Oct 2016 08:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,454,1473145200"; d="scan'208";a="1041208974"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.29.86])
	by orsmga001.jf.intel.com with ESMTP; 06 Oct 2016 08:45:25 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 16:45:20 +0100
Message-Id: <1475768720-21649-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pseudo: backport a patch to fix renameat()
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
X-List-Received-Date: Thu, 06 Oct 2016 15:45:25 -0000

renameat calls under pseudo were losing extended attributes.
Backport the fix for this from pseudo upstream.

[YOCTO '10349]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 ...nameat-parallel-to-previous-fix-to-rename.patch | 64 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch

diff --git a/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch b/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
new file mode 100644
index 0000000..739c03e
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
@@ -0,0 +1,64 @@
+From d9ab3a0acc94151048498b1ea4d69e7707df1526 Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Fri, 30 Sep 2016 10:56:35 -0500
+Subject: [PATCH 3/3] Fix renameat (parallel to previous fix to rename)
+
+There was a bug in rename(), which was duplicated when renameat() was
+implemented, and which got fixed two years ago for rename(), but no
+one ever uses renameat() so it didn't get fixed there. Thanks
+to Anton Gerasimov <anton@advancedtelematic.com> for the bug report
+and patch.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Upstream-Status: Backport
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+
+---
+ ChangeLog.txt              | 4 ++++
+ ports/unix/guts/renameat.c | 7 ++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 65b9759..ca04cc0 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,7 @@
++2016-09-30:
++	* (seebs) Fix rename at, matching fix from ee00f63d for rename. Bug
++	  and fix provided by Anton Gerasimov <anton@advancedtelematic.com>.
++
+ 2016-09-28:
+ 	* (seebs) Send errors to log when daemonizing, but do that a lot
+ 	  sooner to prevent startup messages which can show up spuriously
+diff --git a/ports/unix/guts/renameat.c b/ports/unix/guts/renameat.c
+index ade0509..d5e36fa 100644
+--- a/ports/unix/guts/renameat.c
++++ b/ports/unix/guts/renameat.c
+@@ -11,6 +11,7 @@
+ 	int oldrc, newrc;
+ 	int save_errno;
+ 	int old_db_entry = 0;
++	int may_unlinked = 0;
+ 
+ 	pseudo_debug(PDBGF_FILE, "renameat: %d,%s->%d,%s\n",
+ 		olddirfd, oldpath ? oldpath : "<nil>",
+@@ -44,10 +45,14 @@
+ 	/* as with unlink, we have to mark that the file may get deleted */
+ 	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, newdirfd, newpath, newrc ? NULL : &newbuf);
+ 	if (msg && msg->result == RESULT_SUCCEED)
++		may_unlinked = 1;
++	msg = pseudo_client_op(OP_STAT, 0, -1, olddirfd, oldpath, oldrc ? NULL : &oldbuf);
++	if (msg && msg->result == RESULT_SUCCEED)
+ 		old_db_entry = 1;
++
+ 	rc = real_renameat(olddirfd, oldpath, newdirfd, newpath);
+ 	save_errno = errno;
+-	if (old_db_entry) {
++	if (may_unlinked) {
+ 		if (rc == -1) {
+ 			/* since we failed, that wasn't really unlinked -- put
+ 			 * it back.
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index 67eb298..fb70034 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://0001-Don-t-send-SIGUSR1-to-init.patch \
            file://0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch \
            file://0002-Use-correct-file-descriptor.patch \
+           file://0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
-- 
2.7.4


