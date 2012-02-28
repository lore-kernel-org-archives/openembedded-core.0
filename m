Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhO-0008QH-PA
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197435"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:02 -0800
Message-Id: <2a12a697e7a0dd51179e328d67b158d45397b8c0.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/36] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:07 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Ensure the Qt configure script can can detect the compiler correctly as
g++. This fixes the following compile error with gcc 4.6:

./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword in C++0x [-Werror=c++0x-compat]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
 .../qt4/qt-4.8.0/configure_oe_compiler.patch       |   31 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
 3 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch

diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
index 2addbb2..532f1ff 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://fix-translations.patch \
            file://add_nostrip_for_debug_packages.diff \
            file://qmake_cxx_eval.patch \
+           file://configure_oe_compiler.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch b/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
new file mode 100644
index 0000000..d455d0a
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
@@ -0,0 +1,31 @@
+Ensure we identify the compiler as g++ in configure
+
+Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
+script was interpreting from this that the compiler was "oe-g++" and thus
+g++ specific checks were not being run since this string did not match;
+among other things this resulted in a compiler version check in the
+QtWebKit build code not working, and hence the following error at build
+time:
+
+./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword in C++0x [-Werror=c++0x-compat]
+
+The easiest thing since our PLATFORM is entirely artificial is to just
+force COMPILER to "g++" in the configure script if it is detected as
+"oe-g++".
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- qt-everywhere-opensource-src-4.8.0.orig/configure
++++ qt-everywhere-opensource-src-4.8.0/configure
+@@ -7444,6 +7444,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; th
+ else
+     COMPILER=`echo $PLATFORM | cut -f 2- -d-`
+ fi
++case $COMPILER in
++    *oe-g++) COMPILER="g++" ;;
++esac
+ if [ "$CFG_EXCEPTIONS" = "unspecified" -a "$PLATFORM_QWS" = "yes" ]; then
+     CFG_EXCEPTIONS=no
+ fi
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
index 5c1c97e..efbc02a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.7.6



