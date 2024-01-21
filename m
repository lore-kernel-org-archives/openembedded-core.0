Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEF4C47258
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 02:10:20 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.39590.1705803011194755101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 18:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6RRGI6C;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7bb5fda069bso119184939f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 18:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705803010; x=1706407810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AN0Hoslgw8i3iXNErfrrYDyLdtLhbRPLXKUQAaa0ZIg=;
        b=l6RRGI6CyGXQlgqPO+HKtyF4PYuLkyJcyrcQdhd36RdczNjP28kLocDAEOABcnZBcB
         jqNtFN93dI5ROfjSwPVNxiYRSYf9Sg875dPv1Xw3uHCTxX4HAtjAAM2v+XEznz0WgD0C
         qrN2t9PKsz6DxWYm/hDI6UUzT7aODagSkXiTsW8+C5OsY2ZA/arILlCrTjgub2DHsmbR
         hKxpftVSKPQel8yT7Xyt/lSGquf7U6/2aFuyMTWqrvR/N+HrPpwAwIQ/mYiHepAVQ/YI
         J16GeuXUe52Z77NZoviZWpd6u8hvgC6W7k+2DpxcQOP0PHmiiyz751ZuVRHAYcSkdzhD
         XPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705803010; x=1706407810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN0Hoslgw8i3iXNErfrrYDyLdtLhbRPLXKUQAaa0ZIg=;
        b=I320jtYoj5FCG0OzI6NAma19/7k85LjMhhoXqy+ZJ1LYSYe3hoR9OucK0bSmxARzLS
         Up38gzSPnU+mhVrlzRAEj1v7c5lq+UqIdYr1a3GpgJlchLi1AB/IxJXRS9E2z50PGUEE
         wsyycedcvslkGwGaEbZLS4sUqkFxdDQUEYdbIgtNjMSo8q7lXVRKTkpT/QgVOvUk++sZ
         qOKmRZH/rhbjsRqMr/+OiGH7Wl24uiTJJoREFySNXRAUU+lPZEa7Z/T9ZY0WlQvoJdno
         bEIsd8jRV6IffhQWagPmldSzq2WnSf1rsHOvMkr+JdzoARXcaML1GkxtFr4XEJL3guMb
         DBsQ==
X-Gm-Message-State: AOJu0Yy37NW9vZK56R9H1/XMsgOEJ1s1TnLViz6K9W+wCwW7Nf1ffzsd
	n5nUqSKqGDeJUer/dXV6kgvLUGrZaIt+A0580/4o5UCaDJz4UrgBMTF8+ItAsGQ=
X-Google-Smtp-Source: AGHT+IHVWe8amaAGp2a/f6JBjaQoTpEKhtpSbd2XlFeJFYOKaOHPRJTPNiKEmomtrmI5mZKc+LaAFw==
X-Received: by 2002:a05:6e02:e0f:b0:360:29f:b7a6 with SMTP id a15-20020a056e020e0f00b00360029fb7a6mr2527060ilk.18.1705803009947;
        Sat, 20 Jan 2024 18:10:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::81f2])
        by smtp.gmail.com with ESMTPSA id kk6-20020a170903070600b001d720a7a616sm3224168plb.165.2024.01.20.18.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 18:10:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] opensbi: bump to 1.4
Date: Sat, 20 Jan 2024 18:10:07 -0800
Message-ID: <20240121021007.78342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 02:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194087

From: Thomas Perrot <thomas.perrot@bootlin.com>

This release has:
- Synopsys DesignWare APB GPIO driver
- Zicntr and Zihpm support
- Console print improvements
- Smepmp support
- Simple FDT based syscon regmap driver
- Syscon based reboot and poweroff driver
- Non-contiguous hpm counters
- Smcntrpmf support
- Full sparse hartid support
- IPI improvements
- RFENCE improvements
- Zkr support
- Andes custom PMU support
Overall, this release mainly adds more ISA extensions, drivers and other improvements.

https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1.4

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use FW_PIC=y and drop revert patch

 .../opensbi/{opensbi_1.3.bb => opensbi_1.4.bb}            | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb => opensbi_1.4.bb} (89%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.3.bb b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
similarity index 89%
rename from meta/recipes-bsp/opensbi/opensbi_1.3.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.4.bb
index f01cae34d1f..fd18c03cfbc 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.3.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
@@ -8,12 +8,12 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "057eb10b6d523540012e6947d5c9f63e95244e94"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.3.x;protocol=https"
+SRCREV = "a2b255b88918715173942f2c5e1f97ac9e90c877"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n CLANG_TARGET= "
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=y CLANG_TARGET= "
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
@@ -43,5 +43,3 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
-
-SECURITY_CFLAGS = ""
-- 
2.43.0


