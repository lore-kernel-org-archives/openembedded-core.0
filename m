Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6634CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 05:08:37 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.10013.1757480910254725216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 22:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=davqNpXT;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b34a3a6f64so50301781cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 22:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757480909; x=1758085709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWYPOCNjvAKMq+NUEgfaToAeAS3F3FA/KfTv03fWQBg=;
        b=davqNpXToohmkFjz695sCkjDkq3dkFXmBZ9s7Z/JsqL0Qzy9pHo3oqH039hPRTBqA1
         uQvgvNfd3JdLHJmP1yOFrkBSML7c357ohy0nGG5X1V2l9j/6n5CkX3l4dmh3l9K7vTv2
         6YpO6xJySR3H6F1ifOTrzi4nbCckMkG89htHYDg7QCuyWmB0/V/EXgXqLMTOzKuqJ2wx
         r5+p+9plu6IDMMLSM+96fV9bD9C52AjxJqa6wyqLAlal5XI63+pbKHIN87z09B6qXKHa
         g+QBF177zwO3kRE4sl6ImDr25Lyc+hq/0FDAnaVcuvlQhmpvJQMg6TrbBEgBQSMX0CWP
         gO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480909; x=1758085709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWYPOCNjvAKMq+NUEgfaToAeAS3F3FA/KfTv03fWQBg=;
        b=t0ZE5KuvZYrgtRduQhJ/T0ggQ5vVaAm2MFnK2xLfPNOjxJDVT7cO8P8XgWv2NflUA5
         K4DNAA0wu4qkCZ2mFcx9AdIPJwpyeEBqJ/601mOzsqIvfzi97Dw9dLGEcojPVlxa1uSx
         AraqAn1s1iWArIKNlNsHZLb7KqoPrYUL+8WO+hq7XUJSfuJF5AMsuh7lXZ1Bqv5243vz
         d4eb1I/W5VRf5UvtCoX05OCLMfS74PMgNeni8PJ3XQfHvZ/hh4pYHxpRWVc6hBGiIken
         s7gep6bNf4TQtlpRh7Y1oxbZhrjBFh4WjbX/joG6exlZRqlV9piB1mHKMpLtnqT1Mxl5
         dagw==
X-Gm-Message-State: AOJu0Yz3k17EjSoKuU/INTjIB4Tqk/rtzztCt3ANlToZgq5bdOVe/W87
	aHTEx1pZj8DU2sNDMGJ30QqmH2wjhR1NSD/PXWLxnOJILwMQCmBz624n
X-Gm-Gg: ASbGnctckgy5JZjeaKgzjVvVcLiKSxL3GeEtcYY6blTaoy3jTiB8M5+VYEZrQtxjXDj
	c+DGZCSC+MR1cx9QZPCQZtqggdXjr/bs5U66QZkOWfPtETv9GI36Up+tDoJw2HFylFmeK/HdgKT
	LnlyWKdM5SIpun7rGi7l9yqZqHPziJRPBw6pJf+GTBZCVaFU7NfonLTEvhdBBhEfBRgLnzp7II+
	9QGQXcAyb8oQtPmL3bo96Ges8WLMOp/LSOUpOAhHX9GUbgFU/PmsL92vhMjsbf71FK4rZfXSGAr
	XJUGrHT0L5gzmw9CVhJClDWLn7bYMtaaidIqlK38fXHYnNXiwH0Mdpf3XMdX4+E79I9HTcfXbLB
	vYfX5ygG/R4iCX1j5rsOUDNOVWXaNJ6SM9Q6XeWekMFAdCpd3wVlKAxcniMw80HZwA8/zyX6ESo
	oZxBlCEuMbaqVWtV+9NpYbltkBv4jfi7mUd/p66Iz7Rt87Nzet3iFiDtcJrqxhv6Zhkg==
X-Google-Smtp-Source: AGHT+IHHCXAZVN/jC6VYnV3tvX72/EcyYm4eJwKGHtwiUKLOdPr6fa2+HfT8YctLS7GakRNf9kab+g==
X-Received: by 2002:a05:622a:50a:b0:4b4:56a6:42b5 with SMTP id d75a77b69052e-4b5f844742emr156578781cf.41.1757480909081;
        Tue, 09 Sep 2025 22:08:29 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed72c49sm227866685a.51.2025.09.09.22.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:08:28 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com,
	mikko.rapeli@linaro.org
Subject: [PATCH 4/4] linux-yocto/6.16: genericarm64 config
Date: Wed, 10 Sep 2025 01:08:22 -0400
Message-Id: <20250910050822.3273330-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223146

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: Revert "serial: 8250: unexport serial8250_rpm_*() functions"
    Date: Tue, 9 Sep 2025 22:22:53 -0400

    1/2 [
        Author: Mikko Rapeli
        Email: mikko.rapeli@linaro.org
        Subject: Revert "serial: 8250: unexport serial8250_rpm_*() functions"
        Date: Thu, 28 Aug 2025 09:33:16 +0300

        This reverts commit 7ba4f02e12e6f2409c5b2afae2963089b5673482.
        Needed by revert of 8700a7ea5519fb0b3bad2362adfeac358c2119ce
        which causes kernel hangs when starting getty's on BeaglePlay.

        [ YOCTO #15704 ]
        https://bugzilla.yoctoproject.org/show_bug.cgi?id=15704

        Upstream-Status: Inappropriate

        Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
    ]

    2/2 [
        Author: Ross Burton
        Email: ross.burton@arm.com
        Subject: Revert "serial: 8250_omap: Drop pm_runtime_irq_safe()"
        Date: Thu, 28 Aug 2025 09:33:17 +0300

        This reverts commit 8700a7ea5519fb0b3bad2362adfeac358c2119ce.

        The genericarm64 machine sets SERIAL_CONSOLES to a number of potential
        devices:

        SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;ttyS1 115200;ttyS2"

        With sysvinit this turns into getty lines in inittab, and with systemd
        the systemd-serialgetty recipe creates explicit units to spawn gettys.

        This worked fine with 6.6, but since "serial: 8250_omap: Drop
        pm_runtime_irq_safe()"[1] in 6.7 onwards we see kernel hangs:

        BUG: scheduling while atomic: getty/957/0x00000002
        Call trace:
        dump_stack+0x1c/0x30
        __schedule_bug+0x60/0x90
        __schedule+0x83c/0xcf8
        schedule+0x40/0x158
        schedule_timeout+0xb0/0x1b0
        wait_for_completion_timeout+0x84/0x188
        ti_sci_set_device_state+0x134/0x220
        ti_sci_cmd_get_device_exclusive+0x24/0x40
        ti_sci_pd_power_on+0x34/0x68 [ti_sci_pm_domains]
        _genpd_power_on+0xa4/0x178
        genpd_power_on+0xb4/0x190
        genpd_runtime_resume+0xc8/0x260
        __rpm_callback+0x54/0x200
        rpm_callback+0x78/0x90
        rpm_resume+0x420/0x690
        __pm_runtime_resume+0x5c/0xb0
        omap8250_set_mctrl+0x38/0xe0 [8250_omap]
        serial8250_set_mctrl+0x2c/0x60
        uart_update_mctrl+0x98/0x120
        uart_shutdown+0x124/0x180
        uart_hangup+0x7c/0x180
        __tty_hangup.part.0+0x408/0x440
        tty_vhangup_session+0x24/0x40
        disassociate_ctty.part.0+0x48/0x1b0
        disassociate_ctty+0x30/0x48
        (full backtrace elided)

        With many thanks to TI, my understanding is that it was determined that
        the problem here is that we have a getty connected to ttyS1 which is
        actually the expansion port uart and on the BeaglePlay wired up to the
        wifi controller's debug port. The getty receives noise it doesn't know
        what to do with, and at some point the power management code does a
        suspend/result cycle of the device.  The serial drivers assume that
        child nodes use the serdev driver and they manage runtime_pm, but the
        getty opening the tty breaks a series of bad assumptions in the drivers.

        So, there are two bugs:
        1) The kernel shouldn't crash if this tty is opened
        2) The only serial port for a console on the BeaglePlay is ttyS2,
           despite others existing.

        TI are looking at (1) and other patches to follow will deal with (2).
        Until one of these is resolved entirely, reverting this change to power
        management stops the crashes.

        [ YOCTO #15704 ]
        https://bugzilla.yoctoproject.org/show_bug.cgi?id=15704

        [1] linux 8700a7ea5519fb0b3bad2362adfeac358c2119ce

        Upstream-Status: Inappropriate

        Signed-off-by: Ross Burton <ross.burton@arm.com>
        Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
        Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
    ]

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64: temporarily use a branch
    Date: Tue, 9 Sep 2025 22:23:13 -0400

    There are two reverts needed for genericarm64 serial that we
    don't want to have on the common branches. So for now, we create
    a BSP branch to hold those reverts.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64.cfg: fix warnings from v6.16.2 kernel
    Date: Wed, 27 Aug 2025 13:08:52 +0300

    New kernel version has changed config dependencies and
    these need to be enabled explicitly. Fixes multiple
    do_kernel_configcheck warnings about ineffective configs.
    Tested kernel boot and oeqa runtime tests on arm64 build
    machine with qemu and qemu kvm and on AMD KV260

    https://ledge.validation.linaro.org/scheduler/job/119012

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 1d44936da4..7725bcf20b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
-SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
+SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 8764c21490..befced7a98 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
+SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 4bf5fa53c5..2ea54a5301 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
+SRCREV_meta ?= "5b4b90bbad3ada455c7c124bf704c519c6013aa1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


