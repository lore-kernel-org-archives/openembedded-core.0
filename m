Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B780771F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:32:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8C8WA0E031575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:32:11 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 01:32:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2016 01:32:07 -0700
Message-ID: <715e99a70a610395dc27f8f197be1edf213271a4.1473669090.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473669090.git.liezhi.yang@windriver.com>
References: <cover.1473669090.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] meta: cleanup d.getVar(var, 1)
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
X-List-Received-Date: Mon, 12 Sep 2016 08:32:11 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel.bbclass                                       | 8 ++++----
 meta/classes/package_ipk.bbclass                                  | 2 +-
 meta/lib/oe/utils.py                                              | 4 ++--
 meta/recipes-devtools/apt/apt-native.inc                          | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                             | 2 +-
 .../kconfig-frontends/kconfig-frontends_3.12.0.0.bb               | 2 +-
 meta/recipes-devtools/vala/vala.inc                               | 2 +-
 meta/recipes-support/boost/boost-1.61.0.inc                       | 4 ++--
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d6a0ca8..b8fbbc5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -127,9 +127,9 @@ PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
-KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
-                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
-                       int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.')[-1])}"
+KERNEL_PRIORITY ?= "${@int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('PV', True).split('-')[0].split('+')[0].split('.')[-1])}"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
@@ -140,7 +140,7 @@ KERNEL_IMAGEDEST = "boot"
 #
 # configuration
 #
-export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
+export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE", True) or "ttyS0"}"
 
 KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e32b9cb..930e154 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -245,7 +245,7 @@ python do_package_ipk () {
 
         os.chdir(basedir)
         ret = subprocess.call("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH", True),
-                                                          d.getVar("OPKGBUILDCMD",1), pkg, pkgoutdir), shell=True)
+                                                          d.getVar("OPKGBUILDCMD", True), pkg, pkgoutdir), shell=True)
         if ret != 0:
             bb.utils.unlockfile(lf)
             raise bb.build.FuncFailed("opkg-build execution failed")
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 19db540..d6545b1 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -23,13 +23,13 @@ def ifelse(condition, iftrue = True, iffalse = False):
         return iffalse
 
 def conditional(variable, checkvalue, truevalue, falsevalue, d):
-    if d.getVar(variable,1) == checkvalue:
+    if d.getVar(variable, True) == checkvalue:
         return truevalue
     else:
         return falsevalue
 
 def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    if float(d.getVar(variable,1)) <= float(checkvalue):
+    if float(d.getVar(variable, True)) <= float(checkvalue):
         return truevalue
     else:
         return falsevalue
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 59aa04e..9fa206e 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -17,7 +17,7 @@ python do_install () {
 }
 
 python do_install_config () {
-    indir = os.path.dirname(d.getVar('FILE',1))
+    indir = os.path.dirname(d.getVar('FILE', True))
     infile = open(oe.path.join(indir, 'files', 'apt.conf'), 'r')
     data = infile.read()
     infile.close()
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1a1896f..1f73b3a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=052f86c15bbde68af55c7f7b340ab639 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
+CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV', True).split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index 804186d..9b65a99 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--disable-gconf --disable-qconf"
 
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
-SOLIBS = "-${@d.getVar('PV',1)[:-2]}.so"
+SOLIBS = "-${@d.getVar('PV', True)[:-2]}.so"
 FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 37aa38f..34c9db9 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -11,7 +11,7 @@ HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools pkgconfig upstream-version-is-even
diff --git a/meta/recipes-support/boost/boost-1.61.0.inc b/meta/recipes-support/boost/boost-1.61.0.inc
index 4553677..cd9d8a4 100644
--- a/meta/recipes-support/boost/boost-1.61.0.inc
+++ b/meta/recipes-support/boost/boost-1.61.0.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://www.boost.org/"
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
-BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
+BOOST_VER = "${@"_".join(d.getVar("PV", True).split("."))}"
+BOOST_MAJ = "${@"_".join(d.getVar("PV", True).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
-- 
2.9.0


