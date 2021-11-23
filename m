Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7C4C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:55 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.819.1637704674880265526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IAD90tZL;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id q14so685872qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLoJCVmtqzno3i99hxHcTMfGd4vqKd2gwJ2aJHl2YAg=;
        b=IAD90tZLa+o5234cxV3h0ZFDoo8hGfFJiVRhkTnBphFfng7d1N2LaKXC3/YELmepu2
         KXO3MxA0rCMc73/ZvvcOXr4qKB/RhYXTaK/F6Jtew18+/EnwATtAiZnFJ30nmphBZV7B
         xPCTrH1XsQ/Hyw2eQqVpmMgBNiuVPiky6hHUbbcumBw1OVwVcfHmaoz6O4tq2115Dqqp
         hagR09Hj0R0FlSuq6cw4E7Y6GZra2kiI4NM6FyTWSG1+F5rHBE5yO6Yk4RbnEn9QSV2y
         Eh8qVI5XkfXm1122Qnw2zFd8OxnSKmuusnrhk1f4QRtmaEitJhgtHCY+0ku9isoxQjab
         diBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLoJCVmtqzno3i99hxHcTMfGd4vqKd2gwJ2aJHl2YAg=;
        b=xLaCDkewyVnTisjcFpLESkBqai3JXwGS7uG3ZXko4Fh5OeCXEeyeMsqi09m2v5HvUN
         L4Y/s50l2sQV/kzzJbm4VSLpl/N5bf/ioBCJfhJzxK0F7dRzaVnHPULlfKUWBqWSK+Bj
         8LZrwlO1qFVMr0j1Af5aXHqp8sYeOuE9bMzaqhJ/mZsCFBtMdevcUIC7ReJq2ONE7NHW
         4KwUYbtbdeyx/QEHj8RBhvrl2XpzJGLc0LgvSZWycGRFdiVbmCr+o/Ca3lFkz1aRNxtD
         o0wqCwYnTItSh42VMhvWd8v38DCyrDNGv4UeMA+VejkAM9i+F4AgH43Qxn3FPTttCKFJ
         nZDg==
X-Gm-Message-State: AOAM531vKWmLzQx6bnipPjeagni8OswxQ9siQXc+mZAdCNuwtkgii8YE
	JY/nEGZT+SZTLAtIWiMyu1HrSpXWz6KRUw==
X-Google-Smtp-Source: 
 ABdhPJwZJe/dwuGy1QCpa4K0k5OLrOFTOcvOu+JMLaVdqKklMtpWt0WeSS+3YfI8m3NW5Kg/AgAuVw==
X-Received: by 2002:a05:622a:30e:: with SMTP id
 q14mr875477qtw.71.1637704674016;
        Tue, 23 Nov 2021 13:57:54 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 04/20] kernel-yocto: conditionally enable stack protection
 checking on x86-64
Date: Tue, 23 Nov 2021 16:57:31 -0500
Message-Id: 
 <ad3d4ca0262f45cae9206e0c0417163cd036f06f.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158625

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The kernel Makfile uses pkgconfig to check for libelf when enabling
CONFIG_STACK_VALIDATION. We already have libelf in our DEPENDS, but
the kernel Makefiles hardcode 'pkgconfig', so fail to pick up our
pkgconfig-native binary that would report the correct flags and paths
for libelf support.

Rather than patching the kernel Makefile's to use pkgconfig-native,
we can use the KERNEL_EXTRA_ARGS variable to pass the definition of
HOST_LIBELF_LIBS via the kernel build commmand line.

We conditionally set HOST_LIBELF_LIBS based on "stack" being in
a newly introduced variable KERNEL_DEBUG_OPTIONS. The value of
HOST_LIBELF_LIBS is the same as pkgconfig-native would set in a
kernel build (but we cannot call pkgconfig at the point this
variable is set).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 331727d62c..15fc7ff724 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -46,6 +46,7 @@ LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
+inherit pkgconfig
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
@@ -57,3 +58,6 @@ do_install:append(){
 
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
+
+KERNEL_DEBUG_OPTIONS ?= "stack"
+KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
-- 
2.19.1


