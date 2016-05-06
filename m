Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id CD0DE73289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 18:17:48 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id v145so147759665oie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=yX6tAqgAOrSMG+DUhMbX7AydEARcAV6k19xfXwJuhbk=;
	b=wAYNEBtA6MaU39tyNtBvJvbndZ3jz1vqiZFnTK631bGcjKSp/djUmcV7deXfvnCQM6
	VCLlR0mAOXr8zn2PW2/pOZDHjYWGlAqntAL1lUEh/E0CWW0Fz4no3qFqUlI/TnWLNLJ5
	T/t/VngoDy6xrjulXrIX7F4GA+V7dcu2j1PCpcDF9xxIITrMmCg8vnerh+Bhg8OK/AsW
	myWUkJ6BL7rCO0ywJu2U9kElAsRyPgQRHAJdxBZMuoqdiBrcFpjxcCV1S2ud2n88mPX0
	fryWBxzWuAtnIijacTkqls8c+2MEO48Ylgn7ccitDMQ3EnQp7xIgmYjbR2r2W6fZqxIN
	AgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=yX6tAqgAOrSMG+DUhMbX7AydEARcAV6k19xfXwJuhbk=;
	b=ETh8PmH7WakH+nJnpp/rltbqvnPvwQc5nSAuCVYvP43Sj+5s9RUYZ1xcllTYlwT2x7
	F/3B+cean29MtWej57uIF1tyV0gybVgXv2PaiATHifnlhwxYTdb/ZRgdb3FYgsJzsJmO
	RyMcub91+0YHMmBdMJ63h98YPgjowU+rcvFwfhO77wPYA1Bc7ZfrVPR54qEhPjm/l5/r
	nH8qlotYdNyEAgGTfgL2TAKbRi4bcdxWRxyV9oDs4XGyAtLPkQFUSOZdZtNIt5nvAuWd
	JLL5buoXChtNgT6d+G9Dl/NUjzrSJJ6KlbLpN8VPGlK9+tnAfxuz+oP5IBhss3F3kNgz
	q+Dw==
X-Gm-Message-State: AOPr4FWYXSHABak78+pjtuT7ks6eRkYjcX1ve3wdxY6gka1Y3PmNjZwS7cyzZq/jaBrhb5E4snRiHvFITlIe7A==
MIME-Version: 1.0
X-Received: by 10.157.9.137 with SMTP id q9mr10139082otd.101.1462558668736;
	Fri, 06 May 2016 11:17:48 -0700 (PDT)
Received: by 10.157.29.214 with HTTP; Fri, 6 May 2016 11:17:48 -0700 (PDT)
Date: Fri, 6 May 2016 11:17:48 -0700
Message-ID: <CACMJ4GY1NYE5WjmXa3A7XAg__yy6dPkCLDg8ht9TC_02G8q4Bg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware : break out all bnx2 firmwares
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
X-List-Received-Date: Fri, 06 May 2016 18:17:51 -0000
Content-Type: text/plain; charset=UTF-8

From 81c448f89c679af258d0a3640592709dd066bbfb Mon Sep 17 00:00:00 2001
From: Christopher Clark <christopher.clark6@baesystems.com>
Date: Fri, 6 May 2016 11:06:29 -0700
Subject: [PATCH] linux-firmware : break out all bnx2 firmwares

Break out each bnx2 firmware into an independent subpackage.
Create a bnx2 package that depends upon all individual bnx2 subpackages.

Remove the earlier bnx2-mips package that only contained the most
recent bnx2-mips firmware.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 129 ++++++++++++++++++++-
 1 file changed, 124 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 95a57d7..41c7020 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -230,7 +230,31 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
-             ${PN}-bnx2-mips \
+             ${PN}-bnx2 \
+             ${PN}-bnx2-mips-06-4-6-16 \
+             ${PN}-bnx2-mips-06-5-0-0-j3 \
+             ${PN}-bnx2-mips-06-5-0-0-j6 \
+             ${PN}-bnx2-mips-06-6-0-15 \
+             ${PN}-bnx2-mips-06-6-2-1 \
+             ${PN}-bnx2-mips-06-6-2-3 \
+             ${PN}-bnx2-mips-09-4-6-17 \
+             ${PN}-bnx2-mips-09-5-0-0-j15 \
+             ${PN}-bnx2-mips-09-5-0-0-j3 \
+             ${PN}-bnx2-mips-09-5-0-0-j9 \
+             ${PN}-bnx2-mips-09-6-0-17 \
+             ${PN}-bnx2-mips-09-6-2-1a \
+             ${PN}-bnx2-mips-09-6-2-1b \
+             ${PN}-bnx2-mips-09-6-2-1 \
+             ${PN}-bnx2-rv2p-06-4-6-16 \
+             ${PN}-bnx2-rv2p-06-5-0-0-j3 \
+             ${PN}-bnx2-rv2p-06-6-0-15 \
+             ${PN}-bnx2-rv2p-09-4-6-15 \
+             ${PN}-bnx2-rv2p-09-5-0-0-j10 \
+             ${PN}-bnx2-rv2p-09-5-0-0-j3 \
+             ${PN}-bnx2-rv2p-09-6-0-17 \
+             ${PN}-bnx2-rv2p-09ax-5-0-0-j10 \
+             ${PN}-bnx2-rv2p-09ax-5-0-0-j3 \
+             ${PN}-bnx2-rv2p-09ax-6-0-17 \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -430,18 +454,113 @@ RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"

-# For Broadcom bnx2-mips
+# For Broadcom bnx2
 #
 # which is a separate case to the other Broadcom firmwares since its
 # license is contained in the shared WHENCE file.

-LICENSE_${PN}-bnx2-mips = "WHENCE"
+LICENSE_${PN}-bnx2 = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-4-6-16      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-5-0-0-j3    = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-5-0-0-j6    = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-6-0-15      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-6-2-1       = "WHENCE"
+LICENSE_${PN}-bnx2-mips-06-6-2-3       = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-4-6-17      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-5-0-0-j15   = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-5-0-0-j3    = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-5-0-0-j9    = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-6-0-17      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-6-2-1a      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-6-2-1b      = "WHENCE"
+LICENSE_${PN}-bnx2-mips-09-6-2-1       = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-06-4-6-16      = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-06-5-0-0-j3    = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-06-6-0-15      = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09-4-6-15      = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09-5-0-0-j10   = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09-5-0-0-j3    = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09-6-0-17      = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09ax-5-0-0-j10 = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09ax-5-0-0-j3  = "WHENCE"
+LICENSE_${PN}-bnx2-rv2p-09ax-6-0-17    = "WHENCE"
 LICENSE_${PN}-whence-license = "WHENCE"

-FILES_${PN}-bnx2-mips = "/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-bnx2-mips-06-4-6-16      =
"/lib/firmware/bnx2/bnx2-mips-06-4.6.16.fw"
+FILES_${PN}-bnx2-mips-06-5-0-0-j3    =
"/lib/firmware/bnx2/bnx2-mips-06-5.0.0.j3.fw"
+FILES_${PN}-bnx2-mips-06-5-0-0-j6    =
"/lib/firmware/bnx2/bnx2-mips-06-5.0.0.j6.fw"
+FILES_${PN}-bnx2-mips-06-6-0-15      =
"/lib/firmware/bnx2/bnx2-mips-06-6.0.15.fw"
+FILES_${PN}-bnx2-mips-06-6-2-1       =
"/lib/firmware/bnx2/bnx2-mips-06-6.2.1.fw"
+FILES_${PN}-bnx2-mips-06-6-2-3       =
"/lib/firmware/bnx2/bnx2-mips-06-6.2.3.fw"
+FILES_${PN}-bnx2-mips-09-4-6-17      =
"/lib/firmware/bnx2/bnx2-mips-09-4.6.17.fw"
+FILES_${PN}-bnx2-mips-09-5-0-0-j15   =
"/lib/firmware/bnx2/bnx2-mips-09-5.0.0.j15.fw"
+FILES_${PN}-bnx2-mips-09-5-0-0-j3    =
"/lib/firmware/bnx2/bnx2-mips-09-5.0.0.j3.fw"
+FILES_${PN}-bnx2-mips-09-5-0-0-j9    =
"/lib/firmware/bnx2/bnx2-mips-09-5.0.0.j9.fw"
+FILES_${PN}-bnx2-mips-09-6-0-17      =
"/lib/firmware/bnx2/bnx2-mips-09-6.0.17.fw"
+FILES_${PN}-bnx2-mips-09-6-2-1a      =
"/lib/firmware/bnx2/bnx2-mips-09-6.2.1a.fw"
+FILES_${PN}-bnx2-mips-09-6-2-1b      =
"/lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw"
+FILES_${PN}-bnx2-mips-09-6-2-1       =
"/lib/firmware/bnx2/bnx2-mips-09-6.2.1.fw"
+FILES_${PN}-bnx2-rv2p-06-4-6-16      =
"/lib/firmware/bnx2/bnx2-rv2p-06-4.6.16.fw"
+FILES_${PN}-bnx2-rv2p-06-5-0-0-j3    =
"/lib/firmware/bnx2/bnx2-rv2p-06-5.0.0.j3.fw"
+FILES_${PN}-bnx2-rv2p-06-6-0-15      =
"/lib/firmware/bnx2/bnx2-rv2p-06-6.0.15.fw"
+FILES_${PN}-bnx2-rv2p-09-4-6-15      =
"/lib/firmware/bnx2/bnx2-rv2p-09-4.6.15.fw"
+FILES_${PN}-bnx2-rv2p-09-5-0-0-j10   =
"/lib/firmware/bnx2/bnx2-rv2p-09-5.0.0.j10.fw"
+FILES_${PN}-bnx2-rv2p-09-5-0-0-j3    =
"/lib/firmware/bnx2/bnx2-rv2p-09-5.0.0.j3.fw"
+FILES_${PN}-bnx2-rv2p-09-6-0-17      =
"/lib/firmware/bnx2/bnx2-rv2p-09-6.0.17.fw"
+FILES_${PN}-bnx2-rv2p-09ax-5-0-0-j10 =
"/lib/firmware/bnx2/bnx2-rv2p-09ax-5.0.0.j10.fw"
+FILES_${PN}-bnx2-rv2p-09ax-5-0-0-j3  =
"/lib/firmware/bnx2/bnx2-rv2p-09ax-5.0.0.j3.fw"
+FILES_${PN}-bnx2-rv2p-09ax-6-0-17    =
"/lib/firmware/bnx2/bnx2-rv2p-09ax-6.0.17.fw"
 FILES_${PN}-whence-license = "/lib/firmware/WHENCE"

-RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-4-6-16      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-5-0-0-j3    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-5-0-0-j6    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-6-0-15      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-6-2-1       += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-06-6-2-3       += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-4-6-17      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-5-0-0-j15   += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-5-0-0-j3    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-5-0-0-j9    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-6-0-17      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-6-2-1a      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-6-2-1b      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-mips-09-6-2-1       += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-06-4-6-16      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-06-5-0-0-j3    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-06-6-0-15      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09-4-6-15      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09-5-0-0-j10   += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09-5-0-0-j3    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09-6-0-17      += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09ax-5-0-0-j10 += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09ax-5-0-0-j3  += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2-rv2p-09ax-6-0-17    += "${PN}-whence-license"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-4-6-16"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-5-0-0-j3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-5-0-0-j6"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-6-0-15"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-6-2-1"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-06-6-2-3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-4-6-17"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-5-0-0-j15"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-5-0-0-j3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-5-0-0-j9"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-6-0-17"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-6-2-1a"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-6-2-1b"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-mips-09-6-2-1"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-06-4-6-16"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-06-5-0-0-j3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-06-6-0-15"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09-4-6-15"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09-5-0-0-j10"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09-5-0-0-j3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09-6-0-17"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09ax-5-0-0-j10"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09ax-5-0-0-j3"
+RDEPENDS_${PN}-bnx2 += "${PN}-bnx2-rv2p-09ax-6-0-17"
+RDEPENDS_${PN}-bnx2 += "${PN}-whence-license"

 # For iwlwifi
 LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
-- 
2.1.4

