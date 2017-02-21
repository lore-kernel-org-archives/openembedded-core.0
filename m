Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9084272F72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875692"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:31 +0200
Message-Id: <089a322f9f102a4e3a8d05e31f837eac672d08a2.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 14/39] dnf: add a recipe
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:52 -0000

This is replacing Smart package manager, which is unsupported upstream, and has a growing
amount of issues (lack of python 3.x support in particular). We identified dnf as
the only feasible replacement.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Corretly-install-tmpfiles.d-configuration.patch | 21 ++++++++++
 ...hardcode-etc-and-systemd-unit-directories.patch | 29 +++++++++++++
 ...0001-Do-not-prepend-installroot-to-logdir.patch | 31 ++++++++++++++
 .../dnf/dnf/0028-Use-backports.lzma-not-lzma.patch | 30 ++++++++++++++
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch | 27 ++++++++++++
 .../dnf/0030-Run-python-scripts-using-env.patch    | 48 ++++++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_git.bb               | 40 ++++++++++++++++++
 7 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf_git.bb

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
new file mode 100644
index 00000000000..c9df4589746
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -0,0 +1,21 @@
+From 8ce181714640315d2dd37ee794acbb22063cd669 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 26 Jan 2017 16:36:20 +0200
+Subject: [PATCH] Corretly install tmpfiles.d configuration
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ etc/tmpfiles.d/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/tmpfiles.d/CMakeLists.txt b/etc/tmpfiles.d/CMakeLists.txt
+index f69c773e..3eb6d0e8 100644
+--- a/etc/tmpfiles.d/CMakeLists.txt
++++ b/etc/tmpfiles.d/CMakeLists.txt
+@@ -1 +1 @@
+-INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
++INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
new file mode 100644
index 00000000000..0f261e5c5d6
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -0,0 +1,29 @@
+From 4313ced1320594013795f11f6db00381e3f4cc45 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 26 Jan 2017 16:25:47 +0200
+Subject: [PATCH] Do not hardcode /etc and systemd unit directories
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6a319935..db20ccd4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,8 +7,8 @@ if (NOT PYTHON_DESIRED)
+     set (PYTHON_DESIRED "2")
+ endif()
+ 
+-SET( SYSCONFDIR /etc)
+-SET( SYSTEMD_DIR /usr/lib/systemd/system)
++SET( SYSCONFDIR ${CMAKE_INSTALL_SYSCONFDIR})
++SET( SYSTEMD_DIR $ENV{systemd_system_unitdir})
+ 
+ if (${PYTHON_DESIRED} STREQUAL "2")
+ 	FIND_PACKAGE (PythonInterp REQUIRED)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
new file mode 100644
index 00000000000..a90e77cbf10
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
@@ -0,0 +1,31 @@
+From 31653d324cf8c7b1f2f9e49d22676bd2ac546331 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Jan 2017 15:10:13 +0200
+Subject: [PATCH] Do not prepend installroot to logdir.
+
+This would otherwise write the logs into rootfs/var/log
+(whereas we want them in $T),
+and will break installation of base-files rpm.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/cli/cli.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
+index b764801a..893f4bda 100644
+--- a/dnf/cli/cli.py
++++ b/dnf/cli/cli.py
+@@ -881,7 +881,7 @@ class Cli(object):
+         subst = conf.substitutions
+         subst.update_from_etc(conf.installroot)
+ 
+-        for opt in ('cachedir', 'logdir', 'persistdir'):
++        for opt in ('cachedir', 'persistdir'):
+             conf.prepend_installroot(opt)
+ 
+         self.base._logging._setup_from_dnf_conf(conf)
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch b/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
new file mode 100644
index 00000000000..57038a8c7d5
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
@@ -0,0 +1,30 @@
+From 89af5c84d4b920d22ae882fcc5ab71ba09443cea Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:28:18 +0200
+Subject: [PATCH 28/30] Use backports.lzma, not lzma
+
+This is needed when using Python 2.x and should be dropped
+after moving to Python 3.x
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ dnf/yum/misc.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf/yum/misc.py b/dnf/yum/misc.py
+index 441b0148..6b4aea0a 100644
+--- a/dnf/yum/misc.py
++++ b/dnf/yum/misc.py
+@@ -37,7 +37,7 @@ import gpgme.editutil
+ import gzip
+ import hashlib
+ import io
+-import lzma
++import backports.lzma
+ import os
+ import os.path
+ import pwd
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
new file mode 100644
index 00000000000..8c59f9f670e
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -0,0 +1,27 @@
+From 3ddaa930cda57a62a2174faebcc87aebc59591d1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:29:07 +0200
+Subject: [PATCH 29/30] Do not set PYTHON_INSTALL_DIR by running python
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6a319935..466ca1e6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,7 +18,7 @@ else()
+ 	FIND_PACKAGE(PythonInterp 3.0 REQUIRED)
+ endif()
+ 
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+ EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "import sys; sys.stdout.write('%s.%s' % (sys.version_info.major, sys.version_info.minor))" OUTPUT_VARIABLE PYTHON_MAJOR_DOT_MINOR_VERSION)
+ MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
new file mode 100644
index 00000000000..7fc8afef535
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -0,0 +1,48 @@
+From 9c8d545152b35d8943be72b9503414a53e1ebf7c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:29:37 +0200
+Subject: [PATCH 30/30] Run python scripts using env
+
+Otherwise the build tools hardcode the python path into them.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ bin/dnf-automatic.in | 2 +-
+ bin/dnf.in           | 2 +-
+ bin/yum.in           | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
+index 5b06aa26..9f6f703e 100755
+--- a/bin/dnf-automatic.in
++++ b/bin/dnf-automatic.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON_EXECUTABLE@
++#!/usr/bin/env python
+ # dnf-automatic executable.
+ #
+ # Copyright (C) 2014-2016 Red Hat, Inc.
+diff --git a/bin/dnf.in b/bin/dnf.in
+index 645d0f06..ab141abd 100755
+--- a/bin/dnf.in
++++ b/bin/dnf.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON_EXECUTABLE@
++#!/usr/bin/env python
+ # The dnf executable script.
+ #
+ # Copyright (C) 2012-2016 Red Hat, Inc.
+diff --git a/bin/yum.in b/bin/yum.in
+index f1fee071..013dc8c5 100755
+--- a/bin/yum.in
++++ b/bin/yum.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON_EXECUTABLE@
++#!/usr/bin/env python
+ # The dnf executable script.
+ #
+ # Copyright (C) 2016 Red Hat, Inc.
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
new file mode 100644
index 00000000000..82501a866bb
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolver"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://PACKAGE-LICENSING;md5=bfc29916e11321be06924c4fb096fdcc \
+                   "
+
+SRC_URI = "git://github.com/rpm-software-management/dnf.git \
+           file://0028-Use-backports.lzma-not-lzma.patch \
+           file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0030-Run-python-scripts-using-env.patch \
+           file://0001-Do-not-prepend-installroot-to-logdir.patch \
+           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
+           file://0001-Corretly-install-tmpfiles.d-configuration.patch \
+           "
+
+PV = "2.0.0+git${SRCPV}"
+SRCREV = "f0093d672d3069cfee8447973ae70ef615fd8886"
+
+S = "${WORKDIR}/git"
+
+inherit cmake gettext bash-completion distutils-base systemd
+
+DEPENDS += "libdnf librepo libcomps python-pygpgme python-iniparse"
+# python 2.x only, drop when moving to python 3.x
+DEPENDS += "python-backports-lzma"
+
+# manpages generation requires http://www.sphinx-doc.org/
+EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}_class-target += "python-core python-codecs python-netclient python-email python-threading python-distutils librepo python-shell python-subprocess libcomps libdnf python-sqlite3 python-compression python-pygpgme python-backports-lzma python-rpm python-iniparse python-json python-importlib python-curses python-argparse"
+
+# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
+do_install_append_class-native() {
+        create_wrapper ${D}/${bindir}/dnf-2 \
+                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
-- 
2.11.0


