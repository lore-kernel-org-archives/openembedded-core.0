Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 137F472341
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:18:42 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so11346119wiv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Wm6L31C/hn6OpzTSE0wvSMY/fU23p9hRZ0zEJ/np0fU=;
	b=egIVc6czrMSv4Av/X2XKPMC0sQuqnFSdXrDEs+GfO966/5qCqckt2bqM+3XLqXwv0P
	feRfZFuXzVMtNRkyP0NyFz04zfDKtwZwTYsbAHG63kV4t8TuFWqF1zB538RLuiEtyWdw
	wmiCFR2UPgOzdrI//JZibLLX3KKREsG2r1YRc+mMdyM34/oYFF5edJsTdeO/IQE+J+wI
	hWr5Zqxm+4Sve1kiIsT3e+vRXNC9SNkoJRwIjLLJY/JzL/e3EH2Y/uxcfYGdoRJ1qgap
	+zQcipjqad+gAPPl/vhC9xT1U5EeOD5gtSF1G8uFNsXDO2GsbUmgJU9WB/5yMpetxExq
	Ml+A==
X-Received: by 10.180.73.206 with SMTP id n14mr13819743wiv.60.1418221123256;
	Wed, 10 Dec 2014 06:18:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	et4sm6048196wjd.15.2014.12.10.06.18.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:18:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:18:36 +0100
Message-Id: <1418221117-12710-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Dec 2014 14:18:44 -0000

* it's not complete, but recipes depending on virtual/libx11 are easiest
  to spot, I've long list of PNBLACKLIST for all recipes which cannot
  be built in distro without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb  | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb       | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb     | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb     | 4 ++++
 meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb  | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
index cd8fd63..de6a4d8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
@@ -11,6 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI += "file://disable-dri2-tests.patch \
             file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
            "
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
index a10cd9e..23733fd 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "7c8ffc492d59f34cac64093deb70717b4d9223cf416ecc6fa016ab2e8b
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index 454d0a1..3c92ae0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -24,6 +24,10 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
 PR = "${INC_PR}.3"
 PV = "0.4.2+gitr${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 4ad2538..eefc6e1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -9,6 +9,10 @@ LICENSE = "MIT-X & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
 DEPENDS += "virtual/libx11"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
 PR = "${INC_PR}.7"
 PV = "0.1.1+gitr${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
index 4052f70..cd17068 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
@@ -13,6 +13,10 @@ PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 randrproto libpciaccess"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
index 24041b5..619d9fe 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
@@ -11,6 +11,10 @@ DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
 SRC_URI += "file://0001-configure-fix-build-without-xatracker.patch \
             file://0002-add-option-for-vmwgfx.patch"
 
+inherit distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[md5sum] = "91d1d7d33181766714405ab013d31244"
 SRC_URI[sha256sum] = "c8ba3d2cead3620dba2cbf5defb7f1759b2b96f4fe209f4bf6976832b6763c54"
 
-- 
2.1.3


