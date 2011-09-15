Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R4Ejq-0002gO-SP
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 18:24:35 +0200
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 439994B0074;
	Thu, 15 Sep 2011 18:19:19 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 18:19:16 +0200
Message-Id: <1316103556-24569-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <4E7222E5.6070401@eukrea.com>
References: <4E7222E5.6070401@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH v2] qt4.inc: package qtdemo's docs in a separate package
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
X-List-Received-Date: Thu, 15 Sep 2011 16:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The documentation was 285M and doesn't fit on the NAND of many machines,
  but in another had part of the documentation is needed for the
  QT demos, so we split the documentation: so qt demo only RRECOMMAND
  the documentation that it really needs.

Thanks to Eric B=C3=A9nard for explaining me how to split it.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |    7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/q=
t4-embedded.inc
index 9914c61..1ede922 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION =3D "libs"
 LICENSE =3D "LGPLv2.1 | GPLv3"
 HOMEPAGE =3D "http://qt.nokia.com"
 DEPENDS +=3D "directfb tslib"
-INC_PR =3D "r30"
+INC_PR =3D "r31"
=20
 QT_BASE_NAME ?=3D "qt4-embedded"
 QT_BASE_LIB  ?=3D "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
index 0a714be..a360ec3 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
 SECTION =3D "x11/libs"
 DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
=20
-INC_PR =3D "r27"
+INC_PR =3D "r28"
=20
 QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
, '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 =3D "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 5545be7..ae616f7 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -101,6 +101,8 @@ OTHER_PACKAGES =3D "\
              ${QT_BASE_NAME}-qt3to4 \
              ${QT_BASE_NAME}-qml-plugins"
=20
+#We prepend so ${QT_BASE_NAME}-demos-doc comes before ${PN}-doc,so the p=
ackaging of FILES_ get done before.
+PACKAGES =3D+ "${QT_BASE_NAME}-demos-doc"
 PACKAGES +=3D "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_P=
ACKAGES}"
 PACKAGES_DYNAMIC =3D "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translati=
on-* ${QT_BASE_NAME}-fonts-*"
=20
@@ -109,6 +111,7 @@ ALLOW_EMPTY_${QT_BASE_NAME}-fonts =3D "1"
 FILES_${PN}     =3D ""
 FILES_${PN}-dev =3D "${includedir}/${QT_DIR_NAME}/Qt/*"
 FILES_${PN}-dbg =3D "${exec_prefix}/src/debug/"
+FILES_${QT_BASE_NAME}-demos-doc =3D "${docdir}/qtopia/qch/qt.qch"
 RRECOMMENDS_${PN} =3D "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev =3D "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg =3D "${DBG_PACKAGES}"
@@ -125,13 +128,15 @@ RRECOMMENDS_${QT_BASE_NAME}-demos +=3D " \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
             ${QT_BASE_NAME}-qml-plugins \
             ${QT_BASE_NAME}-assistant \
-            ${PN}-doc"
+            ${QT_BASE_NAME}-demos-doc"
 RRECOMMENDS_${QT_BASE_NAME}-examples +=3D " \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
             ${QT_BASE_NAME}-plugin-imageformat-jpeg \
             ${QT_BASE_NAME}-qml-plugins"
 RRECOMMENDS_${QT_BASE_NAME}-qmlviewer +=3D " \
             ${QT_BASE_NAME}-qml-plugins"
+RRECOMMENDS_${QT_BASE_NAME}-doc +=3D " \
+            ${QT_BASE_NAME}-demos-doc"
=20
 FILES_${QT_BASE_NAME}-tools                =3D "${bindir}/qttracereplay =
${bindir}/qdoc*"
 FILES_${QT_BASE_NAME}-tools-dbg            =3D "${bindir}/.debug/qttrace=
replay ${bindir}/.debug/qdoc*"
--=20
1.7.4.1



