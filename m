Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RVLJr-0006C5-Q6
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 11:53:48 +0100
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id A2C2A4B0480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 11:47:07 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 11:47:05 +0100
Message-Id: <1322563625-22780-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [PATCH] qt4: fix sed to have correct *.pc files
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
X-List-Received-Date: Tue, 29 Nov 2011 10:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

it seems sed doesn't handle \? properly if the string in not between
quotes.

without this patch, we get something like (for example for QtDBusE.pc :
Libs: -L${libdir} -lQtDBusE
Libs.private: -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom_2010_=
x-eglibc/sysroots/board/
usr/lib -L/usr/lib  -L/home/ebenard/WORK/setup-scripts/build/tmp-angstrom=
_2010_x-eglibc/sysroots/board
/usr/lib -lQtXmlE -L/usr/lib -lQtCoreE -lpthread
Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}

with the patch we get what is expected :
Libs: -L${libdir} -lQtDBusE
Libs.private:     -lQtXmlE  -lQtCoreE -lpthread
Cflags: -DQT_SHARED -I/usr/include/qtopia -I${includedir}

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/q=
t4-embedded.inc
index bee7345..c4f6e98 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION =3D "libs"
 LICENSE =3D "LGPLv2.1 | GPLv3"
 HOMEPAGE =3D "http://qt.nokia.com"
 DEPENDS +=3D "directfb tslib"
-INC_PR =3D "r36"
+INC_PR =3D "r37"
=20
 QT_BASE_NAME ?=3D "qt4-embedded"
 QT_BASE_LIB  ?=3D "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
index f391028..5abb5a1 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
 SECTION =3D "x11/libs"
 DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
=20
-INC_PR =3D "r32"
+INC_PR =3D "r33"
=20
 QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
, '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 =3D "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 82ba637..b365e75 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -294,13 +294,13 @@ do_install() {
 	rm -f ${D}/${bindir}/lrelease
=20
 	# fix pkgconfig, libtool and prl files
-	sed -i -e s#-L${S}/lib/\?##g \
-			-e s#-L${STAGING_LIBDIR}/\?##g \
+	sed -i -e 's#-L${S}/lib/\?##g' \
+			-e 's#-L${STAGING_LIBDIR}/\?##g' \
 			-e 's#STAGING_LIBDIR}#libdir}'#g \
-			-e s#-L${libdir}/\?##g \
+			-e 's#-L${libdir}/\?##g' \
 			-e s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
-			-e s#" -Wl,-rpath-link,${S}/lib/\?"##g \
-			-e s#" -Wl,-rpath-link,${libdir}/\?"##g \
+			-e 's#" -Wl,-rpath-link,${S}/lib/\?"##g' \
+			-e 's#" -Wl,-rpath-link,${libdir}/\?"##g' \
 			-e 's#Iin#I${in#g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
=20
--=20
1.7.6.4



