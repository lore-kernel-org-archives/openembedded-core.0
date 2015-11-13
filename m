Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 749CF77362
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 23:11:00 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so113667467pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=F6FYxuKizAA/JypNt3ebee+yr7L/DBAgUIsJJpb7jDo=;
	b=iTuqlGhU7bUQR1i+0PD6TX0eq2ietUEZfTWtMrGbzLS5eP5TybcJQODCiazbR/bU0Z
	UKYDdQT7dN/EAJYq7d6IBLMWJn7hE7DketK1Xn0aiRvHXn2hQmi9zl38vIuicbYKekYZ
	RjzopMM9JGaHD/Uf3FvbDX4b+ozTDOMpeLyV7iXw+QyBAkKlkyin8ktvnpQCexgruE7P
	OjxGOh8SD67HnXToJS6fwes1iXfgGifkr86gcjptEL9NqWnPYXDSFXUDuwFWjAPDYVzq
	ymqKLOoW0cgRwXvHIrkHpAjAKOBIbvEbSRdnauYARZMWbOf188bkMhGQeVecb5nNo3PN
	8lSQ==
X-Received: by 10.67.22.99 with SMTP id hr3mr35805042pad.10.1447456260484;
	Fri, 13 Nov 2015 15:11:00 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pq1sm22366902pbb.91.2015.11.13.15.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 15:10:59 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:10:44 -0700
Message-Id: <0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
References: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 6/6] psplash: add systemd support
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
X-List-Received-Date: Fri, 13 Nov 2015 23:11:00 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/psplash/files/psplash-quit.service | 11 +++++++++++
 .../recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
 meta/recipes-core/psplash/psplash_git.bb             | 20 +++++++++++++++-----
 3 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100755 meta/recipes-core/psplash/files/psplash-quit.service
 create mode 100755 meta/recipes-core/psplash/files/psplash-start.service

diff --git a/meta/recipes-core/psplash/files/psplash-quit.service b/meta/recipes-core/psplash/files/psplash-quit.service
new file mode 100755
index 0000000..14bd499
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-quit.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Terminate Psplash Boot Screen
+After=psplash-start.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/psplash-write QUIT
+TimeoutSec=20
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
new file mode 100755
index 0000000..502b150
--- /dev/null
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Starts Psplash Boot screen
+Wants=systemd-vconsole-setup.service
+After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.service
+DefaultDependencies=no
+
+[Service]
+ExecStart=/usr/bin/psplash
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index b3b6479..acf294f 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -12,6 +12,8 @@ PR = "r15"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch \
            file://psplash-init \
+           file://psplash-start.service \
+           file://psplash-quit.service \
            ${SPLASH_IMAGES}"
 
 SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
@@ -66,11 +68,13 @@ python __anonymous() {
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig update-rc.d update-alternatives
+inherit autotools pkgconfig update-rc.d update-alternatives systemd
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[psplash] = "${bindir}/psplash"
 
+SYSTEMD_SERVICE_${PN} = "psplash-start.service psplash-quit.service"
+
 python do_compile () {
     import shutil
 
@@ -97,8 +101,15 @@ python do_compile () {
 
 do_install_append() {
 	install -d ${D}/mnt/.psplash/
-	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d/
+		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/psplash-quit.service ${D}${systemd_unitdir}/system
+		install -m 0644 ${WORKDIR}/psplash-start.service ${D}${systemd_unitdir}/system
+	fi
 	install -d ${D}${bindir}
 	for i in ${SPLASH_INSTALL} ; do
 		install -m 0755 $i ${D}${bindir}/$i
@@ -111,9 +122,8 @@ FILES_${PN} += "/mnt/.psplash"
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
 
-DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
-- 
2.2.1


