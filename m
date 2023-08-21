Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA998EE49A8
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 06:30:57 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5300.1692599453136470520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 23:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RcXl/l8o;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-56c250ff3d3so454175a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692599452; x=1693204252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBGS4fclJuJI284bRiVGhqWcO+bnlZIX0rpHNJsGOSU=;
        b=RcXl/l8oPZXS9YlRPVi6DKjbnJAgwqhuKjGtzmxHHI25SvOUSZE213br4BCWNNiNWE
         oC1al3hQDzCWWIbaoFIuTm2eOBz62ZEZb3TC/AluUde8lVY0GriGjp5yAEBIOJyXFTyu
         1zdwJBk0kxlMJQcJ1X2OZHgMM4LJoWIO5Idn7gCEck4058UmJrMJVMpQ02XEO2O6aERS
         Kq4nza8DfwMFSeCU6ZX09wT2LrNX3WlxV41zl5MbBKvXTM2mfj2m4Hd4nH4OkAK7UW2l
         x6jQ4Sfqjc3RaaOx0J9eXLPHCPgwGY0zRmylwn3sVQx73Slwq3QB4Y/32+nwW32hxytp
         7lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692599452; x=1693204252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBGS4fclJuJI284bRiVGhqWcO+bnlZIX0rpHNJsGOSU=;
        b=Lrc78GfyJNzI4n/d1dXmTnWoCALabcHRAZ6igwmL+jFbE1ISQc2ed1t1vAH341NV6a
         2U+L7vvP3gkWbKmZHVNu80rHW6uvNFWVA5YIeglGagIAlVePeHmV3PymykJxq9OCapLn
         NvZdpq01O03pbqK1Vdo5UnOCRY9p6lWVicOsuqPtLxbdU7WhzN+CC/EkPPti8ClPvfFR
         VTS8ElEZ8bqLLisIlMtCTpI1aGGGNJv5ThCEjWaUSlc5TqUYNgLEcUjTKuiCKDB/13nz
         BGWPH/Nr9isSFdHWIhmVkK7Jyc7tAcQ+T4zwqOfOF5COZpxTaIM65z4DjfDaDQR+xj8w
         jX7w==
X-Gm-Message-State: AOJu0Yz6PMH9I/6vB+R1A56clKV+xvBcnl98GBdEzCIY4Jaxj7z9B8jf
	RxyAm34lMBJSo7Tcwfy63WBbKqaJcOIrUg==
X-Google-Smtp-Source: AGHT+IGzOyqeU2o3cKr0N0b3obCLoB3IpEz8Fb9iPJcCrW9RAXMc3pPBMkQ6pxdZvjRg7hmlBON2cw==
X-Received: by 2002:a17:902:ced0:b0:1b8:8702:1e7c with SMTP id d16-20020a170902ced000b001b887021e7cmr9384374plg.33.1692599452202;
        Sun, 20 Aug 2023 23:30:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001beef2c9bffsm6148546plz.85.2023.08.20.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:30:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/2] tunes: Add support for sve instructions on armv8/armv9
Date: Sun, 20 Aug 2023 23:30:48 -0700
Message-ID: <20230821063049.3296008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 06:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186420

This helps in defining correct compiler options and configure options
for glibc and overall ABI for toolchain

(From OE-Core rev: 58330ce58719bd82530b1143623db7af7a85e897)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v2: No change

 meta/conf/machine/include/arm/feature-arm-sve.inc | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/feature-arm-sve.inc

diff --git a/meta/conf/machine/include/arm/feature-arm-sve.inc b/meta/conf/machine/include/arm/feature-arm-sve.inc
new file mode 100644
index 00000000000..279bf8c4862
--- /dev/null
+++ b/meta/conf/machine/include/arm/feature-arm-sve.inc
@@ -0,0 +1,5 @@
+# Scalable Vector Extension (SVE) for:
+# armv8.2-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, armv8-r, armv9a
+
+TUNEVALID[sve] = "Enable SVE instructions for ARMv8 and ARMv9"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'sve', '+sve', '', d)}"
-- 
2.41.0


