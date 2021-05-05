Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.358.1620237504484505964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 10:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n2TGiKKs;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id w9so1662328qvi.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fik9d4yvnoKKOnA2pfQrzRTA/6S4TrU7VVH14J0vLI=;
        b=n2TGiKKsm5frJd+vfJrOJZ9IAY9jfYw2Q3GlT98P5RbYI1fQZIH8CqHnjcgqe2YCLm
         GTd6eRDmwvHuQr9WU77LD3TXmuMfriEncuwKouRYXmrfqINoKRMFYMsgoOL1tRqL4drr
         QqnaG8FRRK6W4TLqpcUFP7tMRlG2B+vyCvjaBNAO5zUnqmaEIz4uQuoeSqf942x/0Myi
         KdcQycf6SjwbW4fC82nK0xEdQWGLoejlrpAky+ZpYQncXEmhKrcOzRdHUOvxLzAMpoC9
         lGNrZGUcw6ezALpj561fedUrx5xcZVfge/aZ59ukc7FSxz6JTLGeWgZGzkO1syh8hOT4
         m01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fik9d4yvnoKKOnA2pfQrzRTA/6S4TrU7VVH14J0vLI=;
        b=mcI/WkuSR00ckijJHTMQvb7vq0HTm8h/8Dn8rNayAdA2gcy2q0w+rCRZ4tclGd8N68
         N6TKHYPbonUvkiRz+hY8/dC+k2KdPNGzJ9aCuiaJDacOigcShcGYa+UdcB4au2D0LJUN
         rB/ldjbo9+C5VjNpj5jR3HJi9U1SJiV5QkcoLHb/c4erRSdwTLXJ07xbbJbUdwYwH+tk
         Es2vkYE5MtjwROxEcWFN3siKaeq3sh8JLMZ5SDkE+njwi/K+FbDTqpcrQKPmfCsJKQgk
         GL9g5tD3gvhsOK/x+iDryOP4ySjwiSPZyKpTAvuFFX0K2fuXnPwknECw+s+KGhBBq3SU
         MejA==
X-Gm-Message-State: AOAM5320tlR0BM43eX732rar4YzLvUGf39Xiv9MFN+8TnSwhEmwgbKLH
	igYpDGLm6Jsm4PVmdKpXvNs=
X-Google-Smtp-Source: ABdhPJwBFxrX13G9dqjD8WSVJ1WuaWfIDeG6coZmwS+NwoGeYk9evTf4qsKXPiv6DS0UxkcaSQUZMg==
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr87366qvs.55.1620237503640;
        Wed, 05 May 2021 10:58:23 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u9sm5574172qtf.76.2021.05.05.10.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 10:58:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
Date: Wed,  5 May 2021 13:58:21 -0400
Message-Id: <20210505175821.39714-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    qemuppc32: reduce serial issues seen on shutdown

    Richard reported:

    We've been seeing a lot of the qemuppc shutdown issue and I decided to
    look into it. The really worrying thing looking at the logs locally is the
    serial ports are showing irq issues and becoming disabled as nobody would
    handle them.

    Errors like:

       [    9.194886] irq 36: nobody cared (try booting with the "irqpoll" option)
       [    9.198712] CPU: 0 PID: 127 Comm: bootlogd Not tainted 5.10.30-yocto-standard #1
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

    CONFIG_SERIAL_PMACZILOG complicates that handling, but doesn't provide
    any output or capabilities that we need. So we disable it here, and
    reduce the chances of issues during shutdown.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index bbac0d0336..d64772f697 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "400fbf5b14a0c88afb7c31d65be56fb9d6214c81"
-SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
+SRCREV_meta ?= "16df1d13c6486191812bf0ac8c61573a804ac45d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f08dc68a6e..b9dc14f8d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "bf33b78f5136873b6d2ec6274908cf688341bc9e"
 SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
+SRCREV_meta ?= "16df1d13c6486191812bf0ac8c61573a804ac45d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index d26f02283f..5fee041ea5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
 SRCREV_machine_qemux86-64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
 SRCREV_machine_qemumips64 ?= "bf264e264d2141a4fb61d515573c27935e67ecfa"
 SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
-SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
+SRCREV_meta ?= "16df1d13c6486191812bf0ac8c61573a804ac45d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

