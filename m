Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TohvQ-0007O3-5J
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 22:57:09 +0100
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C88622FEF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 16:42:07 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 13:41:38 -0800
Message-Id: <043d67c6677fa87496c4c441e9d366e2003ab9aa.1356730817.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1356730817.git.scott.a.garman@intel.com>
References: <cover.1356730817.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C88622FEF3.D9AEA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 05/15] grub, guile, cpio, tar, wget: Fix gnulib for absense of gets in eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2012 21:57:09 -0000

From: Khem Raj <raj.khem@gmail.com>

eglibc 2.16 does not export gets anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Resolved merge conflicts with denzil branch and backported guile
patch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 ++++++++++++++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 ++-
 .../recipes-devtools/guile/files/remove-gets.patch |   25 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.3.bb         |    3 ++-
 .../cpio/cpio-2.11/remove-gets.patch               |   20 ++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +++-
 .../tar/tar-1.26/remove-gets.patch                 |   20 ++++++++++++++++
 meta/recipes-extended/tar/tar_1.26.bb              |    5 +++-
 .../wget/wget-1.13.4/remove-gets.patch             |   23 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.13.4.bb          |    3 ++-
 10 files changed, 122 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
 create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch

diff --git a/meta/recipes-bsp/grub/grub-1.99/remove-gets.patch b/meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
new file mode 100644
index 0000000..463f784
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
@@ -0,0 +1,20 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: grub-1.99/grub-core/gnulib/stdio.in.h
+===================================================================
+--- grub-1.99.orig/grub-core/gnulib/stdio.in.h	2010-12-01 06:45:43.000000000 -0800
++++ grub-1.99/grub-core/gnulib/stdio.in.h	2012-07-04 12:25:02.057099107 -0700
+@@ -140,8 +140,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 882f21d..9747525 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
           file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
           file://grub-1.99-fix-enable_execute_stack-check.patch \
+          file://remove-gets.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
diff --git a/meta/recipes-devtools/guile/files/remove-gets.patch b/meta/recipes-devtools/guile/files/remove-gets.patch
new file mode 100644
index 0000000..1b4ca62
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/remove-gets.patch
@@ -0,0 +1,25 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Backported to guile 2.0.3 by Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Pending
+
+diff -urN guile-2.0.3.orig/lib/stdio.in.h guile-2.0.3/lib/stdio.in.h
+--- guile-2.0.3.orig/lib/stdio.in.h	2011-10-22 07:19:35.000000000 -0700
++++ guile-2.0.3/lib/stdio.in.h	2012-12-12 20:47:06.397265942 -0800
+@@ -711,11 +711,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index 164ab8c..5201f6b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -19,12 +19,13 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
            file://debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch \
            file://opensuse/guile-64bit.patch \
            file://opensuse/guile-turn-off-gc-test.patch \
+           file://remove-gets.patch \
            "
 
 SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
 SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
 
-PR = "r5"
+PR = "r6"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch b/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
new file mode 100644
index 0000000..b4d113d
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
@@ -0,0 +1,20 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: cpio-2.11/gnu/stdio.in.h
+===================================================================
+--- cpio-2.11.orig/gnu/stdio.in.h	2012-07-04 12:13:43.133066247 -0700
++++ cpio-2.11/gnu/stdio.in.h	2012-07-04 12:14:10.189067564 -0700
+@@ -138,8 +138,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 78da20e..75fa2b1 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -3,7 +3,10 @@ include cpio_v2.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-PR = "r1"
+PR = "r2"
+
+SRC_URI += "file://remove-gets.patch \
+           "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
 SRC_URI[sha256sum] = "601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978"
diff --git a/meta/recipes-extended/tar/tar-1.26/remove-gets.patch b/meta/recipes-extended/tar/tar-1.26/remove-gets.patch
new file mode 100644
index 0000000..2429d42
--- /dev/null
+++ b/meta/recipes-extended/tar/tar-1.26/remove-gets.patch
@@ -0,0 +1,20 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: tar-1.26/gnu/stdio.in.h
+===================================================================
+--- tar-1.26.orig/gnu/stdio.in.h	2011-03-12 01:14:33.000000000 -0800
++++ tar-1.26/gnu/stdio.in.h	2012-07-04 12:18:58.997081535 -0700
+@@ -163,8 +163,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/meta/recipes-extended/tar/tar_1.26.bb b/meta/recipes-extended/tar/tar_1.26.bb
index e679ccb..dfe63b1 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -3,7 +3,10 @@ require tar.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r1"
+PR = "r2"
+
+SRC_URI += "file://remove-gets.patch \
+           "
 
 SRC_URI[md5sum] = "2cee42a2ff4f1cd4f9298eeeb2264519"
 SRC_URI[sha256sum] = "5a5369f464502a598e938029c310d4b3abd51e6bb8dfd045663e61c8ea9f6d41"
diff --git a/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch b/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
new file mode 100644
index 0000000..ed1d019
--- /dev/null
+++ b/meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
@@ -0,0 +1,23 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: wget-1.13.4/lib/stdio.in.h
+===================================================================
+--- wget-1.13.4.orig/lib/stdio.in.h	2011-09-13 01:15:14.000000000 -0700
++++ wget-1.13.4/lib/stdio.in.h	2012-07-04 12:22:45.749092515 -0700
+@@ -693,11 +693,13 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
diff --git a/meta/recipes-extended/wget/wget_1.13.4.bb b/meta/recipes-extended/wget/wget_1.13.4.bb
index e20ff48..9a9441e 100644
--- a/meta/recipes-extended/wget/wget_1.13.4.bb
+++ b/meta/recipes-extended/wget/wget_1.13.4.bb
@@ -1,7 +1,8 @@
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
+           file://remove-gets.patch \
           "
 SRC_URI[md5sum] = "1df489976a118b9cbe1b03502adbfc27"
 SRC_URI[sha256sum] = "24c7710bc9f220ce23d8a9e0f5673b0efc1cace62db6de0239b5863ecc934dcd"
-- 
1.7.9.5



