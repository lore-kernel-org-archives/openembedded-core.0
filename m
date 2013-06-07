Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEA96A456
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 02:07:24 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf10so1726472pab.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 19:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=C8GXhnwv2vPUhDDx1vRbkXNqGvL7r1HBTXd2XdVSq9g=;
	b=S6TmHwNmbfYGnHJrzdOjIxLdG+8yiE+jQq60w2GxaU50TbCAchgpm/rwrvPrnRBcG9
	lV4V8eFMv7MiYK5IAkVlcvGvKmwHDfWSduLuAdhrNe2o8Pga3lZqUHjqNaolG03iFVgL
	UGXEIVzVE7n9L+XyYRidLG3lOKYyqWyeTgAomHzVaQTslLbGBadGMUVz12IeFlI2br3U
	KTNDNvDZkwD5zKQGQFpJxGqk+wnAn5je8HUDhhnbTMlKUohxIZzOF4G8UB/5+hRjIks8
	hHZHkCVkjzpmlUAZYQfeEqqrdtoe+aMXkmt9N8Z65nKJfQXYJE8r1XBMYk+fBYaYO4kY
	pw5g==
X-Received: by 10.68.17.8 with SMTP id k8mr22943123pbd.102.1370570845640;
	Thu, 06 Jun 2013 19:07:25 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nt6sm46739422pbb.4.2013.06.06.19.07.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 19:07:24 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 12:21:08 +1000
Message-Id: <1370571668-22560-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] qt4-native: update configure paths to match target
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
X-List-Received-Date: Fri, 07 Jun 2013 02:07:24 -0000

qmake2 was being built with paths different to the target Qt.

The incorrect paths can be seen by running qmake2 -query:
QT_INSTALL_DOCS:${STAGING_DIR_NATIVE}/usr/doc
  should be /usr/share/doc/qt4
QT_INSTALL_PLUGINS:${STAGING_DIR_NATIVE}/usr/plugins
  should be /usr/lib/qt4/plugins
QT_INSTALL_IMPORTS:${STAGING_DIR_NATIVE}/usr/imports
  should be /usr/lib/qt4/imports
QT_INSTALL_TRANSLATIONS:${STAGING_DIR_NATIVE}/usr/translations
  should be /usr/share/qt4/translations
QT_INSTALL_EXAMPLES:${STAGING_DIR_NATIVE}/usr/examples
  should be /usr/bin/qt4/examples
QT_INSTALL_DEMOS:${STAGING_DIR_NATIVE}/usr/demos
  should be /usr/bin/qt4/demos
QMAKE_MKSPECS:${STAGING_DIR_NATIVE}/usr/mkspecs
  should be /usr/share/qt4/mkspecs

Use the same paths as target Qt for consistency. As the mkspecs are
installed to /usr/share/qt4/mkspecs not /usr/mkspecs, qmake2 was
unable to detect and load the webkit module (it is detected by loading
modules/qt_*.pri inside the mkspecs directory) so webkit was missing
from QT_CONFIG if a qmake project reads the QT_CONFIG variable.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-native.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 59c8ab5..cd6092a 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -25,6 +25,17 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 EXTRA_OECONF = "-prefix ${prefix} \
+                -bindir ${bindir} \
+                -libdir ${libdir} \
+                -datadir ${datadir}/qt4 \
+                -sysconfdir ${sysconfdir}/qt4 \
+                -docdir ${docdir}/qt4 \
+                -headerdir ${includedir}/qt4 \
+                -plugindir ${libdir}/qt4/plugins \
+                -importdir ${libdir}/qt4/imports \
+                -translationdir ${datadir}/qt4/translations \
+                -examplesdir ${bindir}/qt4/examples \
+                -demosdir ${bindir}/qt4/demos \
                 -L ${STAGING_LIBDIR_NATIVE} \
                 -I ${STAGING_INCDIR_NATIVE} \
                 -qt-libjpeg -system-zlib \
@@ -34,7 +45,6 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -no-nas-sound \
                 -no-nis -no-openssl \
                 -verbose -release \
-                -headerdir ${includedir}/qt4 \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -exceptions -xmlpatterns \
                 -qt3support \
-- 
1.8.2.3


