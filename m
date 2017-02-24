Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 774407199A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:03:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 08:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,201,1484035200"; d="scan'208";a="1115165431"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2017 08:03:10 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 18:02:03 +0200
Message-Id: <20170224160203.18002-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemtap: update to 3.1
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
X-List-Received-Date: Fri, 24 Feb 2017 16:03:10 -0000

Removed patches are in upstream.

Rebase monitor-option.patch and no-msgfmt-check.patch

Add support for python 3 probes
(this necessitates the 0001-Do-not-let-configure-write-a-python-location-into-th.patch
and the Add 0001-Install-python-modules-to-correct-library-dir.patch to
install python modules to correct destination).

Add perl to RDEPENDS to fix a QA warning about one of the installed files.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...configure-write-a-python-location-into-th.patch | 25 +++++++++++++
 ...all-python-modules-to-correct-library-dir.patch | 36 +++++++++++++++++++
 .../systemtap/systemtap/fix-monitor-linking.patch  | 41 ----------------------
 .../systemtap/systemtap/monitor-option.patch       | 26 ++++++++++----
 .../systemtap/systemtap/no-msgfmt-check.patch      | 22 ++++++++++--
 .../systemtap/obsolete_automake_macros.patch       | 15 --------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  9 ++---
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  8 ++---
 8 files changed, 109 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
new file mode 100644
index 00000000000..742b1187fc3
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
@@ -0,0 +1,25 @@
+From ab29615ed6c2e779b472903564dc683dc1015de7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 22 Feb 2017 13:37:33 +0200
+Subject: [PATCH] Do not let configure write a python location into the dtrace
+ binary
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dtrace.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dtrace.in b/dtrace.in
+index 5e1cf8079..a24229cbc 100644
+--- a/dtrace.in
++++ b/dtrace.in
+@@ -1,4 +1,4 @@
+-#!@preferred_python@
++#!/usr/bin/python3
+ # vim: et sta sts=4 sw=4 ts=8
+ 
+ # This handles the systemtap equivalent of
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
new file mode 100644
index 00000000000..528864cc939
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-Install-python-modules-to-correct-library-dir.patch
@@ -0,0 +1,36 @@
+From 2ada22f05460223924efe54080cb4419e2b4c276 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 24 Feb 2017 17:53:02 +0200
+Subject: [PATCH] Install python modules to correct library dir.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ python/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index a254480f9..efe9f3c01 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -47,7 +47,7 @@ install-exec-local:
+ if HAVE_PYTHON2_PROBES
+ 	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON) setup.py build \
+          --build-base $(shell readlink -f $(builddir))/py2build \
+-	 install --prefix $(DESTDIR)$(prefix) \
++	 install --prefix $(DESTDIR)$(prefix) --install-lib=$(DESTDIR)${pythondir} \
+ 	 --single-version-externally-managed \
+ 	 --record $(shell readlink -f $(builddir))/py2build/install_files.txt \
+          --verbose)
+@@ -55,7 +55,7 @@ endif
+ if HAVE_PYTHON3_PROBES
+ 	(cd $(srcdir); CFLAGS="$(AM_CPPFLAGS)" $(PYTHON3) setup.py build \
+          --build-base $(shell readlink -f $(builddir))/py3build \
+-	 install --prefix $(DESTDIR)$(prefix) \
++	 install --prefix $(DESTDIR)$(prefix) --install-lib=$(DESTDIR)${python3dir} \
+ 	 --single-version-externally-managed \
+ 	 --record $(shell readlink -f $(builddir))/py3build/install_files.txt \
+          --verbose)
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch b/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
deleted file mode 100644
index 2bf0742a1df..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d940aa0079c253b958cf9158e9ec7922ecf464f9 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 9 Nov 2016 00:00:48 +0000
-Subject: [PATCH] staprun: fix linking if monitor is enabled
-
-If the monitor is enabled, monitor.c needs to link against json-c and ncurses.
-Instead of adding these linker flags to AM_CFLAGS (global CC flags) add them to
-stapio_LDADD.
-
-Apart from being the "right" thing to do, this fixes build failures on systems
-such as current Ubuntu (which defaults to using --as-needed and similar) where
-link order is important.
----
- staprun/Makefile.am | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/staprun/Makefile.am b/staprun/Makefile.am
-index 63d4088..66b3e21 100644
---- a/staprun/Makefile.am
-+++ b/staprun/Makefile.am
-@@ -42,12 +42,11 @@ staprun_CXXFLAGS += $(nss_CFLAGS)
- staprun_LDADD += $(nss_LIBS)
- endif
- 
--if HAVE_MONITOR_LIBS
--AM_CFLAGS += $(jsonc_LIBS) $(ncurses_LIBS)
--endif
--
- stapio_SOURCES = stapio.c mainloop.c common.c ctl.c relay.c relay_old.c monitor.c
- stapio_LDADD = libstrfloctime.a -lpthread
-+if HAVE_MONITOR_LIBS
-+stapio_LDADD += $(jsonc_LIBS) $(ncurses_LIBS)
-+endif
- 
- man_MANS = staprun.8
- 
--- 
-2.8.1
diff --git a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
index 7d43a79e21a..b7ee0701b1a 100644
--- a/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/monitor-option.patch
@@ -1,21 +1,30 @@
+From 93fc4744fedf6fc593ee656968da97f7b1862ada Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 4 Oct 2016 16:37:53 +0100
+Subject: [PATCH 4/6] systemtap: rationalise dependencies
+
 Add an option to explicitly disable the monitor (and therefore the dependency on
 json-c and ncurses).
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ configure.ac | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
 diff --git a/configure.ac b/configure.ac
-index cd781a2..e56079a 100644
+index 6bd0c5fc4..2ea9b3cbf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -570,13 +574,16 @@ dnl See if we have enough libraries and tools to build the virt server
- fi
- AM_CONDITIONAL([BUILD_VIRT], [test "${have_libvirt}" == "yes" -a "${have_libxml2}" == "yes" -a "$enable_virt" != "no"])
-
+@@ -752,13 +752,16 @@ dnl We want either (or both) python probe support.
+ AM_CONDITIONAL([HAVE_PYTHON_PROBES],
+   [test "x$have_python2_support" = "xyes" -o "x$have_python3_support" = "xyes"])
+ 
 +AC_ARG_ENABLE([monitor], AS_HELP_STRING([--disable-monitor],[Disable monitor]))
 +if test "$enable_monitor" != "no"; then
  dnl Check for presence of json-c and ncurses for use in monitor mode
- PKG_CHECK_MODULES([jsonc], [json-c], [have_jsonc=yes], [have_jsonc=no])
+ PKG_CHECK_MODULES([jsonc], [json-c >= 0.12], [have_jsonc=yes], [have_jsonc=no])
  PKG_CHECK_MODULES([ncurses], [ncurses], [have_ncurses=yes], [have_ncurses=no])
 -AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes"])
  if test "${have_jsonc}" == "yes" -a "${have_ncurses}" == yes; then
@@ -23,6 +32,9 @@ index cd781a2..e56079a 100644
  fi
 +fi
 +AM_CONDITIONAL([HAVE_MONITOR_LIBS], [test "${have_jsonc}" == "yes" -a "${have_ncurses}" == "yes" -a "$enable_monitor" != "no"])
-
+ 
  AC_CACHE_CHECK([for assembler .section "?" flags support], stap_cv_sectionq, [
  old_CFLAGS="$CFLAGS"
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
index 471e62c56bb..2c860b19e51 100644
--- a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
@@ -1,15 +1,33 @@
+From 43f1b04449bb1cf7e0092263f1c2a25f3fca08ef Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 8 Nov 2016 23:07:41 +0000
+Subject: [PATCH 5/6] systemtap: remove explicit msgfmt check
+
 There is no need to explicitly check that msgfmt was found as the gettext macros
 handle this for us if NLS is enabled.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ configure.ac | 4 ----
+ 1 file changed, 4 deletions(-)
+
 diff --git a/configure.ac b/configure.ac
-index e56079a..284bbe0 100644
+index 2ea9b3cbf..95417f59c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -39,4 +38,0 @@ AM_GNU_GETTEXT_VERSION([0.19.4])
+@@ -36,10 +36,6 @@ AC_CHECK_FUNCS(openat)
+ AM_GNU_GETTEXT(external)
+ AM_GNU_GETTEXT_VERSION([0.19.4])
+ 
 -if test "x$GMSGFMT" = "x:"; then
 -   AC_MSG_ERROR([missing gnu /usr/bin/msgfmt])
 -fi
 -
+ # We want the 'PYTHON' varible to be python version 2. We also want
+ # our custom 'PYTHON3' varible to be python version 3.
+ #
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch b/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
deleted file mode 100644
index 988cda4f0c8..00000000000
--- a/meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -19,7 +19,6 @@ AC_PROG_LN_S
- AC_PROG_CC
- AC_PROG_CXX
- AC_PROG_CPP
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
- AC_PROG_RANLIB
- AC_OBJEXT
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 43bf69e8778..fed368a38b7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -4,12 +4,12 @@ require systemtap_git.inc
 
 DEPENDS = "boost elfutils"
 
-RDEPENDS_${PN} += "python3-core bash"
+RDEPENDS_${PN} += "python3-core bash perl"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
             --without-nss --without-avahi --without-dyninst \
             --disable-server --disable-grapher --enable-prologues \
-            --with-python3 \
+            --with-python3 --without-python2-probes \
             ac_cv_prog_have_javac=no \
             ac_cv_prog_have_jar=no "
 
@@ -17,11 +17,12 @@ STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
 
 EXTRA_OECONF += "${STAP_DOCS} "
 
-PACKAGECONFIG ??= "sqlite monitor"
+PACKAGECONFIG ??= "sqlite monitor python3-probes"
 PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
+PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig distutils3-base
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a0f0e6859a3..c9612308a51 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,16 +1,16 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "616ec7a0b916df7785d911b824c3df6eb022b213"
-PV = "3.0"
+SRCREV = "b8ea350dc13adb6190d9044a5b80110a4c441270"
+PV = "3.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-           file://obsolete_automake_macros.patch \
            file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
            file://x32_abi_time.patch \
            file://monitor-option.patch \
            file://no-msgfmt-check.patch \
-           file://fix-monitor-linking.patch \
+           file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
+           file://0001-Install-python-modules-to-correct-library-dir.patch \
           "
 
 # systemtap doesn't support mips
-- 
2.11.0


