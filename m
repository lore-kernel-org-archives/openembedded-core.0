Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 485F06017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7F3Gu007648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:15:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:15:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:58 -0700
Message-ID: <b91300b2bbe0577f26b1fd98f23394c34b820c55.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] qt4: fixes for sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:03 -0000
Content-Type: text/plain

* There is no $$QT_BUILD_TREE/bin/lrelease in any .pro file, so remove
  the sed command.
* Only translations/translations.pro has "qtPrepareTool(LRELEASE", so
  use the file name directly rather than find all the .pro files.
* The SEDME in linux.conf had been gone in 2010, and no
  '-Wl,-rpath-link' in linux.conf either, so remove the sed commands.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.7.inc |    8 ++------
 meta/recipes-qt/qt4/qt4.inc       |    3 ---
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.8.7.inc
index 67fad3a..5257e76 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -52,13 +52,9 @@ FILES_${QT_BASE_NAME}-tests-dbg        = "${prefix}/tests/qt4/*/.debug"
 FILES_${QT_BASE_NAME}-tests            = "${prefix}/tests/qt4/*"
 
 do_configure_prepend() {
-    for pro in $(find ${S} -name "*.pro") ; do
-        sed -i \
-            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
-            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
-    done
+    sed -i 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' \
+        ${S}/translations/translations.pro
 
-    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
     sed -i \
     -e /QMAKE_MOC\ /d \
     -e /QMAKE_UIC\ /d \
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index f1c792b..2058e54 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -350,9 +350,6 @@ do_install() {
 			-e 's#-ljscore##g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
 
-	sed -i -e s#" -Wl,-rpath-link,${S}/lib"##g \
-			${D}${datadir}/${QT_DIR_NAME}/mkspecs/common/linux.conf
-
 	# fix pkgconfig files
 	sed -i -e s#"moc_location=.*$"#"moc_location=${bindir}/moc4"# \
 			-e s#"uic_location=.*$"#"uic_location=${bindir}/uic4"# \
-- 
1.7.9.5


