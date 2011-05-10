Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoL1-0007hy-Q1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:55:12 +0200
Received: by yia13 with SMTP id 13so2362303yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=HzyJCG6uY1f2Mf1hugdMe/f0ltBRm6S9FPv9Gi3xRNA=;
	b=bj7XUgO8fvzrlt5wA7czGqcERctlBeE5L49P5yUjW2WPLBKT9IyGIJt7skLMfRJzOE
	hnRa0+1GVnx750uRBQgcszuU2Q29LtYgNOG45KzTqXpEvIZkXyVt/3UsOqCrWdHG7i6X
	hjzd1f1MR/xnkKYIS9QpJmdHfHh34QVh3G6Ms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=PRv3760dgJvKSLjwiGg1iQto9cMwn+0xXLuUdaR0fPBvCfFO6gw8LiGvjYOPgYdHy6
	IJOF60pjPI44qD02x7Ey5xJN6yN03JOMrRxeyBL1r+gh7pRwsUvz9DtgqhcIbgMnLKFt
	meq1miz4dcZIX5Ht0pdyn/Udh0J6yC/WmsivM=
Received: by 10.151.4.8 with SMTP id g8mr817691ybi.224.1305039135983;
	Tue, 10 May 2011 07:52:15 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u20sm3193051yba.15.2011.05.10.07.52.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:52:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:59 +0000
Message-Id: <1305039119-1469-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 3/3] cmake: add support for oe qt4 tools names
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
X-List-Received-Date: Tue, 10 May 2011 14:55:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb  |    2 +-
 meta/recipes-devtools/cmake/cmake.inc              |    3 +-
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   90 ++++++++++++++++++++
 3 files changed, 93 insertions(+), 2 deletions(-)
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
index 0000000..ab07670
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/support-oe-qt4-tools-names.patch
@@ -0,0 +1,90 @@
+This allows the usage of OE qt4 tools binaries. It has been created by
+O.S. Systems.
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



