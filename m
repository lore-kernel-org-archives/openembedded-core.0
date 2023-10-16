Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3DACDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:12:00 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.120340.1697458316628522031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S+FzpibL;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-65b162328edso26404006d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697458316; x=1698063116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkIvTawOtQdWAi9Vv5mYaaRSct+XkmG7gNhoC0g0pBM=;
        b=S+FzpibLku/pZvVlpzCZk5kLe64kAQvrlhXaNUBghMnye+dyrsQTpyi/9Vjb6aSXxx
         dx6zF0gUF9msUnqcuit6kUOVwasXX6HTJZleyknqVEISexo2WRcI2V83ssmUwXgWsUKl
         Tl1he1ADTLOoOG+8NEez87IMNet4EpGgYuEdWmMkyEntLOD3fmmLXN+tH8YI+zuxGqJE
         0ThJTjo0oCoAHfaTDEU3xHyjcdnTaNETg7ye+72kMP0mzrRbDvsAEYhwGs9CNCw8G4v/
         PpFp4ij2/kyMM8Fy8arHz3udk0SbNts1bqVd4D+zLEr4ICSN6hDKcRi11cCNbMeSnGNk
         kHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697458316; x=1698063116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkIvTawOtQdWAi9Vv5mYaaRSct+XkmG7gNhoC0g0pBM=;
        b=Kx+Ceu4pgPMXw/lE+8qfu5GoUCMrvEdMmUsbMWfWoNvl7wYiuEVuCVhFA0X3x61QHX
         kUjSvGG2K8OjA89rP3b6D3GHgFQ0/Zhu3v0Yz3xGwT44ulT656AxW68QBv/cZPuMbSFS
         86vZWBxQJMbuoUgepeemDZx+osZGwG2oWf1PkOtOS8upAhC6iWH1lSDRlmXhfdxOA7Ve
         LeKnz4anB6rRMaXv/kek8YQgjxDkxJVk8NM5gF8/TKPk2tivZNkreq3FjvUUB9lwp2NV
         FeljNeJc1cziM4vWHknNJsqZMA2gNvUn7IwDd58Q5vXU3nEMIsI2BO2aea7qFRsAIMz4
         fsdw==
X-Gm-Message-State: AOJu0YyvrpGwNmSAt1iXQFzkDBg5yNcHv9oolZTwEPHh4EcV8O3gtfS9
	jj/peQUBwZ/wMpTDsNKJekU4dn+V58AG/Yy/
X-Google-Smtp-Source: AGHT+IHNdRk5DHiwy6rCZTzJLb32v50LAs2vMzZVptqk7+px2N42I45FNCFDF4PGoKENjnh6unYL6g==
X-Received: by 2002:a05:6214:5585:b0:65a:f55e:5a77 with SMTP id mi5-20020a056214558500b0065af55e5a77mr35004971qvb.34.1697458315556;
        Mon, 16 Oct 2023 05:11:55 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bt15-20020ad455cf000000b0065b2f4dd300sm3379345qvb.90.2023.10.16.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:11:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.5: avoid serial port suspend issues
Date: Mon, 16 Oct 2023 08:11:53 -0400
Message-Id: <20231016121153.1687583-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189289

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is the integration of a workaround patch to avoid the serial
tx issues we are seeing on AB testing with the 6.5 kernel. Paul
Gortmaker located a 6.5 series commit that is causing tx to
intermittently stall to serial ports to stall under load.

    79a314e29b53 serial-core: disable power managment for serial tx

How to fix it properly with upstream is still and ongoing discussion.
We'll revisit and update this change once something lands in mainline.

The details of the commit are below:

    serial-core: disable power managment for serial tx

    1% of the time where the getty never appears on ttyS1 even after our
    timeout of 1000s.

    When this happens we've added code to login to the ttyS0 getty and run
    debug commands. We've been able to confirm the getty is running and the
    init system doesn't matter (happens with sysvinit and systemd). The
    most interesting debug I've seen is this:

    root@qemux86-64:~# cat /proc/tty/driver/serial
    serinfo:1.0 driver revision:
    0: uart:16550A port:000003F8 irq:4 tx:418 rx:43 RTS|CTS|DTR|DSR|CD
    1: uart:16550A port:000002F8 irq:3 tx:249 rx:0 RTS|CTS|DTR|DSR|CD
    2: uart:unknown port:000003E8 irq:4
    3: uart:unknown port:000002E8 irq:3
    root@qemux86-64:~# echo helloA > /dev/ttyS1
    root@qemux86-64:~# echo helloB > /dev/ttyS0
    helloB
    root@qemux86-64:~# cat /proc/tty/driver/serial
    serinfo:1.0 driver revision:
    0: uart:16550A port:000003F8 irq:4 tx:803 rx:121 RTS|CTS|DTR|DSR|CD
    1: uart:16550A port:000002F8 irq:3 tx:281 rx:0 RTS|CTS|DTR|DSR|CD
    2: uart:unknown port:000003E8 irq:4
    3: uart:unknown port:000002E8 irq:3

    This is being run after the getty didn't appear for 60s on ttyS1 so
    we've logged into ttyS0 and run these commands. We've seen that if it
    doesn't appear after 60s, it won't appear after 1000s either.

    The tx:249 is interesting as it should be tx:273, 273 being the number
    of bytes our successful serial getty prompt has. Once we echo something
    to the port (8 bytes), tx: jumps to 281, so it suddenly found our
    missing login prompt. This is confirmed with the data appearing on the
    port after the echo.

    I did try disabling the autosuspend code in the commit above but it
    made no difference. What does seem to help is changing the conditional
    the patch adds around start_tx() back to being under the original
    conditions. This is relatively harmless as it will just stop_tx() again
    if the xmit buffer is empty and this is a one off operation at probe
    time.
    The small overhead is much preferred to randomly failing tests.

    Discussions with upstream are being attempted:
    https://lore.kernel.org/linux-serial/c85ab969826989c27402711155ec086fd81574fb.camel@linuxfoundation.org/T/#t

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index f141709c69..ff61a33db6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a97a5e39ecfb8213e1a8f3065f81de1c1027eb4b"
-SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
+SRCREV_machine ?= "541ff832e9f2a168145f96ff41857a6cf1c74289"
+SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 0cae4b9b06..6ed9972549 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
+SRCREV_machine ?= "8ad515e79001700d5e3d36e6ffe37ebdae2b5cd4"
+SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 392e6b3d81..f63b93ce49 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ba4066c2d3b04b28a9e97bc069ae10cd900ad314"
-SRCREV_machine:qemuarm64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemuloongarch64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemumips ?= "fbf038597ca02cf012ba540506fc66c91ffe9df9"
-SRCREV_machine:qemuppc ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemuriscv64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemuriscv32 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemux86 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemux86-64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_machine:qemumips64 ?= "b21628ab2abaa55e3fcc086fb8b253fac10477ff"
-SRCREV_machine ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
-SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
+SRCREV_machine:qemuarm ?= "e3bd53c181eb362535991bb0e0c15bf7b8b8e86f"
+SRCREV_machine:qemuarm64 ?= "cd01efb6992e0af5dfef251420291d5984898a9c"
+SRCREV_machine:qemuloongarch64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemumips ?= "76f1c7370493dd6068f6733eb7d6ff9da6e7fae8"
+SRCREV_machine:qemuppc ?= "a3ac3f52f2352476f0fb1b0b4fe7b1c2339f9b18"
+SRCREV_machine:qemuriscv64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemuriscv32 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemux86 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemux86-64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_machine:qemumips64 ?= "59ac3aaf836bd355d0f9f734e7bcca3dde44573a"
+SRCREV_machine ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
+SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


