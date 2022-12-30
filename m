Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C844FC46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.22444.1672418722929579993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SAcViQdw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id e10so598555pgc.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdtwWe0EeefPnxo8P++oKTdzo4IafzdCUnrfCJbPuAQ=;
        b=SAcViQdwX5pYLuNZGGGSKEylCUulpU/svOjBOkSE0Xtqw5x6ct4clCeH6wvu+3f6Vq
         mNtFFepz7xIksZPsHayMQAUZySC3Ky/ayAP5jxxbngieF4U0FMyWZH1oBSAo8ioCeSuL
         y2o7Aj9V9AzRG96CgWBlSJ5wyoMRWjCtGo+4y9pLq1ojvOU5vJNe+puDE8+jEliFzYJg
         fwtQczlhUaSG2iszXd9QyAJwYbDJsOaqN3joNqVtsnRiMW6gOzXyc3WCC2SN6n1Zf0wO
         KUvPDp92UyPCzjivbBmJj3lmAHeKNRuLU6vcMBNuK6CGpQdkg37JiFkQTJnYFds5kATS
         EYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdtwWe0EeefPnxo8P++oKTdzo4IafzdCUnrfCJbPuAQ=;
        b=N/OVA67Yh8pQsz5Ea9QyxQv/FWDY5FLTG8OTMi8/qfcY4HbJVkrH0LM2DrDRgOAwzw
         CwvNupWRgQa+gEuBZ62sDMsSUkEpXyfKGT3J2CyH7YQIiNnkANXrMh1hxfOrl7cVQ6PU
         UN0Dw0l0FCqQkB2bBxRy9oi2ClhtwxQTaIMOVzsiYBZ9w8r81CEDKRYGVlOOSv7hcg3b
         C5C8v1dOjNiag2avxPPIQnxUfMyJVpXf3oUyNy/Lt14VMn1lemkWOqIQcnzeIJeZbE+w
         xRf2kNxcCGhbluRRuvsUJdfE7Faw4MyzlE/v6w4yGRTgWzavYkWkkouqKqfPH1fzvPuQ
         FptA==
X-Gm-Message-State: AFqh2kqnn3SauTT+JgO6PVBe9PigfAdjGzBfX4Ifd10i3tBs5h/aaTdp
	YzzLtTqULLm+A63qiAVIdkc8m8zasy8qC+QEcGo=
X-Google-Smtp-Source: AMrXdXuh3fxQwxw7/ZDckARwseRUJxwwR6pC1LT64Ju2IS9cILwLmn+7HYSJOxyZh6mQ5a6v5kK+wg==
X-Received: by 2002:a05:6a00:1d03:b0:573:a0a0:c5d2 with SMTP id a3-20020a056a001d0300b00573a0a0c5d2mr38265786pfx.7.1672418721993;
        Fri, 30 Dec 2022 08:45:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/22] qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel image
Date: Fri, 30 Dec 2022 06:44:10 -1000
Message-Id: <d196220934a62ddf580cb4ce681f26b1410df9ed.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175161

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
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 018c000ca2..5a0e50ccfc 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -13,6 +13,7 @@
 # QB_OPT_APPEND: options to append to qemu, e.g., "-device usb-mouse"
 #
 # QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
+#                                            e.g., "bzImage-initramfs-qemux86-64.bin" if INITRAMFS_IMAGE_BUNDLE is set to 1.
 #
 # QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
 #
@@ -93,7 +94,7 @@
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


