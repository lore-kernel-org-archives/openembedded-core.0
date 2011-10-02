Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RASD8-0005vK-Cs
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 22:00:30 +0200
Received: from mail405.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 8A7A910043E6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2011 21:47:20 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Oct 2011 21:46:01 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 2 Oct 2011 21:45:59 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Sun,  2 Oct 2011 21:45:39 +0200
Message-Id: <1317584739-9480-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <j6abik$9f7$1@dough.gmane.org>
References: <j6abik$9f7$1@dough.gmane.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13796495983753276866
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -20
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrfeeiucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuchlihhnuhigvdigucdlqddvtddm
Subject: [PATCH] qt-4.7.4: fix translation support
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
X-List-Received-Date: Sun, 02 Oct 2011 20:00:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- this was fiexed in 4.7.3 by :
d8b9aad9e3fa0cacbde4597d45f68652009af001
- but forgotten in the 4.7.4 upgrade in :
c3a784cb13f0afc0616ae3ed4102271c6dde17af

Thanks to Dmitry Eremin-Solenikov for noticing this.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    9 ++---
 .../recipes-qt/qt4/qt-4.7.4/fix-translations.patch |   32 ++++++++++++++=
++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 6 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.=
7.4.inc
index 5c06bbe..bc33b6b 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -13,6 +13,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-every=
where-opensource-src-${PV}.
            file://0009-support-2bpp.patch \
            file://0001-Added-Openembedded-crossarch-option.patch \
            file://blacklist-diginotar-certs.diff \
+           file://fix-translations.patch \
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
@@ -27,7 +28,9 @@ FILES_${QT_BASE_NAME}-tools                +=3D "${bind=
ir}/qml"
=20
 do_configure_prepend() {
     for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $=
pro
+        sed -i \
+            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
+            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE =3D ${OE_QM=
AKE_LRELEASE}:g' $pro
     done
=20
     sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
@@ -39,10 +42,6 @@ do_configure_prepend() {
     ${S}/configure
 }
=20
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makef=
ile
-}
-
 QT_GLFLAGS ?=3D ""
 QT_CONFIG_FLAGS +=3D " -xmlpatterns -no-rpath -qt3support -reduce-reloca=
tions -silent ${QT_GLFLAGS}"
=20
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch b/meta/r=
ecipes-qt/qt4/qt-4.7.4/fix-translations.patch
new file mode 100644
index 0000000..906d4e3
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch
@@ -0,0 +1,32 @@
+fix phony translation linking error
+
+  | .../usr/lib/crt1.o: In function `_start':
+  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
+  | collect2: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/translations/translations.pro b/translations/translations.p=
ro
+index cdaf04a..24fa668 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -20,7 +20,7 @@ updateqm.name =3D LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG +=3D no_link
+ QMAKE_EXTRA_COMPILERS +=3D updateqm
+=20
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK =3D @: IGNORE THIS LINE
+     OBJECTS_DIR =3D
+     win32:CONFIG -=3D embed_manifest_exe
+@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+     phony_src.input =3D PHONY_DEPS
+     phony_src.output =3D phony.c
+     phony_src.variable_out =3D GENERATED_SOURCES
+-    phony_src.commands =3D echo int main() { return 0; } > phony.c
++    phony_src.commands =3D echo \"int main() { return 0; }\" > phony.c
+     phony_src.name =3D CREATE phony.c
+     phony_src.CONFIG +=3D combine
+     QMAKE_EXTRA_COMPILERS +=3D phony_src
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/q=
t4-embedded.inc
index 53e1297..79473c9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION =3D "libs"
 LICENSE =3D "LGPLv2.1 | GPLv3"
 HOMEPAGE =3D "http://qt.nokia.com"
 DEPENDS +=3D "directfb tslib"
-INC_PR =3D "r34"
+INC_PR =3D "r35"
=20
 QT_BASE_NAME ?=3D "qt4-embedded"
 QT_BASE_LIB  ?=3D "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4=
-native.inc
index ebbee9b..a3ffe03 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Dfbc093901=
857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=3Dbabc5b6b77441da277f5c06b2e=
547720 \
                     file://LGPL_EXCEPTION.txt;md5=3D411080a56ff917a5a1aa=
08c98acae354"
=20
-INC_PR =3D "r13"
+INC_PR =3D "r14"
=20
 inherit native
=20
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-q=
t/qt4/qt4-tools-nativesdk.inc
index a71c3ae..b1a5661 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION =3D "libs"
 HOMEPAGE =3D "http://qt.nokia.com"
 LICENSE =3D "LGPLv2.1 | GPLv3"
=20
-INC_PR =3D "r7"
+INC_PR =3D "r8"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
=20
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
index f76a97f..f391028 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://qt.nokia.com"
 SECTION =3D "x11/libs"
 DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
=20
-INC_PR =3D "r31"
+INC_PR =3D "r32"
=20
 QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
, '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 =3D "-opengl"
--=20
1.7.6.2



