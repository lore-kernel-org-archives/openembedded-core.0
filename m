Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECEFD1D860
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35376.1764822637426671718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZPz+wrE;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88051279e87so4526156d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822636; x=1765427436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8USys7OcsCbaHvEJ7NZKYQgIl4xC0Aa326dCExLxvFI=;
        b=SZPz+wrE4aZ46MotkTlP2PgGnT6Pt7y3aqA1sfpGAxtByL7mAR+LTnQT1Gh2N1YCeE
         eT3wYHWsKLktQgyhaP8WV2aHCsai0/iti4SftZ72YpRzXHdIZl4ZNwiuATNKvC/oQLOc
         zFdtEeMIlHRhPWVInk3vHk7fsgfWejhDaLle3wcSS7gzsFbpzAALdCYp0hZt3Efbq6nM
         rVKxP6QEcGNpZ13uKd1dy5g2wT4mU0RGpMoYbjT05N8nVuXqB42aYc31m9CTb8yMnRzV
         vhIrE8MTBPqVkikFA66bonwMgOsZIA79Rp9NWZFuH0HqM0a65jNp7TiUgZ4q8SLO8NWP
         x4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822636; x=1765427436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8USys7OcsCbaHvEJ7NZKYQgIl4xC0Aa326dCExLxvFI=;
        b=rrbuiuxcot3GcXiNhM9K6xHxrrvrgF+/dQDe+/TcVMse68i1V/0/QIAa+tz8fYlpOn
         kvvgwDCTQRY5hFRWuzCAmmKOJNOzMaFauKO8Kw2dyF3fvNfgTGoFa8OWFDdxFuhRczgZ
         8XlmEZISr5PS57nhWlajnLUKPOoERs0kSwr5mSQ3TvXzkq4uhR9UGJCfvmAogQHLjqSi
         C4b28R7x9rf6hDBnJc+WVEHFGTQfYs+Or+mrq0Cjla7WGm90mGyCFRlG5N33clYn7maR
         MXF7AL0/E/0dR80CFWCsgkieE483048NuVi+38Ln3NJxNr/Bf74da58mmACnAOW+bdUU
         dpKg==
X-Gm-Message-State: AOJu0YwR80kSLnNBYGzB5RhYLKIB8K8c+w5b3dPYd/cmRoMn4GQ5SFub
	BooMuLSBUwyz8NxB73geJllvUZUg5scs+ieLL0+wRauTtLmhBXiefJOW8qrWpSzx/J8=
X-Gm-Gg: ASbGncuanoX6/2pPKcKVXPfrNs3PebMKwOD7JKWUWhsoQnjOVkA9F2cdA4XOh5+l+WL
	qMHgPgfKvB8426GtQgFDoi5Sb6IqWorbVfzU6NRU77vunVaO5bZQJrrup973A4ymvnc2xSwk+p7
	dGduQFH3/gXPJ7YRy6BuN/l59kac80HznM43dTwTKecQSiaJ5B0r4FS9DRqXBovPxBTkl7cDr2I
	1yITAHqPexF7dwwG8wbq1ivZM9eYrSlXs4M/d6x/9jzmuMEeK/9Rbek5rHRrz/jIFnaN9MABMMC
	dB+MNtSvKfgBV+8MjC0oRWvJ9Mo1VbX0iqg8GWIYKe1vfhMHJHNct+JLZmwuvmgGNX1Z75M89ro
	iNHDCbEP3h+x5glCKDChu7YBaPwk64YPGAYrp74CoZgr0zsNmKSqwzDbsKF+deGO95zbTBW9oiv
	prnzSQJ9l9fevmusylau+1Rxy4auQEShhnMEAQJ4yefqNnwI9QYivG36RJFuH8V7FOoeyq7hy54
	R47VdMHtb8PTdgWX181UuO3ng==
X-Google-Smtp-Source: AGHT+IHcumUpkx9OyaoTjLxxt8M4Ie/TXJbsD8gwOBakB+YjK18iXkzBM0gqroFkDMY4WpZ1Rge2Rw==
X-Received: by 2002:ad4:4eac:0:b0:71a:e4c5:72c7 with SMTP id 6a1803df08f44-888194b997fmr71159426d6.7.1764822636317;
        Wed, 03 Dec 2025 20:30:36 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:35 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/16] linux-yocto/6.17: generic64arm configuration updates
Date: Wed,  3 Dec 2025 23:30:16 -0500
Message-Id: <b2de282512cb28639f1573aeb30b935904dd8c9d.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227255

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: multitouch.scc: add feature
    Date: Wed, 12 Nov 2025 14:15:48 +0200

    For multitouch capable devices. Should not be
    needed for early boot so building as modules.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.scc: enable multitouch support
    Date: Wed, 12 Nov 2025 14:15:49 +0200

    For user input if supported by devices.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: hid-i2c.scc: add feature
    Date: Wed, 12 Nov 2025 14:15:50 +0200

    For I2C based HID input devices. Should not be needed
    for early boot so using modules.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

4/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.scc: enable I2C HID support
    Date: Wed, 12 Nov 2025 14:15:51 +0200

    For devices which support this.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

5/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: more USB HW support
    Date: Wed, 12 Nov 2025 14:15:52 +0200

    Enabled Cadence, TI, NXP etc drivers.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

6/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: usb-configfs.scc: add feature
    Date: Wed, 12 Nov 2025 14:15:53 +0200

    For USB gadget configfs support. Enabling same features
    as kernel.org arm64 defconfig. Enabling as modules
    since this feature should not be needed for mounting
    rootfs.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

7/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.scc: enable USB gadget configfs
    Date: Wed, 12 Nov 2025 14:15:54 +0200

    Same features as upstream kernel.org arm64 defconfig.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

8/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable more TYPEC support
    Date: Wed, 12 Nov 2025 14:15:55 +0200

    For Richtek, Mediatek, Maxim and Qualcomm devices.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

9/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: ufs.scc: add feature
    Date: Wed, 12 Nov 2025 14:15:56 +0200

    For Universal Flash Storage. Using modules since
    this is likely not needed for rootfs without an
    initrd.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

10/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.scc: enable UFS support
    Date: Wed, 12 Nov 2025 14:15:57 +0200

    And drivers for a number of chips/vendors.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

11/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: leds.cfg: module option for class and multicolor support
    Date: Wed, 12 Nov 2025 14:15:58 +0200

    Enable multicolor support. Then mark all class drivers
    available as modules if configured with override.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

12/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: more LEDS support
    Date: Wed, 12 Nov 2025 14:15:59 +0200

    For TI, NXP, Qualcomm etc.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

13/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64-mmc.cfg: enable MMC_DW_K3
    Date: Wed, 12 Nov 2025 14:16:00 +0200

    For TI K3 based devices.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

14/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64-serial.cfg: build Renesas serial driver into kernel
    Date: Wed, 12 Nov 2025 14:16:01 +0200

    Kernel serial logging does not work if driver is built as module.

    Suggested-by: John Vincent <john.vincent.xa@bp.renesas.com>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

15/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: more USB support
    Date: Wed, 12 Nov 2025 14:16:02 +0200

    For Renesas, Samsung etc.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

16/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable Renesas DMA engines
    Date: Wed, 12 Nov 2025 14:16:03 +0200

    For Renesas SMARC EVK based on r9a07g044l2 and similar boards.

    Suggested-by: John Vincent <john.vincent.xa@bp.renesas.com>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

17/17 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: enable more SPMI support
    Date: Wed, 12 Nov 2025 14:16:04 +0200

    For Apple, Hisilicon, Qualcomm, MediaTek HW.

    Follow-up to these MTK support changes in ACS,
    as reported by Anton.Antonov@arm.com

    Link: https://github.com/ARM-software/arm-systemready/pull/466

    Reported-by: Anton.Antonov@arm.com
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.17.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 90241488236..736e847f1b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "ec65f0ddf93e8dd3499482d166725c8548f6af65"
-SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
+SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index c5c15540520..bba067e8062 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e92d9fd0cb4a691ad487797d96fa2706e5c75626"
-SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
+SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index db63abb3ccb..4cf8b87b655 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
 SRCREV_machine:qemux86-64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_meta ?= "d54d08a25356729340a413253c738b8a0d6c4da5"
+SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


