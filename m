Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E87CA72207
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:50:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 14:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="440187502"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.162])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2015 14:38:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 14:50:46 -0800
Message-Id: <ed5de0c5a61b2542a462629e9c51b2ad80901548.1421189008.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
In-Reply-To: <cover.1421189008.git.sgw@linux.intel.com>
References: <cover.1421189008.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] rxvt-unicode: Add Upgraded version 9.21
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
X-List-Received-Date: Tue, 13 Jan 2015 22:50:58 -0000

Keep older 9.20 due to newer version being GPLv3

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
new file mode 100644
index 0000000..239fbed
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.21.bb
@@ -0,0 +1,65 @@
+SECTION = "x11/utils"
+SUMMARY = "rxvt terminal clone supporting unicode"
+DESCRIPTION = "rxvt-unicode is a clone of the well known \
+terminal emulator rxvt, modified to store text in Unicode \
+(either UCS-2 or UCS-4) and to use locale-correct input and \
+output. It also supports mixing multiple fonts at the \
+same time, including Xft fonts."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://src/main.C;beginline=1;endline=31;md5=7dac0395806570856e037f98aba8513b"
+
+DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
+
+SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
+	   file://xwc.patch \
+	   file://rxvt.desktop \
+	   file://rxvt.png"
+
+SRC_URI[md5sum] = "a9a06c608258c5fd247c3725d8f44582"
+SRC_URI[sha256sum] = "75270ed72bc5895a64a1d7392bf45a622204192371c3965bd3dd978dc088956b"
+
+inherit autotools update-alternatives
+
+PROVIDES = "virtual/x-terminal-emulator"
+ALTERNATIVE_${PN} = "x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
+
+CFLAGS_append = " -fpermissive"
+
+EXTRA_OECONF = "--enable-menubar --enable-xim \
+		--enable-utmp --enable-wtmp --enable-lastlog \
+		--disable-strings --with-term=rxvt --enable-keepscrolling \
+		--enable-xft --with-name=rxvt --enable-frills \
+		--enable-swapscreen --enable-transparency \
+		--with-codesets=eu \
+		--enable-cursor-blink --enable-pointer-blank \
+		--enable-text-blink --enable-rxvt-scroll \
+		--enable-combining --enable-shared \
+		--enable-xgetdefault \
+                --disable-perl \
+		--with-x=${STAGING_DIR_HOST}${prefix}"
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
-- 
2.1.0


