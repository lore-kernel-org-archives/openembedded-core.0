Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DDDC001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:10 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.26467.1688656029711001017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5B6jxAi+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso539035b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656029; x=1691248029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+HzmG/80t0r2N6damhv67dtUMXD1lFVfrZgUuU9qMM=;
        b=5B6jxAi+G/Z32jajHs8/rCqeqeg7cZ6WNDXnFQEBZHekLIwHm+fJPYM4s8sY7btnHX
         yRTjXUGzbpDe20eAqGf4NM83dEVhYV50G6MvvHGdzG4RYqdT3u4smrX8jVw/0C9hmPmg
         JPLZUnPy/y6zqQ7X888AP79eB9qv/I0yTW8JrMk6PvjC0cpzTBmi82PMVxd7YF81nDKf
         duuQwk6Dlj/DB7+g3M/UnZ5pNeyddTTtQIYDPXySYVus/f17UOwADcrDckGUgtfxwLAL
         juPDY3eyRNfESBs0rhC2JJmsfR6KXeBYGO8SC8xpNh19MYeYohdm0MnpT7XDnnO3fOYb
         QkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656029; x=1691248029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+HzmG/80t0r2N6damhv67dtUMXD1lFVfrZgUuU9qMM=;
        b=LeU3MIFaPfOExHIm1zLgNSiddVEMqCch/RVa0leGXkrlfPClAdkVEFqwOboEXyOOeg
         8VB1rMiEXXhwobE0tR6U0RgaOjI3Ag1BLqGlr/lPY2tmZxzLY1k7RJTHMuRMaSsCk2ux
         O3ycygrqYjxG+smpj+of/Sjcv6MWgYS22L1dVoIwDMGfoSMyfhudTvYUC07+4hWxsklS
         /G2ZK8wQcht7aOwWQ+11WEktLSbZPCgPbld+koch5/Gb26pmzlMoDvhMcWv5kP/RIXwJ
         OREDFHgUSlsRlVPM0PHmVpysXHn8SNtT8JcwchgerLf4UtOneP7adwL42DRprrTlSs0W
         QAXg==
X-Gm-Message-State: ABy/qLaZufq1W6deWPyu3Tsdy8JmT1L5+u69au8jjac7SLj4C9jhDOFz
	vXBCZ7BvMT4naAR7Y/EDHbl/W3oqL/1BSe4amF4=
X-Google-Smtp-Source: APBJJlHaLMXZr/NVCOVQqbxsprspwuLdlX6+O+guFqct2gQgTmqkKFSYtOQHfxr4ViHf8/yTJDLeGw==
X-Received: by 2002:a05:6a20:6708:b0:10b:e54f:1c00 with SMTP id q8-20020a056a20670800b0010be54f1c00mr1346596pzh.57.1688656027975;
        Thu, 06 Jul 2023 08:07:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/28] image_types: Fix reproducible builds for initramfs and UKI img
Date: Thu,  6 Jul 2023 05:06:17 -1000
Message-Id: <0d8890f7c1fbea5036acefa3031dcd442b316725.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183967

From: Frieder Paape <frieder@konvera.io>

I've encountered issues reproducing initramfs and UKI image builds,
which will be fixed with this patch.

1. initramfs
There's a symbolic link to /sbin/init, which is appended to the cpio archive after creation.
The links timestamp needs to be static and the cpio append command needs the '--reproducible' flag to produce deterministic outcomes.

2. Unified Kernel Image
'--preserve-dates' is required for a static 'Time/Date' entry.
I've added '--enable-deterministic-archives' although in my case this
didn't change anything.

Signed-off-by: Frieder Paape <frieder@konvera.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd027729bafb4e085ba0949e38e724f3a8cad102)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass              | 5 +++--
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 79081d9f98..9d5f8c68a4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -130,10 +130,11 @@ IMAGE_CMD:cpio () {
 		if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; then
 			if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init ]; then
 				ln -sf /sbin/init ${WORKDIR}/cpio_append/init
+                                touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init
 			else
-				touch ${WORKDIR}/cpio_append/init
+                                touch -r ${IMAGE_ROOTFS} ${WORKDIR}/cpio_append/init
 			fi
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio --reproducible -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
 	fi
 }
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index c28d3917c2..a2b9f4c893 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -330,6 +330,8 @@ class BootimgEFIPlugin(SourcePlugin):
 
                 # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
                 objcopy_cmd = "%s-objcopy" % target_sys
+                objcopy_cmd += " --enable-deterministic-archives"
+                objcopy_cmd += " --preserve-dates"
                 objcopy_cmd += " --add-section .osrel=%s/usr/lib/os-release" % staging_dir_host
                 objcopy_cmd += " --change-section-vma .osrel=0x20000"
                 objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
-- 
2.34.1


