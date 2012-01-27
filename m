Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqpWa-0007HY-AS
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:23:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2012 09:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117133177"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 09:15:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:15:49 -0800
Message-Id: <03ed59be5d199a8410b7b2e54b412a62df2e44a9.1327684299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 6/6] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Fri, 27 Jan 2012 17:23:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

the build is actually failing because host g++ and ld are used to
compile and link

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../qt4/{files => qt-4.7.4}/configure-lflags.patch |    0
 .../recipes-qt/qt4/qt-4.8.0/configure-lflags.patch |   18 ++++++++++++++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   10 +++++++---
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    3 ++-
 4 files changed, 27 insertions(+), 4 deletions(-)
 rename meta/recipes-qt/qt4/{files => qt-4.7.4}/configure-lflags.patch (100%)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch

diff --git a/meta/recipes-qt/qt4/files/configure-lflags.patch b/meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch
similarity index 100%
rename from meta/recipes-qt/qt4/files/configure-lflags.patch
rename to meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch b/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
new file mode 100644
index 0000000..d74f7fd
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
@@ -0,0 +1,18 @@
+qt4-tools-native: set LFLAGS to pick up zlib from staging
+
+Original Author: Jeremy Lainé <jeremy.laine@m4x.org>
+Upstream-Status: Pending
+
+Index: qt-everywhere-opensource-src-4.8.0/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.8.0.orig/configure
++++ qt-everywhere-opensource-src-4.8.0/configure
+@@ -611,7 +611,7 @@ fi
+ # initalize variables
+ #-------------------------------------------------------------------------------
+ 
+-SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
++SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
+ for varname in $SYSTEM_VARIABLES; do
+     qmakevarname="${varname}"
+     # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 275fdcc..4b097cf 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -12,7 +12,6 @@ inherit nativesdk qmake2
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://configure-lflags.patch \
-           file://compile.test-lflags.patch \
            file://qt-config.patch \
            file://qmake-exists-check.patch \
            file://configure-paths.patch \
@@ -51,12 +50,18 @@ EXTRA_OECONF = "-prefix ${prefix} \
 EXTRA_OEMAKE = " "
 
 do_configure() {
+    # Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD (since we want the linker to be g++)
+    unset LD
+
     if [ ! -e mkspecs/${TARGET_OS}-oe-g++ ]; then
         ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
     fi
 
     cp ../g++.conf mkspecs/common
     cp ../linux.conf mkspecs/common
+    # don't use host g++ even during configure
+    sed -i -e "s#g++#${CXX}#" mkspecs/common/g++-base.conf
+    sed -i -e "s#gcc#${CC}#" mkspecs/common/g++-base.conf
 
     # first launch configure to get qmake compiled for the nativesdk
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || true
@@ -66,7 +71,6 @@ do_configure() {
     if [ ! -e bin/qmake ]; then
         ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
     fi
-
     (echo o; echo yes) | CC="${CC}" CXX="${CXX}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
index 4c90d57..ea5e13d 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -3,7 +3,8 @@ require qt4-tools-nativesdk.inc
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://blacklist-diginotar-certs.diff \
-            file://fix-qtbug-20925.patch"
+            file://fix-qtbug-20925.patch \
+            file://compile.test-lflags.patch "
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
 SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
-- 
1.7.6.5



