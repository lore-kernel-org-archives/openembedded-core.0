Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCA8CD128A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 15:12:22 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.139759.1712675537539073943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 08:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t6JZqklP;
 spf=pass (domain: konsulko.com, ip: 209.85.210.194, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-6ecff9df447so4460917b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1712675536; x=1713280336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8CyvMzPZK3gg77/kXfrseXq/KlJc7m3Cl8W5X46tH8=;
        b=t6JZqklP4GFhlEhEpHvxqO/zjXRnjnecb4VhWJ6uMC81XGcQyCH3ylzATpFzo2IICS
         Pk8EpQJGwyCywnp8EH/QaCtHDLTSFAxYNzNQ/7aedm1gJ6Dqn+X/tjaKaiYCJjvNPTG1
         /M0iQ/zGJnH8uxyPTFvkwPsKSYu41XF/0or3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675536; x=1713280336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8CyvMzPZK3gg77/kXfrseXq/KlJc7m3Cl8W5X46tH8=;
        b=CBGaB9hOcCa6V7tEV/F+INQ1mUxNVhzYx2SNOFCWI2VqNHT7Q5rrQkQCixPHpIVYxY
         2g2Z3yQsBAUxCJ1b8g8d9Tm0UgT3YcShAAYc6y0kLefx9JkvxrR8+U3FUpYqdSKhswjb
         uHaPJUDMNfFKiMKH1kTVE9eOBFXhmTlS1XpUh106kx7e4pt9zW8TAUtryaEnuoC6svrq
         GkeGvarY5KEWrNqXBIau7ORvKqQi7P/LXAXiT9Xlvt8DjPkJ+LOiYKlOLtQpMdmZpc1p
         LtsP0hm6GcjAEm23HTDbXCTUKN8FLSY/Sga4a9aLqWjc2obHUEROYzLqAytMT6QK9GKy
         UDSQ==
X-Gm-Message-State: AOJu0YwpQmpj1BIiyueOnEQJJfuMZDT71Uc6roiwaMd+8P92Q5ODfpn6
	Z38Z3TXA3UL7Co+QuM0UrsDsWy5pdYqnyHnEeA664gL/EpKmtvUXsMQLQvn0lcRLyxbGVKcXEqg
	ZO2P664tS
X-Google-Smtp-Source: AGHT+IGdxiL0N0oh/HbaZOKCr6qtmXErlR7mpjGyh3KSKurIpJkPJ7qZHSu+HqqlczK74YnEB7n3KA==
X-Received: by 2002:a05:6a20:ddaf:b0:1a7:a971:7065 with SMTP id kw47-20020a056a20ddaf00b001a7a9717065mr90396pzb.56.1712675536060;
        Tue, 09 Apr 2024 08:12:16 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:b05d:f6bf:f812:8d68])
        by smtp.gmail.com with ESMTPSA id jw22-20020a056a00929600b006e57247f4e5sm8438784pfb.8.2024.04.09.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 08:12:15 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] u-boot: update to final v2024.04 release
Date: Tue,  9 Apr 2024 08:12:05 -0700
Message-ID: <20240409151205.3333978-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 15:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198067

Release announcement:
https://lists.denx.de/pipermail/u-boot/2024-April/549827.html

"The merge window is formally open again, and I'll be merging in next
shortly. v2024.07 is scheduled for Monday, July 1st, 2024 and the merge
window will close and -rc1 will be released on the 22nd of April, and
then the next window will open with -rc2, two weeks later.
"

Changes since v2024.01:
https://github.com/u-boot/u-boot/compare/v2024.01...v2024.04

Complete changelog of merges from v2024.01...v2024.04:

425dc46a2c Merge tag 'u-boot-imx-master-20240330' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
9468bf3a69 Merge tag 'doc-2024-04-rc6' of https://source.denx.de/u-boot/custodians/u-boot-efi
a5ec56aea1 Merge https://source.denx.de/u-boot/custodians/u-boot-riscv
34f0452e0e Merge tag 'u-boot-amlogic-fixes-20240325' of https://source.denx.de/u-boot/custodians/u-boot-amlogic
5397daaed8 Merge tag 'efi-2024-04-rc5-2' of https://source.denx.de/u-boot/custodians/u-boot-efi
6ec096a711 Merge tag 'u-boot-imx-master-20240317' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
86fd291a79 Merge tag 'efi-2024-04-rc5' of https://source.denx.de/u-boot/custodians/u-boot-efi
a81242099c Merge tag 'mips-fixes-for-v2024.04' of https://source.denx.de/u-boot/custodians/u-boot-mips
7422f661e2 Merge https://source.denx.de/u-boot/custodians/u-boot-riscv
da07a629e1 Merge tag 'u-boot-imx-master-20240311' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
0981f8900f Merge https://source.denx.de/u-boot/custodians/u-boot-usb
485bfe1adb Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-marvell
46e3871aa6 Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-sunxi
773cb2bca7 Merge tag 'u-boot-imx-master-20240304' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
eac52e4be4 Merge patch series "ARM: renesas: Rename R-Mobile to Renesas"
574aac1c8c Merge branch 'master-riic' of https://source.denx.de/u-boot/custodians/u-boot-sh
44a15c3f4e Merge patch series "toradex: fix reset and hardware detection regressions"
abd4fb5ac1 Merge patch series "Dockerfile: Build coreboot from source"
1a66a7768a Merge tag 'u-boot-imx-master-20240224' of https://source.denx.de/u-boot/custodians/u-boot-imx
bb9d6c7f4f Merge tag 'u-boot-amlogic-fixes-20240223' of https://source.denx.de/u-boot/custodians/u-boot-amlogic
5e4a0c7f4a Merge branch 'qcom-fixes-2024.04' of https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon
7bb761c42d Merge patch series "board/ti: k3 boards: Stop using findfdt"
1817afe30f Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb
bebf916f9e Merge https://gitlab.denx.de/u-boot/custodians/u-boot-samsung
3e6f2a94bf Merge tag 'u-boot-imx-master-20240219' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
e4013bcb10 Merge branch 'master-porter' of https://source.denx.de/u-boot/custodians/u-boot-sh
9e00b6993f Merge tag 'u-boot-dfu-20240215' of https://source.denx.de/u-boot/custodians/u-boot-dfu
77ff61a5bb Merge tag 'xilinx-for-v2024.04-rc3' of https://source.denx.de/u-boot/custodians/u-boot-microblaze
0b66c54a97 Merge branch '2024-02-13-assorted-updates'
73b5b47dd5 Merge tag 'doc-2024-04-rc2' of https://source.denx.de/u-boot/custodians/u-boot-efi
91c37c4a20 Merge tag 'u-boot-imx-master-20240212' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
e8f2404e09 Merge branch 'master-779h0-r2' of https://source.denx.de/u-boot/custodians/u-boot-sh
d7aaaf4223 Merge tag 'u-boot-dfu-20240209' of https://source.denx.de/u-boot/custodians/u-boot-dfu
2b51069b7c Merge tag 'u-boot-imx-master-20240208' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
a7fb2f57ad Merge tag 'fsl-qoriq-2024-2-8' of https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq
0101a2ffe1 Merge branch '2024-02-06-assorted-fixes'
7ebc77fede Merge tag 'u-boot-rockchip-20240207' of https://source.denx.de/u-boot/custodians/u-boot-rockchip
daa3100250 Merge patch series "board: siemens: clean up subfolders"
090d8463b0 Merge tag 'rpi-next-2024.04' of https://source.denx.de/u-boot/custodians/u-boot-raspberrypi
819abd0a1e Merge tag 'smbios-2024-04-rc2' of https://source.denx.de/u-boot/custodians/u-boot-efi
050a9b981d Merge tag 'u-boot-amlogic-fixes-20240201' of https://source.denx.de/u-boot/custodians/u-boot-amlogic
f0df21b40c Merge https://source.denx.de/u-boot/custodians/u-boot-watchdog
b6d8969bcb Merge tag 'u-boot-at91-2024.04-a' of https://source.denx.de/u-boot/custodians/u-boot-at91
625e68ef65 Merge https://source.denx.de/u-boot/custodians/u-boot-riscv
28760ce864 Merge tag 'clk-2024.04-rc2' of https://source.denx.de/u-boot/custodians/u-boot-clk
d5c0c990c3 Merge tag 'efi-2024-04-rc1-4' of https://source.denx.de/u-boot/custodians/u-boot-efi
073f4f10b9 Merge patch series "Move framebuffer reservation for SPL to RAM end"
8986be59e7 Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-spi
41a737bb85 Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-sunxi
ce54325c42 Merge branch '2024-01-29-pytest-enhancements'
526a865fe4 Merge branch 'master-cleanup' of https://source.denx.de/u-boot/custodians/u-boot-sh
fb5fe1bf84 Merge tag 'smbios-2024-04-rc1-2' of https://source.denx.de/u-boot/custodians/u-boot-efi
e7f9e5eb58 Merge branch '2024-01-24-assorted-fixes-and-updates'
15e7927b5a Merge patch series "omap3: Make SPL_OMAP3_ID_NAND depend on NAND_OMAP_GPMC"
c09ec8e1cb Merge https://gitlab.denx.de/u-boot/custodians/u-boot-marvell
d64e05fc5b Merge tag 'u-boot-imx-master-20240122' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
79a9697894 Merge commit '3c9bb8fbdc77f6bd56e97597d875d8965db3b96c' of https://github.com/tienfong/uboot_mainline
22aeab2d96 Merge tag 'efi-2024-04-rc1-3' of https://source.denx.de/u-boot/custodians/u-boot-efi
3c04fcf313 Merge patch series "k3-j721e: beagleboneai: Fix USB"
83a8424722 Merge tag 'u-boot-stm32-20240119' of https://source.denx.de/u-boot/custodians/u-boot-stm
f4d5486506 Merge branch '2024-01-18-assorted-fixes'
cb49375239 Merge tag 'u-boot-rockchip-20240119' of https://source.denx.de/u-boot/custodians/u-boot-rockchip
002764d739 Merge tag 'xilinx-for-v2024.04-rc1-v2' of https://source.denx.de/u-boot/custodians/u-boot-microblaze
bdaa0b27b3 Merge tag 'efi-2024-04-rc1-2' of https://source.denx.de/u-boot/custodians/u-boot-efi
106332d6cc Merge branch '2024-01-16-assorted-updates-and-improvements'
043ca8c8a9 Merge tag 'qcom-2024.04-rc1' of https://gitlab.denx.de/u-boot/custodians/u-boot-snapdragon
6ca9349b67 Merge tag 'u-boot-imx-20240115' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
b9631fe781 Merge tag 'u-boot-nand-20240115' of https://source.denx.de/u-boot/custodians/u-boot-nand-flash
697758e7c8 Merge branch 'master-sync-dts-663' of https://source.denx.de/u-boot/custodians/u-boot-sh
817fdce324 Merge tag 'efi-2024-04-rc1' of https://source.denx.de/u-boot/custodians/u-boot-efi
547d3dd28a Merge branch '2024-01-12-assorted-fixes'
2ee7a8ec6f Merge patch series "net fixes prior lwip"
d3dba8a28b Merge tag 'u-boot-dfu-20240111' of https://source.denx.de/u-boot/custodians/u-boot-dfu
254a81c6b6 Merge https://source.denx.de/u-boot/custodians/u-boot-marvell
344667db64 Merge tag 'smbios-2024-04-rc1' of https://source.denx.de/u-boot/custodians/u-boot-efi
0727b10f6b Merge branch 'master' of https://gitlab.denx.de/u-boot/custodians/u-boot-samsung
c7937a4199 Merge tag 'rng-2024-04-rc1' of https://gitlab.denx.de/u-boot/custodians/u-boot-efi
c5e461fbf7 Merge tag 'u-boot-imx-master-20240108' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx
93d91e9485 Merge branch 'next'
f28a77589e Merge tag 'dm-next-7jan23' of https://source.denx.de/u-boot/custodians/u-boot-dm into next
c2c598e87c Merge branch 'staging' of https://source.denx.de/u-boot/custodians/u-boot-tegra into next
18fa946ab9 Merge branch '2024-01-05-fw_env-fixes' into next
0d53be75c7 Merge patch series "ATF and OP-TEE Firewalling for K3 devices."
93a0138acb Merge tag 'v2024.01-rc6' into next
dffa6d0210 Merge tag 'dm-next-1124' of https://source.denx.de/u-boot/custodians/u-boot-dm into next
2b28c3b871 Merge patch series "Modernize U-Boot shell"
64e47952f5 Merge branch 'next' of https://source.denx.de/u-boot/custodians/u-boot-riscv into next
7c4647b8fb Merge patch series "Complete decoupling of bootm logic from commands"
ced928b199 Merge branch '2023-12-21-assorted-updates-and-fixes' into next
ae797e022e Merge branch '2023-12-21-header-inclusion-cleanup' into next
36d3db6c2c Merge branch '2023-12-20-assorted-general-updates' into next
a0d0e132b3 Merge tag 'u-boot-imx-next-20231220' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
f7655af980 Merge tag 'u-boot-amlogic-next-20231220' of https://source.denx.de/u-boot/custodians/u-boot-amlogic into next
1f115bdeb8 Merge branch 'staging' of https://source.denx.de/u-boot/custodians/u-boot-tegra into next
936d0f9dd7 Merge patch series "Fix J7200 kernel boot when using upstream u-boot"
9cfef5fcfb Merge patch series "Add support for MediaTek MT8365 EVK Board"
298419ba4d Merge branch '2023-12-19-assorted-platform-updates' into next
a6f86132e3 Merge branch 'next' of https://source.denx.de/u-boot/custodians/u-boot-riscv into next
cd908ba186 Merge branch 'master' of https://source.denx.de/u-boot/custodians/u-boot-spi into next
1373ffde52 Merge tag 'v2024.01-rc5' into next
fdefb4e194 Merge tag 'efi-next-20231217' of https://source.denx.de/u-boot/custodians/u-boot-efi into next
8bb3cd7fe7 Merge tag 'clk-2024.01-next' of https://source.denx.de/u-boot/custodians/u-boot-clk into next
57e584d941 Merge branch '2023-12-15-assorted-TI-platform-updates' into next
c936ef7870 Merge tag 'u-boot-stm32-20231215' of https://source.denx.de/u-boot/custodians/u-boot-stm into next
d7a2c7ff75 Merge patch series "bootm: Handle compressed arm64 images with bootm"
fa3f19aa56 Merge tag 'xilinx-for-v2024.04-rc1' of https://source.denx.de/u-boot/custodians/u-boot-microblaze into next
11e1cc7aae Merge tag 'u-boot-imx-next-20231214' of https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
86f623dcf8 Merge tag 'dm-next-13dec23' of https://gitlab.denx.de/u-boot/custodians/u-boot-dm into next
9565771076 Merge patch series "bootm: Refactoring to reduce reliance on CMDLINE (part A)"
bfe3c7b93b Merge patch series "some LED patches"
e54987d6af Merge patch series "cmd: bdinfo: Optionally use getopt and implement bdinfo -a"
d379150621 Merge tag 'v2024.01-rc4' into next
4a363dd516 Merge branch 'staging' of https://source.denx.de/u-boot/custodians/u-boot-tegra into next
6357cf0cc4 Merge branch '2023-11-29-assorted-platform-updates' into next
339d96822e Merge patch series "cmd: add scmi command"
e2a9edc0ce Merge patch series "fs: fat: calculate FAT type based on cluster count"
38cc6cdeb1 Merge patch series "Import "string" I/O functions from Linux"
66c21738fd Merge patch series "sysinfo: Expand sysinfo with some more banner information"
d6e052c615 Merge patch series "ufs: Add a PCI UFS controller support"
129d6a0d87 Merge tag 'u-boot-dfu-next-20231124' of https://source.denx.de/u-boot/custodians/u-boot-dfu into next
1682d97db9 Merge branch '2023-11-25-assorted-platform-updates' into next
054222eb68 Merge branch '2023-11-22-TI-K3-cleanups' into next
0744fef6a3 Merge tag 'tpm-next-22112023' of https://source.denx.de/u-boot/custodians/u-boot-tpm into next
dca7a8958f Merge tag 'v2024.01-rc3' into next
9e4b42267e Merge tag 'efi-next-18112023' of https://source.denx.de/u-boot/custodians/u-boot-tpm into next
ae7ec8b0be Merge branch '2023-11-16-assorted-updates' into next
6c1608b1ff Merge patch series "spl: Use common function for loading/parsing images"
5e6a112e11 Merge patch series "nand: Add sandbox tests"
be0724601a Merge tag 'u-boot-stm32-20231113' of https://source.denx.de/u-boot/custodians/u-boot-stm into next
3b6db6901f Merge branch '2023-11-10-improve-semihosting-armv6' into next
1e4d9dd871 Merge branch '2023-11-07-assorted-big-cleanups' into next

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0af..ca5357392a5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.04.bb
-- 
2.43.2


