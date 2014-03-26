Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4966B8BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:07:37 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id b6so2714753yha.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=h+xRLwI6ER8LqX4/oE0cTGAWdQnJQdictI7TS0Tvue4=;
	b=wombhamVrdLVSIr8ZBEfjoYeXuKHjUCZX/DuVyA4BA2PFLIePQC3Qn9jgv6XOK9L3t
	3/uWReop5bE18bSFmv9ykJAxWUdGClRnESg+Q0u5r8OkBMbPpbdcSR6ETLKxxsuMBli/
	0oq4iogfsyNvOFEn80z1cBMWaQ33NHeacoq8yS11oM40aqOHCkBj6MVnm7Rsb1xQJTcW
	yUfPadEgtkgZxjG0a+g/hb/rNYR04Jx25McAmgb7djztz1qMCaqtJQbsjiUMzZhtRD5m
	x6S7rKA89rBsGi5T19IgSE/QvHl17jdbyLyf+3hWEmQfb0z01VWDTkbqZHencFHmP5H7
	kJuA==
X-Received: by 10.236.110.77 with SMTP id t53mr70026476yhg.78.1395868058804;
	Wed, 26 Mar 2014 14:07:38 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	k23sm21631553yhj.45.2014.03.26.14.07.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 14:07:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 8713D19C81F39; Wed, 26 Mar 2014 18:07:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 18:07:33 -0300
Message-Id: <1395868053-27393-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Wed, 26 Mar 2014 21:07:41 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/wayland/weston_1.4.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
index e0c354d..a41b5cd 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -23,7 +23,6 @@ EXTRA_OECONF = "--enable-setuid-install \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
-                --disable-simple-egl-clients \
                 --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor"
@@ -39,7 +38,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev way
 # Weston on KMS
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/mesa mtdev"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-egl --disable-wayland-compositor,virtual/mesa"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,virtual/mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
@@ -50,6 +49,10 @@ PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,ude
 PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
+# Weston with EGL support
+PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
+# Weston with cairo glesv2 support
+PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
1.9.1


