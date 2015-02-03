Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 467896E636
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CPW5022785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:25 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:08 -0800
Message-ID: <561284fa3fdf6861193589388407a805332641a1.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/21] rxvt-unicode: fix for 9.20 and 9.21
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:24 -0000
Content-Type: text/plain

* Add a rxvt-unicode.inc for rxvt-unicode_9.20.bb and rxvt-unicode_9.21.bb
* Fix unknown-configure-option:
  WARNING: QA Issue: rxvt-unicode: configure was passed unrecognised options: --enable-menubar --enable-cursor-blink --enable-shared --disable-strings --enable-xgetdefault [unknown-configure-option]
* Fix build-deps: (add a PACKAGECONFIG)
  WARNING: QA Issue: rxvt-unicode rdepends on startup-notification, but it isn't a build dependency? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc    |   58 +++++++++++++++++++
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb |   61 +-------------------
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb |   61 +-------------------
 3 files changed, 62 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
new file mode 100644
index 0000000..04a43c0
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -0,0 +1,58 @@
+SECTION = "x11/utils"
+SUMMARY = "rxvt terminal clone supporting unicode"
+DESCRIPTION = "rxvt-unicode is a clone of the well known \
+terminal emulator rxvt, modified to store text in Unicode \
+(either UCS-2 or UCS-4) and to use locale-correct input and \
+output. It also supports mixing multiple fonts at the \
+same time, including Xft fonts."
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
+
+SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
+	   file://xwc.patch \
+	   file://rxvt.desktop \
+	   file://rxvt.png"
+
+inherit autotools update-alternatives
+
+PROVIDES = "virtual/x-terminal-emulator"
+ALTERNATIVE_${PN} = "x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
+
+CFLAGS_append = " -fpermissive"
+
+EXTRA_OECONF = "--enable-xim \
+		--enable-utmp --enable-wtmp --enable-lastlog \
+		--with-term=rxvt --enable-keepscrolling \
+		--enable-xft --with-name=rxvt --enable-frills \
+		--enable-swapscreen --enable-transparency \
+		--with-codesets=eu --enable-pointer-blank \
+		--enable-text-blink --enable-rxvt-scroll \
+		--enable-combining --disable-perl \
+		--with-x=${STAGING_DIR_HOST}${prefix}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[startup] = "--enable-startup-notification,--disable-startup-notification,startup-notification,"
+
+do_configure_prepend () {
+	if [ ! -e ${S}/acinclude.m4 ]; then
+		cp ${S}/aclocal.m4 ${S}/acinclude.m4
+	fi
+}
+
+do_compile_prepend () {
+	echo '#define UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
+	echo '#define WTMP_FILE "${localstatedir}/log/wtmp"' >> config.h
+	echo '#define LASTLOG_FILE "${localstatedir}/log/lastlog"' >> config.h
+	echo '#define HAVE_XLOCALE 1' >> config.h
+}
+
+do_install_append () {
+	install -d ${D}/${datadir}
+	install -d ${D}/${datadir}/applications
+	install -d ${D}/${datadir}/pixmaps/
+
+	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
+	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
+}
+
+FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
index 3a1ea66..3480ec7 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
@@ -1,65 +1,8 @@
-SECTION = "x11/utils"
-SUMMARY = "rxvt terminal clone supporting unicode"
-DESCRIPTION = "rxvt-unicode is a clone of the well known \
-terminal emulator rxvt, modified to store text in Unicode \
-(either UCS-2 or UCS-4) and to use locale-correct input and \
-output. It also supports mixing multiple fonts at the \
-same time, including Xft fonts."
+require rxvt-unicode.inc
+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/main.C;beginline=1;endline=31;md5=775485398a09fa7aee6f90464af88432"
 
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
-
-SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
-	   file://xwc.patch \
-	   file://rxvt.desktop \
-	   file://rxvt.png"
-
 SRC_URI[md5sum] = "4a5b823f08d21036f94a6c51e94d025b"
 SRC_URI[sha256sum] = "e73e13fe64b59fd3c8e6e20c00f149d388741f141b8155e4700d3ed40aa94b4e"
-
-inherit autotools update-alternatives
-
-PROVIDES = "virtual/x-terminal-emulator"
-ALTERNATIVE_${PN} = "x-terminal-emulator"
-ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
-
-CFLAGS_append = " -fpermissive"
-
-EXTRA_OECONF = "--enable-menubar --enable-xim \
-		--enable-utmp --enable-wtmp --enable-lastlog \
-		--disable-strings --with-term=rxvt --enable-keepscrolling \
-		--enable-xft --with-name=rxvt --enable-frills \
-		--enable-swapscreen --enable-transparency \
-		--with-codesets=eu \
-		--enable-cursor-blink --enable-pointer-blank \
-		--enable-text-blink --enable-rxvt-scroll \
-		--enable-combining --enable-shared \
-		--enable-xgetdefault \
-                --disable-perl \
-		--with-x=${STAGING_DIR_HOST}${prefix}"
-
-do_configure_prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cp ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_compile_prepend () {
-	echo '#define UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
-	echo '#define WTMP_FILE "${localstatedir}/log/wtmp"' >> config.h
-	echo '#define LASTLOG_FILE "${localstatedir}/log/lastlog"' >> config.h
-	echo '#define HAVE_XLOCALE 1' >> config.h
-}
-
-do_install_append () {
-	install -d ${D}/${datadir}
-	install -d ${D}/${datadir}/applications
-	install -d ${D}/${datadir}/pixmaps/
-
-	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
-}
-
-FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
index 239fbed..7049495 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
@@ -1,65 +1,8 @@
-SECTION = "x11/utils"
-SUMMARY = "rxvt terminal clone supporting unicode"
-DESCRIPTION = "rxvt-unicode is a clone of the well known \
-terminal emulator rxvt, modified to store text in Unicode \
-(either UCS-2 or UCS-4) and to use locale-correct input and \
-output. It also supports mixing multiple fonts at the \
-same time, including Xft fonts."
+require rxvt-unicode.inc
+
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=7dac0395806570856e037f98aba8513b"
 
-DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
-
-SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
-	   file://xwc.patch \
-	   file://rxvt.desktop \
-	   file://rxvt.png"
-
 SRC_URI[md5sum] = "a9a06c608258c5fd247c3725d8f44582"
 SRC_URI[sha256sum] = "75270ed72bc5895a64a1d7392bf45a622204192371c3965bd3dd978dc088956b"
-
-inherit autotools update-alternatives
-
-PROVIDES = "virtual/x-terminal-emulator"
-ALTERNATIVE_${PN} = "x-terminal-emulator"
-ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
-
-CFLAGS_append = " -fpermissive"
-
-EXTRA_OECONF = "--enable-menubar --enable-xim \
-		--enable-utmp --enable-wtmp --enable-lastlog \
-		--disable-strings --with-term=rxvt --enable-keepscrolling \
-		--enable-xft --with-name=rxvt --enable-frills \
-		--enable-swapscreen --enable-transparency \
-		--with-codesets=eu \
-		--enable-cursor-blink --enable-pointer-blank \
-		--enable-text-blink --enable-rxvt-scroll \
-		--enable-combining --enable-shared \
-		--enable-xgetdefault \
-                --disable-perl \
-		--with-x=${STAGING_DIR_HOST}${prefix}"
-
-do_configure_prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cp ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_compile_prepend () {
-	echo '#define UTMP_FILE "${localstatedir}/run/utmp"' >> config.h
-	echo '#define WTMP_FILE "${localstatedir}/log/wtmp"' >> config.h
-	echo '#define LASTLOG_FILE "${localstatedir}/log/lastlog"' >> config.h
-	echo '#define HAVE_XLOCALE 1' >> config.h
-}
-
-do_install_append () {
-	install -d ${D}/${datadir}
-	install -d ${D}/${datadir}/applications
-	install -d ${D}/${datadir}/pixmaps/
-
-	install -m 0644 ${WORKDIR}/rxvt.png ${D}/${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
-}
-
-FILES_${PN} += "${datadir}/applications/rxvt.desktop ${datadir}/pixmaps/rxvt.png"
-- 
1.7.9.5


