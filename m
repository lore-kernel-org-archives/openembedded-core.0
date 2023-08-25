Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB0BEE49A5
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:02 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.5805.1692931681222381963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QIUiCdrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a7d7e5fb03so329255b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931680; x=1693536480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSrqbsaPAR8kVFbVVGhCkqNE5MFL5qWQI5XkWkagjos=;
        b=QIUiCdrLRcALDKVswVT6dAXpwFBspfqo45hmlAjZtF/gwQnUFeE12LzpdLc2yzZbJJ
         dn/Yb73Bys2SupVQtgu1sERm6HYA/ROMO0tyTuHhpsx3pC+5KjbLF+dyR9FUFYg0Nuqp
         9wxhCCZZuys2f1TNIZxEyMz0Y9BYatgT9JIXdPMTXLsC7loroEt6NCWENeBLZ3OKpngr
         JBIdG/dgepn4ZKJ46ow5K1QhMWUNTEzb9yK7xuw9oRlDANiyyhlgEkyzDiBbB/hcFfEj
         ahDXNG/OVxt1xfSF3HVcKQBUZhcOm+BKim2IfTS0LIDcMkOF5x8HauAoWV5s+Fpzffe6
         pFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931680; x=1693536480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSrqbsaPAR8kVFbVVGhCkqNE5MFL5qWQI5XkWkagjos=;
        b=IhDJ59OtHZEeVmlN9AJkwljXcznSXoeoIT//rlFazw5TMe/WfZnga7YKznoCFwsGvT
         UftW/4d4759a2T4RJCLuD2QjCLi26qa42fHveH1P0GPYgW7t4Y0y0Y6Pj59mUvFgSIxj
         +G0tXvO/1elDs3f6CgorK4sfejzWkpMCVashx9rn/+dVWLQwE69bVbdtVaxoo1MpLYXg
         Memdtq4rTJHoZe2aTP6apT6Zd/PEhibus50RnR0qQYV60YxriwHwPTbyroZOYSQuxH/d
         K3mY1TvSeyhFv8yH080KehTYlYaVbLQ2lUmYjhNLCGDpTmPVKsdxjPhdNUPcRWIkVmwp
         riyw==
X-Gm-Message-State: AOJu0YwYWyDaGR8LhYVBJfQMoWW4cQCclPjVgDyMWDFtVDTXH4RyrEb9
	pPSePdtSWU5qUycfo2+21tPWZVjwCmMmaBMZmNI=
X-Google-Smtp-Source: AGHT+IH/BRdn7qjpmjYtLmMtGMtlbjixcCK9xj7XcTbsxFszzlsT40wi30mWR1p/AsekxFFa/rC99Q==
X-Received: by 2002:a05:6808:1803:b0:3a4:67b6:454e with SMTP id bh3-20020a056808180300b003a467b6454emr2042999oib.6.1692931680114;
        Thu, 24 Aug 2023 19:48:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.47.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:47:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] linux-firmware : Add firmware of RTL8822 serie
Date: Thu, 24 Aug 2023 16:47:32 -1000
Message-Id: <05bb93772ebfcffc0686add16c0a1419b4f40594.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186681

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

RTL8822 is a serie of wireless modules that need firmwares to function correctly.
The linux firmware recipe does not have a package of these firmwares, and this commit add them.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6459959beeb91c0b694f5f17b6587a12c6dcb087)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 4f6dd409f4..ff7cb94859 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -239,6 +239,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
+             ${PN}-rtl8822 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
@@ -564,6 +565,7 @@ LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8822 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8168 = "WHENCE"
 
@@ -591,6 +593,11 @@ FILES_${PN}-rtl8821 = " \
 FILES_${PN}-rtl8168 = " \
   ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
 "
+FILES_${PN}-rtl8822 = " \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin \
+"
 
 RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
@@ -598,6 +605,7 @@ RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8821 += "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8822 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
-- 
2.34.1


