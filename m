Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.1151.1617290913996024647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GN26DKFA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so2440782otq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CODYvJQTDAy5fZzoTeYlmAEl9O4WzUfs8hezudgmyFs=;
        b=GN26DKFAQR2yHIpsjQMVpX6OepW/tnhdcGtxXDUdxktK0vtqKeWmq2TYe+fuQdsfWj
         +XxL4qPJGtoLylqcbZuSWQ318h2LhERO7ErCHJR5WdXOB76wzRalwb6g+WhtQnxuBu5K
         F6BBII2CIZRU1bc9U45ce8TLFdxJXUhcxMCF2ilEUZeNdTvZHNK48w+AKc/i5aEzBQE0
         Xvjg4v+grf9hwwFiSPFQwnVIWQyNsaIrCepSOk//3N5ipVYMakED/QF0EJjkyAN+Qpdv
         tHjUEs8Bqz0CUFvEyKO9HVoPhtmGMFftfo9fzRPQX5MLLA7XbhLm1oP67IXRXy9xnNvG
         Yfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CODYvJQTDAy5fZzoTeYlmAEl9O4WzUfs8hezudgmyFs=;
        b=p4GMvY1SZkk5fpcAPK/EwhmukWh1Wc/7de6UWoDWdL0yv+CeSKnuk21jqJJkoCH8Q6
         VTINx0Im0/qn0AJgTeFRzgO3i5daDBDSD7gOKAmqN5/6gghZlY0odX12iX9dmxBHtQW/
         6kmwDeDm5j9ULB3wci5bijg0tf2An2zfoTCXsWyfYUh7VaGKPNCLcgg1kBaYxpM5M5kO
         ZLZwy0i3Y0NsxZXmwdl1QdphmjV3im2NmWzU5Hx8k6wP7UfaewoHzezxPmGpFNaaSFl5
         uz+CWEM3uwyk5uJRRjHdrmS6b/B/W/sgYAji/EAQhHG47bavCz1Jf/vZ+x8IUffoPTTW
         hvsQ==
X-Gm-Message-State: AOAM5321HEZmjyfJKiu5Z3sQrLZEKrQML0w4dZt63U6GoEECSC4llANe
	X35ANKWIFGrFOYJGxqtzWpgtLKlRfYdQW8/CnZk=
X-Google-Smtp-Source: ABdhPJyOo2KUVSGr0fh66owBCl6I8xDWrV+YxV6HJtHSZ5vpU8oja1hOCLRR1IUANVTQW+ZS+VvWiA==
X-Received: by 2002:a9d:7481:: with SMTP id t1mr7416859otk.208.1617290912767;
        Thu, 01 Apr 2021 08:28:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/15] linux-firmware: Fix packaging
Date: Thu,  1 Apr 2021 05:27:34 -1000
Message-Id: <86367fd896a020de7f3379da57f1ec62895bcf70.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trensch <mtrensch@hilscher.com>

Upstream directory layout has changed after update in commit 3c2f8b750ab9c53773fb5a9a1a874e475740b4ee, resulting in some package to pull in linux-firmware base package.
This may cause an image size increase of approximately 700MB.

See log.do_packaging:
DEBUG: linux-firmware-bcm43340 contains dangling link /lib/firmware/cypress/cyfmac43340-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43362 contains dangling link /lib/firmware/cypress/cyfmac43362-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4339 contains dangling link /lib/firmware/cypress/cyfmac4339-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43430 contains dangling link /lib/firmware/cypress/cyfmac43430-sdio.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43430 contains dangling link /lib/firmware/cypress/cyfmac43430-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43455 contains dangling link /lib/firmware/cypress/cyfmac43455-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43455 contains dangling link /lib/firmware/cypress/cyfmac43455-sdio.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4354 contains dangling link /lib/firmware/cypress/cyfmac4354-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356 contains dangling link /lib/firmware/cypress/cyfmac4356-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356-pcie contains dangling link /lib/firmware/cypress/cyfmac4356-pcie.clm_blob
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4356-pcie contains dangling link /lib/firmware/cypress/cyfmac4356-pcie.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm43570 contains dangling link /lib/firmware/cypress/cyfmac43570-pcie.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-bcm4373 contains dangling link /lib/firmware/cypress/cyfmac4373-sdio.bin
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_2x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_2x25.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0081-0001_4x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_8x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0099-0001_1x10_1x25.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_2x40.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0096-0001_2x10.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0097-0001_4x10_1x40.nffw
DEBUG: target found in linux-firmware
DEBUG: linux-firmware-netronome contains dangling link /lib/firmware/netronome/nic/nic_AMDA0081-0001_1x40.nffw
DEBUG: target found in linux-firmware

Signed-off-by: Michael Trensch <mtrensch@hilscher.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd273c611b03bd5972da8bf4accaba247f7c9c62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20210208.bb | 41 +++++++++++++++----
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 1881a8e065..78856cbf66 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -496,6 +496,13 @@ FILES_${PN}-netronome = " \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw \
   ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0011_2x40.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0012_2x40.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0078-0011_1x100.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/bpf \
+  ${nonarch_base_libdir}/firmware/netronome/flower \
+  ${nonarch_base_libdir}/firmware/netronome/nic \
+  ${nonarch_base_libdir}/firmware/netronome/nic-sriov \
 "
 
 RDEPENDS_${PN}-netronome += "${PN}-netronome-license"
@@ -622,7 +629,9 @@ FILES_${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bi
 FILES_${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.*"
 FILES_${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
 FILES_${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
-FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin"
+FILES_${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin \
+"
 FILES_${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin"
 FILES_${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin"
 FILES_${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin"
@@ -631,12 +640,18 @@ FILES_${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
 "
 FILES_${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.*"
-FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.*"
+FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43455-sdio.* \
+"
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
-FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin"
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.bin \
+"
 FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
-FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin"
+FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin \
+"
 FILES_${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin"
 FILES_${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
@@ -707,13 +722,21 @@ LICENSE_${PN}-cypress-license = "Firmware-cypress"
 FILES_${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
 FILES_${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
-FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.*"
-FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.*"
-FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.*"
-FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin"
-FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.*"
+FILES_${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
+FILES_${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43362-sdio.*"
+FILES_${PN}-bcm43430 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43430-sdio.*"
+FILES_${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4354-sdio.bin \
+"
+FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
+"
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
 "
 
 LICENSE_${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.25.1

