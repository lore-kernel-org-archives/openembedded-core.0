Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5BCC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:39:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.7375.1745411185569925039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=htTpIoyE;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so59031051fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745411184; x=1746015984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJollbCfrmz+XMF7zFR2bxUzMMmUOZyc2LVyrgGzKb0=;
        b=htTpIoyEC7rufo+weFOOFMOuFvg0nPvCUVptg3YNqB3MLuzWD7M144e6HrgfK+bOGn
         mPsd4UhItYirxVmt+V3vmMVoFg+qmZwlwhsDahedGBDvxxZIY+1xQzIEjG4qYeDRLjIy
         QBw+8HYJJs86Ei6fuHhr7EXEYmgHPpkZbylGSxRMmHI4n30rB3GJQmjCoUuB4NY6/9L9
         o4jKaZyF4arpJK5V+leYPSYBuvV0sbr+hZdnWJkqYsI8Bth7JZnhM5oaN0LSS7DyPSp8
         WXNwNFb7EzEI6rJO8IvgjqsbSzbMJpx+2y/3m5Ma+NLsg0cslsUkfZ7be2OH4T8DiiaE
         sH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745411184; x=1746015984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJollbCfrmz+XMF7zFR2bxUzMMmUOZyc2LVyrgGzKb0=;
        b=MQ/qGnJ7Fvxc6if8iB1j+J7bX7QBWbOkCu0XI8qLmOgzW1NSP6XT7d3RmNctutYehu
         93bE9RRqJ9rAtJPpdBNCyWNECfN3Tr8rcG9LeX1wiC0uLI9XIzNgw2G1E6y8uaGN4Y+X
         HxleBRYnaBuGuJPpz/UZWxA1Ge+ShCToALq39MB5++7hlocMirBa6PT3EZ0FPd3/PikJ
         SPegvGGnI89v7I5mcCeA2jM95iJp+9tggTiXSuz4kjBwlo2pvg+4BQ4zgR3dpSlLU2pO
         X4YIOqtzun0R6mVonoa17cyQXQ2pSdrkwRBdJqfXK+V1qJM2muoMsDAYwvHUSolK3kGL
         eDeA==
X-Gm-Message-State: AOJu0YxkZDQzLvfoG5dacTBtOTCU106fbzd8CLz1PtA7q4mLiR39CFPr
	xONVrtSB/kyGSs9YH+tJeB3YEAf67LanBI8UEuVswd7ShB3seqD3cfB0oaQ806udWA==
X-Gm-Gg: ASbGncsgb3y7svGjyxO9/1P6s9GYvnM9L+r05DO+PB+4BCkwPp+0VUYfiCQeEomf467
	mMCGZlhurRXNEzxm3oHHreYfj+AaghPYQY4Zb46ME6UYpAbNVqv+tfcO80fQ6YDu04V/5/a5BM3
	hQSH6T/6qS1pkSFWtvdgsh2fOkklfq1yGzLV099XrBp29lwBO/Kr6anYH6TY2XY3DaIVnyWEbQ2
	pH2Ia4uoKLG3t0+OKY5vMX6/zVHgFisQG/h+VnQWC8rj+Ocj7C2T9EZakujbSQAqfzUwz3CYWi6
	QB6bDJUnh4xBv2/5hxa3OTrC1Rqx6XXoQKuFVFdvi3UrRc9pStxjBgYO8cAeSjUgJKIZlNrk0UZ
	bZjgJbeH8e8Evcu7TCQ4teAtj
X-Google-Smtp-Source: AGHT+IFCWssL4E6QYc8zahwoN0JAnew0z71g2bf5uCwECv/M2CqVG8ZREvvn3ujaoh+vVjSSdU389Q==
X-Received: by 2002:a05:651c:220e:b0:30d:e104:b594 with SMTP id 38308e7fff4ca-31090579a68mr54760081fa.40.1745411183390;
        Wed, 23 Apr 2025 05:26:23 -0700 (PDT)
Received: from localhost.localdomain (83-168-79-193.static.ipv4.korbank.pl. [83.168.79.193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090782f92sm18473231fa.34.2025.04.23.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 05:26:22 -0700 (PDT)
From: patryk.seregiet@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Patryk Seregiet <patryk.seregiet@gmail.com>
Subject: [PATCH v2] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Wed, 23 Apr 2025 14:26:19 +0200
Message-ID: <20250423122619.109306-1-patryk.seregiet@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215288

From: Patryk Seregiet <patryk.seregiet@gmail.com>

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
index f12bb2c6d3..a548645f00 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -1257,6 +1257,7 @@ FILES:${PN}-rtl8723 = " \
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_config.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
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


