Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF8310F3DDB
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:49:20 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8247.1774691355467538859
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=l0WbQdFW;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=YIFZ21iW;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A047314001E0;
	Sat, 28 Mar 2026 05:49:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 28 Mar 2026 05:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691354;
	 x=1774777754; bh=2KQgZXPTpGGsLCvqFGyTjSgNWQoFFYCZYUfYXU56IX0=; b=
	l0WbQdFWRD/X3CZJqi0lrFynLUwnsiicDGvd7m+ynMEEIDP9cOOVXQhK3Sm1HGP4
	gcbSj2bbMR+w/ppz5ZDk/6gultnYI8nlLeZ2KUIvnaTxylM1oJFl/EUNdHhxjueq
	hl1JhlpcG7Oq0mlAvOk9Y27sAIirdWX3gg3U60iZgBspJrLBhFSDncar5aSTOwbT
	DuVDuLslhL4Vf8/xKAaqvDN6aQ92e7ZEQAuZ6zRCgzyyJoaXBLrSzzmGTjK6ebep
	oXrYXKKrEQ80m9RHOcnAX4ABnmgRKDG7UbsiTu90PhhnIV7atlwVrh2irWKai+rS
	ZQaFdOjZQRri8wUrNC0KaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691354; x=
	1774777754; bh=2KQgZXPTpGGsLCvqFGyTjSgNWQoFFYCZYUfYXU56IX0=; b=Y
	IFZ21iWUdt2OotT+0wLncvZlpXuIckF1UMxG+hy7AZujUZSLbYU1hMaxm/ZtcXrE
	jbRxD3ObfnZ+j/RmqxSOPIvO8kkaNUzexm8hazYABWOY2pSbfOslZ/ixVme4KAsi
	pSRplKnz4QmEMXrezl7Ar5j3m61yfoecEyOfDhvqjnZjtK4LTT1HUoyR1rdUvJz9
	s7n84XHSp0Rw1+70hT/zQyyn1uuDoAOVffOSir9NyBQSiKlKP73IBAavyf2kJe+2
	ZuJ+wAU/Oo9/HDvEs+x0jiE030xMS8qpGwLjg9wFoLrOZQs9WBorAvkIdJs/iSkQ
	8wQHHVnygDXjoBLnx0aRg==
X-ME-Sender: <xms:GqTHaXUPgvUsCTN5c2jEkEJUxt0oXfN8EH9SqVsc1Ul78FIMp1hElw>
    <xme:GqTHaVlSs_B0KHBmwM_BHcIBjF8LdNBCdI8vAriTGAelGtmj2C-o9VxEmSP_mTO2Y
    jDR4nYhOmExxSFaxOLnQnfe9TeI2Yyh-85-aa5HppoYkZ4qbhgjdgw>
X-ME-Received: <xmr:GqTHaRD8quRP8VhZJkUug5O92GVl_4O9qFwftTYilRzr845PCafPecP54_luQGxke2BEqVhfFJho1Bv7yWAsUW-mT_ua8v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgepudenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:GqTHadf73WHrMDZnj01-F_NjDVIE7dYwSkROtAAYAOqco_Uf6h0Y4Q>
    <xmx:GqTHaULiwaHlVkACviG7rP1w2RFEJyzNqX00o6sm3L_BELHDquCGGw>
    <xmx:GqTHaYeNRH8HbhGlm7om9G9E7Idg7uMv37Fb368W8sn6niaSzSQbLA>
    <xmx:GqTHaT0_YC0CtMXsgLHfjGcLHMIGVygXTqj3QNOR5VTRIFH9gWQtPQ>
    <xmx:GqTHaY5zkFSkhtani3g_77w2ue9-1rNbJOGUoOxJZVXpyFWxv4kBTsGM>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:49:14 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:49:00 +0000
Subject: [PATCH 2/4] meta: Support opting out of any distro features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-default-features-v1-2-90790864d734@pbarker.dev>
References: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
In-Reply-To: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12794; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=X3JWYU4/qOK4ICsn155vFJXi0btygwN/RH/ehxRqdvI=;
 b=kA0DAAoWq2NU7J269G4ByyZiAGnHpBigxMKBlyE/yNa2YWSVmqLcH2mpUhsVUq395yz+ldcec
 Yh1BAAWCgAdFiEEs4z13+WNQQ1oVNogq2NU7J269G4FAmnHpBgACgkQq2NU7J269G6VtAD/TTzD
 0PtJB7F5bVzpb7T9hoFqBazHHw7u6avSCwW2dhgA+wXhEtQKNyn2FX++8n298kpNDbyiCqtd3DS
 CMHO9ZJ4K
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234124

Construct DISTRO_FEATURES_DEFAULT from DISTRO_FEATURES_DEFAULT_RAW using
the new filter_default_features() function.

This change obsoletes the variables DISTRO_FEATURES_BACKFILL and
DISTRO_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added to
DISTRO_FEATURES_DEFAULT_RAW and users can opt out of any of these using
DISTRO_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
for people to understand and remember.

DISTRO_FEATURES is now weakly set to DISTRO_FEATURES_DEFAULT in
bitbake.conf, after inclusion of local, DISTRO and MACHINE conf files.
This means that all assignments in conf files will need to use :append
instead of += to preserve the defaults but this is in line with how
other global variables are modified in conf files.

Migration notes:
- If you have previously extended DISTRO_FEATURES using :append, or set
  DISTRO_FEATURES to a new value including ${DISTRO_FEATURES_DEFAULT},
  you shouldn't need to make any changes there.

  E.g. usage in poky.conf is ok, it doesn't need any change:

    DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"

- If you have previously set DISTRO_FEATURES, but did not include
  ${DISTRO_FEATURES_DEFAULT}, you will lose the features which were
  previously in DISTRO_FEATURES_BACKFILL:

    pulseaudio gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan

  You will need to add these to your DISTRO_FEATURES or include
  ${DISTRO_FEATURES_DEFAULT} as in the example above.

- If you previously set DISTRO_FEATURES_BACKFILL_CONSIDERED, use the new
  variable DISTRO_FEATURES_OPTED_OUT instead.

- If you previously modified DISTRO_FEATURES_BACKFILL, don't do that.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-global/base.bbclass                |  5 ++++-
 meta/classes-recipe/crosssdk.bbclass            |  7 +++----
 meta/classes-recipe/native.bbclass              |  7 +++----
 meta/classes-recipe/nativesdk.bbclass           |  7 +++----
 meta/conf/bitbake.conf                          |  3 +--
 meta/conf/distro/include/default-distrovars.inc | 15 +++++++++------
 meta/conf/distro/include/tclibc-musl.inc        |  2 +-
 meta/conf/distro/include/tclibc-newlib.inc      |  2 +-
 meta/conf/distro/include/tclibc-picolibc.inc    |  2 +-
 meta/conf/documentation.conf                    |  7 ++++---
 10 files changed, 30 insertions(+), 27 deletions(-)

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
index a2853e6a9201..c2a49773c696 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -16,13 +16,12 @@ PACKAGE_ARCH = "${SDK_ARCH}"
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
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 5aa9c8e4145e..45f20c239b8b 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -126,13 +126,12 @@ python native_virtclass_handler () {
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
 
     classextend = d.getVar('BBCLASSEXTEND') or ""
     if "native" not in classextend:
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 5adb7515bf14..47e81ecf95f6 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -78,13 +78,12 @@ python nativesdk_virtclass_handler () {
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
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6b3443695a04..4bf56fe2a9ae 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -889,7 +889,7 @@ OES_BITBAKE_CONF = "1"
 MACHINE_FEATURES ?= ""
 SDK_MACHINE_FEATURES ?= ""
 
-DISTRO_FEATURES ?= ""
+DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""
@@ -912,7 +912,6 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7adcdfad4ff4..24adbbc4417f 100644
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
+DISTRO_FEATURES_DEFAULT_RAW ?= " \
+    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost \
+    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
+    gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
+    "
 IMAGE_FEATURES ?= ""
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 98d7a801ac84..23696d119af1 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -14,7 +14,7 @@ PREFERRED_PROVIDER_virtual/libc-locale ?= "musl-locales"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT:append = "ldconfig"
 
 #USE_NLS ?= "no"
 
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index 34318b24549c..a6e5b6adba0e 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "newlib"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT:append = "ldconfig"
 
 #USE_NLS ?= "no"
 
diff --git a/meta/conf/distro/include/tclibc-picolibc.inc b/meta/conf/distro/include/tclibc-picolibc.inc
index 2cd26cfd7dcd..0096c236be17 100644
--- a/meta/conf/distro/include/tclibc-picolibc.inc
+++ b/meta/conf/distro/include/tclibc-picolibc.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/libintl ?= "picolibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+DISTRO_FEATURES_OPTED_OUT:append = "ldconfig"
 
 IMAGE_LINGUAS = ""
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1853676fa060..7545e8da0c67 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -140,9 +140,10 @@ DESCRIPTION[doc] = "The package description used by package managers. If not set
 DISTRO[doc] = "The short name of the distribution. If the variable is blank, meta/conf/distro/defaultsetup.conf will be used."
 DISTRO_EXTRA_RDEPENDS[doc] = "Specifies a list of distro-specific packages to add to all images. The variable only applies to the images that include packagegroup-base."
 DISTRO_EXTRA_RRECOMMENDS[doc] = "Specifies a list of distro-specific packages to add to all images if the packages exist. The list of packages are automatically installed but you can remove them."
-DISTRO_FEATURES[doc] = "The features enabled for the distribution."
-DISTRO_FEATURES_BACKFILL[doc] = "Features to be added to DISTRO_FEATURES if not also present in DISTRO_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and it is not intended to be user-configurable."
-DISTRO_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from DISTRO_FEATURES_BACKFILL that should not be backfilled (i.e. added to DISTRO_FEATURES) during the build."
+DISTRO_FEATURES[doc] = "The features enabled for the distribution. Defaults to DISTRO_FEATURES_DEFAULT."
+DISTRO_FEATURES_DEFAULT_RAW[doc] = "The default set of distribution features, prior to any filtering. Usually you should leave this alone and modify DISTRO_FEATURES and/or DISTRO_FEATURES_OPTED_OUT."
+DISTRO_FEATURES_DEFAULT[doc] = "The set of default distribution features, after filtering out features listed in DISTRO_FEATURES_OPTED_OUT."
+DISTRO_FEATURES_OPTED_OUT[doc] = "The set of default distribtion features to disable. Prefer opting out of features using this variable instead of using DISTRO_FEATURES:remove."
 DISTRO_NAME[doc] = "The long name of the distribution."
 DISTRO_PN_ALIAS[doc] = "Alias names used for the recipe in various Linux distributions."
 DISTRO_VERSION[doc] = "The version of the distribution."

-- 
2.43.0


