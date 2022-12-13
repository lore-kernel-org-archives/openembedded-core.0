Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72215C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 14:58:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.75348.1670943537019228479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 06:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ikz0WeZu;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id p24so18772plw.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TXU1IunrwyAyJzzx3UzslqXvyFLZZxqP0w24Cqli0k=;
        b=Ikz0WeZu1EC8myAojqiRfZnDAoXY4cvGF0tHe5qYSsM8+I8FqkSEDrq7itj9ka3NuA
         xnmpjaTVbEu6ExNo82+wTxE4sVomiMrlBJH6l4m2TULccjgu5f4V0z+FegInEmWU2AX/
         nk2H9OBdxGhcK6joqEm4QwmXLQVLXdIsbEFLTzPymn/OnZngOvAuOxww7byHzp6yjuXI
         +9Jbqx5NmFjgTrEJtkvQCQgmd0/TACY/eCXZuAPH04EkTh+cwvU3XFQV+LkR3RD5PTY0
         fz4n2V2gVAl0U8ITyAxptM+OICDC/dTH5DAK/O0PvfjvRw/J0x7USbdn/G3fm1rxx2D1
         PoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TXU1IunrwyAyJzzx3UzslqXvyFLZZxqP0w24Cqli0k=;
        b=bXpUDW2lu62pa+V/2IRvjniZ3JU5zcVgdQg/dfqbN8/yuBWZpkKyhEsc2QkaWw7fiH
         0CYnmMDiQ1obKPzEOd7IOnb27brAWYtiCXx+xv+hhCZYMbK6jhYpsFzKMN3U0WiU0Z8q
         HygElU8N3lXyIifgjNU30yuOv1V9OH9YI4Y3l8iyXwCDoZeLHMs6HQ7Rt3uCK+ctJH/J
         IX2yd8qOgEVD437xDHIK+EU/aay0PyC5BOxI1R8tdxN0mwFRoBn0oWkVkXWkcYyHMYsV
         bi0JyHh0q2CF7Erm2PwP5thwOQ1/LHWQoTFoEkeSEFL/Rf2uSVyLoMHWTwuH41HDAZqk
         sI2w==
X-Gm-Message-State: ANoB5pncv4q+PJBTMvfuoQ/cMEsSgrhp68oHchyystoJVJ7Cq0pnpkXK
	GCjx8I+Pmf1xAwe91x3zwOq6UaxtH6w=
X-Google-Smtp-Source: AA0mqf5T7XnHGr/uaH8bUnzZmauAFXE0rPqi/wF12tIhr6es5ka0j2NPRlWp0Wr4sSgtwCAUwbpKkQ==
X-Received: by 2002:a17:902:d510:b0:185:441e:90ae with SMTP id b16-20020a170902d51000b00185441e90aemr29436752plg.20.1670943536295;
        Tue, 13 Dec 2022 06:58:56 -0800 (PST)
Received: from localhost.localdomain ([157.45.138.229])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b00189bf5deda3sm8585683ple.133.2022.12.13.06.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:58:55 -0800 (PST)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH] qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel image
Date: Tue, 13 Dec 2022 14:58:36 +0000
Message-Id: <20221213145836.326-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 14:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174536

The QB_DEFAULT_KERNEL is set to pick bundled initramfs kernel image
if the Linux kernel image is generated with INITRAMFS_IMAGE_BUNDLE="1".

This makes runqemu to automatically pick bundled initramfs kernel image
instead of explicitly mentioning bundled initramfs kernel image in
runqemu.

[YOCTO #14748]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 018c000ca20..5a0e50ccfc2 100644
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
2.17.1


