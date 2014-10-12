Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1FB718F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:50:18 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa09-03.prod.phx3.secureserver.net with 
	id 2Pq71p0040BVjqb01PqK7K; Sun, 12 Oct 2014 16:50:19 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 18:49:53 -0500
Message-Id: <1413157795-1346-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1413157795-1346-1-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
Subject: [PATCH 1/3] pseudo: support --without-passwd-fallback configuration option
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
X-List-Received-Date: Sun, 12 Oct 2014 23:50:18 -0000

A bug in pseudo 1.6.2 results in lock failures if this option is
present.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
Cc: peter.seebach@windriver.com

 ...do_client.c-protect-pwd_lck-against-magic.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch

diff --git a/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
new file mode 100644
index 0000000..d0c0a27
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
@@ -0,0 +1,56 @@
+From e11468a47369596f57c5e99bd0a3dd58b2c6d5e0 Mon Sep 17 00:00:00 2001
+From: "Peter A. Bigot" <pab@pabigot.com>
+Date: Sun, 12 Oct 2014 08:27:14 -0500
+Subject: [PATCH 1/3] pseudo_client.c: protect pwd_lck against magic
+
+While attempting to diagnose unexpected uid/gid assignment I added
+--without-passwd-fallback to the pseudo build.  This caused build
+failures due to inability to lock /etc/passwd.
+
+Instrumentation revealed that attempts to create the lock file ended up
+with pseudo_etc_file() creating the correct lock name, but the
+subsequent open had an extra PSEUDO_PASSWD directory prefix causing
+it to fail.
+
+Inspection of pseudo_client shows the only other use of PSEUDO_ETC_FILE
+to be protected against magic.  Applying the same shield to the
+unprotected calls in pseudo_pwd_lck_{open,close} fixes the issue.
+
+Upstream-Status: Pending
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+---
+ pseudo_client.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 8deaa1b..442dd19 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -416,20 +416,24 @@ pseudo_pwd_lck_open(void) {
+ 		}
+ 	}
+ 	pseudo_pwd_lck_close();
++	pseudo_antimagic();
+ 	pseudo_pwd_lck_fd = PSEUDO_ETC_FILE(".pwd.lock",
+ 					pseudo_pwd_lck_name, O_RDWR | O_CREAT);
++	pseudo_magic();
+ 	return pseudo_pwd_lck_fd;
+ }
+ 
+ int
+ pseudo_pwd_lck_close(void) {
+ 	if (pseudo_pwd_lck_fd != -1) {
++		pseudo_antimagic();
+ 		close(pseudo_pwd_lck_fd);
+ 		if (pseudo_pwd_lck_name) {
+ 			unlink(pseudo_pwd_lck_name);
+ 			free(pseudo_pwd_lck_name);
+ 			pseudo_pwd_lck_name = 0;
+ 		}
++		pseudo_magic();
+ 		pseudo_pwd_lck_fd = -1;
+ 		return 0;
+ 	} else {
+-- 
+1.8.5.5
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
index ece50bf..df8ce83 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.2.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+    file://0001-pseudo_client.c-protect-pwd_lck-against-magic.patch \
 "
 
 SRC_URI[md5sum] = "4d7b4f9d1b4aafa680ce94a5a9a52f1f"
-- 
1.8.5.5


