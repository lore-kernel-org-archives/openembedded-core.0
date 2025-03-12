Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C331C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 12:56:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.36137.1741784163997970053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 05:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNw0AJwv;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912c09bea5so5425424f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784162; x=1742388962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=907iRrl1haEbcRTGdG2bcbojKD89/xLPcqerenSLcUM=;
        b=DNw0AJwvZN3AZ5rhRuGu7U/+wJNmORG82zYva/US7RZp0RgdloM5ZLaUCTK92XwGOp
         1/0bwlyk3pz0Ub5/oAMS79QUIZJx7uVxqHP9uZWRvxTHEZwqrMf/CfUdjN3L3Vi6zh7K
         52XXQahyit3qMfolfNYbIeoBpogcysD+vWFkjyZgl6eDYtJngb6A7oigcBFtN6J8K5G6
         UciEl7m7kPniH81O1UV4OY3E4IEZ2a4IQ2hSsqYk22pkC53tq5ypjEYVhck5873j77S6
         QhsTT4hxLHQFprpUZoMgtBMJU39WwxrLfb4CNvrZSOdjGY7+WYZV9rJkolehwnF8dGOE
         L8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784162; x=1742388962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=907iRrl1haEbcRTGdG2bcbojKD89/xLPcqerenSLcUM=;
        b=GtLzk8ZVAvs8icepgzSRMq/aJv6Ir4F6JzfUEb7pSObYX/nNaF/oomf0YG6WSHQHVH
         OsWW6arBZOZPM8IXYB7Tg07Esh6Hume+ZIYL4sB6wQhyDMaNIfCXQvJ5BzZ7f75T98p4
         gWYYH7c7VjUAeBh9KcWQx7/f5Mk37v/lO+ZFU9/nzeYoHLt2qW3BwzqiVIyq6DxJnWWn
         MNha3E3gcqf/Arz0Q15i4zd5j8RjCoZeS0lvmT5tEVLSC1bHOBHK1l+2gYiXUGp9uzkj
         /kcT6Zlwqi08NbFDsLjB+SMgErwFinE6z/i0E9BIEDG13VPifFgGvpB4vjHeHHsmSfVl
         B4aw==
X-Gm-Message-State: AOJu0YwN7JuVULOioZQkMQH9UT9228XQzUAyHUyt6ZetlfK45mlrw602
	Cu1N9f7dfvfaFGqoiGjCYZoMoaMoeAIq4Mo8wNq9OoEa9C3SRnyuojaYbw==
X-Gm-Gg: ASbGncvWwkHZ347QOOQZ1uAdVGluaa4/AzQtEyR6HmCgaBy5jeXLFdrFiBYaITRWHC9
	pD7dUIqh+Gy5NHh7KcTGOfTuANLPjd2I4CWGJhjqtrDPEfNhQMDoIUXPWj4tLHsv46oBDJsCEz7
	fb0xcpIMBHOL63crMdp+dDaQ1y/fvYYww61s4rOb/6ol0j1KqxJ4xbd18hP5/r+CEik2gIgkePt
	AamXreE2ZXVpX+UbuKTSBuqEA9W6GDB7TyThAW8vfxsGKWlNUCyjlNC8OusNCQYzh4xgRv1ERHe
	ojptceSzIpEYrmfIwM1hz1/8sQbVdWQVXlpuuMhSIM/N//SnfVOimYbU3ThzpE7/i6AJgn+LlNQ
	=
X-Google-Smtp-Source: AGHT+IHOwiulqFMYBg+9KlwS9ogY/3yl9TkYe1LJ3S13W70qXlSJaFZ73IBzNaEXRS2PolFhjHflgw==
X-Received: by 2002:a5d:5d86:0:b0:391:4390:97e3 with SMTP id ffacd0b85a97d-3926487d434mr5934184f8f.33.1741784161831;
        Wed, 12 Mar 2025 05:56:01 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2eecsm20810694f8f.79.2025.03.12.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:56:01 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] linux-firmware: Fix packaging of some subpackages
Date: Wed, 12 Mar 2025 13:55:54 +0100
Message-ID: <20250312125554.365599-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212649

Since commit c0fedbc7 ("linux-firmware: Upgrade to 20241017 and
allow compressing firmware") more firmware files were added and
some subpackages have been split further.

Some of these new subpackages do not use the correct globbing so
when FIRMWARE_COMPRESSION is set, the firmware files end up in
a different subpackage than they were intended.

For example, linux-firmware-amdgpu-aldebaran and others are empty
and everything ends up in linux-firmware-amdgpu-misc.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../linux-firmware/linux-firmware_20250211.bb | 212 +++++++++---------
 1 file changed, 106 insertions(+), 106 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index aec36a7a7f..68e0a3b1e4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -662,89 +662,89 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
 FILES:${PN}-qca-qca61x4-serial = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin* \
 "
 FILES:${PN}-qca-qca61x4-usb = " \
-  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin* \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin* \
 "
 FILES:${PN}-qca-qca6390 = " \
-  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin* \
 "
 FILES:${PN}-qca-qca6698 = " \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206 \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207 \
-  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207* \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin* \
 "
 FILES:${PN}-qca-wcn3950 = " \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv \
-  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv \
-  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin \
-  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin* \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin* \
 "
 FILES:${PN}-qca-wcn3988 = " \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
-  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
-  ${nonarch_base_libdir}/firmware/qca/apnv10.bin \
-  ${nonarch_base_libdir}/firmware/qca/apnv11.bin \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/apnv10.bin* \
+  ${nonarch_base_libdir}/firmware/qca/apnv11.bin* \
 "
 FILES:${PN}-qca-wcn399x = " \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/crnv21.bin \
-  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv \
-  ${nonarch_base_libdir}/firmware/qca/crnv32.bin \
-  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/crnv21.bin* \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/crnv32.bin* \
+  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin* \
 "
 FILES:${PN}-qca-wcn6750 = " \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn \
-  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.bin \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a \
-  ${nonarch_base_libdir}/firmware/qca/msnv11.b09 \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn* \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.bin* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
 "
 FILES:${PN}-qca-qca2066 = " \
-  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.301 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.302 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
+  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
 "
 FILES:${PN}-qca-wcn7850 = " \
-  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112 \
-  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112* \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin* \
 "
 FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
 # -qca is a virtual package that depends upon all qca packages.
@@ -912,45 +912,45 @@ LICENSE:${PN}-amdgpu-vega12 = "Firmware-amdgpu"
 LICENSE:${PN}-amdgpu-misc = "Firmware-amdgpu"
 
 FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
-FILES:${PN}-amdgpu-aldebaran = "${nonarch_base_libdir}/firmware/amdgpu/aldebaran_*.bin"
-FILES:${PN}-amdgpu-carrizo = "${nonarch_base_libdir}/firmware/amdgpu/carrizo_*.bin"
-FILES:${PN}-amdgpu-cezanne = "${nonarch_base_libdir}/firmware/amdgpu/green_sardine_*.bin"
-FILES:${PN}-amdgpu-fiji = "${nonarch_base_libdir}/firmware/amdgpu/fiji_*.bin"
-FILES:${PN}-amdgpu-hawaii = "${nonarch_base_libdir}/firmware/amdgpu/hawaii_*.bin"
-FILES:${PN}-amdgpu-navi10 = "${nonarch_base_libdir}/firmware/amdgpu/navi10_*.bin"
-FILES:${PN}-amdgpu-navi14 = "${nonarch_base_libdir}/firmware/amdgpu/navi14_*.bin"
-FILES:${PN}-amdgpu-navi21 = "${nonarch_base_libdir}/firmware/amdgpu/sienna_cichlid_*.bin"
-FILES:${PN}-amdgpu-navi22 = "${nonarch_base_libdir}/firmware/amdgpu/navy_flounder_*.bin"
-FILES:${PN}-amdgpu-navi23 = "${nonarch_base_libdir}/firmware/amdgpu/dimgrey_cavefish_*.bin"
-FILES:${PN}-amdgpu-navi24 = "${nonarch_base_libdir}/firmware/amdgpu/beige_goby_*.bin"
-FILES:${PN}-amdgpu-navi31 = "${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_0_*.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
-"
-FILES:${PN}-amdgpu-navi32 = "${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin \
-    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin \
-"
-FILES:${PN}-amdgpu-oland = "${nonarch_base_libdir}/firmware/amdgpu/oland_*.bin"
-FILES:${PN}-amdgpu-polaris10 = "${nonarch_base_libdir}/firmware/amdgpu/polaris10_*.bin"
-FILES:${PN}-amdgpu-polaris11 = "${nonarch_base_libdir}/firmware/amdgpu/polaris11_*.bin"
-FILES:${PN}-amdgpu-polaris12 = "${nonarch_base_libdir}/firmware/amdgpu/polaris12_*.bin"
-FILES:${PN}-amdgpu-raven = "${nonarch_base_libdir}/firmware/amdgpu/raven_*.bin"
-FILES:${PN}-amdgpu-rembrandt = "${nonarch_base_libdir}/firmware/amdgpu/yellow_carp_*.bin"
-FILES:${PN}-amdgpu-renoir = "${nonarch_base_libdir}/firmware/amdgpu/renoir_*.bin"
-FILES:${PN}-amdgpu-stoney = "${nonarch_base_libdir}/firmware/amdgpu/stoney_*.bin"
-FILES:${PN}-amdgpu-tonga = "${nonarch_base_libdir}/firmware/amdgpu/tonga_*.bin"
-FILES:${PN}-amdgpu-topaz = "${nonarch_base_libdir}/firmware/amdgpu/topaz_*.bin"
-FILES:${PN}-amdgpu-vega10 = "${nonarch_base_libdir}/firmware/amdgpu/vega10_*.bin"
-FILES:${PN}-amdgpu-vega12 = "${nonarch_base_libdir}/firmware/amdgpu/vega12_*.bin"
+FILES:${PN}-amdgpu-aldebaran = "${nonarch_base_libdir}/firmware/amdgpu/aldebaran_*.bin*"
+FILES:${PN}-amdgpu-carrizo = "${nonarch_base_libdir}/firmware/amdgpu/carrizo_*.bin*"
+FILES:${PN}-amdgpu-cezanne = "${nonarch_base_libdir}/firmware/amdgpu/green_sardine_*.bin*"
+FILES:${PN}-amdgpu-fiji = "${nonarch_base_libdir}/firmware/amdgpu/fiji_*.bin*"
+FILES:${PN}-amdgpu-hawaii = "${nonarch_base_libdir}/firmware/amdgpu/hawaii_*.bin*"
+FILES:${PN}-amdgpu-navi10 = "${nonarch_base_libdir}/firmware/amdgpu/navi10_*.bin*"
+FILES:${PN}-amdgpu-navi14 = "${nonarch_base_libdir}/firmware/amdgpu/navi14_*.bin*"
+FILES:${PN}-amdgpu-navi21 = "${nonarch_base_libdir}/firmware/amdgpu/sienna_cichlid_*.bin*"
+FILES:${PN}-amdgpu-navi22 = "${nonarch_base_libdir}/firmware/amdgpu/navy_flounder_*.bin*"
+FILES:${PN}-amdgpu-navi23 = "${nonarch_base_libdir}/firmware/amdgpu/dimgrey_cavefish_*.bin*"
+FILES:${PN}-amdgpu-navi24 = "${nonarch_base_libdir}/firmware/amdgpu/beige_goby_*.bin*"
+FILES:${PN}-amdgpu-navi31 = "${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_0_*.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_sos.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_0_ta.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_0.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_0.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
+"
+FILES:${PN}-amdgpu-navi32 = "${nonarch_base_libdir}/firmware/amdgpu/dcn_3_2_0_dmcub.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/gc_11_0_3_*.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_sos.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/psp_13_0_10_ta.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/sdma_6_0_3.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/smu_13_0_10.bin* \
+    ${nonarch_base_libdir}/firmware/amdgpu/vcn_4_0_0.bin* \
+"
+FILES:${PN}-amdgpu-oland = "${nonarch_base_libdir}/firmware/amdgpu/oland_*.bin*"
+FILES:${PN}-amdgpu-polaris10 = "${nonarch_base_libdir}/firmware/amdgpu/polaris10_*.bin*"
+FILES:${PN}-amdgpu-polaris11 = "${nonarch_base_libdir}/firmware/amdgpu/polaris11_*.bin*"
+FILES:${PN}-amdgpu-polaris12 = "${nonarch_base_libdir}/firmware/amdgpu/polaris12_*.bin*"
+FILES:${PN}-amdgpu-raven = "${nonarch_base_libdir}/firmware/amdgpu/raven_*.bin*"
+FILES:${PN}-amdgpu-rembrandt = "${nonarch_base_libdir}/firmware/amdgpu/yellow_carp_*.bin*"
+FILES:${PN}-amdgpu-renoir = "${nonarch_base_libdir}/firmware/amdgpu/renoir_*.bin*"
+FILES:${PN}-amdgpu-stoney = "${nonarch_base_libdir}/firmware/amdgpu/stoney_*.bin*"
+FILES:${PN}-amdgpu-tonga = "${nonarch_base_libdir}/firmware/amdgpu/tonga_*.bin*"
+FILES:${PN}-amdgpu-topaz = "${nonarch_base_libdir}/firmware/amdgpu/topaz_*.bin*"
+FILES:${PN}-amdgpu-vega10 = "${nonarch_base_libdir}/firmware/amdgpu/vega10_*.bin*"
+FILES:${PN}-amdgpu-vega12 = "${nonarch_base_libdir}/firmware/amdgpu/vega12_*.bin*"
 FILES:${PN}-amdgpu-misc = "${nonarch_base_libdir}/firmware/amdgpu/*"
 # -amdgpu is a virtual package that depends upon all amdgpu packages.
 ALLOW_EMPTY:${PN}-amdgpu = "1"
@@ -1500,8 +1500,8 @@ FILES:${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
 FILES:${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
-FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin \
+FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin* \
 "
 FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
-- 
2.48.1


