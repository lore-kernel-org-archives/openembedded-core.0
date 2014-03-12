Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3EA0610CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 07:47:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C7l8uU017069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:47:08 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 12 Mar 2014 00:47:08 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 15:46:57 +0800
Message-ID: <6cfb8b40cecff683d66529a1274e2984505877a9.1394610315.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394610315.git.kai.kang@windriver.com>
References: <cover.1394610315.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/5] qmmp: update to 0.7.5
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
X-List-Received-Date: Wed, 12 Mar 2014 07:47:10 -0000
Content-Type: text/plain

Update qmmp to 0.7.5 version

* update no-host-paths.patch
* remove no-sessionmanager.patch which is merged

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch    | 13 +++++++------
 .../recipes-qt/qt-apps/qmmp/no-sessionmanager.patch | 21 ---------------------
 .../qt-apps/{qmmp_0.6.6.bb => qmmp_0.7.5.bb}        |  6 +++---
 3 files changed, 10 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.6.6.bb => qmmp_0.7.5.bb} (93%)

diff --git a/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch b/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
index de17b4e..2bb5bb11 100644
--- a/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
+++ b/meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
@@ -8,16 +8,17 @@ Upstream-Status: Inappropriate [cross]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,12 +1,5 @@
+Update patch for version 0.7.4.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+--- qmmp-0.7.4/CMakeLists.txt	2014-01-10 09:59:44.971837746 +0800
++++ qmmp-0.7.4/CMakeLists.txt.new	2014-01-10 10:24:51.855837566 +0800
+@@ -1,9 +1,5 @@
  cmake_minimum_required(VERSION 2.6.0)
  
 -#freebsd support
 -include_directories(SYSTEM /usr/local/include)
--link_directories(/usr/local/lib)
--link_directories(/usr/local/lib32)
--link_directories(/usr/local/lib64)
 -SET(CMAKE_REQUIRED_INCLUDES ${CMAKE_REQUIRED_INCLUDES} /usr/local/include)
 -
  #extract version from qmmp.h
diff --git a/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch b/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
deleted file mode 100644
index 5e2978b..0000000
--- a/meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Don't call session manager function if not enabled
-
-If session management has been disabled we will get a compilation
-failure if we try to call QApplication::commitData() so don't do so if
-it is disabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- a/src/app/qmmpapplication.cpp
-+++ b/src/app/qmmpapplication.cpp
-@@ -29,6 +29,8 @@ void QmmpApplication::commitData(QSessionManager &manager)
- {
-     if(UiHelper::instance())
-         UiHelper::instance()->exit();
-+#ifndef QT_NO_SESSIONMANAGER
-     else
-         QApplication::commitData(manager);
-+#endif
- }
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb b/meta/recipes-qt/qt-apps/qmmp_0.7.5.bb
similarity index 93%
rename from meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.7.5.bb
index ddfdfdc..910e7c2 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.7.5.bb
@@ -10,10 +10,10 @@ DEPENDS = "taglib libmad libvorbis libogg alsa-lib libsndfile1 libsamplerate0 cu
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2 \
            file://no-host-paths.patch \
-           file://no-sessionmanager.patch"
+          "
 
-SRC_URI[md5sum] = "0131a9bf7b98737c1a6fd6e1a897e2b2"
-SRC_URI[sha256sum] = "dfa973cca80c020a85a11bb66701a3804f9fde326440abb179559c98bf3b5b99"
+SRC_URI[md5sum] = "dcc3c9ecd4dfbf0ced91c59cb894d460"
+SRC_URI[sha256sum] = "6066aea939813667dae7cf32ff1d6eb9913894977d132c2cd729fea22d24cf67"
 
 inherit cmake qt4x11
 
-- 
1.8.1.2


