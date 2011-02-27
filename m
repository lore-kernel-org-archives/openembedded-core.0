Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyX-0007FI-OQ
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:37 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800700wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:16 -0800 (PST)
Received: by 10.216.163.11 with SMTP id z11mr3735142wek.36.1298799014328;
	Sun, 27 Feb 2011 01:30:14 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t11sm1285121wes.17.2011.02.27.01.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:48 +0100
Message-Id: <63ed6d993c0573aa957371286f09afe6200c2438.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 37/50] rpm: Fix rpm usage of prelink on the target
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:37 -0000

From: Mark Hatle <mark.hatle@windriver.com>

RPM has the ability to validate files that have been prelinked, however
the necessary configuration and staging was not done properly.  Resolve
this issue by fixing the macro paths, providing the missing RPM macro,
and correcting a defect in the way the prelink image class was working
with the necessary configuration file.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image-prelink.bbclass           |    2 +-
 meta/recipes-devtools/prelink/prelink_git.bb |    8 +++++---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb       |    3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index faf1814..ee0951c 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -24,7 +24,7 @@ prelink_image () {
 	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
 
 	# Remove the prelink.conf if we had to add it.
-	if [ $dummy_prelink_conf ]; then
+	if [ "$dummy_prelink_conf" == "true" ]; then
 		rm -f ${IMAGE_ROOTFS}/etc/prelink.conf
 	fi
 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 53ef045..e8abf59 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,12 +8,13 @@ runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 PV = "1.0+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.pokylinux.org/prelink-cross.git;protocol=git \
            file://prelink.conf \
            file://prelink.cron.daily \
-           file://prelink.default"
+           file://prelink.default \
+	   file://macros.prelink"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
 OVERRIDES_append = ":${TARGET_OS_ORIG}"
@@ -33,10 +34,11 @@ do_configure_prepend () {
 }
 
 do_install_append () {
-	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default ${D}${sysconfdir}/rpm
 	install -m 0644 ${WORKDIR}/prelink.conf ${D}${sysconfdir}/prelink.conf
 	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
 	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
+	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
 }
 
 pkg_postinst_prelink() {
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 8bce395..e350150 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -74,7 +74,8 @@ inherit autotools gettext
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
 # Specify the default rpm macros in terms of adjustable variables
-rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
+rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
+rpm_macros_virtclass-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
 
 # Configure values taken from rpm.spec
 WITH_BZIP2 = "--with-bzip2"
-- 
1.6.6.1



