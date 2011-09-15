Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R48Io-000238-Dt
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 11:32:22 +0200
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C089F4B0067;
	Thu, 15 Sep 2011 11:26:23 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:26:15 +0200
Message-Id: <1316078776-19890-2-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1316078776-19890-1-git-send-email-denis@eukrea.com>
References: <1316078776-19890-1-git-send-email-denis@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] qt4.inc: package qtdemo's docs in a separate package
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
X-List-Received-Date: Thu, 15 Sep 2011 09:32:22 -0000
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
 meta/recipes-qt/qt4/qt4.inc          |   57 ++++++++++++++++++++++++++++=
+++++-
 3 files changed, 58 insertions(+), 3 deletions(-)

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
index 5545be7..585df83 100644
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
@@ -125,13 +127,15 @@ RRECOMMENDS_${QT_BASE_NAME}-demos +=3D " \
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
@@ -272,6 +276,57 @@ python populate_packages_prepend() {
         qtopia_split('styles',        'style',         '^libq(.*)\.so$')
         qtopia_split('phonon_backend','phonon-backend','^libphonon_(.*)\=
.so$')
         qtopia_split('bearer',        'bearer',        '^libq(.*)bearer\=
.so$')
+
+        #handle the QT documentation split:
+        #only a small part of the documentation is needed for qt-doc
+        import xml.parsers.expat
+        curdir =3D []
+
+        class handler:
+                def __init__(self):
+                        self.allfiles =3D []
+                def add(self,name,attrs):
+                        if name =3D=3D 'demos' and 'dirname' in attrs:
+                                if (attrs['dirname'] !=3D '.'):
+                                        curdir.append(attrs['dirname'].r=
eplace('/','-'))
+                                else:
+                                        curdir.append(name.replace('/','=
-'))
+                        if name =3D=3D 'category' and 'dirname' in attrs=
:
+                                curdir.append(attrs['dirname'].replace('=
/','-'))
+                        if name =3D=3D 'example' and 'filename' in attrs=
:
+                                path =3D (attrs['filename'].replace('/',=
'-'))
+                                if (len(curdir) is 0):
+                                        self.allfiles.append(path)
+                                else:
+                                        self.allfiles.append("-".join(cu=
rdir) + '-' + path)
+                def clean(self,name):
+                        if (len(curdir) is not 0 ) and (name =3D=3D 'cat=
egory' or name =3D=3D 'demos'):
+                                curdir.remove(curdir[-1])
+                def __repr__(self):
+                        return repr(self.allfiles)
+                def result(self):
+                        return self.allfiles
+        h =3D handler()
+        # 3 handler functions
+        def start_element(name, attrs):
+                h.add(name,attrs)
+        def end_element(name):
+                h.clean(name)
+        def char_data(data):
+                pass
+
+        p =3D xml.parsers.expat.ParserCreate()
+        p.StartElementHandler =3D start_element
+        p.EndElementHandler =3D end_element
+        p.CharacterDataHandler =3D char_data
+
+        f =3D open("%s/%s/qtopia/demos/qtdemo/xml/examples.xml" % ( bb.d=
ata.getVar("D",d,1) ,  bb.data.getVar("bindir",d,1) ) ,'r');
+        p.ParseFile(f)
+
+        docs =3D []
+        for element in h.result():
+                docs.append("${docdir}/qtopia/html/" + element + "*")
+        bb.data.setVar("FILES_%s-demos-doc" % bb.data.getVar("QT_BASE_NA=
ME",d,1) ,str(" ".join(docs)),d)
 }
=20
 do_install() {
--=20
1.7.4.1



