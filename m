Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 28FC96D189
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 14:02:41 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so4991331yho.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=cUjEBPVnkDSqkkPE+QZBelgE0B31iwe+Hq4i8wMdMMI=;
	b=YU2DMjntvQhFUWS2D9liQHf9kmPn5EdgPa0dbcBK3bpkw3KHwT5gV3UZp6XbDSR0NJ
	3UShhjgnIQihvOBu6faSBpMraeic3a8gTy6VOuB9KT4Z4gpwlGeSkg1FRQX+b6H/En2c
	sOdYBI5Q9OY0OMJw6XRCTXf1k+X6CrHCc1MXWnfUNYC6TDZNzw97zOd/O+SIQ+9C/ug4
	MB/GUrtgVFbPY2DQslBzjdB3GA7OspgxzoMBiSK8Er9DSn30dLcS435xDsU8AY8V3WQu
	aqevjw7O5wIoxzQTehrXGZd/0da94psNjyJpipQMEByXh32fbT7MDOHoWi+ozw1NCcR9
	HPYg==
X-Received: by 10.236.151.83 with SMTP id a59mr11528216yhk.48.1396015362547;
	Fri, 28 Mar 2014 07:02:42 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id k23sm8921632yhj.45.2014.03.28.07.02.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Mar 2014 07:02:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id C1A3E19C913B2; Fri, 28 Mar 2014 11:02:37 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 11:02:37 -0300
Message-Id: <1396015357-27637-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] weston : refactor to identify EGL, cairoglesv2 support
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
X-List-Received-Date: Fri, 28 Mar 2014 14:02:47 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/wayland/weston_1.4.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
index e0c354d..5213166 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -23,13 +23,12 @@ EXTRA_OECONF = "--enable-setuid-install \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
-                --disable-simple-egl-clients \
                 --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor"
 
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland', '', d)} \
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                   "
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


