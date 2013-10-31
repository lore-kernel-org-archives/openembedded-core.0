Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id BF5196D45E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 19:10:22 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id c50so928989eek.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yM1S4BRZvmvmqwHvlg36Yti6uSgmnmT/m58KM5KV9rU=;
	b=v7HBbdDZBu24D6SnQ21zF+8TSajzKgbQutCsMkS9LKkg0fZsmCwQ4d07/dxqTupZgY
	pZupfWXCKO7V2HGJ++A9d0jeeW4ZYzAiBNgx0Rs8LBZ8DP1mJsWNFDxY4AC0QGKdbyPz
	HO3lYQ0CelGNPyIzX254twq1q9aGJuIVA7ZiaJf+vqpu0cMVX4fBlwWNf+N7yH7LRoqD
	N8U7Vk6+SBc+6T2a/FV9h812O2Cr6LEo3v100G7Cur3uFozyg4ie5G5dd94753DUfe7x
	xgNLu+zdyykxi+6cExnKg2ScWAVN3ICwJz/a32qd5Pvaq8UPzjf15F7yXVVh8jI/PQ65
	kPVA==
X-Received: by 10.15.21.12 with SMTP id c12mr719703eeu.114.1383246624286;
	Thu, 31 Oct 2013 12:10:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m54sm12283123eex.2.2013.10.31.12.10.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 12:10:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 20:10:25 +0100
Message-Id: <1383246625-32068-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [RFC][PATCH] qt-mobility: fix installation path of header files
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
X-List-Received-Date: Thu, 31 Oct 2013 19:10:24 -0000

* RFC only as heads-up, this patch doesn't work yet, it triggers
  different kinds of issues, but qt-mobility seems to be broken
  like this for quite long time, so I'm surprised nobody reported
  it sooner
* since this commit
  commit f7409a9fe83ba2535a43f39ed57cd78242a88557
  Author: Roy.Li <rongqing.li@windriver.com>
  Date:   Mon Jun 24 13:08:03 2013 +0800
  Subject: qt-mobility: remove /usr/lib from ld rpath-link option

  header files are partially installed in ${includedir} and partially
  in ${includedir}/qt4

  $ ls 1.2.0-r8-default/image/usr/include/
    QtBearer    QtFeedback  QtLocation  QtMultimediaKit  QtPublishSubscribe  QtSystemInfo  QtVersitOrganizer
    QtContacts  QtGallery   QtMobility  QtOrganizer      QtServiceFramework  QtVersit      qt4

  before we had them all in ${includedir}/qt4
  $ ls 1.2.0-r8-rpath-reverted/image/usr/include/
    qt4
  $ ls 1.2.0-r8-rpath-reverted/image/usr/include/qt4/
    QtBearer        QtContacts  QtGallery   QtMobility       QtOrganizer         QtSensors           QtSystemInfo  QtVersitOrganizer
    QtConnectivity  QtFeedback  QtLocation  QtMultimediaKit  QtPublishSubscribe  QtServiceFramework  QtVersit

  it's not caused by the patch itself (it seems to trigger some
  reconfiguration which breaks it, it can be broken also by running
  configure again in the same directory).

* moved haders are broken, because include paths in applications using
  e.g. QtLocation point only to ${includedir}/qt4/QtLocation and files
  there want to include headers now in ${includedir}/qt4/, e.g. monav
  fails:
  sysroots/om-gta02/usr/include/qt4/QtLocation/QGeoPositionInfoSource:1:36:
    fatal error: qgeopositioninfosource.h: No such file or directory
    #include "qgeopositioninfosource.h"
  and qgeopositioninfosource.h is in
  sysroots/om-gta02/usr/include/QtLocation/qgeopositioninfosource.h

* use configure parameters to set paths, because config.pri contains
  every path twice, first from configure script without qt4 prefix and
  then appended from do_configure, I was suspecting that that's the
  reason why some headers get installed to includedir without qt4 prefix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 062702f..9390a75 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -40,6 +40,9 @@ qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
 QTM_MODULES_LIST ?= "bearer contacts gallery location publishsubscribe messaging multimedia \
 systeminfo serviceframework sensors versit organizer feedback connectivity"
 
+#EXTRA_QMAKEVARS_PRE += "QT_CONFIG ${qtm_glflags}"
+#EXTRA_QMAKEVARS_PRE += "CONFIG += ${qtm_embedded}"
+
 do_configure_prepend() {
 	cp qtmobility.pro qtmobility.pro.old
 	sed -e 's@...QT_INSTALL_DATA.@${qtm_data}@' <qtmobility.pro.old >qtmobility.pro
@@ -79,13 +82,19 @@ gypsy_enabled = no
 ${qtm_extra_config}
 EOF
 
-	./configure -qmake-exec qmake2 -prefix /usr -staticconfig oe -examples -demos -modules "${QTM_MODULES_LIST}"
-	echo QT_MOBILITY_BIN = ${qtm_bin} >>./config.pri
-	echo QT_MOBILITY_LIB = ${qtm_lib} >>./config.pri
-	echo QT_MOBILITY_INCLUDE = ${qtm_include} >>./config.pri
-	echo QT_MOBILITY_PLUGINS = ${qtm_plugins} >>./config.pri
-	echo QT_MOBILITY_EXAMPLES = ${qtm_examples} >>./config.pri
-	echo QT_MOBILITY_DEMOS = ${qtm_demos} >>./config.pri
+	./configure \
+		-bindir ${qtm_bin} \
+		-libdir ${qtm_lib} \
+		-headerdir ${qtm_include} \
+		-plugindir ${qtm_plugins} \
+		-examplesdir ${qtm_examples} \
+		-demosdir ${qtm_demos} \
+		-qmake-exec qmake2 \
+		-prefix /usr \
+		-staticconfig oe \
+		-examples \
+		-demos \
+		-modules "${QTM_MODULES_LIST}"
 	echo QT_CONFIG ${qtm_glflags} >>./config.pri
 	echo CONFIG += ${qtm_embedded} >>./config.pri
 }
-- 
1.8.4.2


