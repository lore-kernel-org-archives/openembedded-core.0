Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FACC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 18:33:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.24435.1749061990129201193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 11:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rt7ImkLu;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so111449f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749061988; x=1749666788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXQwHwIy0wF16ifc86A31qiZUOVffGsZ5YfIS56RyOQ=;
        b=Rt7ImkLuNZ5Y+F+kx3sl5UfUGim6hfp3hnHb6iAxu1IyOZis+RjLDO8u7IT6y2fvHq
         8z8/ZBRKjhp36FG5PNMSFVFv4Fu3rXOiBjUI0q62w8Zcvk29iVVoQSa283oG0sW6eTla
         mDbc6hopjbGpe0ITnZjs5zn7fj1FUY6NwA074Ftuel35o8m3c54bSLWDzo7x2FOcSg2I
         BKtuun/BQDI/CZ+ouWkJm7Z5WYvMRre4SGVwQowjAXAiNDsApTGXzl1QhQGsLJUsURaI
         ZHT0JVVHJPJNmvx1Of1BlbNYaDUSPdLl1bBwc3M5SdC5S+CerW/9MyQrQ8uWWvMIKeMa
         Ei7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749061988; x=1749666788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXQwHwIy0wF16ifc86A31qiZUOVffGsZ5YfIS56RyOQ=;
        b=b+xrf258hNL5i2z3Xpd/X7vxkUvFQ6v7zklZ4pDGBHK7Ly4PFzvaZHy8uzgTKEDu0B
         +nlpY2lAIilB1IWRHrF0tVOXm3CFQoKEgxJnFYIzulEjaYLvpWCd1/JA2CKGyHYjKACa
         FnOvFbhhGRpfD9cCbyuowsbr5D8VAzYsBcivC8Bo8gRNBER6PThW0rew/UMu9Lj/4Mxm
         wLpSuSrSvlixJscrgb9yxxihRKfBlNdSgxlnFT85Y0x2gI2CE1iGRFiXdmBpbOIdgm31
         5ugO2rFDqMI23qZ0wA7Iz1q++6TjHFAHraLjfcb5M345ZkD91+0MmHNdyv4GzW0sORMD
         3ITA==
X-Gm-Message-State: AOJu0YydznBlsu67w8zylG3TSGJuJ+3L8VbOGpyUtnuCJngd1Q3HLKM/
	q+gxrMlIry1buNCYGR/BWCqRGPkUPCeHyxUvLwd4ai1EDYVweRQkWD1ZpItgeg==
X-Gm-Gg: ASbGncv8CH+h5bwMdFtAf5gsuQw1/54gFN07VzOd21w3D3jvK5HH0IT3CCO6Z2fJr/Q
	lXerx70TJhya9y+s1wNx8O86yz5Z0n4u+R1+8nxn9A810q41uLl3Y9FSa4cfoEWynj1DxHoUVyd
	VJdwjhlx3maPtgHKWtxvNysjS7k4Xv8REB59YvM2zSp2YcJ9M+XgnxS3cZO23uA+n+5n2mhtmU7
	FFyAHD7a3A2+25cWVhOs15aP0RMEsy+eusiIn7qiE5wE+Oj370Hp10waQ+/sgPNcNBjAIRLs+0p
	48aYtnzcNOE/eV79+ouwqV8hcN6ELN9zThtJ/AQN0nNNP3YGrkO+FegMeF9ueIXY4bItkZU1y8X
	3kvzZ+arlxpw=
X-Google-Smtp-Source: AGHT+IHY/lt99Y7T0fJFldXka1tU5DqX7x7fvX51Mp8blyH8laQRrJpYBG3oIgSiuNOQUK8RANDAsQ==
X-Received: by 2002:a05:6000:40ce:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a51d987c75mr3624190f8f.57.1749061987925;
        Wed, 04 Jun 2025 11:33:07 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a02cdsm22692704f8f.94.2025.06.04.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 11:33:07 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] bluez5: upgrade 5.82 -> 5.83
Date: Wed,  4 Jun 2025 18:32:38 +0000
Message-ID: <20250604183238.3647-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 18:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217963

Changelog:
Fix issue with handling BAP and removal of PAC.
Fix issue with handling SID for broadcast receiver.
Fix issue with handling HSP/HFP reconnection policy.
Fix issue with handling cable pairing and Sixaxis controllers.
Fix issue with handling virtual cable unplug for HID devices.
Fix issue with handling service records for HID devices.
Add support for AVDTP and TX timestamps.

Full changelog:
https://github.com/bluez/bluez/compare/5.82...5.83

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../bluez5/bluez5/0001-bluez5-disable-aics-tests.patch      | 2 +-
 ...sts-add-a-target-for-building-tests-without-runnin.patch | 6 +++---
 .../bluez5/{bluez5_5.82.bb => bluez5_5.83.bb}               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.82.bb => bluez5_5.83.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
index 4e8bd040e9..3f01843ea3 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-bluez5-disable-aics-tests.patch
@@ -1,4 +1,4 @@
-From 2140aa879c24dcc9dad7e733c77c1bb212fe1ddf Mon Sep 17 00:00:00 2001
+From 182545f2504255d67d9ec2071fd5c82ab53c5a2e Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
 Date: Sun, 30 Mar 2025 02:20:24 +0000
 Subject: [PATCH] bluez5: disable aics tests
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 5492509577..a9af56f141 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From 9d5141cecea46fb3d6f918b11705cf0b6c673bca Mon Sep 17 00:00:00 2001
+From fa5da30786837b437707cea921056e9c1c22ffba Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index dc9a27e..949d7da 100644
+index 02ad23c..169269d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -723,6 +723,9 @@ endif
+@@ -722,6 +722,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.82.bb b/meta/recipes-connectivity/bluez5/bluez5_5.83.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.82.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.83.bb
index f8d73444e3..8af6bdb67e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.82.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.83.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "0739fa608a837967ee6d5572b43fb89946a938d1c6c26127158aaefd743a790b"
+SRC_URI[sha256sum] = "108522d909d220581399bfec93daab62035539ceef3dda3e79970785c63bd24c"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


