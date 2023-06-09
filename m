Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC748C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:35 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.174.1686329668078906520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hL54PzeI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-652a6cf1918so1714482b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329667; x=1688921667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shBusaz4tdGEkAd9k2lLLyxfTpFnLdmBiUTuh5ADeSg=;
        b=hL54PzeIeKtSwhN3axnDcFjEjKz4vaLb/k4ZAu7n1D1WEX688/cUW7oc5on8cgU+1e
         HqMGK4Xdm3jKaDkmAbGKIaOqHPNby3qCy1dKYHT6cGS2RQx762VEocyJ+nDjgEaNk9DT
         72iuylwF6ewS6WXVvDywQ1XrYbqeUNYdjuXqpv7zD2SbFHyURzWYFmrUbphg+8VZgUX7
         6q83jdT7r24Rra+8hdZYpXRNoiwDPG44StkXsYkaZFzQylPjJgYV5fCixL6uhw+qanmy
         GCgwzRdWFIwWdhN7CwkDxLJpqcEhr+D4vlEa87iRpFfyQQo8zGHHlgLTiUzQv08k7YRH
         zSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329667; x=1688921667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shBusaz4tdGEkAd9k2lLLyxfTpFnLdmBiUTuh5ADeSg=;
        b=KGsqEjC44TXSfVIwc9OMBNlDav1kWBpdrHOevo7lfwMxijKoqcQ1skbgbruSe5deAa
         3VOIcgltpP6oe/n4bo4tppewDe7ZoCaiXkNmpW65b9JpeYAZIqiJQTiE8NMreXpe/LKj
         jW9vQVLmM4CB7Hc3m2DmTBd4ctGCsKg3XBlsQJkh19o0Up5uMaUFUxcQoHyIk+KBLnld
         EKMABKZBAOGdR3EYVEknslyw/6TuBuoZKDRJUqWxxU3WOxbIw3ox4T017RN9gmfTPb11
         XTdo2Y2vUnfGPaavcTho4Lu3l/FhFy49Xq7T2NNR6CyVZJ7X3e4gyo0kwof+wbn7TvJJ
         pg/w==
X-Gm-Message-State: AC+VfDxFSdjNpCYKdw5y3nYwFtsFb7mxUdsSUt5hfhJJ4eUV+5znl3UN
	gfXUpqrSSbq518Uf+FTUre8XKxYJ8SF9aUhuAR8=
X-Google-Smtp-Source: ACHHUZ5Z+wG+tzteg4gg6VKIUuyo9cijCl50pc2dsZUm1KokXjSI4zpmojY0JvHPepIQj7v0EH4qUg==
X-Received: by 2002:a05:6a00:1a87:b0:663:6e88:6f93 with SMTP id e7-20020a056a001a8700b006636e886f93mr1745863pfv.28.1686329667167;
        Fri, 09 Jun 2023 09:54:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/30] image-live.bbclass: respect IMAGE_MACHINE_SUFFIX
Date: Fri,  9 Jun 2023 06:53:41 -1000
Message-Id: <ac1977fea5a5d68c197d948a59447472e7c7747b.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182580

From: Martin Jansa <Martin.Jansa@gmail.com>

* fixes:
  ERROR: core-image-minimal-1.0-r0 do_bootimg: /OE/build/poky/build/tmp/deploy/images/qemux86-64/core-image-minimal-initramfs-qemux86-64.cpio.gz is invalid. initrd image creation failed.
  ERROR: core-image-minimal-1.0-r0 do_bootimg: ExecutionError('/OE/build/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.build_hddimg.2001892', 1, None, None)
  when IMAGE_MACHINE_SUFFIX is set to empty in local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ed072d2a0abe5a22330160f67ee5e83c2eae1dac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index 1034acc49e..168774a464 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -38,7 +38,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}${IMAGE_MACHINE_SUFFIX}.${INITRAMFS_FSTYPES}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.34.1


