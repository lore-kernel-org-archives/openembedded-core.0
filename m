Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0265CCD19E
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:09:04 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.4555.1760584139415263349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YaNG7DB6;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-796fe71deecso3840186d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584138; x=1761188938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR4QeZK/eQek5Lg19B/6AF36HWKG6OsX6w+cr4yg2WI=;
        b=YaNG7DB6GYhLGyjdwSTTLZ2PzHjQ0k67BeouJbWgtdiEB5wPhySk+cSAawJWD9FjRs
         hW6++4sMxHOOMTOFS1/hMCzacMbuiDukfz/vE98c+QafV7xJRsn81hdyp+x4bnoaACcW
         WT/+8R5PgxPaLv9p4CySDAVVaTklap9HUv18xVFrB/sIyS9kTF+jWTvjLbLZx7FmNj6q
         ZmbM+jBrYYus72xrgJIaJ4N9ZgNzYA24JxMzAT3qUMomzl8TnX1kFKoYw9dimGAhKCDu
         3SDAdErdZjdOFA3XZ1iLJ5SD0oWuL99t8CVQneL//E7pix0Xx7Otpyd8QrmwfUdS50Lz
         X9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584138; x=1761188938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR4QeZK/eQek5Lg19B/6AF36HWKG6OsX6w+cr4yg2WI=;
        b=P7q9u2jeXxyqfx3vnkjdKrHEXSX50ab3yvy1xdcl3+J1nGfbessxkspLLM++V1E1a+
         OuVbTEjG6gKlc0+6xYHxmZ/vtDbDDwa42+fJXDiNQEzEyDdm4/VOXAuv4zHFSccF2amw
         ZDeNt2imYkUD1n8OB9v9kQhfK2dvyd+VfZiMW9IlxT9FBxQCWIEwXfXVnfh0sVXUaboP
         SSC9j3wIrAk4myaEULmjXzLVuOIg5F/q5HIBoPPjUYJD/jylJkM3/+Fgw3RfKJD7vveJ
         w/+eCq6czzyglGnoR8QDmz7mIfQnFXTPcScN2JFEg05E/FosiUmy5Z+YZyHBMEGlQPY7
         ySkw==
X-Gm-Message-State: AOJu0YwuqfI7d5M0VjB5H2VrDZBKxj4ArJ0gWiHDvmLuWGLkfeJiH5Sp
	8ajZiFNNbCCQXr+1lyR9+lG5Yqil/5C6OxIclxuLSrgapUmz9R2kHcqdN4YytqseJgw=
X-Gm-Gg: ASbGnctC9EHk5ePA4uNRpnYcEfQb/4WtZSwRNROCDnByt8boDl3cfi6HWSI/FPt6KzJ
	yi+ADXqxzBjvW1YHL0tSiOf8227md6R4WsFl0WR732EvRfEAgpwUQRIEris79QpHc6d4d6Gn7zS
	ex7lHmTv/gaSmbbbwoKsaY+3cvUowpK2aleydHKJPnQox9Leo1VRc2O7h7mxMnoXh48QXZNrL6B
	5CwtPipmfDVjX0q2VsAi7EyLi4ZJzobBGc8FC2Nr9bm0bPHjFF0pn7I7czlimErDZcKAYVuFvUv
	BDF7PwOYke0XSS7IOTnxU37XwJvFu0MY3Hl1/ahh040frWlWaXeeKq6+rN1is1TA1IimsLQobKP
	hraRt2CZbdLHrK2z0KLNeAje8jQYt0YZ8ZLAFCCT4mzc47w0yE6k0gpvXnp2haJWtbcBkxBkB6E
	bPQXXMR3Z8JLxHVOivoxzZzpoU8YgKDtv9I8WggoCGQ6W61vQE/s1a68yTKXwNpDF1bCi6MYeC6
	AF6AKfA6mewzUk=
X-Google-Smtp-Source: AGHT+IFPcg6Gwae2iP8pUgfxwTWc7YTJ7hCsPpYErgwgOfB+0172IZTHAkEaPkjt/DFumLe40e/ITQ==
X-Received: by 2002:a05:6214:412:b0:815:7c28:99c3 with SMTP id 6a1803df08f44-87b21014db7mr399547696d6.9.1760584138214;
        Wed, 15 Oct 2025 20:08:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] linux-yocto/6.16: genericarm64: feature splits and enablement
Date: Wed, 15 Oct 2025 23:08:42 -0400
Message-Id: <d5ce29eec099450ee58496bb57f675f773554ee2.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224924

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    9e0a3e81 genericarm64.cfg: enable more power, reset drivers
    0293b84e genericarm64.cfg: enable MFD_KHADAS_MCU
    f9c89a33 genericarm64-regulator.cfg: enable more drivers
    01af8892 genericarm64.cfg: enable more IRQCHIP support
    96bf1e51 genericarm64.scc: enable USB serial support
    dc7502db genericarm64.cfg: improve SATA support
    e85415a3 genericarm64.cfg: improve input device support
    cb734447 genericarm64.cfg: enable more Hisilicon PCI drivers
    362c7b10 genericarm64.cfg: enable USB_CHIPIDEA_NPCM
    c9127be9 genericarm64.cfg: enable EXTCON_USBC_CROS_EC
    3836443f genericarm64.cfg: improve PHY support
    a25d50d8 genericarm64-clock.cfg: improve Qualcomm, Renesas etc clock driver support
    5e47e723 usb-net.cfg: add USB_LAN78XX
    e5be3915 genericarm64-clock.cfg: add more Renesas support
    8d1d61f1 genericarm64.cfg: improve Renesas pmdomain support
    89d463fc genericarm64.cfg: enable UACCE
    18251d7d genericarm64.cfg: more MTD CFI etc support
    070f72bc genericarm64.cfg: enable PCIe error reporting
    dfa6ca16 genericarm64.cfg: add more ethernet support
    5821cdf3 genericarm64.scc: add genericarm64-rtc.cfg and enable more HW support
    e9847838 genericarm64.cfg: enable Chrome OS platform drivers
    549b8af0 genericarm64.scc: enable Mellanox ethernet support
    5e172179 mellanox.scc: add network driver feature
    27eaec09 genericarm64.cfg: improve USB_DWC3 support
    c543148b genericarm64.cfg: improve TYPEC_MUX support
    62b093b3 genericarm64.scc: enable exFAT support
    360d572b cfg/fs/exfat.scc: add config feature
    8be64103 genericarm64.cfg: add more USB 3.0 and basic 2.0 support
    48e00648 genericarm64-arch.cfg: enable more Renesas support
    cef54e58 genericarm64.cfg: enable ARM_PSCI_FW support
    129993c7 genericarm64.cfg: enable more TPM and FFA support
    8cd8cb12 genericarm64.cfg: enable TCG_TIS as module
    be840fc8 genericarm64.cfg: enable ZYNQMP_FIRMWARE
    9f94acee genericarm64.cfg: enable COMMON_CLK_ZYNQMP
    10a0e7c7 genericarm64.cfg: enable DMI_SYSFS
    705cae9a genericarm64.scc: enable efi-test.scc
    08fd4f23 efi-test: add config fragment for EFI test interface
    98178196 genericarm64.cfg: enable ARM_PSCI_CPUIDLE_DOMAIN

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 9c1752d179..d1f7e76501 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c31e0cb82247b36842209614bb72af9127ef2471"
-SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
+SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index c0dbec8b29..ef904adad4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
-SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
+SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 81f37c8d8a..2188c7fed2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemux86-64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
-SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
+SRCREV_meta ?= "9e0a3e81b40db2b35e060ef001b3902a6a0996ac"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


