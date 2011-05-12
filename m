Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKXyk-0006gC-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 17:39:06 +0200
Received: by yxn22 with SMTP id 22so613691yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2011 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=9B0tNnUeHEQ2RjqdVMaf2LhDXuRi92fc0POf/WsqfaE=;
	b=fQmVaLqeBDkLHK63ty8JReW/43I/SAHLm+tmDWiS86ElIxA0wdEqoNZSgPvI3h7wdt
	P3lA6mCjsEGZ7yRV0aNzEdPL0OPS4C1olW4WrEGXpRcqnnhv9InTNrveh4iNSQfZ9Yty
	02o1w7i6f1X5qViKm6m8cytGRON4hbAinbzZo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=K9s9fG7xFJ7U0TiFnzLFLsAee5BAqB2rXGCd9CYonyEiuTUknnkYN6YgYvuGXH2BXD
	w0s7/cjtroHEWaH5cy3TpodZ8/sREaKHsS155rN5v72OQDmTIMgSlb2qt34vv35RCo1m
	NkYSVFVPkFHcUAv0496KNsacCimjiw4Op4W38=
Received: by 10.236.180.7 with SMTP id i7mr400566yhm.94.1305214576773;
	Thu, 12 May 2011 08:36:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d48sm629974yhe.58.2011.05.12.08.36.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 08:36:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2011 15:36:03 +0000
Message-Id: <1305214563-32740-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] cmake: add support for oe qt4 tools names
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
X-List-Received-Date: Thu, 12 May 2011 15:39:06 -0000

The FindQt4 module looks for Qt4 binaries to be able to gather the
paths used for compilation and also to be using during other processes
(translation update, translation binary generating and like) however
OpenEmbedded has renamed those to allow old QMake to be used in
parallel with the current one. This patch adds support for the
OpenEmbedded specific binary names.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    2 +-
 meta/recipes-devtools/cmake/cmake.inc              |    3 +-
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   98 ++++++++++++++++++++
 3 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
index 1595416..29b3d87 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
@@ -1,7 +1,7 @@
 CMAKE_MAJOR_VERSION="2.8"
 require cmake.inc
 inherit native
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f6b1c3b..eed9346 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -9,7 +9,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f372516292ff7c33337bf16a74a5f9a8 \
                     file://Source/cmake.h;beginline=1;endline=10;md5=341736dae83c9e344b53eeb1bc7d7bc2"
 
-SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
+SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://support-oe-qt4-tools-names.patch"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
new file mode 100644
index 0000000..9bccd40
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -0,0 +1,98 @@
+cmake: support OpenEmbedded Qt4 tool binary names
+
+The FindQt4 module looks for Qt4 binaries to be able to gather the
+paths used for compilation and also to be using during other processes
+(translation update, translation binary generating and like) however
+OpenEmbedded has renamed those to allow old QMake to be used in
+parallel with the current one. This patch adds support for the
+OpenEmbedded specific binary names.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+--- a/Modules/FindQt4.cmake
++++ b/Modules/FindQt4.cmake
+@@ -461,7 +461,7 @@
+ # check for qmake
+ # Debian uses qmake-qt4
+ # macports' Qt uses qmake-mac
+-FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac PATHS
++FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac PATHS
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Qt3Versions\\4.0.0;InstallDir]/bin"
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\4.0.0;InstallDir]/bin"
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]/bin"
+@@ -988,13 +988,13 @@
+   ENDIF(QT_QMAKE_CHANGED)
+   
+   FIND_PROGRAM(QT_MOC_EXECUTABLE
+-    NAMES moc-qt4 moc
++    NAMES moc-qt4 moc4 moc
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_UIC_EXECUTABLE
+-    NAMES uic-qt4 uic
++    NAMES uic-qt4 uic4 uic
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+@@ -1006,49 +1006,49 @@
+     )
+ 
+   FIND_PROGRAM(QT_RCC_EXECUTABLE 
+-    NAMES rcc
++    NAMES rcc4 rcc
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DBUSCPP2XML_EXECUTABLE 
+-    NAMES qdbuscpp2xml
++    NAMES qdbuscpp2xml4 qdbuscpp2xml
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DBUSXML2CPP_EXECUTABLE 
+-    NAMES qdbusxml2cpp
++    NAMES qdbusxml2cpp4 qdbusxml2cpp
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LUPDATE_EXECUTABLE
+-    NAMES lupdate-qt4 lupdate
++    NAMES lupdate-qt4 lupdate4 lupdate
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LRELEASE_EXECUTABLE
+-    NAMES lrelease-qt4 lrelease
++    NAMES lrelease-qt4 lrelease4 lrelease
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_QCOLLECTIONGENERATOR_EXECUTABLE
+-    NAMES qcollectiongenerator-qt4 qcollectiongenerator
++    NAMES qcollectiongenerator-qt4 qcollectiongenerator4 qcollectiongenerator
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DESIGNER_EXECUTABLE
+-    NAMES designer-qt4 designer
++    NAMES designer-qt4 designer4 designer
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LINGUIST_EXECUTABLE
+-    NAMES linguist-qt4 linguist
++    NAMES linguist-qt4 linguist4 linguist
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
-- 
1.7.2.5



