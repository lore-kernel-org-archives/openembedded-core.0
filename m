Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CDEC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16167.1672594972570891594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uluvpdzN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id m4so27173422pls.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rKkju5gZMxlT9SRxcZiqoKsvnkRsRYj3i8fbCK/fTE=;
        b=uluvpdzNKbjmhBU+AS3kaK7r3XBm6+jI8EgW9JSmaWkh5fpAeLS3exzVAT9DKcz5P1
         8cZRGMsWSRdjciHrOb2X617Ii9N0j4dKWjiUYm5H+Vmo2eOKhARenpf0pjioV13175JA
         9ZuwJA7iVdN3hqZ3RoJSMZTPFpbY/vAFsweB2mGs0xOxrCeMe6qpNllrIOpmGGd7Lxoq
         J1YZx+kFxeIjV3CCIDXIS4Pr/YBmekGX+bTyDhFCaPPHBNAWoCnNxlh/lHqAccXL9RKV
         BugEiN5s7v/PnCKliL06IwnH6cAjX0qS6czX/uZI92MfCwd5Y2OpLtInJiTl6o5aU8k2
         g92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rKkju5gZMxlT9SRxcZiqoKsvnkRsRYj3i8fbCK/fTE=;
        b=lzmjwsBumq+DYfpESKetUcPC9pmYaKYIA/dlRzI0sn0SBWu2uk+EI6aZkDtD90vnJU
         AqMg4r6/G0Ld1+EIk6jTC0f0iqPagfvFwnnymjXs/5mzH0HatlLISj4CnziqEYufnE/q
         kBTpaICDm1fCuypykN+XfD9r+AjLhQL9jY2G5rr0AOQnTeP6G0Ki4bL8MF/HI76Yg7Ka
         fPTKRefSFAVtb1ROKw/UVb4Evbc+ta3CZh9HMj4kGH0/aJIkTiIJTILoZVY4Q0JGOWp2
         ayzK4oP0Wt+3QOBZNZFoDB9tse4P21tpTOVkdGX/qjuzKhUB41/nzXNli8X487cqDPGq
         zFzQ==
X-Gm-Message-State: AFqh2kpNm51v/CT8Kdznlwj8EpLrx03pumI9VEU5tkv/phe5hAgWXVkj
	7qdnK3x0H0uV0+4V32g3PKGHyPZZC5aStRqPK3s=
X-Google-Smtp-Source: AMrXdXv/go7dG+5JFUsTESciw0tGE9f7xk57FsoQeYp1g3HD+3ZvR6ffjOF9MzxCrxcrvEpa1vh9Ow==
X-Received: by 2002:a05:6a20:2a01:b0:a2:17a6:44cd with SMTP id e1-20020a056a202a0100b000a217a644cdmr45692070pzh.58.1672595002509;
        Sun, 01 Jan 2023 09:43:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/18] qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel image
Date: Sun,  1 Jan 2023 07:42:34 -1000
Message-Id: <4524bf4a45e69b560a15d9344a8fb1f091bf654e.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175236

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
index 648af09b6e..92ae69d9f2 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -7,6 +7,7 @@
 # QB_OPT_APPEND: options to append to qemu, e.g., "-show-cursor"
 #
 # QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
+#                                            e.g., "bzImage-initramfs-qemux86-64.bin" if INITRAMFS_IMAGE_BUNDLE is set to 1.
 #
 # QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
 #
@@ -75,7 +76,7 @@
 
 QB_MEM ?= "-m 256"
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
-QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
+QB_DEFAULT_KERNEL ?= "${@bb.utils.contains("INITRAMFS_IMAGE_BUNDLE", "1", "${KERNEL_IMAGETYPE}-${INITRAMFS_LINK_NAME}.bin", "${KERNEL_IMAGETYPE}", d)}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
-- 
2.25.1


