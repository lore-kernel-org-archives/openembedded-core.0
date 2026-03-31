Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F33A10F92F1
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:29:41 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2264.1774985376841127806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=wZJ3jCwi;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fAyg97e2;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 36F8E14001B4;
	Tue, 31 Mar 2026 15:29:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 31 Mar 2026 15:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774985376;
	 x=1775071776; bh=W76iQTFcC3bADt7G7zR1bZBGs7uGD2LQkMrAPvnZLqc=; b=
	wZJ3jCwiVBj1BtEJuhNWaYzTxHCMpVE7MFqbo3xFJ+rzwerVFPFhYbLObnuFE8n4
	oQZFeWjSHf5gB5+LUohRCoGUaYhHtGnu/I7mJ7RDegG40CVtgcs1UyddxRJHkOJ/
	aLRh6KCwjwApjCHafCJao7sWrPGRoYgiqa52xjM0LalMCKB5CSB4qgbNe850d3qP
	CxRkpfNMFNjtiTo1g7XSDfjzCiUWtywWHFnUjrdS0k5/wjeJwflaP0Lj2bCHuugC
	2Bq3HGs7Mk3U0rtNXeC14En6cmOOmJQHRODcx+pUD9sU8GMJGS1Hduxyarb0kx/G
	1ShUleq6txj7P6dd+zA0bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774985376; x=
	1775071776; bh=W76iQTFcC3bADt7G7zR1bZBGs7uGD2LQkMrAPvnZLqc=; b=f
	Ayg97e2S5WpU7faQYbWLlAQC2ZLRMmpURFrWLdHdw6WQ4ienRNI1WsdysKO0RA2B
	r0CCOy24aMNApabUTukaZ1ylkATwyT0yNpCrk+59n5m1MF3UW6cBerLMqSDdKGpP
	wxvF1mu2yZz7fvdPhLI6ampm9FapvW4w8B0GcE3EilJbmTf2HhPvUIRJq5KdE2n2
	ZQVOwE0exZrT5QtEqtYJcv8nqWCy+WrvwNXBxsPIEGpnqFKN1gIt5gn72uzK6eV3
	GpcBOsk3BNEW1gem+kL5o6HSSFP4Mjn1NBIbqT/VR5BE5A3aAKyK1WdQMADZF1tM
	Q8ErL4snsWISg/uCer1SA==
X-ME-Sender: <xms:oCDMaXk7mxJcqnX4iCLKP3mE9TVam7f-wsdGGUQ--CGX48wphIKd3A>
    <xme:oCDMaQ2opv28CgJX3PaKzbWfV4XymIKVzw3vnhHyhfvyojZE7rDfBkHUX0Nj-EBA-
    5PLhtmxVyvPssxbzgPkKcujtUv-0kJ-hKl4GLT8cz7TrHw6GSNzkw>
X-ME-Received: <xmr:oCDMabQxNiE0LrovBlRruYmhsQhdIB-lt7QOr5S-xcTGOqFiL7-KPCXfgved0_0KavT6vNae4KTzY9N3DyHioW9SiUgqqIk>
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
X-ME-Proxy: <xmx:oCDMaasqhebL3ogJnTVja6yHw1M1R6DDx85hLz7bx11nYUmfKaq26w>
    <xmx:oCDMaYZKc1SA9DuIa05Ji407c_MiVcWoP1NP7qt_1yyMNpARm08biQ>
    <xmx:oCDMaXsKKw_tgR7BW2eA1pJik3rDUm6rMrhKHB84L_y5DwVWFaEn5A>
    <xmx:oCDMaSGrtk8o6yufL6M97AOLdY_WZV8giSj2MxMAf4uhTkQtCjWrIg>
    <xmx:oCDMadJND2vbpqCRLv9hYcANbbuT6q1Fbr_JOKCiel0bvlAspxlSQpMB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:29:35 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 31 Mar 2026 20:29:32 +0100
Subject: [PATCH v2 3/4] meta: Support opting out of any machine features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-default-features-v2-3-f73b43d8bd57@pbarker.dev>
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
In-Reply-To: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10791; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=aGr2fFA7Upwtlj1eozysmfZrTpF7gOQQms+hAOo9KKM=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeUZgTz+Hd2Cx9423S1kKTm3rRWqvmdTvffrlnY4ODo
 maXp+GHjlIWBjEuBlkxRZbNPV/vP+115M0IuaUAM4eVCWQIAxenAEzk30uG/44PldkVvta998qQ
 7+PZtmflPTvGH/eXry0/wP/mZ773iVWMDPeyXjvzb09lf3llU0TjRvO+a5xZF77pHl+kk/9qx7I
 UDXYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234310

Add default values to MACHINE_FEATURES using the new
filter_default_features() function.

This change obsoletes the variables MACHINE_FEATURES_BACKFILL and
MACHINE_FEATURES_BACKFILL_CONSIDERED. Instead, all defaults are added
via MACHINE_FEATURES_DEFAULTS and users can opt out of any of these
using MACHINE_FEATURES_OPTED_OUT. Hopefully the variable naming here is
easier for people to understand and remember.

Migration notes:

- MACHINE_FEATURES will now get the default features added
  automatically. You will need to review these and add any features you
  do not want to use to MACHINE_FEATURES_OPTED_OUT.

- If you previously set MACHINE_FEATURES_BACKFILL_CONSIDERED, use the new
  variable MACHINE_FEATURES_OPTED_OUT instead.

- If you previously modified MACHINE_FEATURES_BACKFILL, don't do that.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/classes-global/base.bbclass                    | 4 +---
 meta/classes-recipe/nativesdk.bbclass               | 1 -
 meta/conf/bitbake.conf                              | 2 +-
 meta/conf/documentation.conf                        | 4 ++--
 meta/conf/machine/include/mips/arch-mips.inc        | 2 +-
 meta/conf/machine/include/powerpc/tune-power5.inc   | 2 +-
 meta/conf/machine/include/powerpc/tune-power6.inc   | 2 +-
 meta/conf/machine/include/powerpc/tune-power7.inc   | 2 +-
 meta/conf/machine/include/powerpc/tune-ppce5500.inc | 2 +-
 meta/conf/machine/include/powerpc/tune-ppce6500.inc | 2 +-
 meta/conf/machine/include/x86/arch-x86.inc          | 2 +-
 11 files changed, 11 insertions(+), 14 deletions(-)

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
index f663067f3a25..316649708781 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -17,7 +17,6 @@ CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
 MACHINE_FEATURES = "${SDK_MACHINE_FEATURES}"
-MACHINE_FEATURES_BACKFILL = ""
 
 MULTILIBS = ""
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f851e2adc9f7..84450386d984 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -912,7 +912,7 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
 DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
 
-MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
+MACHINE_FEATURES_DEFAULTS = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 5c93d0e47970..3c2088754188 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -277,8 +277,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS[doc] = "A list of recommended machine-specif
 MACHINE_EXTRA_RDEPENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for the machine to boot. However, the build process for more fully-featured images depends on the packages being present."
 MACHINE_EXTRA_RRECOMMENDS[doc] = "A list of machine-specific packages to install as part of the image being built that are not essential for booting the machine. The image being built has no build dependencies on the packages in this list."
 MACHINE_FEATURES[doc] = "Specifies the list of hardware features the MACHINE supports."
-MACHINE_FEATURES_BACKFILL[doc] = "Features to be added to MACHINE_FEATURES if not also present in MACHINE_FEATURES_BACKFILL_CONSIDERED. This variable is set in the meta/conf/bitbake.conf file and is not intended to be user-configurable."
-MACHINE_FEATURES_BACKFILL_CONSIDERED[doc] = "Features from MACHINE_FEATURES_BACKFILL that should not be backfilled (i.e. added to MACHINE_FEATURES) during the build."
+MACHINE_FEATURES_DEFAULTS[doc] = "The default set of machine features, prior to any filtering. Usually you should leave this alone and modify MACHINE_FEATURES and/or MACHINE_FEATURES_OPTED_OUT."
+MACHINE_FEATURES_OPTED_OUT[doc] = "The set of default machine features to disable. Prefer opting out of features using this variable instead of using MACHINE_FEATURES:remove."
 MACHINEOVERRIDES[doc] = "Lists overrides specific to the current machine. By default, this list includes the value of MACHINE."
 MAINTAINER[doc] = "The email address of the distribution maintainer."
 MIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index baadc61d652c..fff2ff639279 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -21,7 +21,7 @@ ABIEXTENSION .= "${@bb.utils.filter('TUNE_FEATURES', 'n32', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
 
 # user mode qemu doesn't support mips64 n32: "Invalid ELF image for this architecture"
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = " ${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
diff --git a/meta/conf/machine/include/powerpc/tune-power5.inc b/meta/conf/machine/include/powerpc/tune-power5.inc
index e70e4012176c..452897d2d43d 100644
--- a/meta/conf/machine/include/powerpc/tune-power5.inc
+++ b/meta/conf/machine/include/powerpc/tune-power5.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'power5', 'qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power6.inc b/meta/conf/machine/include/powerpc/tune-power6.inc
index eaf89515cad7..da8831058094 100644
--- a/meta/conf/machine/include/powerpc/tune-power6.inc
+++ b/meta/conf/machine/include/powerpc/tune-power6.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'power6', 'qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-power7.inc b/meta/conf/machine/include/powerpc/tune-power7.inc
index 4531ddd85f48..47887c553f97 100644
--- a/meta/conf/machine/include/powerpc/tune-power7.inc
+++ b/meta/conf/machine/include/powerpc/tune-power7.inc
@@ -21,4 +21,4 @@ GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7',
 GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
 
 # QEMU usermode fails with invalid instruction error
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'power7', 'qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
index 446b344c3d25..63e745b4a29c 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -19,4 +19,4 @@ PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc
 QEMU_EXTRAOPTIONS:tune-ppc64e5500 = " -cpu e500mc"
 
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', 'qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
index 4444705b2d6d..77de2f9982bc 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -19,4 +19,4 @@ PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc
 QEMU_EXTRAOPTIONS:tune-ppc64e6500 = " -cpu e500mc"
 
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', 'qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 28742e794d63..95b5fe52114c 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -25,7 +25,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
-MACHINE_FEATURES_BACKFILL_CONSIDERED:append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
+MACHINE_FEATURES_OPTED_OUT += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '', d)}"
 
 # ELF64 ABI

-- 
2.43.0


