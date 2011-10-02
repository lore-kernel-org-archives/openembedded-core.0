Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RATyb-0007nk-I5
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 23:53:37 +0200
Received: by bke11 with SMTP id 11so4594393bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 14:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MoA/pjivVWxk6C4YyIFRYanS8QSDbSB69TCeehu9TcM=;
	b=e4dgUAxf4jlE+ExL02PTVtU3ZVI2eJ+JwUZJAnYBNNmxiZuJWfTJHvMcovnpipw9lD
	CEfqQhVY8VwbwYpFYBGeFJYWtQ9gs42GVjMG63w053BTvuwIY+dASof6VYBD+JGqpQLH
	dYlsqtoJmi+Q/KE7mHZaw2lud+Im0EEzS3qQ8=
Received: by 10.204.150.202 with SMTP id z10mr212745bkv.279.1317592086025;
	Sun, 02 Oct 2011 14:48:06 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id e14sm11120209bka.0.2011.10.02.14.48.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 14:48:04 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 01:46:10 +0400
Message-Id: <1317591971-22553-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 1/2] qt4: Fix translation support
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
X-List-Received-Date: Sun, 02 Oct 2011 21:53:37 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The translation support was disable in build. The
fix-translation.patch was imported from OpenEmbedded to fix a linking
issue in phonon translation support.

[Dmitry Eremin-Solenikov: ported to apply to qt 4.7.4 build, bumped PR]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    9 ++---
 .../recipes-qt/qt4/qt-4.7.4/fix-translations.patch |   32 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 4 files changed, 38 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch

diff --git a/meta/recipes-qt/qt4/qt-4.7.4.inc b/meta/recipes-qt/qt4/qt-4.7.4.inc
index 5c06bbe..bc33b6b 100644
--- a/meta/recipes-qt/qt4/qt-4.7.4.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.4.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0009-support-2bpp.patch \
            file://0001-Added-Openembedded-crossarch-option.patch \
            file://blacklist-diginotar-certs.diff \
+           file://fix-translations.patch \
            file://g++.conf \
            file://linux.conf \
            file://fix-qtbug-20925.patch \
@@ -27,7 +28,9 @@ FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
 
 do_configure_prepend() {
     for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
+        sed -i \
+            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
+            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
     done
 
     sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
@@ -39,10 +42,6 @@ do_configure_prepend() {
     ${S}/configure
 }
 
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
-}
-
 QT_GLFLAGS ?= ""
 QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
 
diff --git a/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch b/meta/recipes-qt/qt4/qt-4.7.4/fix-translations.patch
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
+diff --git a/translations/translations.pro b/translations/translations.pro
+index cdaf04a..24fa668 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG += no_link
+ QMAKE_EXTRA_COMPILERS += updateqm
+ 
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK = @: IGNORE THIS LINE
+     OBJECTS_DIR =
+     win32:CONFIG -= embed_manifest_exe
+@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+     phony_src.input = PHONY_DEPS
+     phony_src.output = phony.c
+     phony_src.variable_out = GENERATED_SOURCES
+-    phony_src.commands = echo int main() { return 0; } > phony.c
++    phony_src.commands = echo \"int main() { return 0; }\" > phony.c
+     phony_src.name = CREATE phony.c
+     phony_src.CONFIG += combine
+     QMAKE_EXTRA_COMPILERS += phony_src
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index 9d893f9..34061cb 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 2f39ec0..0290313 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
-- 
1.7.2.5



