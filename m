Return-Path: <sakib@meta.ua>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Sep 2015 13:23:04 UTC
Received: from smtp-out-1.meta.ua (smtp-out-1.meta.ua [194.0.131.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8520A76417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:23:04 +0000 (UTC)
Received: from bargainingless-net.volia.net ([93.73.27.29]:43217
	helo=localhost)
	by smtp.meta.ua with esmtpsa id 1ZcYuo-0006Tw-LF by authid
	<sakib@meta.ua>; Thu, 17 Sep 2015 16:07:55 +0300
Received: by localhost (sSMTP sendmail emulation);
	Thu, 17 Sep 2015 16:08:04 +0300
From: Sergiy Kibrik <sakib@meta.ua>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:08:02 +0300
Message-Id: <1442495282-23328-1-git-send-email-sakib@meta.ua>
X-Mailer: git-send-email 1.9.1
X-SESSION-Connect-Host: bargainingless-net.volia.net [93.73.27.29] in
	2015-09-17 16:07:54
X-MUA-GeoIP: UA
MIME-Version: 1.0
X-HddSpool: 1
X-Gen: 74a4dc8debe47a1da3aa04e7fa9d8e91
Cc: Sergiy Kibrik <sakib@meta.ua>
Subject: [dizzy][PATCH] rsync: backport libattr checking patch
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
X-List-Received-Date: Thu, 17 Sep 2015 13:23:06 -0000
Content-Type: text/plain; charset=utf-8

Add check_libattr.patch to version 3.1.0 recipe, which checks
and includes libattr to linker, otherwise rsync may fail to build
with linker error below (as -lattr option gets omitted):

[..]
lib/sysxattrs.o: undefined reference to symbol 'llistxattr@@ATTR_1.0'
[..]/lib/libattr.so.1: error adding symbols: DSO missing from command line

Signed-off-by: Sergiy Kibrik <sakib@meta.ua>
---
 .../rsync/files/check_libattr.patch                | 33 ++++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch

diff --git a/meta/recipes-devtools/rsync/files/check_libattr.patch b/meta/recipes-devtools/rsync/files/check_libattr.patch
new file mode 100644
index 0000000..cb159fa
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/check_libattr.patch
@@ -0,0 +1,33 @@
+From 677c6e14cc7d5f41371d5616865a5f0cfc0a273f Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayned@samba.org>
+Date: Mon, 5 May 2014 09:25:13 -0700
+Subject: [PATCH] Check for attr lib.
+
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7b28c5..8e3703c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1007,7 +1007,7 @@ else
+     *)
+ 	AC_MSG_RESULT(running tests:)
+ 	AC_CHECK_LIB(acl,acl_get_file)
+-	    AC_CACHE_CHECK([for ACL support],samba_cv_HAVE_POSIX_ACLS,[
++	AC_CACHE_CHECK([for ACL support],samba_cv_HAVE_POSIX_ACLS,[
+ 	    AC_TRY_LINK([#include <sys/types.h>
+ #include <sys/acl.h>],
+ [ acl_t acl; int entry_id; acl_entry_t *entry_p; return acl_get_entry( acl, entry_id, entry_p);],
+@@ -1057,6 +1057,7 @@ else
+ 	AC_DEFINE(HAVE_LINUX_XATTRS, 1, [True if you have Linux xattrs])
+ 	AC_DEFINE(SUPPORT_XATTRS, 1)
+ 	AC_DEFINE(NO_SYMLINK_USER_XATTRS, 1, [True if symlinks do not support user xattrs])
++	AC_CHECK_LIB(attr,getxattr)
+ 	;;
+     darwin*)
+ 	AC_MSG_RESULT(Using OS X xattrs)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.0.bb b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
index a4a5c10..d253fe9 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
@@ -1,7 +1,8 @@
 require rsync.inc
 
 
-SRC_URI += "file://acinclude.m4"
+SRC_URI += "file://acinclude.m4 \
+	    file://check_libattr.patch"
 
 SRC_URI[md5sum] = "3be148772a33224771a8d4d2a028b132"
 SRC_URI[sha256sum] = "81ca23f77fc9b957eb9845a6024f41af0ff0c619b7f38576887c63fa38e2394e"
-- 
1.9.1


