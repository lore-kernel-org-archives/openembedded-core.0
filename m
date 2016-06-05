Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4F024771CD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:11:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 05 Jun 2016 14:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,423,1459839600"; d="scan'208";a="969427839"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2016 14:11:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1F65D6A4007
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 14:59:04 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 00:12:03 +0300
Message-Id: <1465161123-7766-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libarchive: respect disable-acl configuration option
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
X-List-Received-Date: Sun, 05 Jun 2016 21:11:39 -0000

Update configure.ac to properly handle --disable-acl option

[YOCTO #9668]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...c-check-acl-libacl.h-and-sys-acl.h-based-.patch | 66 ++++++++++++++++++++++
 .../libarchive/libarchive_3.2.0.bb                 |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch b/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
new file mode 100644
index 0000000..4b41d62
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
@@ -0,0 +1,66 @@
+From b30c530aaf5068a652a479f3e46c74eb1716861a Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 2 Jun 2016 16:08:02 +0300
+Subject: [PATCH] configure.ac: check acl/libacl.h and sys/acl.h based on
+ requirement
+
+acl/libacl.h and sys/acl.h check should not happen when we explicitly
+disable it with --disable-acl.
+
+Similarly, update attr/xattr.h for --disable-xattr option.
+
+Update the help texts to reflect what it really does.
+
+Upstream-Status: Accepted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ configure.ac | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb6943f..0638182 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -252,7 +252,7 @@ esac
+ # Checks for header files.
+ AC_HEADER_DIRENT
+ AC_HEADER_SYS_WAIT
+-AC_CHECK_HEADERS([acl/libacl.h attr/xattr.h copyfile.h ctype.h])
++AC_CHECK_HEADERS([copyfile.h ctype.h])
+ AC_CHECK_HEADERS([errno.h ext2fs/ext2_fs.h fcntl.h grp.h])
+ 
+ AC_CACHE_CHECK([whether EXT2_IOC_GETFLAGS is usable],
+@@ -272,7 +272,7 @@ AC_CHECK_HEADERS([linux/fiemap.h linux/fs.h linux/magic.h linux/types.h])
+ AC_CHECK_HEADERS([locale.h paths.h poll.h pthread.h pwd.h])
+ AC_CHECK_HEADERS([readpassphrase.h signal.h spawn.h])
+ AC_CHECK_HEADERS([stdarg.h stdint.h stdlib.h string.h])
+-AC_CHECK_HEADERS([sys/acl.h sys/cdefs.h sys/extattr.h])
++AC_CHECK_HEADERS([sys/cdefs.h sys/extattr.h])
+ AC_CHECK_HEADERS([sys/ioctl.h sys/mkdev.h sys/mount.h])
+ AC_CHECK_HEADERS([sys/param.h sys/poll.h sys/select.h sys/statfs.h sys/statvfs.h])
+ AC_CHECK_HEADERS([sys/time.h sys/utime.h sys/utsname.h sys/vfs.h])
+@@ -644,7 +644,7 @@ AC_CHECK_MEMBER(struct dirent.d_namlen,,,
+ # Check for Extended Attributes support
+ AC_ARG_ENABLE([xattr],
+ 		AS_HELP_STRING([--disable-xattr],
+-		[Enable Extended Attributes support (default: check)]))
++		[Disable Extended Attributes support (default: check)]))
+ 
+ if test "x$enable_xattr" != "xno"; then
+ 	AC_CHECK_HEADERS([attr/xattr.h])
+@@ -670,9 +670,10 @@ fi
+ #
+ AC_ARG_ENABLE([acl],
+ 		AS_HELP_STRING([--disable-acl],
+-		[Enable ACL support (default: check)]))
++		[Disable ACL support (default: check)]))
+ 
+ if test "x$enable_acl" != "xno"; then
++   AC_CHECK_HEADERS([acl/libacl.h])
+    AC_CHECK_HEADERS([sys/acl.h])
+    AC_CHECK_LIB([acl],[acl_get_file])
+    AC_CHECK_FUNCS([acl_create_entry acl_init acl_set_fd acl_set_fd_np acl_set_file])
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
index fe22ea5..f183b74 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch \
            "
 
 SRC_URI[md5sum] = "596210b5a9c2ff74a0f7ca34838d655f"
-- 
2.4.0


