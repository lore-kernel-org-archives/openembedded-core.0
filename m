Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB36EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:34 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.7393.1687919432363752386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WUgVKoBW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666e6541c98so5128697b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919431; x=1690511431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sX+/gntmGoIkvqxz/Q40iQ9hJk8RS8zPW10jG+Dl5A=;
        b=WUgVKoBWVb7B/MbITGQ6Jh4/BgUFwU4yzi0PMWAVlNmZuVPToRp28SeCFVUKufPZgO
         xs5cDiH9zDmQkRkoDOTAEZXIqfJqVTMRIKddkEgsGEz12sL30otDTp7T2SOMwismPYL9
         52XLuX3kDAqorjFFp8b/tv5dqSfFnlkgaPe73naQiJN6ysog+1ZbcFuxJPsic/yCR2Tc
         gsBNYtmNDOJYju/X+7NucY9c48ksU2csbknYazV8CeyeYZCdsZEtfGyAB1HylFy+KD0+
         xGM5vi3a29WO7VuK3XUhnCnHa1GTuLF19TfoyzdBeGdIMXRWYVvI9Ycb3DZm4Ae41YH6
         BNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919431; x=1690511431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sX+/gntmGoIkvqxz/Q40iQ9hJk8RS8zPW10jG+Dl5A=;
        b=GDvVUfF5UYzg0qT+yMNlsxqFUFMWjV1Yq2N5RlFq65oVx1UxaydmgFjRd/YwK426fL
         sd6v8/A2N2zYm3WGFSMXFDwmsOwea1sgjQuQkRvPCgnoA1jHj9nDSyasnIcmaxwcnp5s
         l4349x967mAOvk7V6w64CV0OFbVhzNU5swrMAX9xnluTqqGu+axSzl/u1Hkm0X35lBr/
         FemiKj7vCR7u1Y5k+UDcbIt0ACXc9ecLYve+cwuingg05TW5yrjQ4287TTxeczXj1wE8
         CEPpYT/t2NVjmrkdLVFn2grqqXei3DFPGKpfdn1/OaIijO4ZKgeZ0TRKLJVvh7hzbhuW
         BgmQ==
X-Gm-Message-State: AC+VfDwI2K0eI1V2S+mKpAMeE1UVwqnFT3inctqdtxMMtosHvyCg0Z7a
	JIC/114/gjL0djSCA1oT+MbYQnNmDsi0o7v4iYNjhQ==
X-Google-Smtp-Source: ACHHUZ4nDHM4q3MdaymCoyY7xP81wn4mNoQvtCpCxT6UhYrLV0ufEPZN3XoAIjs7OpkXcY0vRTbkVQ==
X-Received: by 2002:a05:6a20:7f99:b0:10b:4539:fa0a with SMTP id d25-20020a056a207f9900b0010b4539fa0amr42019448pzj.1.1687919431356;
        Tue, 27 Jun 2023 19:30:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/30] image_types: Fix reproducible builds for initramfs and UKI img
Date: Tue, 27 Jun 2023 16:29:38 -1000
Message-Id: <7bf9463665c46e331f40f9ca4f04733d14f9ab44.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183531

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
 meta/classes-recipe/image_types.bbclass       | 5 +++--
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index bbddfaf272..023eb87537 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -148,10 +148,11 @@ IMAGE_CMD:cpio () {
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
index d6aeab2aad..8ebb2a9be8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -351,6 +351,8 @@ class BootimgEFIPlugin(SourcePlugin):
 
                 # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
                 objcopy_cmd = "%s-objcopy" % target_sys
+                objcopy_cmd += " --enable-deterministic-archives"
+                objcopy_cmd += " --preserve-dates"
                 objcopy_cmd += " --add-section .osrel=%s/usr/lib/os-release" % staging_dir_host
                 objcopy_cmd += " --change-section-vma .osrel=0x20000"
                 objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
-- 
2.34.1


