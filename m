Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD6562273
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:29:03 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so7027975wes.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/qujygRBiewPlwn4irUA7ES38sdzNYC/bHFDQdSud8k=;
	b=ewxQVByXFpmrTbmtgKEM1rG2J6JCr0nElOmx37i3c4G49f9f5Rbccyax4XQBKQatF6
	YtSzrTPoUCjkjyw+rrltp8i0cN5KSqtfey6lQSF0qr3vat2+pvzmVrWQ/hOsPGQoBde4
	KnIuBgv+Ixx/avmkrMaR5rV9Ts+dOb+UHlPptTbROfJUoybwKvhx3/PVJFkhes+ZLsAq
	3p8lnktonS8UihKAruwLN1/CWfYt+G60/MeCH+Vqtd3IS3Cfx8iEvenamM+Rl4/BjtFg
	YceXAWtlLQiLY1d4exehpTDgDnXSbwJQozDoMzPczM4aoc5Bvk8AiK2cjHuhcj3moi3x
	VyZg==
X-Gm-Message-State: ALoCoQkGFBKhihDseeZrrvYyIQbtmM4izYnd9iOWH3XhrgSZwwBBbPzwCvUArhHlrdW+QEintZWs
X-Received: by 10.180.206.129 with SMTP id lo1mr17300553wic.15.1378906144285; 
	Wed, 11 Sep 2013 06:29:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	iz19sm10699410wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 06:29:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 14:28:57 +0100
Message-Id: <1378906138-12414-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] weston: as weston-launch depends on PAM, control it with a PACKAGECONFIG
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
X-List-Received-Date: Wed, 11 Sep 2013 13:29:03 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.1.0.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index c7c64ad..b765f65 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -35,12 +35,13 @@ EXTRA_OECONF = "--disable-android-compositor \
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                   "
 #
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
 # Weston on X11
@@ -49,7 +50,8 @@ PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/l
 PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
 # Weston on framebuffer
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
-
+# weston-launch
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
 # Use cairo-gl or cairo-glesv2
 PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
 
-- 
1.7.10.4


