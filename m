Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web08.8349.1620831562626102154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s54hQT1t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso20817972otm.4
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wsi0npPKR03JG7WyL2XFMda9Cl19ALbZSHG1pFygGAs=;
        b=s54hQT1tyf6H4rmE2YukzBu6vcubgZrzHaXO3m6bvLM4rva8Nk4PAhFOBszCYkuY+A
         gJOgqiC7qQm9uAWjepziz/qHbX0EhOGsd8KfTdS/R67P+2eTUrY5irrWGCzjsZshtUb9
         z+Tw7dqq41WRwekDdM47fTkvVkP9Ig+NYtHvJGBrL69ucKR7Y/2iSz7yfgv96hW5phqt
         Wk8QIipfSPmicmteNGQHydxZ3qIrOmtLxgvXAomaOSb9RIZGsVJNiNVAGmQv4b2A1NqC
         eVtN3hXqzwlT9zasytHbjNNh99X6BHaIXZSk7IQcXRDafPnzuZpLW1Vf1WpYdIE+/w9d
         0t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsi0npPKR03JG7WyL2XFMda9Cl19ALbZSHG1pFygGAs=;
        b=b2yi/Cn+B78Sb0EN6BUVWjNOwyEzIjVkbQd58NJHIYS/bPiTaOtLPEVox5QI8QaPXN
         GvdoDSkdvKic7TmAr/cxDUKOhPCRB6hZdJOGmw+4kdU3gA1UNlz+n/nh8mJjFs8HC9zG
         /glGB8Na69P87IBhG4YuljxsT8Nj1VlMn/QTTM9t72KrrnIlUJ+o2hRQvCC0lwRFcUER
         +MQV9Di+siBTn8RV1zq01SJRjBfXqAUD/GAfGx14U5IhH1YPGjcUCJGU6vyAl8NacQt0
         SrkVE6xa/mFGQS0Vhi0vBCJ/7NcxoPhQntoPyk66RuwdFtJiEfuSuTjWqEKdh3V53nAq
         10cw==
X-Gm-Message-State: AOAM531rqPLQ8WBajRHsQ10k+lkRIIdimURBvTJYEi5q9dBbylY12IyC
	LGpjpK6/KOSY60IMvSlVevQr76uXces5AhypNcw=
X-Google-Smtp-Source: ABdhPJxyEZ6K6hncxtXbHG6sW8/WgvRr3cphF7stNMhFbekb8bzc/jr9G3/H8GE9dMh5ORXQlbeAYA==
X-Received: by 2002:a05:6830:1dba:: with SMTP id z26mr10091270oti.133.1620831561508;
        Wed, 12 May 2021 07:59:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/22] linux-yocto/5.4: qemuppc32: reduce serial shutdown issues
Date: Wed, 12 May 2021 04:56:59 -1000
Message-Id: <d2b0c5b25a90ea9b39b721152bda410ee6170722.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    qemuppc32: reduce serial issues seen on shutdown

    Richard reported:

    We've been seeing a lot of the qemuppc shutdown issue and I decided to
    look into it. The really worrying thing looking at the logs locally is the
    serial ports are showing irq issues and becoming disabled as nobody would
    handle them.

    Errors like:

       [    9.194886] irq 36: nobody cared (try booting with the "irqpoll" option)
       [    9.198712] CPU: 0 PID: 127 Comm: bootlogd Not tainted
       [    9.202283] Call Trace:
       [    9.205611] [d1005f00] [c00a0da8] __report_bad_irq+0x50/0x138 (unreliable)
       [    9.209347] [d1005f30] [c00a0cc0] note_interrupt+0x324/0x378
       [    9.212855] [d1005f70] [c009d138] handle_irq_event+0xe8/0x104
       [    9.216353] [d1005fa0] [c00a1d9c] handle_fasteoi_irq+0xc0/0x29c
       [    9.219960] [d1005fc0] [c009b798] generic_handle_irq+0x40/0x5c
       [    9.223496] [d1005fd0] [c00075d0] __do_irq+0x58/0x188
       [    9.226948] [d1005ff0] [c0010040] call_do_irq+0x20/0x38
       [    9.230391] [d29eda60] [c0007788] do_IRQ+0x88/0xfc
       [    9.233860] [d29eda90] [c0016454] ret_from_except+0x0/0x14
       [    9.237288] --- interrupt: 501 at __setup_irq+0x3c4/0x838
       [    9.237288]     LR = __setup_irq+0x790/0x838
       [    9.244155] [d29edb88] [c009f0a4] request_threaded_irq+0x114/0x1c8
       [    9.247672] [d29edbb8] [c07a5a18] pmz_startup+0x17c/0x32c
       [    9.251203] [d29edbd8] [c07a1140] uart_port_startup+0x184/0x2f8
       [    9.254651] [d29edc08] [c07a1974] uart_port_activate+0x78/0xf4
       [    9.258141] [d29edc28] [c07839f8] tty_port_open+0xd4/0x170
       [    9.261579] [d29edc58] [c079db74] uart_open+0x2c/0x48
       [    9.265116] [d29edc68] [c077a288] tty_open+0x168/0x640
       [    9.268574] [d29edcd8] [c0280be8] chrdev_open+0x138/0x2a4
       [    9.272123] [d29edd18] [c027421c] do_dentry_open+0x228/0x410
       [    9.275643] [d29edd48] [c028e9f4] path_openat+0xb04/0xf28
       [    9.279184] [d29eddd8] [c02917e4] do_filp_open+0x120/0x164
       [    9.282535] [d29ede98] [c0276238] do_sys_openat2+0xd8/0x19c
       [    9.285790] [d29edee8] [c0276574] sys_openat+0x88/0xdc
       [    9.289096] [d29edf38] [c00160d8] ret_from_syscall+0x0/0x34
       [    9.292620] --- interrupt: c01 at 0xfec3738
       [    9.292620]     LR = 0xfec36e0
       [    9.299035] handlers:
       [    9.302312] [<7f7f7da8>] pmz_interrupt
       [    9.305541] Disabling IRQ #36

    (and the irqpoll option does not help)

    This is problematic as the shutdown test uses the serial interface to
    shut down the system. If the serial interface fails to login or run the command,
    game over for the test.

    CONFIG_SERIAL_PMACZILOG_CONSOLE complicates that handling, but doesn't provide
    any output or capabilities that we need. So we disable it here, and
    reduce the chances of issues during shutdown.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42355cb73049ee7a4af0f539a2a5b7d4ee1abc65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 79aff31770..c2d0458073 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b62ae8bedb024e67e7c5cda51840454a4170c858"
-SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
+SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e3750dd7f1..1c3fe73ae5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "80bd6016a9bdaed4b66ddffffa8c8e62d7c1f8a6"
 SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
+SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f2f0ac0b56..094427cb02 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
 SRCREV_machine_qemux86-64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
 SRCREV_machine_qemumips64 ?= "b36d79d6f2aaf9dadec352f611e7b9becf2b9a55"
 SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_meta ?= "cf20a3c44f5ef181b16ed80e9c2683f76b1ead20"
+SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.25.1

