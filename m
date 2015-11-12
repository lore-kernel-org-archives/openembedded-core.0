Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 773DB772B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:11 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82470589pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=F6FYxuKizAA/JypNt3ebee+yr7L/DBAgUIsJJpb7jDo=;
	b=ntl9nWP7PMJvLkcv2R/PONoJk32zF0Uan1h33BSDkb9Qz3x6jB/pq47GuRmDKKWgNL
	ZJ96CEIVeENxu4XNsW0TYNMuYEiZkh2kX0c7IMhUpWSv+mwwdfQwHfvj93TeaTocDXBQ
	C8T5GeDNBmdpLtQWEAfdSSbr0CCn53kNT8iwDUm73mcMITjPoTL3NvvCQpiPOm12CgNE
	+A3DDQX+vysDdICfY/Dojb/q/CP1okB6uPjunqHMOyhyRRMLW+SX+flTVTAcCKvHhc3Q
	aN3/i+2WE6OwBVnz2wxf3jy1tPE2WZB3j0dJTSxlB3Wl6snFrK8y/nCqlEMGafbgL9RO
	jIHQ==
X-Received: by 10.68.169.34 with SMTP id ab2mr27449807pbc.44.1447371672016;
	Thu, 12 Nov 2015 15:41:12 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	yz3sm16726614pbb.37.2015.11.12.15.41.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:10 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:40:37 -0700
Message-Id: <5f83d8d082767ede01945a5298495e1564c2de96.1447371041.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/7] psplash: add systemd support
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:11 -0000

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


