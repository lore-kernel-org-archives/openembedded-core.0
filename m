Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FE5C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 21:25:18 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.2231.1745357078702998469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 14:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xtz5zZJn;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso54055261fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745357077; x=1745961877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrbctI21P+klBTg+dt8S5cjwp9PlLFbWYavr9r0Zo7o=;
        b=Xtz5zZJnak8yc61dxpsYcgzrwuXfco+DG5XrJ5kxSjfhIk/G+q8eL7dtG0Y99tEqPF
         xCElIrldyIsCVDBswLv/ysYn4T3ucRNKf6TZSS/tg6XhADHDSeIJ45FyLUWqIHOWvqhB
         8D/BYhmqUXKaSzSzFALS4NNuvbfKnQllKnpPeO3tpdbZ/upo7wVrBW+stwhZdsb3kVLF
         yA4FifGk9pypjJR4a+7jRrymkjktR0d+g50hUm9w3N62S7JcMtG1hAF+weqaycheCHoR
         kaNuRciw+66vJUDOrHVFG6yicOaASfBd+yGkSTeg1EN9YhJAtRhOVMxowBkfKwwTzZXb
         Gv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357077; x=1745961877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrbctI21P+klBTg+dt8S5cjwp9PlLFbWYavr9r0Zo7o=;
        b=GoFfkCkpX1XlmgTQls3P7rR8ZtcXtVTPZzLHAJ8w/64YIM26yLUUnLbpBndppcEip0
         02U4t7qluQaR8mBe4Ghw1feczvvWOEgzwSq1fNxObymcuTzfxlwUo+NjV12fqDuVrClI
         Q00A3rBBvkDM1SC7uO2U5ZY+YrxANFKVdmTGk7VB4C12eCSLHJAmDBZcPjAk2dL4mPen
         8OCD/CH0tOreYxp+CCcOsJJpNc5OZEOtvUPCXf7FEOXK0jPkjGikZrBUkIU2P7hyg1vM
         xuQJk2/r6nFciJwiPgZCzh7EcIoBHyqp36kfr6DK7XgQzs9yAXbNeSQblHXJKSa7W92k
         I8SA==
X-Gm-Message-State: AOJu0Yw5Lxj3BnClP3n16CFmR9Y54GnBmO9EAUR6reMbRjvsOSJXjLha
	EOa1pCHIDbeShMZCRm78BtAB05+m1BFgrPss2UTAiC1rudaY+Av8OJqWlGxENQE=
X-Gm-Gg: ASbGncvCZBZ3EZHxpfExZa+GqycMO9PEiTn3IrGAsyVmWFDlkbvxHpcy1BOqx0sFE+D
	1Qm/fmF5VQHyZW5WPHdDTznETXHs5DoXm+noTVM7n2cZpcd6OfWDooULhuZz1/DAjmu7nxULGPL
	7+JbDhoeXUWqgcQ1jtm8DCTQAPu4ecVETIUn0Y4lxzoutV7jEr9rm+2NjwDXCfp7XmmVx3RKYzF
	WLHGeQQT/7dgDq4ZSBAvgaEi/2NabSw3f39SMQgaeSwFEmrdggxvh0jQ1rxsNEpeR/JmYZuAaBj
	2OxISQpI6ADrFdaLr1UpnfsEkirETfVM1Tke5R5mWUAQ6YM5q6d23FObqtAdjf8XTosO9T7IQRM
	FFf+aFQwNZyYcTir+M9+GTn4sf4ENWfljr0o=
X-Google-Smtp-Source: AGHT+IHdUpKeUmXYEteu+9Dxpmb/sw2z8QXCyJEnKYEfYXmUPCKXGGWNQtUz4XaPAhDUlfBufX0R6A==
X-Received: by 2002:a05:651c:244:b0:308:f787:5c48 with SMTP id 38308e7fff4ca-310905794c5mr64514401fa.33.1745357076499;
        Tue, 22 Apr 2025 14:24:36 -0700 (PDT)
Received: from localhost.localdomain (83-168-79-193.static.ipv4.korbank.pl. [83.168.79.193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075e927sm16215031fa.10.2025.04.22.14.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:24:35 -0700 (PDT)
From: patryk.seregiet@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: pseregiet <patryk.seregiet@gmail.com>
Subject: [PATCH] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Tue, 22 Apr 2025 23:24:32 +0200
Message-ID: <20250422212432.3495828-1-patryk.seregiet@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 21:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215247

From: pseregiet <patryk.seregiet@gmail.com>

linux-firmware-rtl8723 and linux-firmware-adsp-sst
contain symlinks to files that were previously
packaged only in the main linux-firmware package.
This caused both subpackages to inherit an unintended
RDEPENDS on the full package. This change resolves the
issue by ensuring all required files are correctly
included in their respective subpackages.

Thanks to Peter Kjellerstedt for figuring out the rootcause.

Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
---
 .../linux-firmware/linux-firmware_20250410.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
index f12bb2c6d3..7e5c4e25a0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
@@ -1760,7 +1761,10 @@ RDEPENDS:${PN}-ice      = "${PN}-ice-license"
 FILES:${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE:${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES:${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
+FILES:${PN}-adsp-sst              = "\
+    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
+    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
+"
 RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For QAT
-- 
2.49.0


