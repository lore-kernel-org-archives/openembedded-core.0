Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9355A707BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:42:48 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so3953352wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zcjb4HLjm6h6uRAh56JW6I79+UbPcYBeaNG48ecIXk8=;
	b=pscDGpFKROI/NjeEV2+OSRIBTTEDCYNhToD/do2lM5DDTEVr71jrmoof6vIwSrBEnJ
	2qbX1KvbyFXpOTdDAcRAUB4fTU5J8o16S+hVUgsQnCtFIaWyQBzaySFnR4AdAoanY/ac
	GMCP7eGYEdqtWrtoiznrEYEWj5mvwXWAOFVPA1Iv+xpmC5kOD03bKJVg3NTwHHbUTrds
	V8wO/kB0Rq8Gw4sbfQ+zXsBwDcUUINVCpeLDwD+C2Ji88F3wHsDoZok9U+4PKfGgv8VH
	64LupUi6qsHFuF1i2RS0k5OzzDcdJy8LjjvlbObRLojqN05Xm+21nVd2epAwb2v5ZL5J
	1mIg==
X-Received: by 10.180.8.10 with SMTP id n10mr35551998wia.41.1406209367565;
	Thu, 24 Jul 2014 06:42:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx5sm16032495wjb.8.2014.07.24.06.42.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 06:42:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:42:58 +0200
Message-Id: <1406209379-1662-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Jul 2014 13:42:51 -0000

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
index 544de4a..34912f3 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
@@ -17,6 +17,10 @@ SRC_URI[sha256sum] = "7c8ffc492d59f34cac64093deb70717b4d9223cf416ecc6fa016ab2e8b
 
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
index 50ce4c2..a2141e9 100644
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
2.0.2


