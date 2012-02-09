Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RvYMy-00047W-JB
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:05:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2012 09:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="105753134"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.13])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2012 09:57:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, philip@balister.org,
	eric@eukrea.com
Date: Thu,  9 Feb 2012 17:57:07 +0000
Message-Id: <6dd3f664169b2ffd249da4e86f5f16b8c4316c99.1328809777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1328809777.git.paul.eggleton@linux.intel.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1328809777.git.paul.eggleton@linux.intel.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Thu, 09 Feb 2012 18:05:20 -0000

Fix the following compile error (by disabling -Werror for QtWebKit):

./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword in C++0x [-Werror=c++0x-compat]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.8.0.inc                   |    1 +
 .../recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch |   19 +++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |    2 +-
 4 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch

diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc b/meta/recipes-qt/qt4/qt-4.8.0.inc
index 2addbb2..e251f0a 100644
--- a/meta/recipes-qt/qt4/qt-4.8.0.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.0.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://fix-translations.patch \
            file://add_nostrip_for_debug_packages.diff \
            file://qmake_cxx_eval.patch \
+           file://webkit_no_werror.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch b/meta/recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch
new file mode 100644
index 0000000..90eb60e
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.8.0/webkit_no_werror.patch
@@ -0,0 +1,19 @@
+Fix the following error during compiling with gcc 4.6:
+
+./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword in C++0x [-Werror=c++0x-compat]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Pending
+
+--- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/webkit/Source/WebKit.pri
++++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit.pri
+@@ -102,8 +102,6 @@ CONFIG -= warn_on
+ 
+ # Treat warnings as errors on x86/Linux/GCC
+ linux-g++* {
+-    isEqual(QT_ARCH,x86_64)|isEqual(QT_ARCH,i386): QMAKE_CXXFLAGS += -Werror
+-
+     greaterThan(QT_GCC_MAJOR_VERSION, 3):greaterThan(QT_GCC_MINOR_VERSION, 5) {
+         if (!contains(QMAKE_CXXFLAGS, -std=c++0x) && !contains(QMAKE_CXXFLAGS, -std=gnu++0x)) {
+             # We need to deactivate those warnings because some names conflicts with upcoming c++0x types (e.g.nullptr).
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
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
index edd3e0e..6a0b0b8 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.5.4



