Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RATyc-0007nl-Tw
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 23:53:38 +0200
Received: by bke11 with SMTP id 11so4594411bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=P9YKcUbCNP4Tc2E0Y4YkyATuPWRLcD8WeLOoxPzae+g=;
	b=MlF2cZWn3egyV0DzQQilJAH6KlmK/c0Y7K/lRPAz+rgHnLlCJxOEK1hCejb5KqguNe
	mFHV2BEypz+cNhTAPXFsU3cuBfHvXVysIxiqvnW33h0+TnJNqdORzzTWP0Ki4GAeXY8J
	oNe2D2YMnsJApjE1RL+ViBYlt2bAG8vemNa9c=
Received: by 10.204.148.23 with SMTP id n23mr472390bkv.133.1317592087543;
	Sun, 02 Oct 2011 14:48:07 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id e14sm11120209bka.0.2011.10.02.14.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 14:48:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 01:46:11 +0400
Message-Id: <1317591971-22553-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1317591971-22553-1-git-send-email-dbaryshkov@gmail.com>
References: <1317591971-22553-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/2] qt4: packaging fixup
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
X-List-Received-Date: Sun, 02 Oct 2011 21:53:39 -0000

Improve packaging:
* Add phrasebook packages to DYNAMIC_PACKAGES
* Correct phrasebook packages generation
* Include more files into -dbg packages
* Package fontdir and fonts README.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
 meta/recipes-qt/qt4/qt4.inc          |   13 ++++++++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 53e1297..79473c9 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r34"
+INC_PR = "r35"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index f76a97f..f391028 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r31"
+INC_PR = "r32"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index eb01a1b..d6382f5 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -50,7 +50,7 @@ python __anonymous () {
                   ${libdir}/lib%(name)s${QT_LIBINFIX}.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
                   ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
+        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so*" % locals(), d)
         bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg", d)
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
@@ -67,7 +67,7 @@ python __anonymous () {
                   ${libdir}/lib%(name)s.so
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
                   ${libdir}/pkgconfig/%(name)s.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so.*" % locals(), d)
+        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so*" % locals(), d)
         bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg", d)
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
@@ -104,7 +104,7 @@ OTHER_PACKAGES = "\
 #We prepend so ${QT_BASE_NAME}-demos-doc comes before ${PN}-doc,so the packaging of FILES_ get done before.
 PACKAGES =+ "${QT_BASE_NAME}-demos-doc"
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
+PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-phrasebook-* ${QT_BASE_NAME}-fonts-*"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
@@ -157,6 +157,7 @@ FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
 FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
 FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
 FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf"
+FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts/README ${libdir}/fonts/fontdir"
 FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
 FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
 FILES_${QT_BASE_NAME}-pixeltool            = "${bindir}/pixeltool"
@@ -171,7 +172,7 @@ FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/
 FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
 FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
-FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug"
+FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/.debug"
 
 do_configure() {
 	unset QMAKESPEC
@@ -233,8 +234,10 @@ python populate_packages_prepend() {
         phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
         phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
         import os;
-        if os.path.exists(phrasebook_dir):
+        if os.path.exists("%s%s" % (bb.data.expand('${D}',d), phrasebook_dir)):
                 do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
+        else:
+                bb.note("The path does not exist:", bb.data.expand('${D}', d), phrasebook_dir)
  
         # Package all the plugins and their -dbg version and create a meta package
         def qtopia_split(path, name, glob):
-- 
1.7.2.5



