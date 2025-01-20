Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE92C02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 15:46:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.39342.1737387975761799581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 07:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K10ehnnD;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so18895395e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 07:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387974; x=1737992774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R04Lg2YuQNIQ5ls1btastIyJ5Q8tKKnDfa044/IXgvc=;
        b=K10ehnnDIyxa4dYpaWiLdCn0gL8457hRA7c8GPXhvinpt5XlOXvKcB9gJgEhIq3xeY
         K0dj7YnGOmNjCzqR3HH0/60D3NAGFG9s0o1dQEVSDJNiCZH9hzJ/w1NqqC/W0Zr022x6
         9KLXiU2xjsbizDa4hhgP3c7ON5YsgGWeSEK5NC8qYR/s7TKm2HXPuh7lSSbex6bTUPTK
         SWkILny5NxvpueLFRtsQEZlab9faoJ6ghIjSYMflj9F7av2gBzU9mlMdgrv8MtNdjPgb
         Kya8P6Kb7SwBVxDdMF0whtoPKnuoQhU1db+75LwwEE68fUpi2GQdHHEMQTR3UpbwC0NS
         sz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387974; x=1737992774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R04Lg2YuQNIQ5ls1btastIyJ5Q8tKKnDfa044/IXgvc=;
        b=cpCBfEhG5goBzz3qfm2oBi62VCleE+t7/2An3dSdlyx1T7he2zH035sHiJlnx/dl5W
         32jcMm5XmXEkL72JMyNIq9O+byj7yDn2smPbOcd0AD6v5UnEzbC2sdCmQoQBQcIDo7wo
         A6Nt+FhDRhFb5gA+0PQ3XcU2alvgN7Typ6P0fCeh2HdRezNUidPVv3nsuQ3q9bBsi1Be
         IVBkY5CRLRwE8SC9XvC8FgVpNXSWGwCGIcKBqD59XCjggfh5lGILJFQjBg0jCkS4RbJ5
         wwtcQVYpwBIRmnU1okC37+Fdmt2rXgwETNrqh9rr5QIDWaZwHKiYeuSPkmfHlGeG4kvc
         ubYQ==
X-Gm-Message-State: AOJu0Yxej2DVr1bgwK7wSEn0AlJz4VHTOqgYSOPj8iNS5umPKLAR7z2y
	ho4Iklt4tpC00zrOKrsyM1HsfVWywQdKu3V9wwWQaPAWHIFf2UMOsXV+vQ==
X-Gm-Gg: ASbGnctPbYJQaY+jNqHTGoQrUeG4LtNVh4ssRwU2MqQcMoqYokDVZ04coh6y2TJNfFx
	rVXp0keK6uGhoSDDZIquUcN2dDnMFYasaqFnB9Y7gle4d/pPCkAGcQ0ntAdBNSdMd8ELMIvSfI/
	9NngYJ34QA7YxsqzwG4WLN1JqM+fC+KyglLb6HV0qeQ3iAwSPslnPdByr8vSl6B2/1zBhFPoC58
	0dAFHvwKqmY3wF60s2xG6WVsoth96+U/IXIfAmG3j867nJZ2baeu7lDc4BTaEnh4NyzIgiqYkf4
	JgM0CV1ZSMXnfY0Iq/pWM1dpRoUD7SPabYUxGrfWMF7PnGzweqte+KQZWjC1yXU2iys4nokV88q
	xamzAB37K41GzBeGWNA==
X-Google-Smtp-Source: AGHT+IG2Y/XxbUqSl+7rG3GS0v5z7BzGH+rqvozuOLkJspogC86+7x9yHj4BjrzuVyQfOEfs/PUf7A==
X-Received: by 2002:a05:600c:34c1:b0:438:a432:7c44 with SMTP id 5b1f17b1804b1-438a4327dadmr59061895e9.21.1737387973638;
        Mon, 20 Jan 2025 07:46:13 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904131f5sm141078725e9.11.2025.01.20.07.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:46:12 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH 3/3] linux-firmware: split amdgpu firmwares in separate packages
Date: Mon, 20 Jan 2025 10:46:05 -0500
Message-Id: <20250120154605.3023068-3-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120154605.3023068-1-marc.ferland@sonatest.com>
References: <20250120154605.3023068-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 15:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210042

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for AMD gpu chips:

- linux-firmware-amdgpu-aldebaran
- linux-firmware-amdgpu-carrizo
- linux-firmware-amdgpu-cezanne
- linux-firmware-amdgpu-fiji
- linux-firmware-amdgpu-hawaii
- linux-firmware-amdgpu-navi10
- linux-firmware-amdgpu-navi14
- linux-firmware-amdgpu-navi21
- linux-firmware-amdgpu-navi22
- linux-firmware-amdgpu-navi23
- linux-firmware-amdgpu-navi24
- linux-firmware-amdgpu-navi31
- linux-firmware-amdgpu-navi32
- linux-firmware-amdgpu-oland
- linux-firmware-amdgpu-polaris10
- linux-firmware-amdgpu-polaris11
- linux-firmware-amdgpu-polaris12
- linux-firmware-amdgpu-raven
- linux-firmware-amdgpu-rembrandt
- linux-firmware-amdgpu-renoir
- linux-firmware-amdgpu-stoney
- linux-firmware-amdgpu-tonga
- linux-firmware-amdgpu-topaz
- linux-firmware-amdgpu-vega10
- linux-firmware-amdgpu-vega12
- linux-firmware-amdgpu-misc: catches all firmwares that are not
  already included in the other -amdgpu- packages.

This list was partly inspired from:

https://wiki.gentoo.org/wiki/AMDGPU#Known_firmware_blobs

Many other firmware packages could be created out of what is in
-misc. Looking at the different commits in the linux-firmware
repository gives a very good idea of which firmware goes with each
chip.

Note: Altough this patch might break some installations that assumed
that _all_ firmwares where installed by the linux-firmware-amdgpu
package, I think it is a step in the right direction as the number of
firmwares under amdgpu is constantly increasing (currently ~103MB).

Tested with a renoir gpu.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../linux-firmware/linux-firmware_20241210.bb | 130 +++++++++++++++++-
 1 file changed, 127 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index f1a664c4fd..242a698667 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -287,6 +287,32 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-mt76x-license ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2 \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-amdgpu-license ${PN}-amdgpu \
+             ${PN}-amdgpu-aldebaran \
+             ${PN}-amdgpu-carrizo \
+             ${PN}-amdgpu-cezanne \
+             ${PN}-amdgpu-fiji \
+             ${PN}-amdgpu-hawaii \
+             ${PN}-amdgpu-navi10 \
+             ${PN}-amdgpu-navi14 \
+             ${PN}-amdgpu-navi21 \
+             ${PN}-amdgpu-navi22 \
+             ${PN}-amdgpu-navi23 \
+             ${PN}-amdgpu-navi24 \
+             ${PN}-amdgpu-navi31 \
+             ${PN}-amdgpu-navi32 \
+             ${PN}-amdgpu-oland \
+             ${PN}-amdgpu-polaris10 \
+             ${PN}-amdgpu-polaris11 \
+             ${PN}-amdgpu-polaris12 \
+             ${PN}-amdgpu-raven \
+             ${PN}-amdgpu-rembrandt \
+             ${PN}-amdgpu-renoir \
+             ${PN}-amdgpu-stoney \
+             ${PN}-amdgpu-tonga \
+             ${PN}-amdgpu-topaz \
+             ${PN}-amdgpu-vega10 \
+             ${PN}-amdgpu-vega12 \
+             ${PN}-amdgpu-misc \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-mediatek-license ${PN}-mediatek \
              ${PN}-microchip-license ${PN}-microchip \
@@ -709,13 +735,107 @@ RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 # For amdgpu
 LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
 LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-aldebaran = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-carrizo = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-cezanne = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-fiji = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-hawaii = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi10 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi14 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi21 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi22 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi23 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi24 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi31 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-navi32 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-oland = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-polaris10 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-polaris11 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-polaris12 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-raven = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-rembrandt = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-renoir = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-stoney = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-tonga = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-topaz = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-vega10 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-vega12 = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-misc = "Firmware-amdgpu"
 
 FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
-FILES:${PN}-amdgpu = " \
-  ${nonarch_base_libdir}/firmware/amdgpu \
-"
+FILES:${PN}-amdgpu-aldebaran = "${nonarch_base_libdir}/firmware/amdgpu/aldebaran_*.bin"
+FILES:${PN}-amdgpu-carrizo = "${nonarch_base_libdir}/firmware/amdgpu/carrizo_*.bin"
+FILES:${PN}-amdgpu-cezanne = "${nonarch_base_libdir}/firmware/amdgpu/green_sardine_*.bin"
+FILES:${PN}-amdgpu-fiji = "${nonarch_base_libdir}/firmware/amdgpu/fiji_*.bin"
+FILES:${PN}-amdgpu-hawaii = "${nonarch_base_libdir}/firmware/amdgpu/hawaii_*.bin"
+FILES:${PN}-amdgpu-navi10 = "${nonarch_base_libdir}/firmware/amdgpu/navi10_*.bin"
+FILES:${PN}-amdgpu-navi14 = "${nonarch_base_libdir}/firmware/amdgpu/navi14_*.bin"
+FILES:${PN}-amdgpu-navi21 = "${nonarch_base_libdir}/firmware/amdgpu/sienna_cichlid_*.bin"
+FILES:${PN}-amdgpu-navi22 = "${nonarch_base_libdir}/firmware/amdgpu/navy_flounder_*.bin"
+FILES:${PN}-amdgpu-navi23 = "${nonarch_base_libdir}/firmware/amdgpu/dimgrey_cavefish_*.bin"
+FILES:${PN}-amdgpu-navi24 = "${nonarch_base_libdir}/firmware/amdgpu/beige_goby_*.bin"
+FILES:${PN}-amdgpu-navi31 = "${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_0_*.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
+"
+FILES:${PN}-amdgpu-navi32 = "${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
+"
+FILES:${PN}-amdgpu-oland = "${nonarch_base_libdir}/firmware/amdgpu/oland_*.bin"
+FILES:${PN}-amdgpu-polaris10 = "${nonarch_base_libdir}/firmware/amdgpu/polaris10_*.bin"
+FILES:${PN}-amdgpu-polaris11 = "${nonarch_base_libdir}/firmware/amdgpu/polaris11_*.bin"
+FILES:${PN}-amdgpu-polaris12 = "${nonarch_base_libdir}/firmware/amdgpu/polaris12_*.bin"
+FILES:${PN}-amdgpu-raven = "${nonarch_base_libdir}/firmware/amdgpu/raven_*.bin"
+FILES:${PN}-amdgpu-rembrandt = "${nonarch_base_libdir}/firmware/amdgpu/yellow_carp_*.bin"
+FILES:${PN}-amdgpu-renoir = "${nonarch_base_libdir}/firmware/amdgpu/renoir_*.bin"
+FILES:${PN}-amdgpu-stoney = "${nonarch_base_libdir}/firmware/amdgpu/stoney_*.bin"
+FILES:${PN}-amdgpu-tonga = "${nonarch_base_libdir}/firmware/amdgpu/tonga_*.bin"
+FILES:${PN}-amdgpu-topaz = "${nonarch_base_libdir}/firmware/amdgpu/topaz_*.bin"
+FILES:${PN}-amdgpu-vega10 = "${nonarch_base_libdir}/firmware/amdgpu/vega10_*.bin"
+FILES:${PN}-amdgpu-vega12 = "${nonarch_base_libdir}/firmware/amdgpu/vega12_*.bin"
+FILES:${PN}-amdgpu-misc = "${nonarch_base_libdir}/firmware/amdgpu/*"
+# -amdgpu is a virtual package that depends upon all amdgpu packages.
+ALLOW_EMPTY:${PN}-amdgpu = "1"
+# -amdgpu-misc is a catch all package that includes all the amdgpu
+# firmwares that are not already included in other -amdgpu- packages.
+ALLOW_EMPTY:${PN}-amdgpu-misc = "1"
 
 RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-aldebaran += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-carrizo += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-cezanne += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-fiji += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-hawaii += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi10 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi14 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi21 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi22 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi23 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi24 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi31 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-navi32 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-oland += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-polaris10 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-polaris11 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-polaris12 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-raven += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-rembrandt += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-renoir += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-stoney += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-tonga += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-topaz += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-vega10 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-vega12 += "${PN}-amdgpu-license"
+RDEPENDS:${PN}-amdgpu-misc += "${PN}-amdgpu-license"
 
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
@@ -1772,6 +1892,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
+# Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1787,6 +1908,9 @@ python populate_packages:prepend () {
 
     ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
+
+    amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.34.1


