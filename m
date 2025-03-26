Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1990CC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.33369.1743020994633071490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R6L3aysS;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2241221a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020994; x=1743625794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQi7z89ko/qYaR8FgqLbY+8rXAXO0zbw21Pci01jojY=;
        b=R6L3aysS5wczoxxXPHX+Bn38C+vRxtjNRREYqFozAUJFSjre05eHp20fU6vDNpvPj5
         xzwF4dXSii0vrZXdYT7wEPdy7+rbHw146XWBI5V5gWQZXoNk7CIG2hYRop/9qBECPMSd
         uvUcLgb2wPxdzOQeGuTx5ylkWUKHnMdtLjqHEiM5+q51qagawi76KXm+BsDVGiLf2Q9N
         DR0FQ1SguhILr7Kan0RJusK1eySKpMzbfk4o+Fy1iq7R5bKkP6hbNgJgFwB88nmFVqjd
         lTZP8e6GCwD0/6jeugPw2qV38reGi2j4U7zJwexJjjohqnI81jydcrf213YaqE4r+8Zj
         T2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020994; x=1743625794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQi7z89ko/qYaR8FgqLbY+8rXAXO0zbw21Pci01jojY=;
        b=L3lsnUuQaZiF0HflJA45AgKiMqkQduTIPkS8GvG7WWO6hKA7raJsUGAeHqkEjbOnfd
         eFkijLuXvjYsVLEe17MtimJ19pdHSjNaBuRumMyDXA9kTEChJuuInntQLw5iyIpM99Gg
         orqUYsZZJO9Zy0iZWr9z9IlgsoONL7ejvuIVUcIQ/sGeskvN+/6U2XU+HZFcGwywOtZ7
         PboxzEyeYZvlQRGXoNO9J1m3vb8uUaHTw+eyxSPgTwvyJ7XncCqfIo4w5NKzfcyD0VYI
         mcSGtSKWVsX3/pxia1IGzq07mGItPWOT48pzvY1J+Z+kIeJuAPumfDh1rEuRlbA1huwo
         hdzQ==
X-Gm-Message-State: AOJu0YzEazWO0N+TBRNz4RiE/gvZ/k8Ly8kIa5I/k/BKok1QF2QrY+sr
	MYtbEffqGEpM1DTVtU8v2qQQfT7JIbCeporx701rRxSQhBb/UDVF2byoZCdv
X-Gm-Gg: ASbGncuiOd6G8XWb1Ce/rR+5xxTpWCdo763v9bm6Hu0xJhl2Cv+XbLeF/9Y1iX/GljE
	AsnTiylr1ydE5xj5Rn7Vj34TOxu3nS8omgUk0XuTEE8b0nxJX1d3j3xsGXtOP7iXO7ZKBIVp6MK
	ri9huPlGFOvUrwb//O76/82hZ/ojZ5STrfmoPyk+GWF65p4GRvJyivjAa0+DsJ8kfFDrzeQ8+Zm
	jphO2FTtSP0HdqD+sze/FjlNxVMPo4nc9vIZE0aI9++DtlEmwvPgOovSnPsodh0ygXK4aq6O42d
	YxZycwuvV/macFqJP+JQyiAaXF9TOvapi3S7cC+C8Fn2/5KY7Ou4YlMVEVXWxIy5Pso=
X-Google-Smtp-Source: AGHT+IFqdwXIRUTi/9EiYZ8NrzUgI6cUPSCRB0DNDOILB/u9C9cLZGrO9BRmM9M5lygaCM3fnPMU6Q==
X-Received: by 2002:a17:90b:1ccd:b0:2fa:2133:bc87 with SMTP id 98e67ed59e1d1-303788d90b1mr7878879a91.6.1743020993783;
        Wed, 26 Mar 2025 13:29:53 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:53 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marc Ferland <marc.ferland@sonatest.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [styhead][PATCH v2 19/31] linux-firmware: split amdgpu firmwares in separate packages
Date: Wed, 26 Mar 2025 17:28:05 -0300
Message-Id: <20250326202817.64437-20-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213679

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit 4bcb1cd5803d7b664140f177730af3c0e0b60968)
---
 .../linux-firmware/linux-firmware_20250109.bb | 128 +++++++++++++++++-
 1 file changed, 126 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index 8211bd1eb13f..6380a5303c41 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -290,6 +290,32 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
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
@@ -712,13 +738,107 @@ RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
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
 "
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
@@ -1775,6 +1895,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
+# Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1790,6 +1911,9 @@ python populate_packages:prepend () {
 
     ath11k_pkgs = filter(lambda x: x.find('-ath11k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath11k', ' ' + ' '.join(ath11k_pkgs))
+
+    amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.39.5


