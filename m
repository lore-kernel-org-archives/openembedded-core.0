Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPal7-00088P-O7
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:42:25 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so541647bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8RBwNvegoifsaGsv5vW6Nuo/fX5Cm6OPooB7n/VdFQE=;
	b=kzo8dg7IR+Ia6p0TAnOjwi4WqXCqOL5HI/0MKj3PMYDKx+zdor+PHydJ6yMJuMVrDe
	b2SygMuVwa8RWcOFxNDzgyreiVJJxvSDg8RY5KVoG+ByO/p4tPnkN9v3fgs6M/qDeZKI
	3xERU47sJdkTVlxA1GqGu2CDD7zCYkDAJ9SfI5JtnPC5vtRmukMbNnONfuPPgd7yfMzw
	1f1tQ8Qx7Okffm0Ko/+h38i31Y0RqCtGtieKe761a+yDkMVoDWxa/JpJtVehFYXPsUdK
	i533kbzv/lMbIQX/AKIIGFYRO2xQbUWTUgIDElF8Xi5+9C+I1M425Acl6fNBK+TK38oG
	HaZA==
Received: by 10.205.133.19 with SMTP id hw19mr2773453bkc.0.1335969163284;
	Wed, 02 May 2012 07:32:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s20sm4321728bks.2.2012.05.02.07.32.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:32:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 16:32:35 +0200
Message-Id: <8bad5055c1e2074bee56611b8b42477086087159.1335969047.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335969047.git.Martin.Jansa@gmail.com>
References: <cover.1335969047.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] qt-4.8.1: fix creating /include directory in build host root
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
X-List-Received-Date: Wed, 02 May 2012 14:42:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../qt4/files/set-OUTPUT_DIR-if-empty.patch        |   19 +++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 4 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch

diff --git a/meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch b/meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch
new file mode 100644
index 0000000..9cb72ba
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/set-OUTPUT_DIR-if-empty.patch
@@ -0,0 +1,19 @@
+Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
+now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
+
+First reported here:
+http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24436.html
+
+Upstream-Status: Pending
+
+--- qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro.orig	2012-05-01 07:48:08.457613310 +0200
++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro	2012-05-01 07:48:15.493613232 +0200
+@@ -3,6 +3,8 @@
+ 
+ CONFIG -= debug_and_release
+ 
++isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../..
++
+ CONFIG(standalone_package) {
+     isEmpty(WEBKIT2_GENERATED_SOURCES_DIR):WEBKIT2_GENERATED_SOURCES_DIR = $$PWD/generated
+     isEmpty(WC_GENERATED_SOURCES_DIR):WC_GENERATED_SOURCES_DIR = $$PWD/../WebCore/generated
diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.8.1.inc
index 2fc4228..b923e60 100644
--- a/meta/recipes-qt/qt4/qt-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://gcc47-fix2.patch \
            file://disable-fuse-gold-flag.patch \
            file://fix_conflicting_types.patch \
+           file://set-OUTPUT_DIR-if-empty.patch \
            "
 
 SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 291e62a..0b304a0 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r44"
+INC_PR = "r45"
 
 QT_BASE_LIB  ?= "libqt-embedded"
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 720b1bf..da98962 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r42"
+INC_PR = "r43"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.8.6



