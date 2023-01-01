Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BA4C54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:56 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.16033.1672594731347003462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M12fMuTd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 79so17128447pgf.11
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BaOHZ3TFO9ad+kH979rSsCJNRSuK4GFNMxl7rDAcIuw=;
        b=M12fMuTdentrx04nA+FGyMfik+3QP/I0hBiOWn3gNSh90LRdIP4v3IsDN402qMr3Dc
         VfdKp04VSzz6Ua5cDXjCvL6iBxp0C7KQvnGr/gvEESk9/DeTn/XUYjNqnYSQ+Xov1VcS
         opbo95VnLtSQOMf6O7w0fFucFmX09v8HoTMfSmcXil2V1/t54y+giOWUEK7ZOkZu64Uy
         xnja2msf2xEuWtAityp57pfRW1hwV6MMobV417ktMHASdC66crk9Bj6bWDRj9aG1FpYh
         46l2u4qL0ponYfzVwM1m9E7w1g7WpfkEEjm+2tv5MIyIJWq3yMu2Z61jdKpPqGohM7T1
         jJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaOHZ3TFO9ad+kH979rSsCJNRSuK4GFNMxl7rDAcIuw=;
        b=6BeyybD37iRrERdJpJD1aiFjmeMVC4FSeCuk95TWVi12Y8yNHeM857gURHKf+m8qex
         cef/WpugdNdLj23Xh8QYLT6Tamm5sYMU358siSS/YvuRQcn4tM5+uiWZynbYZqu4282Y
         GqYH7jAfEfGW2z+PLE++ZAFV1NvEHiB2KZw1EpLSRp98efkLFHFgMVb4WHTbhwHCuu6i
         o+va5bay45xyL5wMvCGuztaw65VKT85+zFmDGPWWP8mAppMYogfDkhd211//epKpzpeq
         rLp2zf9E6U0XxGGyC2Xcta/u7J1mJMu5/k2PwQiHiZy9bz8Ga0g9pq14f+egkVujSpGQ
         IGhA==
X-Gm-Message-State: AFqh2kqVsVRv1Y8LPldgsHoJBC8fhtXMLYhKoyOfC07WCbSjipI85fHC
	bpwMuiiNbNcz1dbyKO0PXBCJ+z4dZG3729oHS4w=
X-Google-Smtp-Source: AMrXdXvGpRLop1HXm8Nucc+6esO7WJlW0cpmvy1aoR+d4FdF120q/r8/UBeMeK5EYvlpnv3rMrTnVQ==
X-Received: by 2002:a62:5302:0:b0:577:2a9:96ef with SMTP id h2-20020a625302000000b0057702a996efmr36392543pfb.28.1672594730428;
        Sun, 01 Jan 2023 09:38:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/29] qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel image
Date: Sun,  1 Jan 2023 07:37:49 -1000
Message-Id: <076dca42021a11b9dab692a3bf0b8d488d293360.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175215

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

The QB_DEFAULT_KERNEL is set to pick bundled initramfs kernel image
if the Linux kernel image is generated with INITRAMFS_IMAGE_BUNDLE="1".

This makes runqemu to automatically pick bundled initramfs kernel image
instead of explicitly mentioning bundled initramfs kernel image in
runqemu.

[YOCTO #14748]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52371624313184e1a825519160c3833e282df8b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index ad8489902a..f2ebe94ca4 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -7,6 +7,7 @@
 # QB_OPT_APPEND: options to append to qemu, e.g., "-device usb-mouse"
 #
 # QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
+#                                            e.g., "bzImage-initramfs-qemux86-64.bin" if INITRAMFS_IMAGE_BUNDLE is set to 1.
 #
 # QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
 #
@@ -87,7 +88,7 @@
 QB_MEM ?= "-m 256"
 QB_SMP ?= ""
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
-QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
+QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_RNG ?= "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_OPT_APPEND ?= ""
-- 
2.25.1


