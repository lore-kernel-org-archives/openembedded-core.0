Return-Path: <Matthieu.CRAPET@ingenico.com>
X-Greylist: delayed 649 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Jan 2015 16:18:20 UTC
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id B477A718DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:18:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,475,1418079600"; d="scan'208";a="67167436"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 27 Jan 2015 17:07:30 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Tue, 27 Jan 2015 17:07:30 +0100
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.210.2; Tue, 27 Jan 2015 17:07:30 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 17:07:37 +0100
Message-ID: <1422374857-11566-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Cc: Matthieu Crapet <mcrapet@gmail.com>
Subject: [PATCH] alsa-lib: fix possible missing RDEPENDS for alsa-utils package
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
X-List-Received-Date: Tue, 27 Jan 2015 16:18:23 -0000
Content-Type: text/plain

From: Matthieu Crapet <mcrapet@gmail.com>

alsa-lib (libasound.so) can be compiled with some disabled features (for example: midi)
See suggestion here: http://www.alsa-project.org/main/index.php/DevEmbedded

Depending configuration, alsa-utils recipe may not build all programs.
alsa-utils package will RDEPENDS of non existing packages (for example: alsa-utils-midi).

Minor recipe cleanup:
- Use ${BP}
- Fix do_install shell function with tabs only

Signed-off-by: Matthieu Crapet <mcrapet@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index ac5512a..279951d 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/${BP}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
            file://alsa-utils-aplay-interrupt-signal-handling.patch \
           "
@@ -64,7 +64,6 @@ FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
 
-
 SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
 SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
 SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
@@ -90,8 +89,17 @@ do_install() {
 	rm ${D}${sbindir}/alsaconf
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
-	   # This is where alsa-utils will install its rules if we don't tell it anything else.
-	   rm -rf ${D}/lib/udev
-	   rmdir --ignore-fail-on-non-empty ${D}/lib
+		# This is where alsa-utils will install its rules if we don't tell it anything else.
+		rm -rf ${D}/lib/udev
+		rmdir --ignore-fail-on-non-empty ${D}/lib
 	fi
 }
+
+python populate_packages_prepend () {
+    packages = d.getVar('ALSA_UTILS_PKGS', True)
+    pkgd = d.getVar('PKGD', True)
+    for pkg in packages.split():
+        pkgfiles = d.getVar('FILES_' + pkg, True).split()
+        if not os.path.exists(pkgd + pkgfiles[0]):
+            d.setVar('ALLOW_EMPTY_' + pkg, "1")
+}
-- 
1.9.1


