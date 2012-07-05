Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKs-00066Q-TJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:15 +0200
Received: by yhjj56 with SMTP id j56so9174692yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ob1URZqhy+ZqqwiQLvnFwYEV/+lF596Hf9jEmVZXEQY=;
	b=ZS8D1fYDPDHDUNnR9tHA4toUK5lnHver+OmKboPeheIR+pcKIU/hmteo+iLGQHBFcN
	/8xSkDAKU3IryXfap0ZOwuD9XFLuRXSMy2Eh6h0RBPhwowL2GF9Mx+R+EdKI9V+2sPt+
	Y5gFZGZxocLd2k1eXrs3ldS474m6Pl2895kAfmsJ1tGmz5ghd9KFmtIr83Qz2prk5h51
	HnOtTKEHTW2zypBQVQY9kW6Fa2s9TGHJX65sorN2t12747oJDOTU0sN9ODvQMIPtp0ae
	uDXwzz+jU/kdQMiZVfQuXGU8ff945cDb/r/lsxMyELyTjVbTRiolo/9c1ScDlok7EvB3
	IDeA==
Received: by 10.66.88.230 with SMTP id bj6mr37730221pab.43.1341498969666;
	Thu, 05 Jul 2012 07:36:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:28 -0700
Message-Id: <5438c4293b4dc771a809dac9e77f8a4440f58132.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 09/14] grub, guile, cpio, tar, wget: Fix gnulib for absense of gets in eglibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 14:47:15 -0000

eglibc 2.16 does not export gets anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +++++++++++++++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 ++-
 .../recipes-devtools/guile/files/remove-gets.patch |   23 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 ++-
 .../cpio/cpio-2.11/remove-gets.patch               |   20 +++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |    5 ++++-
 .../tar/tar-1.26/remove-gets.patch                 |   20 +++++++++++++++++
 meta/recipes-extended/tar/tar_1.26.bb              |    5 ++++-
 .../wget/wget-1.13.4/remove-gets.patch             |   23 ++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.13.4.bb          |    3 ++-
 10 files changed, 120 insertions(+), 5 deletions(-)
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
index 0d49f23..775c6aa 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r8"
+PR = "r9"
 
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
index 0000000..6d3605f
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/remove-gets.patch
@@ -0,0 +1,23 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: guile-2.0.5/lib/stdio.in.h
+===================================================================
+--- guile-2.0.5.orig/lib/stdio.in.h	2012-01-24 03:06:06.000000000 -0800
++++ guile-2.0.5/lib/stdio.in.h	2012-07-04 12:28:15.617108481 -0700
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
diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
index cf222a6..fc94a41 100644
--- a/meta/recipes-devtools/guile/guile_2.0.5.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
            file://guile_2.0.5_fix_sed_error.patch \
            file://guile_2.0.5_disable_goops_optimizations.patch \
            file://guile_2.0.5_fix_cross_compilation.patch \
+           file://remove-gets.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
@@ -28,7 +29,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
 SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
 
-PR = "r1"
+PR = "r2"
 
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
index 73a3444..9b37dcd 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -3,7 +3,10 @@ include cpio_v2.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-PR = "r2"
+PR = "r3"
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
index 9c06d7e..4c8ab2c 100644
--- a/meta/recipes-extended/tar/tar_1.26.bb
+++ b/meta/recipes-extended/tar/tar_1.26.bb
@@ -3,7 +3,10 @@ require tar.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r2"
+PR = "r3"
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



