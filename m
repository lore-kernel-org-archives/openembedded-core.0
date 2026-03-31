Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC86410F92F8
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:29:41 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2317.1774985376191671984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=s+RTJucV;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=c3Xk5E2z;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8AEB214001B2;
	Tue, 31 Mar 2026 15:29:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774985375;
	 x=1775071775; bh=5KIxaLxvtYurVmV0vmnyiUDWRawFNByoHC83C6qH7xc=; b=
	s+RTJucVQ8Sre7hsOYmMKWGtZ5br/F7//OA4QVCG+KBMmsgEHoMzVHrGnryQ4292
	SiTx5C4ZLRFn3wwteIuX75y262uz2orXmu+yTN3Klu4jGsfX0PS6XHN4ySIYJYIg
	E+7yzhHFBG48oByBj8Xsg9JToBMiYH3SdB7DCATj6RBr93yq2zLbp4vArX0uKpqp
	wUmMn8ZOH9H/IhbauZhEVALYsg7SUVf6c/HZGDZAlzJKgNJTKOT7L0S5xSk+W25t
	ZRRSNV6yKffe8YgSZPkXWEyElwPBvX8yhKeR6pzf4tRt098OFb4YdyCDZlBewfaq
	e2+ZOzR5Ya6WzCKB4dx9Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774985375; x=
	1775071775; bh=5KIxaLxvtYurVmV0vmnyiUDWRawFNByoHC83C6qH7xc=; b=c
	3Xk5E2zQNI8KChNRpFOnWgFZHcJ2PWRELW70HCwEfsZkx6Z53jqBUzU6MUM4Vs/O
	cU1CT4s89XGn0mWE1QzcFIu3N7hNTICXMYqZhzFSx4iO37ljiDwCvpBfh3Fb32Es
	Cl5fW80hO6ytBVyXbYSXb0IRHoroHiHWmdG4y/37h/UJRE0yUlIcvzm+l66D+Ebf
	O+IIDKuP12pV2nrYfK9XIzCbf8EiDA7IAlaGJMZOm9cm9TDnHaKC/V2UR+5l0d3J
	OOtz8Bw6dABo6jkg0Ewpvbr12fBYNgvBHIfs3+hyTLIj+GcRn5wBTTlmcOb22kRg
	VjapbfRrc33EaNiA3ycJg==
X-ME-Sender: <xms:nyDMaYiHDUz0urtaIon9LeYolZMsu6NPuWK95yyP5uamBsnPcJLWGg>
    <xme:nyDMaXCEekP3j1kMqj5_9a_aCQh8cSwYp_DHvqScwNgvsb0IWdWgTObF7-_heVa0n
    vRyhs6Vi3gBIv0V530ViBCvXWr_YdtbPafv3hY8dEACpPCduvG_tC8>
X-ME-Received: <xmr:nyDMadv5rznKwQndEK90WkOh3V4HXXlHYUl9LjNdlJr8m3FlxDPE0lhZPAv1OYbhJf-MPE8cETjBhEWRDiMdhPAx6VU85YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:nyDMaUZtJhIGwB3CVOwLvqfyh3MogbJUYaxqB5Q0ShXHGSIy3t_-aA>
    <xmx:nyDMaYXo15qIWiIG9mEu62oZ6B7jpxhVEqClzQZ7XYZ1yiyAQiQCfA>
    <xmx:nyDMaQ5qCTcQKPCAyRmsElaMumadBKfgbO1x8NQZt1drcv2InaloHg>
    <xmx:nyDMabhux6hZfE5FVN4PXkjJBrAiqkChqIZ_oXLqE5fVdibXeGMAHQ>
    <xmx:nyDMaVHXLTtOzCE3F6OekEJwua9rLz0-7PyFRboIalxj25z-OVPbilpF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:29:34 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 31 Mar 2026 20:29:31 +0100
Subject: [PATCH v2 2/4] meta: Support opting out of any distro features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-default-features-v2-2-f73b43d8bd57@pbarker.dev>
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
In-Reply-To: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11769; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=lP/Pgw2Eh5FRA/fy2vysq/jH2dOSB/x3LMJIode0kfA=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeUZjzM0VKRO1Os/ck03S/iKo/2z9HR61aHzNFf/mtx
 brXzVyPdpSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAi88sZ/ikWvlOUuNDFemSP
 WOr1y42vlkcoX6jcy2ezQbY6MkbM14nhv+MfpQrr23MnnVzh+DB8+qT/WTVevyTui550K1C+ohY
 UywIA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234309

Add default values to DISTRO_FEATURES using the new
filter_default_features() function.

This change obsoletes the variables DISTRO_FEATURES_BACKFILL and
DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added via
DISTRO_FEATURES_DEFAULTS and users can opt out of any of these using
DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
for people to understand and remember.

Migration notes:

- If you have previously assigned DISTRO_FEATURES without using
  DISTRO_FEATURES_DEFAULT, you will now get the default features added
  automatically. You will need to review these and add any features you
  do not want to use to DISTRO_FEATURES_OPTED_OUT.

- DISTRO_FEATURES_DEFAULT is now unused, the new variable name is
  slighlty different to ensure that it is not accidentally used if a
  layer hasn't been modified to adapt to the new naming.

- If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the new
  variable DISTRO_FEATURES_OPTED_OUT instead.

- If you previously modified DISTRO_FEATURES_BACKFILL, don't do that.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-global/base.bbclass                |  5 ++++-
 meta/classes-recipe/crosssdk.bbclass            |  9 +++++----
 meta/classes-recipe/native.bbclass              |  9 +++++----
 meta/classes-recipe/nativesdk.bbclass           |  9 +++++----
 meta/conf/bitbake.conf                          |  1 -
 meta/conf/distro/include/default-distrovars.inc | 15 +++++++++------
 meta/conf/distro/include/tclibc-musl.inc        |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc      |  2 +-
 meta/conf/distro/include/tclibc-picolibc.inc    |  2 +-
 meta/conf/documentation.conf                    |  4 ++--
 10 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 22b427a5211b..0a4cfd594c72 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -454,8 +454,11 @@ def set_packagetriplet(d):
 python () {
     import string, re
 
+    # Filter default features to allow users to opt out of features they don't
+    # want.
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
+
     # Handle backfilling
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
     # To add a recipe to the skip list , set:
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index a2853e6a9201..e987f1be05e9 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -16,13 +16,14 @@ PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
     # set TUNE_PKGARCH to SDK_ARCH
     d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
-    # Set features here to prevent appends and distro features backfill
-    # from modifying nativesdk distro features
+    # Reset features here to prevent DISTRO_FEATURES modifications from
+    # affecting crosssdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    d.setVar('DISTRO_FEATURES', '')
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_BACKFILL", "")
+    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 5aa9c8e4145e..47a9a066a1a8 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -126,13 +126,14 @@ python native_virtclass_handler () {
         return
     bpn = d.getVar("BPN")
 
-    # Set features here to prevent appends and distro features backfill
-    # from modifying native distro features
+    # Reset features here to prevent DISTRO_FEATURES modifications from
+    # affecting native distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    d.setVar('DISTRO_FEATURES', '')
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_BACKFILL", "")
+    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
 
     classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 5adb7515bf14..f663067f3a25 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -78,13 +78,14 @@ python nativesdk_virtclass_handler () {
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
-    # Set features here to prevent appends and distro features backfill
-    # from modifying nativesdk distro features
+    # Reset features here to prevent DISTRO_FEATURES modifications from
+    # affecting nativesdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    d.setVar('DISTRO_FEATURES', '')
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_BACKFILL", "")
+    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6b3443695a04..f851e2adc9f7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -912,7 +912,6 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7adcdfad4ff4..daa4d2a74dda 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,19 +14,22 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT:class-nativesdk = "0"
 
 # seccomp is not yet ported to rv32
-DISTRO_FEATURES_DEFAULT:remove:riscv32 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:riscv32 = "seccomp"
 
 # seccomp is not yet ported to ARC
-DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:arc = "seccomp"
 
 # seccomp is not yet ported to microblaze
-DISTRO_FEATURES_DEFAULT:remove:microblaze = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:microblaze = "seccomp"
 
 # seccomp is not yet ported to loongarch64
-DISTRO_FEATURES_DEFAULT:remove:loongarch64 = "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = "seccomp"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
-DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
+DISTRO_FEATURES_DEFAULTS ?= " \
+    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost \
+    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
+    gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
+    "
 IMAGE_FEATURES ?= ""
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 98d7a801ac84..a61a6ced0dd2 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libc-locale ?= "musl-locales"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT += "ldconfig"
 
 #USE_NLS ?= "no"
 
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index 34318b24549c..fff9b9f066fb 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "newlib"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT += "ldconfig"
 
 #USE_NLS ?= "no"
 
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distro/include/tclibc-picolibc.inc
index 2cd26cfd7dcd..6134b0d97d6a 100644
--- a/meta/conf/distro/include/tclibc-picolibc.inc
+++ b/meta/conf/distro/include/tclibc-picolibc.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "picolibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT += "ldconfig"
 
 IMAGE_LINGUAS = ""
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1853676fa060..5c93d0e47970 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -141,8 +141,8 @@ DISTRO[doc] = "The short name of the distribution. If the variable is blank, met
 DISTRO_EXTRA_RDEPENDS[doc] = "Specifies a list of distro-specific packages to add to all images. The variable only applies to the images that include packagegroup-base."
 DISTRO_EXTRA_RRECOMMENDS[doc] = "Specifies a list of distro-specific packages to add to all images if the packages exist. The list of packages are automatically installed but you can remove them."
 DISTRO_FEATURES[doc] = "The features enabled for the distribution."
-DISTRO_FEATURES_BACKFILL[doc] = "Features to be added to DISTRO_FEATURES if not also present in DISTRO_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and it is not intended to be user-configurable."
-DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from DISTRO_FEATURES_BACKFILL that should not be backfilled (i.e. added to DISTRO_FEATURES) during the build."
+DISTRO_FEATURES_DEFAULTS[doc] = "The default set of distribution features, prior to any filtering. Usually you should leave this alone and modify DISTRO_FEATURES and/or DISTRO_FEATURES_OPTED_OUT."
+DISTRO_FEATURES_OPTED_OUT[doc] = "The set of default distribtion features to disable. Prefer opting out of features using this variable instead of using DISTRO_FEATURES:remove."
 DISTRO_NAME[doc] = "The long name of the distribution."
 DISTRO_PN_ALIAS[doc] = "Alias names used for the recipe in various Linux distributions."
 DISTRO_VERSION[doc] = "The version of the distribution."

-- 
2.43.0


