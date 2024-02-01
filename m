Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5F6C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 15:48:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.18852.1706802530602458581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 07:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWMpf1i5;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cf45305403so14493631fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 07:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706802528; x=1707407328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8orvOtNlGWwBUBg2ZsdqUolhfj6ShlHz797HnPO2fCo=;
        b=ZWMpf1i5T4MSgHBT5qA3+7Qh+uB71AkXzdOCPasZl1dXukWQvLOHQAi8PiHsk4E7zF
         P/SQEsfZw9opXLaw4naF+7acrsIr++kF4nRp/q2PTVFNWQkp9JzUXueyR65BxrMGyw+X
         oV02CRaL/H3jA5eLLPlS+O0iw3nGenHw/8u2gg/Zu3di8yvDcbaxfeFTkwFOxKhR+/r7
         abmkUu9WuPy7FPXagxHf7FglbjxgXXD+MAs+EAvMV+B9mVCxk/62mLdjfAzWkf+jj0w3
         OFT/Zt82vUFCB6S4HaBb6adiXEQ4xl904UVhXGJk2W5YCYbnHhlKB2vIyxG2dc1LA5Xi
         4B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802528; x=1707407328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8orvOtNlGWwBUBg2ZsdqUolhfj6ShlHz797HnPO2fCo=;
        b=q+y/q5vGcKlGBr/SPOO9u0ZbGiOs40OPcFxC3grX3y/IWDzdT5+1jdQdIjy4GYl1U2
         iQWQkKMFrYCOIaZR2uCJC2AGiXr6RqMYvd4ycFT4X66Y4YQTUy7VoIdnQdU4aO2n0/Wm
         AbRdD571PnDgBzEKM+DK5NJ59woSwkCOuTVIFMm6+xASKsAwvQ0qihuB0vMrW03SjgAR
         ZlQklCNlOyfANYFhj4hlEd/b8YabqLdGstiaD95dxRvhq+ufvO2yDHTu3mmerEADA+A8
         1QlbdR35vdqGdXhHjKKgBKntydgf3PKo0qB0zGgi2qsawgvRUbB7sWLPzJgaHQ/MxF4g
         t8jg==
X-Gm-Message-State: AOJu0YxEV/z1/oZPw++WrxofLbzwrbM46NS190sikq3buDQLDoJy+Pd9
	fxdYqfXsq2iy+N/kmxGUvAmW1LYNeBfLsoI8/yQnw09W7KTDyqG8E5B3oTxb
X-Google-Smtp-Source: AGHT+IHv7F60y7NwquOfb1Cn8fITZhOtRgOkNVgWSEdTp4K/a/h/ks6+I9NzSP5zh7T8hKG6Wlf8Hw==
X-Received: by 2002:a2e:90c3:0:b0:2d0:5f90:1de1 with SMTP id o3-20020a2e90c3000000b002d05f901de1mr1896745ljg.20.1706802528110;
        Thu, 01 Feb 2024 07:48:48 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090628c200b00a311092d2f8sm7271527ejd.169.2024.02.01.07.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:48:47 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][PATCH] kernel-devsrc: RDEPENDS on gawk
Date: Thu,  1 Feb 2024 16:46:52 +0100
Message-ID: <20240201154652.913029-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 15:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194594

In reality all architectures have been depending on awk / gawk for
significant time.

gawk directly since v5.10 as it introduced scripts/check-sysctl-docs

grep for /usr/bin/awk results in

* arch/x86/tools/gen-insn-attr-x86.awk:#!/usr/bin/awk -f
* scripts/ver_linux:#!/usr/bin/awk -f
* tools/arch/x86/tools/gen-insn-attr-86.awk:#!/usr/bin/awk -f

So instead of relying on other recipes adding gawk - RDEPEND on it.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 4ff751d9f0..9c3c09e714 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -390,7 +390,7 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 FILES:${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 FILES:${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
-RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils"
+RDEPENDS:${PN} = "bc python3-core flex bison ${TCLIBC}-utils gawk"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS:${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
@@ -399,7 +399,5 @@ RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
 RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
-# 5.13+ needs awk for arm64
-RDEPENDS:${PN}:append:aarch64 = " gawk"
 # 5.13+ needs grep for powerpc
 RDEPENDS:${PN}:append:powerpc = " grep"
-- 
2.43.0


