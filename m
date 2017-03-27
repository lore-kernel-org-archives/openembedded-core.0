Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CB4E672FB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490620842; x=1522156842;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=dVHzHFJ+LWCQvkXvm+mggD93/8iTTdAOfSYzc8HtZOY=;
	b=pN5lPVUvB4JbzrTFjlHrJhBkhfGfU8Mbc1KhOfAImfZ71zZiwhJ9m3Ow
	Z94Cah9zJ3/RFzh/ryNp5Vyybh6J2Q==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 06:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,231,1486454400"; d="scan'208";a="948599398"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 27 Mar 2017 06:20:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 16:19:55 +0300
Message-Id: <20170327131955.22970-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170327131955.22970-1-alexander.kanavin@linux.intel.com>
References: <20170327131955.22970-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv4 2/2] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Mon, 27 Mar 2017 13:20:42 -0000

[YOCTO #11180]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass                    |   4 +-
 meta/conf/distro/include/security_flags.inc        |   3 +-
 .../createrepo-c/createrepo-c_git.bb               |   4 +-
 .../dnf/dnf/0028-Use-backports.lzma-not-lzma.patch |  30 --
 .../dnf/0030-Run-python-scripts-using-env.patch    |   6 +-
 meta/recipes-devtools/dnf/dnf_git.bb               |  15 +-
 meta/recipes-devtools/libcomps/libcomps_git.bb     |   6 +-
 meta/recipes-devtools/libdnf/libdnf_git.bb         |  17 +-
 meta/recipes-devtools/librepo/librepo_git.bb       |   4 +-
 ...-not-add-include-and-library-directories-.patch |  32 --
 .../python-backports-lzma_git.bb                   |  21 -
 .../0001-Add-python-3-compatibility.patch          | 552 +++++++++++++++++++++
 ...hon-iniparse_0.4.bb => python3-iniparse_0.4.bb} |   8 +-
 ...ython-pygpgme_0.3.bb => python3-pygpgme_0.3.bb} |   6 +-
 ...N_ABI-when-searching-for-python-libraries.patch |  30 ++
 meta/recipes-devtools/rpm/rpm_git.bb               |  16 +-
 16 files changed, 621 insertions(+), 133 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
 delete mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
 delete mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
 create mode 100644 meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
 rename meta/recipes-devtools/python/{python-iniparse_0.4.bb => python3-iniparse_0.4.bb} (75%)
 rename meta/recipes-devtools/python/{python-pygpgme_0.3.bb => python3-pygpgme_0.3.bb} (86%)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index af0f23877ac..7f305f51ca2 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -11,8 +11,8 @@ export STAGING_LIBDIR
 # Add 100Meg of extra space for dnf
 IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf", " + 102400", "" ,d)}"
 
-# Dnf is python based, so be sure python-native is available to us.
-EXTRANATIVEPATH += "python-native"
+# Dnf is python based, so be sure python3-native is available to us.
+EXTRANATIVEPATH += "python3-native"
 
 # opkg is needed for update-alternatives
 RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 89fd45b859c..6df184213e7 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -72,12 +72,11 @@ SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-backports-lzma = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-pygpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python3-pygpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 1e69067eebf..31761368b72 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -17,9 +17,9 @@ S = "${WORKDIR}/git"
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS_append_class-native = " file-replacement-native"
 
-inherit cmake pkgconfig bash-completion distutils-base
+inherit cmake pkgconfig bash-completion distutils3-base
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch b/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
deleted file mode 100644
index 57038a8c7d5..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 89af5c84d4b920d22ae882fcc5ab71ba09443cea Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:28:18 +0200
-Subject: [PATCH 28/30] Use backports.lzma, not lzma
-
-This is needed when using Python 2.x and should be dropped
-after moving to Python 3.x
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/yum/misc.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/yum/misc.py b/dnf/yum/misc.py
-index 441b0148..6b4aea0a 100644
---- a/dnf/yum/misc.py
-+++ b/dnf/yum/misc.py
-@@ -37,7 +37,7 @@ import gpgme.editutil
- import gzip
- import hashlib
- import io
--import lzma
-+import backports.lzma
- import os
- import os.path
- import pwd
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index 7fc8afef535..61328e6ec5b 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -19,7 +19,7 @@ index 5b06aa26..9f6f703e 100755
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
 -#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python
++#!/usr/bin/env python3
  # dnf-automatic executable.
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
@@ -29,7 +29,7 @@ index 645d0f06..ab141abd 100755
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
 -#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python
++#!/usr/bin/env python3
  # The dnf executable script.
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
@@ -39,7 +39,7 @@ index f1fee071..013dc8c5 100755
 +++ b/bin/yum.in
 @@ -1,4 +1,4 @@
 -#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python
++#!/usr/bin/env python3
  # The dnf executable script.
  #
  # Copyright (C) 2016 Red Hat, Inc.
diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index 3a2cb635e40..7d7f597e5a3 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                    "
 
 SRC_URI = "git://github.com/rpm-software-management/dnf.git \
-           file://0028-Use-backports.lzma-not-lzma.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-Do-not-prepend-installroot-to-logdir.patch \
@@ -18,24 +17,22 @@ SRCREV = "f0093d672d3069cfee8447973ae70ef615fd8886"
 
 S = "${WORKDIR}/git"
 
-inherit cmake gettext bash-completion distutils-base systemd
+inherit cmake gettext bash-completion distutils3-base systemd
 
-DEPENDS += "libdnf librepo libcomps python-pygpgme python-iniparse"
-# python 2.x only, drop when moving to python 3.x
-DEPENDS += "python-backports-lzma"
+DEPENDS += "libdnf librepo libcomps python3-pygpgme python3-iniparse"
 
 # manpages generation requires http://www.sphinx-doc.org/
-EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "native nativesdk"
-RDEPENDS_${PN}_class-target += "python-core python-codecs python-netclient python-email python-threading python-distutils librepo python-shell python-subprocess libcomps libdnf python-sqlite3 python-compression python-pygpgme python-backports-lzma python-rpm python-iniparse python-json python-importlib python-curses python-argparse"
+RDEPENDS_${PN}_class-target += "python3-core python3-codecs python3-netclient python3-email python3-threading python3-distutils librepo python3-shell python3-subprocess libcomps libdnf python3-sqlite3 python3-compression python3-pygpgme python3-rpm python3-iniparse python3-json python3-importlib python3-curses python3-argparse python3-misc"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation
 # says that dnf binary is plain 'dnf').
 do_install_append() {
-        ln -s -r ${D}/${bindir}/dnf-2 ${D}/${bindir}/dnf
-        ln -s -r ${D}/${bindir}/dnf-automatic-2 ${D}/${bindir}/dnf-automatic
+        ln -s -r ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
+        ln -s -r ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
 }
 
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index db4481bc8c3..e69bf67729d 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -13,11 +13,11 @@ SRCREV = "01a4759894cccff64d2561614a58281adf5ce859"
 
 S = "${WORKDIR}/git"
 
-inherit cmake distutils-base
+inherit cmake distutils3-base
 
-DEPENDS = "libxml2 expat libcheck"
+DEPENDS += "libxml2 expat libcheck"
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 OECMAKE_SOURCEPATH = "${S}/libcomps"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/libdnf/libdnf_git.bb b/meta/recipes-devtools/libdnf/libdnf_git.bb
index 6e9cfcc8627..ef28611f8a0 100644
--- a/meta/recipes-devtools/libdnf/libdnf_git.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -17,20 +17,9 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc"
 
-inherit gtk-doc gobject-introspection cmake pkgconfig
-
-# We cannot inherit pythonnative (or descendant classes like distutils etc.) 
-# because that would conflict with inheriting python3native
-# (which is done by inheriting gobject-introspection). 
-# But libdnf only needs the path to native Python 2.x binary
-# so we simply set it explicitly here.
-#
-# These lines can be dropped when dnf stack is moved to python 3.x
-EXTRANATIVEPATH += "python-native"
-FILES_${PN} += " ${libdir}/python2.7/*"
-DEPENDS += "python-native"
-
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF \
+inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
+
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
                 "
 EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
diff --git a/meta/recipes-devtools/librepo/librepo_git.bb b/meta/recipes-devtools/librepo/librepo_git.bb
index 3f3c5fbcf51..2f194f14399 100644
--- a/meta/recipes-devtools/librepo/librepo_git.bb
+++ b/meta/recipes-devtools/librepo/librepo_git.bb
@@ -16,9 +16,9 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "curl expat glib-2.0 openssl attr libcheck gpgme"
 
-inherit cmake distutils-base pkgconfig
+inherit cmake distutils3-base pkgconfig
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
deleted file mode 100644
index 0eb904a8a70..00000000000
--- a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e5e3196cf69172b625c8c6ccca991c02fd18137c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:02:12 +0200
-Subject: [PATCH] setup.py: do not add include and library directories from the
- host
-
-This avoids host contamination.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- setup.py | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 7886cf7..9a0356a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -31,9 +31,7 @@ packages = ["backports", "backports.lzma"]
- home = os.path.expanduser("~")
- extens = [Extension('backports/lzma/_lzma',
-                     ['backports/lzma/_lzmamodule.c'],
--                    libraries = ['lzma'],
--                    include_dirs = [os.path.join(home, 'include'), '/opt/local/include', '/usr/local/include'],
--                    library_dirs = [os.path.join(home, 'lib'), '/opt/local/lib', '/usr/local/lib']
-+                    libraries = ['lzma']
-                     )]
- 
- descr = "Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
deleted file mode 100644
index 93c6684be6c..00000000000
--- a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-HOMEPAGE = "https://github.com/peterjc/backports.lzma"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=846e05e7e9e1c886b2637c230cfcd5dd"
-
-SRC_URI = "git://github.com/peterjc/backports.lzma.git \
-           file://0001-setup.py-do-not-add-include-and-library-directories-.patch \
-           "
-
-PV = "0.0.6+git${SRCPV}"
-SRCREV = "718b3316ae7aee8e03c02e7e110108779ce3aec8"
-
-S = "${WORKDIR}/git"
-
-inherit distutils
-
-DEPENDS_append = " xz"
-
-RDEPENDS_${PN} += "python-core python-io python-pkgutil"
-RDEPENDS_${PN}_class-native += "python-core"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch b/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
new file mode 100644
index 00000000000..44090a20d05
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
@@ -0,0 +1,552 @@
+From 8a98e4d44a5e59439a4b6bd95368cc362412c995 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 24 Mar 2017 18:06:08 +0200
+Subject: [PATCH] Add python 3 compatibility.
+
+Taken from
+http://pkgs.fedoraproject.org/cgit/rpms/python-iniparse.git/tree/python-iniparse-python3-compat.patch
+
+Upstream-Status: Inappropriate [upstream is defunct]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ iniparse/__init__.py     | 20 ++++++++++----------
+ iniparse/compat.py       | 30 ++++++++++++++++--------------
+ iniparse/config.py       | 16 ++++++++--------
+ iniparse/configparser.py |  7 +++++++
+ iniparse/ini.py          | 20 ++++++++++++--------
+ iniparse/utils.py        |  4 ++--
+ tests/__init__.py        | 14 +++++++-------
+ tests/test_compat.py     | 23 +++++++++++++++--------
+ tests/test_fuzz.py       | 18 +++++++++---------
+ tests/test_ini.py        |  8 ++++----
+ tests/test_misc.py       |  4 ++--
+ tests/test_tidy.py       |  2 +-
+ tests/test_unicode.py    | 10 +++++-----
+ 13 files changed, 98 insertions(+), 78 deletions(-)
+ create mode 100644 iniparse/configparser.py
+
+diff --git a/iniparse/__init__.py b/iniparse/__init__.py
+index 8de756f..7193f92 100644
+--- a/iniparse/__init__.py
++++ b/iniparse/__init__.py
+@@ -3,17 +3,17 @@
+ # Copyright (c) 2007 Tim Lauridsen <tla@rasmil.dk>
+ # All Rights Reserved.  See LICENSE-PSF & LICENSE for details.
+ 
+-from ini import INIConfig, change_comment_syntax
+-from config import BasicConfig, ConfigNamespace
+-from compat import RawConfigParser, ConfigParser, SafeConfigParser
+-from utils import tidy
++from .ini import INIConfig, change_comment_syntax
++from .config import BasicConfig, ConfigNamespace
++from .compat import RawConfigParser, ConfigParser, SafeConfigParser
++from .utils import tidy
+ 
+-from ConfigParser import DuplicateSectionError,    \
+-                  NoSectionError, NoOptionError,   \
+-                  InterpolationMissingOptionError, \
+-                  InterpolationDepthError,         \
+-                  InterpolationSyntaxError,        \
+-                  DEFAULTSECT, MAX_INTERPOLATION_DEPTH
++from .configparser import DuplicateSectionError,    \
++                   NoSectionError, NoOptionError,   \
++                   InterpolationMissingOptionError, \
++                   InterpolationDepthError,         \
++                   InterpolationSyntaxError,        \
++                   DEFAULTSECT, MAX_INTERPOLATION_DEPTH
+ 
+ __all__ = [
+     'BasicConfig', 'ConfigNamespace',
+diff --git a/iniparse/compat.py b/iniparse/compat.py
+index db89ed8..f95c25c 100644
+--- a/iniparse/compat.py
++++ b/iniparse/compat.py
+@@ -12,19 +12,21 @@ The underlying INIConfig object can be accessed as cfg.data
+ """
+ 
+ import re
+-from ConfigParser import DuplicateSectionError,    \
+-                  NoSectionError, NoOptionError,   \
+-                  InterpolationMissingOptionError, \
+-                  InterpolationDepthError,         \
+-                  InterpolationSyntaxError,        \
+-                  DEFAULTSECT, MAX_INTERPOLATION_DEPTH
++from .configparser import DuplicateSectionError,    \
++                   NoSectionError, NoOptionError,   \
++                   InterpolationMissingOptionError, \
++                   InterpolationDepthError,         \
++                   InterpolationSyntaxError,        \
++                   DEFAULTSECT, MAX_INTERPOLATION_DEPTH
+ 
+ # These are imported only for compatiability.
+ # The code below does not reference them directly.
+-from ConfigParser import Error, InterpolationError, \
+-                  MissingSectionHeaderError, ParsingError
++from .configparser import Error, InterpolationError, \
++                   MissingSectionHeaderError, ParsingError
+ 
+-import ini
++import six
++
++from . import ini
+ 
+ class RawConfigParser(object):
+     def __init__(self, defaults=None, dict_type=dict):
+@@ -56,7 +58,7 @@ class RawConfigParser(object):
+         # The default section is the only one that gets the case-insensitive
+         # treatment - so it is special-cased here.
+         if section.lower() == "default":
+-            raise ValueError, 'Invalid section name: %s' % section
++            raise ValueError('Invalid section name: %s' % section)
+ 
+         if self.has_section(section):
+             raise DuplicateSectionError(section)
+@@ -88,7 +90,7 @@ class RawConfigParser(object):
+         filename may also be given.
+         """
+         files_read = []
+-        if isinstance(filenames, basestring):
++        if isinstance(filenames, six.string_types):
+             filenames = [filenames]
+         for filename in filenames:
+             try:
+@@ -143,7 +145,7 @@ class RawConfigParser(object):
+     def getboolean(self, section, option):
+         v = self.get(section, option)
+         if v.lower() not in self._boolean_states:
+-            raise ValueError, 'Not a boolean: %s' % v
++            raise ValueError('Not a boolean: %s' % v)
+         return self._boolean_states[v.lower()]
+ 
+     def has_option(self, section, option):
+@@ -234,7 +236,7 @@ class ConfigParser(RawConfigParser):
+             if "%(" in value:
+                 try:
+                     value = value % vars
+-                except KeyError, e:
++                except KeyError as e:
+                     raise InterpolationMissingOptionError(
+                         option, section, rawval, e.args[0])
+             else:
+@@ -283,7 +285,7 @@ class SafeConfigParser(ConfigParser):
+     _badpercent_re = re.compile(r"%[^%]|%$")
+ 
+     def set(self, section, option, value):
+-        if not isinstance(value, basestring):
++        if not isinstance(value, six.string_types):
+             raise TypeError("option values must be strings")
+         # check for bad percent signs:
+         # first, replace all "good" interpolations
+diff --git a/iniparse/config.py b/iniparse/config.py
+index 5cfa2ea..3b28549 100644
+--- a/iniparse/config.py
++++ b/iniparse/config.py
+@@ -143,7 +143,7 @@ class BasicConfig(ConfigNamespace):
+ 
+     >>> n.aaa = 42
+     >>> del n.x
+-    >>> print n
++    >>> print(n)
+     aaa = 42
+     name.first = paramjit
+     name.last = oberoi
+@@ -152,7 +152,7 @@ class BasicConfig(ConfigNamespace):
+ 
+     >>> isinstance(n.name, ConfigNamespace)
+     True
+-    >>> print n.name
++    >>> print(n.name)
+     first = paramjit
+     last = oberoi
+     >>> sorted(list(n.name))
+@@ -160,7 +160,7 @@ class BasicConfig(ConfigNamespace):
+ 
+     Finally, values can be read from a file as follows:
+ 
+-    >>> from StringIO import StringIO
++    >>> from six import StringIO
+     >>> sio = StringIO('''
+     ... # comment
+     ... ui.height = 100
+@@ -171,7 +171,7 @@ class BasicConfig(ConfigNamespace):
+     ... ''')
+     >>> n = BasicConfig()
+     >>> n._readfp(sio)
+-    >>> print n
++    >>> print(n)
+     complexity = medium
+     data.secret.password = goodness=gracious me
+     have_python
+@@ -199,7 +199,7 @@ class BasicConfig(ConfigNamespace):
+ 
+     def __str__(self, prefix=''):
+         lines = []
+-        keys = self._data.keys()
++        keys = list(self._data.keys())
+         keys.sort()
+         for name in keys:
+             value = self._data[name]
+@@ -258,7 +258,7 @@ def update_config(target, source):
+     >>> n.ui.display_clock = True
+     >>> n.ui.display_qlength = True
+     >>> n.ui.width = 150
+-    >>> print n
++    >>> print(n)
+     playlist.expand_playlist = True
+     ui.display_clock = True
+     ui.display_qlength = True
+@@ -267,7 +267,7 @@ def update_config(target, source):
+     >>> from iniparse import ini
+     >>> i = ini.INIConfig()
+     >>> update_config(i, n)
+-    >>> print i
++    >>> print(i)
+     [playlist]
+     expand_playlist = True
+     <BLANKLINE>
+@@ -277,7 +277,7 @@ def update_config(target, source):
+     width = 150
+ 
+     """
+-    for name in source:
++    for name in sorted(source):
+         value = source[name]
+         if isinstance(value, ConfigNamespace):
+             if name in target:
+diff --git a/iniparse/configparser.py b/iniparse/configparser.py
+new file mode 100644
+index 0000000..c543d50
+--- /dev/null
++++ b/iniparse/configparser.py
+@@ -0,0 +1,7 @@
++try:
++    from ConfigParser import *
++    # not all objects get imported with __all__
++    from ConfigParser import Error, InterpolationMissingOptionError
++except ImportError:
++    from configparser import *
++    from configparser import Error, InterpolationMissingOptionError
+diff --git a/iniparse/ini.py b/iniparse/ini.py
+index 408354d..052d9e9 100644
+--- a/iniparse/ini.py
++++ b/iniparse/ini.py
+@@ -7,7 +7,7 @@
+ 
+ Example:
+ 
+-    >>> from StringIO import StringIO
++    >>> from six import StringIO
+     >>> sio = StringIO('''# configure foo-application
+     ... [foo]
+     ... bar1 = qualia
+@@ -16,14 +16,14 @@ Example:
+     ... special = 1''')
+ 
+     >>> cfg = INIConfig(sio)
+-    >>> print cfg.foo.bar1
++    >>> print(cfg.foo.bar1)
+     qualia
+-    >>> print cfg['foo-ext'].special
++    >>> print(cfg['foo-ext'].special)
+     1
+     >>> cfg.foo.newopt = 'hi!'
+     >>> cfg.baz.enabled = 0
+ 
+-    >>> print cfg
++    >>> print(cfg)
+     # configure foo-application
+     [foo]
+     bar1 = qualia
+@@ -42,9 +42,11 @@ Example:
+ # Backward-compatiable with ConfigParser
+ 
+ import re
+-from ConfigParser import DEFAULTSECT, ParsingError, MissingSectionHeaderError
++from .configparser import DEFAULTSECT, ParsingError, MissingSectionHeaderError
+ 
+-import config
++import six
++
++from . import config
+ 
+ class LineType(object):
+     line = None
+@@ -278,6 +280,8 @@ class LineContainer(object):
+     value = property(get_value, set_value)
+ 
+     def __str__(self):
++        for c in self.contents:
++            pass#print(c.__str__())
+         s = [x.__str__() for x in self.contents]
+         return '\n'.join(s)
+ 
+@@ -465,7 +469,7 @@ class INIConfig(config.ConfigNamespace):
+         self._sections = {}
+         if defaults is None: defaults = {}
+         self._defaults = INISection(LineContainer(), optionxformsource=self)
+-        for name, value in defaults.iteritems():
++        for name, value in defaults.items():
+             self._defaults[name] = value
+         if fp is not None:
+             self._readfp(fp)
+@@ -551,7 +555,7 @@ class INIConfig(config.ConfigNamespace):
+ 
+         for line in readline_iterator(fp):
+             # Check for BOM on first line
+-            if linecount == 0 and isinstance(line, unicode):
++            if linecount == 0 and isinstance(line, six.text_type):
+                 if line[0] == u'\ufeff':
+                     line = line[1:]
+                     self._bom = True
+diff --git a/iniparse/utils.py b/iniparse/utils.py
+index 829fc28..f8b773a 100644
+--- a/iniparse/utils.py
++++ b/iniparse/utils.py
+@@ -1,5 +1,5 @@
+-import compat
+-from ini import LineContainer, EmptyLine
++from . import compat
++from .ini import LineContainer, EmptyLine
+ 
+ def tidy(cfg):
+     """Clean up blank lines.
+diff --git a/tests/__init__.py b/tests/__init__.py
+index f1fa321..88689fb 100644
+--- a/tests/__init__.py
++++ b/tests/__init__.py
+@@ -1,12 +1,12 @@
+ import unittest, doctest
+ 
+-import test_ini
+-import test_misc
+-import test_fuzz
+-import test_compat
+-import test_unicode
+-import test_tidy
+-import test_multiprocessing
++from . import test_ini
++from . import test_misc
++from . import test_fuzz
++from . import test_compat
++from . import test_unicode
++from . import test_tidy
++from . import test_multiprocessing
+ from iniparse import config
+ from iniparse import ini
+ 
+diff --git a/tests/test_compat.py b/tests/test_compat.py
+index b8da3d5..b6dfb5c 100644
+--- a/tests/test_compat.py
++++ b/tests/test_compat.py
+@@ -1,9 +1,16 @@
+ from iniparse import compat as ConfigParser
+-import StringIO
++from six import StringIO
++try:
++    import UserDict
++except ImportError:
++    import collections as UserDict
+ import unittest
+-import UserDict
+ 
+-from test import test_support
++import sys
++if sys.version_info[0] < 3:
++    from test import test_support
++else:
++    from test import support as test_support
+ 
+ class SortedDict(UserDict.UserDict):
+     def items(self):
+@@ -35,7 +42,7 @@ class TestCaseBase(unittest.TestCase):
+ 
+     def fromstring(self, string, defaults=None):
+         cf = self.newconfig(defaults)
+-        sio = StringIO.StringIO(string)
++        sio = StringIO(string)
+         cf.readfp(sio)
+         return cf
+ 
+@@ -161,7 +168,7 @@ class TestCaseBase(unittest.TestCase):
+                          "No Section!\n")
+ 
+     def parse_error(self, exc, src):
+-        sio = StringIO.StringIO(src)
++        sio = StringIO(src)
+         self.assertRaises(exc, self.cf.readfp, sio)
+ 
+     def test_query_errors(self):
+@@ -181,7 +188,7 @@ class TestCaseBase(unittest.TestCase):
+     def get_error(self, exc, section, option):
+         try:
+             self.cf.get(section, option)
+-        except exc, e:
++        except exc as e:
+             return e
+         else:
+             self.fail("expected exception type %s.%s"
+@@ -227,7 +234,7 @@ class TestCaseBase(unittest.TestCase):
+             "foo: another very\n"
+             " long line"
+             )
+-        output = StringIO.StringIO()
++        output = StringIO()
+         cf.write(output)
+         self.assertEqual(
+             output.getvalue(),
+@@ -465,7 +472,7 @@ class SortedTestCase(RawConfigParserTestCase):
+                         "o1=4\n"
+                         "[a]\n"
+                         "k=v\n")
+-        output = StringIO.StringIO()
++        output = StringIO()
+         self.cf.write(output)
+         self.assertEquals(output.getvalue(),
+                           "[a]\n"
+diff --git a/tests/test_fuzz.py b/tests/test_fuzz.py
+index 5420dcc..b219500 100644
+--- a/tests/test_fuzz.py
++++ b/tests/test_fuzz.py
+@@ -1,9 +1,10 @@
+ import re
+ import os
+ import random
++import sys
+ import unittest
+-import ConfigParser
+-from StringIO import StringIO
++from six import StringIO
++from six.moves import configparser
+ from iniparse import compat, ini, tidy
+ 
+ # TODO:
+@@ -96,24 +97,25 @@ class test_fuzz(unittest.TestCase):
+                 s = '\n'.join(good_lines)
+                 cc = compat.RawConfigParser()
+                 cc.readfp(StringIO(s))
+-                cc_py = ConfigParser.RawConfigParser()
++                cc_py = configparser.RawConfigParser()
+                 cc_py.readfp(StringIO(s))
+                 # compare the two configparsers
+                 self.assertEqualConfig(cc_py, cc)
+                 # check that tidy does not change semantics
+                 tidy(cc)
+-                cc_tidy = ConfigParser.RawConfigParser()
++                cc_tidy = configparser.RawConfigParser()
+                 cc_tidy.readfp(StringIO(str(cc.data)))
+                 self.assertEqualConfig(cc_py, cc_tidy)
+             except AssertionError:
+                 fname = 'fuzz-test-iter-%d.ini' % fuzz_iter
+-                print 'Fuzz test failed at iteration', fuzz_iter
+-                print 'Writing out failing INI file as', fname
++                print('Fuzz test failed at iteration', fuzz_iter)
++                print('Writing out failing INI file as', fname)
+                 f = open(fname, 'w')
+                 f.write(s)
+                 f.close()
+                 raise
+ 
++    @unittest.skipIf(sys.version_info[0] > 2, 'http://code.google.com/p/iniparse/issues/detail?id=22#c9')
+     def assertEqualConfig(self, c1, c2):
+         self.assertEqualSorted(c1.sections(), c2.sections())
+         self.assertEqualSorted(c1.defaults().items(), c2.defaults().items())
+@@ -123,9 +125,7 @@ class test_fuzz(unittest.TestCase):
+                 self.assertEqual(c1.get(sec, opt), c2.get(sec, opt))
+ 
+     def assertEqualSorted(self, l1, l2):
+-        l1.sort()
+-        l2.sort()
+-        self.assertEqual(l1, l2)
++        self.assertEqual(sorted(l1), sorted(l2))
+ 
+ class suite(unittest.TestSuite):
+     def __init__(self):
+diff --git a/tests/test_ini.py b/tests/test_ini.py
+index 6a76edb..07d4f4e 100644
+--- a/tests/test_ini.py
++++ b/tests/test_ini.py
+@@ -1,5 +1,5 @@
+ import unittest
+-from StringIO import StringIO
++from six import StringIO
+ 
+ from iniparse import ini
+ from iniparse import compat
+@@ -196,13 +196,13 @@ but = also me
+         self.assertEqual(p._data.find('section2').find('just').value, 'kidding')
+ 
+         itr = p._data.finditer('section1')
+-        v = itr.next()
++        v = next(itr)
+         self.assertEqual(v.find('help').value, 'yourself')
+         self.assertEqual(v.find('but').value, 'also me')
+-        v = itr.next()
++        v = next(itr)
+         self.assertEqual(v.find('help').value, 'me')
+         self.assertEqual(v.find('I\'m').value, 'desperate')
+-        self.assertRaises(StopIteration, itr.next)
++        self.assertRaises(StopIteration, next, itr)
+ 
+         self.assertRaises(KeyError, p._data.find, 'section')
+         self.assertRaises(KeyError, p._data.find('section2').find, 'ahem')
+diff --git a/tests/test_misc.py b/tests/test_misc.py
+index 31cf4da..96ef035 100644
+--- a/tests/test_misc.py
++++ b/tests/test_misc.py
+@@ -1,9 +1,9 @@
+ import re
+ import unittest
+ import pickle
+-import ConfigParser
++from six.moves import configparser
++from six import StringIO
+ from textwrap import dedent
+-from StringIO import StringIO
+ from iniparse import compat, ini
+ 
+ class CaseSensitiveConfigParser(compat.ConfigParser):
+diff --git a/tests/test_tidy.py b/tests/test_tidy.py
+index 7304747..26b6cde 100644
+--- a/tests/test_tidy.py
++++ b/tests/test_tidy.py
+@@ -1,6 +1,6 @@
+ import unittest
+ from textwrap import dedent
+-from StringIO import StringIO
++from six import StringIO
+ 
+ from iniparse import tidy,INIConfig
+ from iniparse.ini import  EmptyLine
+diff --git a/tests/test_unicode.py b/tests/test_unicode.py
+index a56fcab..14d4fbd 100644
+--- a/tests/test_unicode.py
++++ b/tests/test_unicode.py
+@@ -1,5 +1,5 @@
+ import unittest
+-from StringIO import StringIO
++import six
+ from iniparse import compat, ini
+ 
+ class test_unicode(unittest.TestCase):
+@@ -17,14 +17,14 @@ baz = Marc-Andr\202
+     """
+ 
+     def basic_tests(self, s, strable):
+-        f = StringIO(s)
++        f = six.StringIO(s)
+         i = ini.INIConfig(f)
+-        self.assertEqual(unicode(i), s)
+-        self.assertEqual(type(i.foo.bar), unicode)
++        self.assertEqual(six.text_type(i), s)
++        self.assertEqual(type(i.foo.bar), six.text_type)
+         if strable:
+             self.assertEqual(str(i), str(s))
+         else:
+-            self.assertRaises(UnicodeEncodeError, lambda: str(i))
++            self.assertRaises(UnicodeEncodeError, lambda: six.text_type(i).encode('ascii'))
+         return i
+ 
+     def test_ascii(self):
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python-iniparse_0.4.bb b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
similarity index 75%
rename from meta/recipes-devtools/python/python-iniparse_0.4.bb
rename to meta/recipes-devtools/python/python3-iniparse_0.4.bb
index c6d98c2fdfc..44e3c37f850 100644
--- a/meta/recipes-devtools/python/python-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.4.bb
@@ -4,13 +4,15 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
                     file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-${PV}.tar.gz \
+           file://0001-Add-python-3-compatibility.patch "
 SRC_URI[md5sum] = "5e573e9e9733d97623881ce9bbe5eca6"
 SRC_URI[sha256sum] = "abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054"
 
-inherit distutils
+inherit distutils3
 
-RDEPENDS_${PN} += "python-core"
+RDEPENDS_${PN} += "python3-core python3-six"
+DEPENDS += "python3-six"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python/python-pygpgme_0.3.bb b/meta/recipes-devtools/python/python3-pygpgme_0.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python-pygpgme_0.3.bb
rename to meta/recipes-devtools/python/python3-pygpgme_0.3.bb
index ac8bc9d62e7..495f677cfa2 100644
--- a/meta/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/meta/recipes-devtools/python/python3-pygpgme_0.3.bb
@@ -9,10 +9,10 @@ SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3df
 
 S = "${WORKDIR}/pygpgme-${PV}"
 
-inherit distutils
+inherit distutils3
 
-DEPENDS = "gpgme python"
+DEPENDS = "gpgme python3"
 
-RDEPENDS_${PN} += "python-core"
+RDEPENDS_${PN} += "python3-core"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch b/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
new file mode 100644
index 00000000000..b809332f217
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
@@ -0,0 +1,30 @@
+From 36cf0ff26ece53e529e8b4f2d2f09acd8794b055 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 24 Mar 2017 15:35:47 +0200
+Subject: [PATCH] Add PYTHON_ABI when searching for python libraries.
+
+It has a value of 'm' when using Python3, and so without it
+configure will not find the libraries.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9c58467c1..a506ec819 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -642,7 +642,7 @@ AS_IF([test "$enable_python" = yes],[
+       ])
+     CPPFLAGS="$save_CPPFLAGS"
+     save_LIBS="$LIBS"
+-    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION} python],[
++    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION}${PYTHON_ABI} python],[
+       WITH_PYTHON_LIB="$ac_res"
+     ],[AC_MSG_ERROR([missing python library])
+     ])
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 8d2527cbc7d..b1cf14fc784 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -13,8 +13,8 @@ simplify the process of creating graphical package managers or any \
 other tools that need an intimate knowledge of RPM packages in order \
 to function."
 
-SUMMARY_python-rpm = "Python bindings for apps which will manupulate RPM packages"
-DESCRIPTION_python-rpm = "The rpm-python package contains a module that permits applications \
+SUMMARY_python3-rpm = "Python bindings for apps which will manupulate RPM packages"
+DESCRIPTION_python3-rpm = "The python3-rpm package contains a module that permits applications \
 written in the Python programming language to use the interface \
 supplied by the RPM Package Manager libraries."
 
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
+           file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
@@ -42,10 +43,11 @@ SRCREV = "a8e51b3bb05c6acb1d9b2e3d34f859ddda1677be"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz dbus elfutils python"
+DEPENDS = "nss libarchive db file popt xz dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native"
 
-inherit autotools gettext pkgconfig pythonnative
+inherit autotools gettext pkgconfig python3native
+export PYTHON_ABI
 
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
@@ -102,9 +104,9 @@ FILES_${PN} += "${libdir}/rpm-plugins/*.so \
 FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
 
-PACKAGES += "python-rpm"
-PROVIDES += "python-rpm"
-FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
+PACKAGES += "python3-rpm"
+PROVIDES += "python3-rpm"
+FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
 # rpm 5.x was packaging the rpm build tools separately
 PROVIDES += "rpm-build"
-- 
2.11.0


