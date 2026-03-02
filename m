Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89FDD58E57
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:55:51 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153571.1772427349029162796
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ul3uscju;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c9f6b78ca4so547639585a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427348; x=1773032148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2o9wmtAB2YRGTlN3TqL3p9IbSmmEEn5T/0kPPIOlSY=;
        b=Ul3uscjub0Us63ac1R5+XHK6YzTZWhgMGQiXqaGxvz3jyNbKY3VvcGOVtwYuiKJzAL
         QEiJ0Nnk/w9TCIoUdr0bXWVE8QWtaegYl4+2q8cqTWFQREYZeCO3CVbOr9CFAk4XtfU/
         hRY9xoMvAnwO4WqjYx0zJWiQTtvZtox8hICuwDT0/HD50jsUSny281Fc60eQVdJq8VUy
         Fq8pk4WOCd8QHYEB6ChDVZQNfRFQiOX/VeDaVDI4kl9cejoyI2+DjqWZO4RaXhH/ufhY
         GpQI9uOEad2/cJhlYWpZmW4a0OavvYGQcG0gQ+ocuh9Mlgv1QQ7oMOMz7Ixqlj/IdL2z
         Wpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427348; x=1773032148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2o9wmtAB2YRGTlN3TqL3p9IbSmmEEn5T/0kPPIOlSY=;
        b=VJJ1i1xYnwIjSJytZ2Bn7X99N57uQ+ykyqSmBa62qMCe/gzgc80/pLPhZklOKMB47w
         goFKAUp1LZSR0v8LWaM2P4Acmx+f0zYV7QeHm+RNnBmZaEnvj/X5FKwK7E9GM0bsjelo
         9f2kQbqw/E1m6+dmXKFvFnSudUJqzThbz4XgwMu0ghqxwm4eInBskERqhB6AiOxA60Z2
         kNaVY5JNSirYAgLp1b5Lqpq1bHKjJvYp7qlOJKdfSiDfLX7et+qs4L2TGZ3/0EPDGYE9
         S8hXS2J08dXTayTrzfttxCKqnF7kJ2pQJPnY/Zfx+mYPYykwr0wEGulOl67fsa0fRnFO
         MbqA==
X-Gm-Message-State: AOJu0Yx52ChsixjZ23uth4Yp6pkkLLPfuoWOK82kFxRUy1Os3c0QN4hx
	O88b5dyqD0DjvD1eh7NQfSJbbR1NCxMnLNeI08Zbw/mYb44HnRGtK5nt
X-Gm-Gg: ATEYQzxqU7SM4izK/8hEV2PkeZ443Ss5CTEemJE0cjVmPVjdiS0opXeJcACgcghGa4L
	L3GI8uRoOPbWKduFNrwn2JX6IDQg5XWUXQUqpLkwnio6x+prjfq83mohPRcJBXEjFBTTC1AhRiN
	YFeDKVDDZK10AXohClpFiMiiOzcMpNnDcyzcZ0LeKZ+fvrcEurne+8gbkJHCyjyYYE/ZyUEHOkx
	/ZhZycWGCWaVY5a4WVsTmlHaCDrm6pE8KgVY62MSlSzA9P8dIEV00qSdb5rokNQgCxEgyz2eieO
	Noq1s4MamUOoTouVRO3FUqgTLzKGxd0wKZjUJ2/Xl4jIs4bUbLSiND1Aud5qbw0hDVsPdjunZxl
	e8Yx76BnEyn9FLfdwk3tbVgdemXOaUcZlLTdAFkbgmAgDsImRN2QofMii8mXLMxwp2G8fjJco5p
	s2E6BQH9Z+W+NWA/Kll2a0edAxvww/g38sK2hlvfxeRxK+60gCw6PjbwhCWRaowFf5U1zKKwYWS
	4kozKz9kvZXQiIFnBWW1fv4zyXuB102AH3HmOZ/L530THCGHnziDnwEpoE=
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cbc8e4fc12mr1333159785a.39.1772427347925;
        Sun, 01 Mar 2026 20:55:47 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/10] linux-yocto/6.16: genericarm64: feature splits and enablement
Date: Sun,  1 Mar 2026 23:55:31 -0500
Message-ID: <20260302045537.2153587-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232165

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    98a36302 cfgs/nfc: create an intel-nfc-vendor specific feature
    6350b56a netfilter.cfg: enable NF_CONNTRACK_SNMP
    a425fdd0 pmem.cfg: enable DEV_DAX and DEV_DAX_HMEM
    70eeaeff genericarm64.scc: enable TRANSPARENT_HUGEPAGE support
    d62a1267 security-arm64.cfg: rename CFI_CLANG to CFI
    b925ef94 security-arm64.cfg: correctly enable KASAN
    1fdb98a4 security-arm64.cfg: add comment for ARM64_BTI_KERNEL
    6d8bf6f0 security.cfg: move RANDOMIZE_MEMORY to x86_64
    18fcb6dc arm.scc: move ARM_CPUIDLE to arm only
    7e1d9b2b numa_x86_64.scc: move x86_64 config from numa.cfg to numa_x86_64.cfg
    e93e999e sound.cfg: split SND_SOC_WM8731 to I2C and SPI variants
    5a567776 sound_x86.scc: take over x86 configs from sound.scc
    1ae7ce94 genericarm64.cfg: enable MTD NAND ECC support
    15d48f71 genericarm64.cfg: enable TI MTD NAND support
    40a67254 genericarm64-serial.cfg: set SERIAL_8250_CONSOLE to y
    5ee6148e qemu-kvm.cfg: remove extra space
    9f780417 firmware.cfg: whitespace fixes
    bc221187 genericarm64.cfg: fix CONFIG_PM_DEVFREQ_EVENT
    aef69bf3 Revert "genericarm64.scc: enable OP-TEE support"
    6f597e1a genericarm64.cfg: enable SCSI support for HiSilicon etc
    f1f313cf genericarm64.scc: enable RPMB support
    a4565911 genericarm64.scc: enable GNSS support
    391566e2 gnss.scc: add feature
    d40a455d genericarm64.cfg: enable more bus drivers
    20e41104 genericarm64.cfg: enable PCI_PASID support
    0b2967f5 genericarm64.scc: enable NFC support
    2643b37e nfc-vendor.scc: move Intel configs to nfc-vendor-intel.cfg
    b1d00b01 genericarm64.scc: enable RFKILL LED, INPUT and GPIO
    92610953 rfkill-extra.scc: add fragment for RFKILL LEDs, input and GPIO support
    fc7d5f45 bluetooth.cfg: enable BT_LEDS support
    f18ec272 genericarm64.scc: enable HSR
    79fa2c17 hsr.scc: add feature for High-availability Seamless Redundancy (HSR & PRP)
    1313923a genericarm64.scc: enable Time Sensitive Networking
    e190eeff intel-x86.scc: enable hibernation with feature
    c941f4ee genericarm64.scc: enable hibernation support
    ce5c6d9d hibernation.scc: add feature
    83620a7d bluetooth-usb.cfg: enable MediaTek and RealTek support
    cf6e1261 bluetooth-hw.cfg: enable BT_MTK
    ffdd0769 genericarm64.cfg: enable Microchip PHY support

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 669729f46e..33621d9e9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "bf970b6498c3d3e3f8b8a718741e9f98ccaf84f5"
-SRCREV_meta ?= "8e6a09c7a858e7dd1c1120b3838fe463a273a1b5"
+SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index c5393eca68..a5d02e7726 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_meta ?= "8e6a09c7a858e7dd1c1120b3838fe463a273a1b5"
+SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 0ecb64ca0c..cbc98a1a2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "057e0bf6446ead5535717da84b234c64615458db"
 SRCREV_machine:qemux86-64 ?= "057e0bf6446ead5535717da84b234c64615458db"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "057e0bf6446ead5535717da84b234c64615458db"
-SRCREV_meta ?= "8e6a09c7a858e7dd1c1120b3838fe463a273a1b5"
+SRCREV_meta ?= "a4cdc750c7d35e6bd55393c1690b7135a04be250"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


