Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNq-0006gN-Dt
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:42 +0200
Received: by mail-wy0-f175.google.com with SMTP id 20so1853137wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:20 -0700 (PDT)
Received: by 10.216.12.146 with SMTP id 18mr2235684wez.63.1303409480240;
	Thu, 21 Apr 2011 11:11:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm1083817wer.2.2011.04.21.11.11.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:52 +0200
Message-Id: <1303409452-19263-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-9-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-6-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-7-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-8-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-9-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 10/10] abiword*: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc   |   63 ++++++++++++++++++++
 .../abiword/abiword-embedded_2.5.2.bb              |   12 ++++
 meta-gnome/recipes-gnome/abiword/abiword.inc       |   63 ++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb  |    5 ++
 4 files changed, 143 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword.inc
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
new file mode 100644
index 0000000..e3f6a9d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
@@ -0,0 +1,63 @@
+DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
+HOMEPAGE = "http://www.abiword.org"
+SECTION = "x11/office"
+LICENSE = "GPLv2"
+DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
+RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
+               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
+
+SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
+
+#want 2.x from 2.x.y for the installation directory
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+
+FILES_${PN} += " \
+		${datadir}/icons/* \
+		${datadir}/abiword-${SHRT_VER}/glade \
+		${datadir}/abiword-${SHRT_VER}/scripts \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en_GB \
+#		${datadir}/abiword-${SHRT_VER}/templates/A4.awt \
+#		${datadir}/abiword-${SHRT_VER}/templates/US-Letter.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
+		${datadir}/abiword-${SHRT_VER}/templates/Employee-Directory.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Business-Report.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Fax-Coversheet.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Resume.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Two-Columns.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Memo.awt \
+		${datadir}/abiword-${SHRT_VER}/templates/Press-Release.awt "
+
+inherit autotools pkgconfig
+
+PARALLEL_MAKE = ""
+
+EXTRA_OECONF = " --disable-pspell \
+                 --disable-spellcheck \
+		 --disable-printing \
+		 --disable-exports \
+		 --with-sys-wv"
+
+# AbiWord configure.ac does not play nicely with autoreconf
+# so use the autogen.sh script that comes with AbiWord
+#
+do_configure() {
+        cd ${S}
+        export NOCONFIGURE="no"; ./autogen.sh
+        oe_runconf
+}
+
+
+do_install_append() {
+        install -d ${D}${datadir}/pixmaps/
+        mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
+}
+
+PACKAGES += " abiword-clipart abiword-icons abiword-strings abiword-systemprofiles abiword-templates "
+
+FILES_abiword-clipart 		+= "${datadir}/abiword-${SHRT_VER}/clipart"
+FILES_abiword-icons 		+= "${datadir}/abiword-${SHRT_VER}/icons"
+FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/AbiWord/strings"
+FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/AbiWord/system.profile*"
+FILES_abiword-templates 	+= "${datadir}/abiword-${SHRT_VER}/templates"
diff --git a/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb b/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
new file mode 100644
index 0000000..7ee0f86
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
@@ -0,0 +1,12 @@
+require abiword-2.5.inc
+
+PR = "r1"
+
+EXTRA_OECONF += "--enable-embedded"
+
+S = "${WORKDIR}/abiword-${PV}"
+
+RCONFLICTS = "abiword"
+RPROVIDES += "abiword"
+
+
diff --git a/meta-gnome/recipes-gnome/abiword/abiword.inc b/meta-gnome/recipes-gnome/abiword/abiword.inc
new file mode 100644
index 0000000..5d7e3ce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword.inc
@@ -0,0 +1,63 @@
+DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
+SECTION = "gnome/office"
+HOMEPAGE = "http://www.abiword.org""
+LICENSE = "GPLv2"
+
+DEPENDS     = "libgsf libglade libfribidi libxml2 wv"
+RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
+               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
+
+# Share this file between recipes that use cvs and that pull tarballs
+# (one day change this to differentiate automatically based on PV and set the
+# SRC_URI and S var directly)
+RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
+RELSRC = "${WORKDIR}/abiword-${PV}/abi"
+
+CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
+CVSSRC = "${WORKDIR}/abi"
+
+#want 2.x from 2.x.y for the installation directory
+SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+
+FILES_${PN} += " \
+		${datadir}/icons/* \
+		${datadir}/mime-info \
+		${datadir}/abiword-${SHRT_VER}/glade \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en \
+		${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \
+#		${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
+#		${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
+  "
+
+inherit autotools pkgconfig
+
+PARALLEL_MAKE = ""
+
+# This is a minimalistic AbiWord build
+#
+# if you are planning to build plugins, make sure to comment out the
+# --disable-exports options
+
+EXTRA_OECONF = " --enable-embedded=poky    \
+		 --disable-printing   \
+		 --with-sys-wv 	     \
+		 --disable-exports    \
+		 --disable-spellcheck"
+
+# TODO -- refactor this, so that instead of two strings and profiles
+# packages we have lots of locale packages, each with a set of strings and
+# a profile
+#
+PACKAGES += " abiword-strings abiword-systemprofiles"
+
+FILES_abiword-strings 		+= "${datadir}/abiword-${SHRT_VER}/strings"
+FILES_abiword-systemprofiles 	+= "${datadir}/abiword-${SHRT_VER}/system.profile*"
+
+# AbiWord configure.ac does not play nicely with autoreconf
+# so use the autogen.sh script that comes with AbiWord
+#
+do_configure() {
+	cd ${S}
+	export NOCONFIGURE="no"; ./autogen.sh
+	oe_runconf
+}
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb
new file mode 100644
index 0000000..c10d761
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb
@@ -0,0 +1,5 @@
+require abiword-2.5.inc
+
+PR = "r2"
+
+RCONFLICTS_${PN} = "abiword-embedded"
-- 
1.6.6.1



