Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C43875D84
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:35:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t66AZdwI020240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:35:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:35:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:35:35 -0700
Message-ID: <3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436178756.git.liezhi.yang@windriver.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Mon, 06 Jul 2015 10:35:41 -0000
Content-Type: text/plain

Fixed:
* gcc 5 introduces a plugin libcc1.so, which is used by gdb, the target
gcc didn't build it in the past because gcc_cv_objdump is null, and
the error was:
gcc-5.1.0/libcc1/configure: line 14531: -T: command not found

This only happens for tar gcc as the code shows:
  if test x$build = x$host; then
    export_sym_check="objdump${exeext} -T"
  elif test x$host = x$target; then
    export_sym_check="$gcc_cv_objdump -T"
  else
    export_sym_check=
  fi

* Install libcc1.so and libcc1plugin.so to
  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version) as lto-plugin did.

* Use sed command to fix bad RPATH iussue.

[YOCTO #7956]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-5.1.inc              |    1 +
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   51 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-target.inc           |    5 ++
 meta/recipes-devtools/gcc/gcc_5.1.bb               |    6 +++
 4 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index 63669a9..945dc90 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
            file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
            file://0037-pr65779.patch \
            file://0038-fix-g++-sysroot.patch \
+           file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
           "
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-5.1/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
new file mode 100644
index 0000000..63d97d9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -0,0 +1,51 @@
+From acea0df9997a47f8b8224b6ca1618c8c9dfbe6d5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 5 Jul 2015 20:25:18 -0700
+Subject: [PATCH] libcc1: fix libcc1's install path and rpath
+
+* Install libcc1.so and libcc1plugin.so into
+  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
+  had done to lto-plugin.
+* Fix bad RPATH iussue:
+  gcc-5.1.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64 in file
+ /path/to/gcc/5.1.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_64-poky-linux/5.1.0/plugin/libcc1plugin.so.0.0.0
+ [rpaths]
+
+Upstream-Status: Inappropriate [OE configuration]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libcc1/Makefile.am  |    4 ++--
+ libcc1/Makefile.in  |    4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
+index 7a274b3..db69bea 100644
+--- a/libcc1/Makefile.am
++++ b/libcc1/Makefile.am
+@@ -35,8 +35,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+ 
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ 
+ if ENABLE_PLUGIN
+ plugin_LTLIBRARIES = libcc1plugin.la
+diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
+index 1916134..c8995d2 100644
+--- a/libcc1/Makefile.in
++++ b/libcc1/Makefile.in
+@@ -262,8 +262,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ 
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la
+ @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
+ BUILT_SOURCES = compiler-name.h
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 5d31446..c362a0f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -10,6 +10,11 @@ EXTRA_OECONF_PATHS = "\
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
+# libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
+# set in subdir gcc, so subdir libcc1 can't use it, export it here to
+# fix the problem.
+export gcc_cv_objdump = "${TARGET_PREFIX}objdump"
+
 EXTRA_OECONF_GCC_FLOAT = "${@get_gcc_float_setting(bb, d)}"
 
 PACKAGES = "\
diff --git a/meta/recipes-devtools/gcc/gcc_5.1.bb b/meta/recipes-devtools/gcc/gcc_5.1.bb
index c4827c6..254cd7f 100644
--- a/meta/recipes-devtools/gcc/gcc_5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_5.1.bb
@@ -5,3 +5,9 @@ require gcc-target.inc
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
 ARM_INSTRUCTION_SET_armv4 = "arm"
+
+do_configure_prepend() {
+	# Easiest way to stop bad RPATHs getting into the library since we have a
+	# broken libtool here
+	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
+}
-- 
1.7.9.5


