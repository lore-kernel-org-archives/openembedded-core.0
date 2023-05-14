Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6673C7EE23
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.69687.1684081934176543339
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0QmRPCzF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6434e65d808so12560554b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081933; x=1686673933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mr6EXtWOz5a0FnAsDLC/NPPCikoz8p0AbDOZS/clu+s=;
        b=0QmRPCzFVTBtVOGH1mJ/1m2m+DPEXU5xD9ybtNWYu3vIHg3pQQMF4d64XJ/2nAIIL8
         iNQYWzlrr0M8dZzCuZEWi23xcctJBC2Cpeop/iJrGqSto3zNI1zPq7X/mBmoRgkNptQA
         +PTGSw8ewVOx6AmuXwxbSXc4kjjb5+i8/l3m2uC5Bof8qaJVCwBRSuRDBckLGwys99IU
         DoNfZvPKallTfvmcRZZFjw8U+L9hT9P58yDosQ8CjR2aLVV20vyVbMec9VshQPDhGYLD
         phpzr2p323IINLp3X7/Aes354MIR/59oUWt0wOKqe2zMTGRnUdlCmpJkTMLzHAI29udB
         qY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081933; x=1686673933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr6EXtWOz5a0FnAsDLC/NPPCikoz8p0AbDOZS/clu+s=;
        b=Snpgdnh9OcgP840BQxiWtlwNBzj8TqGQCRv+SCzqmQft00ljdQRXYCwfu+LNxDeRw9
         snr8gnaK5u9W6aNbM+p5c4IZ4VVanO0P2MPuJc55tU84Nv/Tcg7FCjnduCECadTarkNj
         89phmHwH8w81c2urN4ejrSQ0QRXqh9K+Cik2qeAh5FMuH3KPtLmm0+Zq5+cASFhlQdsp
         4nM9ALXBvGp5W0gIp1qhHVpC3VpqyNI0q5azWPMHxAjY2A8Uf7ozBMFOndXZUa5eEHF4
         QB9ZJrdsaz1Wwv6fCKwpFvkd/DwmQYNr+aDoD/xBIKCFpLkMzmGyToAhb5fHzNos7WMN
         NcXQ==
X-Gm-Message-State: AC+VfDzKGqjXUbbciA9d2P9vqqhVya9vZu6P0VHZKmXc8y6iw6XPB61p
	uvSrUSpFgpyVXhk153r9zNBqDyJBhtAoPPzurjY=
X-Google-Smtp-Source: ACHHUZ4boe7bNYbL6fP1bG5BfMOwClYs3vZjXxkAKBdyIR9jRlQT3C6XHGVfQ+3CodQJTuUiG3DDMw==
X-Received: by 2002:a05:6a00:a21:b0:62a:d752:acc5 with SMTP id p33-20020a056a000a2100b0062ad752acc5mr43315042pfh.32.1684081933236;
        Sun, 14 May 2023 09:32:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/15] machine/qemuarm*: don't explicitly set vmalloc
Date: Sun, 14 May 2023 06:31:40 -1000
Message-Id: <2c5af07819b4a555737da9f07aa5236579300027.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181216

From: Ross Burton <ross.burton@arm.com>

In 5c6064 the qemuarm* machines gained vmalloc=256, because in testing
Bruce was seeing problems when the vmalloc area was too big for the
memory size of the machine (eg 256MB).

The intention was for the area to be very small, but 256 bytes is too
small and the kernel sets a minimal vmalloc area of 16MiB:

[    0.000000] vmalloc area is too small, limiting to 16MiB

However, a 16MiB area is too small and results in pages of messages when
you try and use the system:

[  242.822481] vmap allocation for size 4100096 failed: use vmalloc=<size> to increase size

There have been a number of changes since this commit, remove the
explicit vmalloc argument and use the default.  I've tested that the
system still boots locally.

[1] early_vmalloc(), https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/mmu.c#L1170

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemuarm.conf   | 2 --
 meta/conf/machine/qemuarmv5.conf | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index c5234231e2..aa9ce88203 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,8 +17,6 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
 QB_SMP ?= "-smp 4"
-# Standard Serial console
-QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 6e59e42c3a..ef1b4ece23 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -12,7 +12,6 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
-QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
-- 
2.34.1


