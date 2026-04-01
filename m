Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5AD107638D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 17:42:15 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19112.1775065326298922804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 10:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=M7wnHvrO;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=K2uzVoKk;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A56537A0063;
	Wed,  1 Apr 2026 13:42:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 13:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775065325;
	 x=1775151725; bh=+ynOB2kAuGrvKp3v3c+3D6IotLsna9Nj3+7qmuu6ym8=; b=
	M7wnHvrOF0wliumBXFdigW7Qq0yCmnr12m6mnQfl/5iyxunh43tXNQXKy1Hhd+7I
	qK8I+2plCWDimRHqyE74TelSqOpxq936qgDNDbMHorAYpHUrLH88Oa2NuwbOAIFN
	ViI75HsYlRv1uMd/EAGcLfxJXeMJYAgBkgaRKIg3V8P4pMxqmevKJccE2jj26Hxp
	Ta2WF+5iupEorHHCwxlnUPp6U9vkCzbuPBWc1OGhF849BTNgDi4iqEcn/pKAzIIw
	52YZidNy4RJdT3n11drBK9/fVLt46DqOD/t8FjwBmQJGCkWDHjjLMTjKcqzpGdFW
	Hg1pQqJY6WncoGWVm3pj9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775065325; x=
	1775151725; bh=+ynOB2kAuGrvKp3v3c+3D6IotLsna9Nj3+7qmuu6ym8=; b=K
	2uzVoKkYudduG/lWAap1x74xUnWNTOkWHnuPoZefBquCHoP7VHEXFTTD7WTN3a0a
	Ydt45V53F24ZkZdDws7pFgLQ85JeOUzFBzA9zS+HCtJunHcjRltdyPVooUVVDn4/
	pkWVaubRlDLi15c5PB/mddFe23F/YdvEUCSYyZwzBjwqsTavc2OOHYvK3yxP6a7y
	pRepw2hAI3CrZNtJko0+keR+VkZh0kJKll6zwzP+kFy8PG+dvf/ikFg4OoM9cBMH
	3DyYMmtl+9r5tqCDtsqT0NA8aCC70vP40wAObrysgOJUgJPkM2Iub8mMgpEsyx+S
	dCgHOSLgG1RbrCkph+8Ww==
X-ME-Sender: <xms:7VjNaUiLVrqYMLVUOkR3TzXiXd0O43c16JTFYqtY7dGDpuu0L-zPaw>
    <xme:7VjNaTCd78YHChct19Nx8NzmY7cRRUlNSr7esuPkfu90ASqygCdbUyzSsh1weoOs_
    dDhYSfjW8fGwzvD4GqilUSMLkWR1mshwhA8iqk4l4A_MFThS0SUgoA>
X-ME-Received: <xmr:7VjNaZsDyLeGx42RJNAd-yKEPuXH1m5Kd99YGsFDy1ncJyXurCg-COccf0D5BoSUXMsjHT_3xArPdBdNGRPZdkDH8yTITnk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgv
    rhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsth
    hsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:7VjNaQYUJdjDfbAZr5YuDZLesCsvQgHNxlg8hAeitdCsmDea6SOVpA>
    <xmx:7VjNaUVoFesyOpeNw4Um9eNJ376pqY6BAPS5rf9Sgz56P4zQcCXsSg>
    <xmx:7VjNac5O_-YXOremvwwsNuYUtH8r0iIGTH45_i784bnQgKIgCipHjw>
    <xmx:7VjNaXhU_uCGRul5O91TUrLAlZRG6dt01PHDWjTebc4DwygfMYnT4Q>
    <xmx:7VjNaRE35jwcOOuCfA4-UezDM4RApSnoxoF_1RTe2lLi5shpZrWeRiSw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 13:42:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 01 Apr 2026 18:41:57 +0100
Subject: [PATCH v3 2/4] meta: Support opting out of any distro features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-default-features-v3-2-8f4b40401ab7@pbarker.dev>
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
In-Reply-To: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11646; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=MtcvX7vtFl6YAwjWXIzIWKg7gj7KJI0M/bwwnST7VS8=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSejXj1cM5u6RwbzXmdf6N6cutfWVxTmHZClGflbP0Hh
 tc31x3y7ihlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBE/rxm+J8kzKSYmeqxONk6
 YeqLS30fBDYd+y/7pixI43Ty8XVtrVWMDFOucQnxRjfHBp14dO9MsdavydvjZT3sVZMmV1x7/93
 9Lw8A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234452

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
 meta/classes-recipe/crosssdk.bbclass            |  8 ++++----
 meta/classes-recipe/native.bbclass              |  8 ++++----
 meta/classes-recipe/nativesdk.bbclass           |  8 ++++----
 meta/conf/bitbake.conf                          |  1 -
 meta/conf/distro/include/default-distrovars.inc | 15 +++++++++------
 meta/conf/distro/include/tclibc-musl.inc        |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc      |  2 +-
 meta/conf/distro/include/tclibc-picolibc.inc    |  2 +-
 meta/conf/documentation.conf                    |  4 ++--
 10 files changed, 30 insertions(+), 25 deletions(-)

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
index a2853e6a9201..dac18b39edb2 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -16,13 +16,13 @@ PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
     # set TUNE_PKGARCH to SDK_ARCH
     d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
-    # Set features here to prevent appends and distro features backfill
-    # from modifying nativesdk distro features
+    # Set features here to prevent DISTRO_FEATURES modifications from affecting
+    # crosssdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_BACKFILL", "")
+    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 5aa9c8e4145e..9f4ca170f762 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -126,13 +126,13 @@ python native_virtclass_handler () {
         return
     bpn = d.getVar("BPN")
 
-    # Set features here to prevent appends and distro features backfill
-    # from modifying native distro features
+    # Set features here to prevent DISTRO_FEATURES modifications from affecting
+    # native distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
+    oe.utils.filter_default_features("DISTRO_FEATURES", d)
     filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
     d.setVar("DISTRO_FEATURES", " ".join(sorted(features | filtered)))
-    d.setVar("DISTRO_FEATURES_BACKFILL", "")
+    d.setVar("DISTRO_FEATURES_DEFAULTS", "")
 
     classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 5adb7515bf14..a4801c48b2de 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -78,13 +78,13 @@ python nativesdk_virtclass_handler () {
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
-    # Set features here to prevent appends and distro features backfill
-    # from modifying nativesdk distro features
+    # Set features here to prevent DISTRO_FEATURES modifications from affecting
+    # nativesdk distro features
     features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
-    oe.utils.features_backfill("DISTRO_FEATURES", d)
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


