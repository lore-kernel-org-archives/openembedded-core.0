Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8877210F3DDE
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:49:20 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8098.1774691356110172287
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=cKOgvyzg;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=xpYjX+zi;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7954A14001E1;
	Sat, 28 Mar 2026 05:49:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 28 Mar 2026 05:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691355;
	 x=1774777755; bh=iCGxtJazm4Z/jwvo0UkGKn6PT4AxD5utS1BRaeIEBpk=; b=
	cKOgvyzgT7vJ7ZTtgRqoCn6wBMopwEBqpbsXCSuW1fPPBq2jcwSRZWwER0RoC4Wf
	P3eWuaHcMF1YhrEWV36rzLRwdUcTKBpY2t0AN9sIDZPAO5Cz1hOpcKodhj+D4FGC
	sJi6STd8VjZZfnqa+tsMYq+m4sbsseWOW6PfhqcH9Mzfd3C5n98w/4nwJnrWuaGp
	up6a2wXKNg8zdkKzY+piMZfPuXLuAKixlkvByuZft6iZaCsD2pYA1dw3on9oIurj
	M7YZ/rswziQx49XMMsmrB3aQWzdohdfqlY+/Uw0Rj41AS3hPiEn94o67eyN7ibMY
	ESBeQbKybIj+Ko5rIwYKrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691355; x=
	1774777755; bh=iCGxtJazm4Z/jwvo0UkGKn6PT4AxD5utS1BRaeIEBpk=; b=x
	pYjX+zioMzxF+35A/tNTjdYV5ZqXn/HKpyFx3a/IDfUbC99ihiFaIEXcA+37DcG3
	yAJuUrr2Y+uH6QAFbDzqwxuHSjT85FhAFMCDihg7436Ix1miZAjJIC8Fgm1SMttJ
	DpYWZ+TwpMlQU4mDSJflWXtM7xgm/TobLi9Pg7kLiWbTdAFHqbAOvBA15SdEv7aM
	NMZ7miLhaL8M7pPG/cNzkU+wknisS+zsvq8fbrBhOcPQYosgfD7P1baevL5bAemb
	owyHXTNlmBc9Mbpv0k8aw1Q+ZytuI1SQXgovwnsXNBg8r0XvpAsCoFVYBzURehHz
	+zR1VEH3bvyyFx6iEZzEw==
X-ME-Sender: <xms:G6THaSg0Rou5beFsJo_xTpFwLz_u3anFIyWwBdYiunZFD2oC-SsUkg>
    <xme:G6THaZDEM_08XhodqbuNAh4ndN2yV2rgsEo2RY4aYps6AmCvkrbJf9w5SXCjwpvtM
    08ar-gIXYx-LosR3MALZOa8r_c_QRGtBifMTPkIUkPhPrZI7lWgsT0>
X-ME-Received: <xmr:G6THaXsHrZrqmyg25xLPbym1UB6lVPDLu_4nt4HkHytDxN2XFMYEzmQWyivO7msyoNP6MXyeuUrKMvgYjBb_oNJPIZFSKbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:G6THaWb6ogepFO-V7iUWZyTJeitruihdOEzmHRRjEtUS3WcbebiZbA>
    <xmx:G6THaSW_KuGsl5veTRsS2ViIwXIQ2UdcGqW0rh7hLs8l9Vh__fcF8w>
    <xmx:G6THaS6MojA8EJD_uyTo0epMG3BXZgs_FCUaOYtGkvbRAKL9Vd7LMQ>
    <xmx:G6THaVi2I7lIp4TYN4hu1wEz8XOwFhHkOnvOhQioxPoV8f6kH0iA_A>
    <xmx:G6THafF90BWAeoYeMCmr9zGYHvkuHJsEuwkqsiMlzUPsde1A5eZmlcO2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:49:14 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:49:01 +0000
Subject: [PATCH 3/4] meta: Support opting out of any machine features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-default-features-v1-3-90790864d734@pbarker.dev>
References: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
In-Reply-To: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=16343; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=Gaah9xegRTR/v06w9A/w/egs7GBK52PCCNgMDm+HHk4=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeXyKRNXFyKffGzNudmfMmf50Tt6e7+uDpc0n90vuO/
 5E8Yzd7W0cpC4MYF4OsmCLL5p6v95/2OvJmhNxSgJnDygQyhIGLUwAmwrOR4X/EVAGGXLPzjRmV
 sZsW7uhqrL1WJKn2vf/EomS5rXbRASkM/1Q359c+0uypUJPa775p4USV4NTmS0yvZLfkuh+5L25
 6hQUA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234125

Construct MACHINE_FEATURES_DEFAULT from MACHINE_FEATURES_DEFAULT_RAW
using the new filter_default_features() function.

This change obsoletes the variables MACHINE_FEATURES_BACKFILL and
MACHINE_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added to
MACHINE_FEATURES_DEFAULT_RAW and users can opt out of any of these using
MACHINE_FEATURES_OPTED_OUT. Hopefully the variable naming here is easier
for people to understand and remember.

MACHINE_FEATURES is now weakly set to MACHINE_FEATURES_DEFAULT in
bitbake.conf, after inclusion of local, DISTRO and MACHINE conf files.
This means that all assignments in conf files will need to use :append
instead of += to preserve the defaults but this is in line with how
other global variables are modified in conf files.

Migration notes:
- If you have previously extended MACHINE_FEATURES using :append, or set
  MACHINE_FEATURES to a new value including ${MACHINE_FEATURES_DEFAULT},
  you shouldn't need to make any changes there.

- If you have previously set MACHINE_FEATURES, but did not include
  ${MACHINE_FEATURES_DEFAULT}, you will lose the features which were
  previously in MACHINE_FEATURES_BACKFILL:

    rtc qemu-usermode

  You will need to add these to your MACHINE_FEATURES or include
  ${MACHINE_FEATURES_DEFAULT}.

  For example in meta-yocto-bsp, the MACHINE_FEATURES assignment for
  beaglebone-yocto must be modified to become:

    MACHINE_FEATURES = "${MACHINE_FEATURES_DEFAULT} usbgadget usbhost vfat alsa"

- If you previously set MACHINE_FEATURES_BACKFILL_CONSIDERED, use the new
  variable MACHINE_FEATURES_OPTED_OUT instead.

- If you previously modified MACHINE_FEATURES_BACKFILL, don't do that.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-global/base.bbclass                      | 4 +---
 meta/classes-recipe/nativesdk.bbclass                 | 1 -
 meta/conf/bitbake.conf                                | 4 ++--
 meta/conf/documentation.conf                          | 7 ++++---
 meta/conf/machine/include/loongarch/qemuloongarch.inc | 3 ++-
 meta/conf/machine/include/mips/arch-mips.inc          | 2 +-
 meta/conf/machine/include/powerpc/tune-power5.inc     | 2 +-
 meta/conf/machine/include/powerpc/tune-power6.inc     | 2 +-
 meta/conf/machine/include/powerpc/tune-power7.inc     | 2 +-
 meta/conf/machine/include/powerpc/tune-ppce5500.inc   | 2 +-
 meta/conf/machine/include/powerpc/tune-ppce6500.inc   | 2 +-
 meta/conf/machine/include/qemu.inc                    | 4 +++-
 meta/conf/machine/include/riscv/qemuriscv.inc         | 2 +-
 meta/conf/machine/include/x86/arch-x86.inc            | 2 +-
 meta/conf/machine/include/x86/x86-base.inc            | 5 +++--
 meta/conf/machine/qemux86-64.conf                     | 2 +-
 meta/conf/machine/qemux86.conf                        | 2 +-
 17 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0a4cfd594c72..76fd0ac046a9 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -457,9 +457,7 @@ python () {
     # Filter default features to allow users to opt out of features they don't
     # want.
     oe.utils.filter_default_features("DISTRO_FEATURES", d)
-
-    # Handle backfilling
-    oe.utils.features_backfill("MACHINE_FEATURES", d)
+    oe.utils.filter_default_features("MACHINE_FEATURES", d)
 
     # To add a recipe to the skip list , set:
     #   SKIP_RECIPE[pn] = "message"
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 47e81ecf95f6..2c00a7d96724 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -17,7 +17,6 @@ CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
 MACHINE_FEATURES = "${SDK_MACHINE_FEATURES}"
-MACHINE_FEATURES_BACKFILL = ""
 
 MULTILIBS = ""
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4bf56fe2a9ae..08a80a20fdbc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -886,7 +886,7 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and packagegroup-base stuff
 ##################################################################
 
-MACHINE_FEATURES ?= ""
+MACHINE_FEATURES ?= "${MACHINE_FEATURES_DEFAULT}"
 SDK_MACHINE_FEATURES ?= ""
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
@@ -912,7 +912,7 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
+MACHINE_FEATURES_DEFAULT_RAW = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 7545e8da0c67..46f5c038abac 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -277,9 +277,10 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS[doc] = "A list of required machine-specific pac
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS[doc] = "A list of recommended machine-specific packages to install as part of the image being built. Because this is a 'machine essential' variable, the list of packages are essential for the machine to boot."
 MACHINE_EXTRA_RDEPENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for the machine to boot. However, the build process for more fully-featured images depends on the packages being present."
 MACHINE_EXTRA_RRECOMMENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for booting the machine. The image being built has no build dependencies on the packages in this list."
-MACHINE_FEATURES[doc] = "Specifies the list of hardware features the MACHINE supports."
-MACHINE_FEATURES_BACKFILL[doc] = "Features to be added to MACHINE_FEATURES if not also present in MACHINE_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and is not intended to be user-configurable."
-MACHINE_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from MACHINE_FEATURES_BACKFILL that should not be backfilled (i.e. added to MACHINE_FEATURES) during the build."
+MACHINE_FEATURES[doc] = "Specifies the list of hardware features the MACHINE supports. Defaults to MACHINE_FEATURES_DEFAULT"
+MACHINE_FEATURES_DEFAULT_RAW[doc] = "The default set of machine features, prior to any filtering. Usually you should leave this alone and modify MACHINE_FEATURES and/or MACHINE_FEATURES_OPTED_OUT."
+MACHINE_FEATURES_DEFAULT[doc] = "The set of default machine features, after filtering out features listed in MACHINE_FEATURES_OPTED_OUT."
+MACHINE_FEATURES_OPTED_OUT[doc] = "The set of default machine features to disable. Prefer opting out of features using this variable instead of using MACHINE_FEATURES:remove."
 MACHINEOVERRIDES[doc] = "Lists overrides specific to the current machine. By default, this list includes the value of MACHINE."
 MAINTAINER[doc] = "The email address of the distribution maintainer."
 MIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
diff --git a/meta/conf/machine/include/loongarch/qemuloongarch.inc b/meta/conf/machine/include/loongarch/qemuloongarch.inc
index e1bcfabc4301..3084c7a92729 100644
--- a/meta/conf/machine/include/loongarch/qemuloongarch.inc
+++ b/meta/conf/machine/include/loongarch/qemuloongarch.inc
@@ -3,7 +3,8 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/loongarch/tune-loongarch.inc
 
-MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
+MACHINE_FEATURES:append = " keyboard ext2 ext3 serial"
+MACHINE_FEATURES_OPTED_OUT:append = " alsa bluetooth usbgadget vfat"
 
 KERNEL_IMAGETYPE = "vmlinuz"
 KERNEL_IMAGETYPES += "vmlinuz"
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index baadc61d652c..2691535ee7ac 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -21,7 +21,7 @@ ABIEXTENSION .= "${@bb.utils.filter('TUNE_FEATURES', 'n32', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
 
 # user mode qemu doesn't support mips64 n32: "Invalid ELF image for this architecture"
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = " ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = " ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
diff --git a/meta/conf/machine/include/powerpc/tune-power5.inc b/meta/conf/machine/include/powerpc/tune-power5.inc
index e70e4012176c..79b0d37f6823 100644
--- a/meta/conf/machine/include/powerpc/tune-power5.inc
+++ b/meta/conf/machine/include/powerpc/tune-power5.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power6.inc b/meta/conf/machine/include/powerpc/tune-power6.inc
index eaf89515cad7..aa9ff5168562 100644
--- a/meta/conf/machine/include/powerpc/tune-power6.inc
+++ b/meta/conf/machine/include/powerpc/tune-power6.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power7.inc b/meta/conf/machine/include/powerpc/tune-power7.inc
index 4531ddd85f48..be4b07de3a75 100644
--- a/meta/conf/machine/include/powerpc/tune-power7.inc
+++ b/meta/conf/machine/include/powerpc/tune-power7.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
index 446b344c3d25..113e52925012 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -19,4 +19,4 @@ PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc
 QEMU_EXTRAOPTIONS:tune-ppc64e5500 = " -cpu e500mc"
 
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
index 4444705b2d6d..a93e81e728bf 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -19,4 +19,4 @@ PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc
 QEMU_EXTRAOPTIONS:tune-ppc64e6500 = " -cpu e500mc"
 
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 79016ad9cce1..7ef1c2beaaf4 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -4,7 +4,9 @@ XSERVER ?= "xserver-xorg \
             xf86-video-modesetting \
             "
 
-MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
+# Extend the raw default features here so that individual architectures can
+# easily opt-out of what they don't support.
+MACHINE_FEATURES_DEFAULT_RAW:append = " alsa bluetooth usbgadget screen vfat"
 
 MACHINEOVERRIDES =. "qemuall:"
 
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a80..27254edf04d9 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 require conf/machine/include/qemu.inc
 require conf/machine/include/riscv/tune-riscv.inc
 
-MACHINE_FEATURES += "keyboard ext2 ext3 serial"
+MACHINE_FEATURES:append = " keyboard ext2 ext3 serial"
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_IMAGETYPES += "uImage"
diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 28742e794d63..4b8d7adea100 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -25,7 +25,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT:append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '', d)}"
 
 # ELF64 ABI
diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index fc8200d8f097..1c099c4edf0a 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -5,8 +5,9 @@
 #
 # common settings for X86 machines
 #
-MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
-                     acpi serial usbgadget alsa"
+MACHINE_FEATURES:append = " \
+        screen keyboard pci usbhost ext2 ext3 x86 acpi serial usbgadget alsa \
+        "
 
 IMAGE_FSTYPES ?= "wic.zst"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8aac7634b753..350b6f5e474a 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -27,7 +27,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
-MACHINE_FEATURES += "x86 pci"
+MACHINE_FEATURES:append = " x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 51f080bd2a51..978e01c10735 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -23,7 +23,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
-MACHINE_FEATURES += "x86 pci"
+MACHINE_FEATURES:append = " x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 

-- 
2.43.0


