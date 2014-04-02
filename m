Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5AC6FA5C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:25:54 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so129470wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CIszUyEvFjNwOGewe3a/aP0l3kUAtVwvPXhQkFrB1IQ=;
	b=xPgElaDM7J+lSOxUxflI5PGGWB6LrI5ZJVncBKGWSeAz6/f9qPRIB0GthnuDKR/HwV
	iF8Vt/bmKmCfNei8x3Iww8+0WJXkboxJDLEbGtuR+2iU5kmeY6NzedtHDDWsXwBcio78
	8/wzn9AAg8jR7T74FqJteoFG3falPgB6IwZGMIIV1WA17kmeS58rNtlR5Az9vccEtEqM
	q07GC1yzFJ15D/jM6KxcQ00vuJ3mdkMvLPoUEnJNtSHrR2+J2tefxRD8fECWlJoOTV8O
	e2B/xaBnCHwWCXdFLkQSQhvq6PVsyOc+0wKsjQEV/hT08nLwf0Ks4Dht/V0s2AJ5zHBn
	qNcA==
X-Received: by 10.180.84.73 with SMTP id w9mr1662535wiy.58.1396441555544;
	Wed, 02 Apr 2014 05:25:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm4223756eel.1.2014.04.02.05.25.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:25:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 14:25:33 +0200
Message-Id: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/5] cmake: Add ugly hack from meta-qt5 to prevent cmake trying to detect qt5
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
X-List-Received-Date: Wed, 02 Apr 2014 12:25:56 -0000

* cmake doesn't have dependency on qt4/qt5, so these tests usually fail
  but still can cause undeterministic results or build failures (when
  OE_QMAKE_PATH_EXTERNAL_HOST_BINS is undefined or native qmake removed
  while running the test in cmake)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1d5303f..a0fcf49 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,6 +21,28 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
 
 inherit autotools-brokensep
 
+# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
+# and possibly missing qmake binary (qtbase-native can be removed from sysroot
+# e.g. in order to upgrade it, even when there is target qtbase)
+
+# Fixes errors like this in cmake(-native).do_configure:
+#| -- Performing Test run_pic_test - Success
+#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
+#|   The imported target "Qt5::Core" references the file
+#|
+#|      "/qmake"
+#|
+#|   but this file does not exist.  Possible reasons include:
+
+do_configure_prepend() {
+	sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
+	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
+	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
+	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
+}
+
 do_configure () {
 	./configure --prefix=${prefix}
 }
-- 
1.9.1


