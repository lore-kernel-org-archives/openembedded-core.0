Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B3FC48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 06:55:21 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.69135.1709448920418796721
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 22:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YV3Cb1ie;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: haokexin@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so2598352a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 22:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709448919; x=1710053719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTYmBBWc/qU35Cbu3cMAf7K8GDWF/TmFGA2B/68JoFQ=;
        b=YV3Cb1iev7qFTGelBeUniWZrqd74p8RpdZrQtPoisR3j6aBRdHjuLwWazO8HigR6F9
         Q7TXt7i63QD0pJ64leDWUXyzYl3a5oPJiScm5uTi20u6QtipR8eAb66YWvn6Lpixtfzw
         JmDPxgJ6AY7itKOsYINfngKfOo5PCjoosl+hw1Avoc5ENVem36xYAm1109IBbVkd0LQz
         zoMg8ovqEjRXiVsklBuZZhSxGB6pKnJq5OZ9O9bUqMUgXEdjSHHrQABgBzcMNhyslk9Z
         yXtSaZqNVJ4We5s70m7JilvKEJhtBYg0wvsfqjOXE6FmO7G5yP5dNCP+B1De9H9cPDcU
         aikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709448919; x=1710053719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTYmBBWc/qU35Cbu3cMAf7K8GDWF/TmFGA2B/68JoFQ=;
        b=N5x3qnrgfJ+tWxMRb1meJQo6peVbY/tS2t9G77QOxsR6p77lITZ46n+2mEqIXZcqdc
         xSBWoLr6oP+e1lAudvtMgzzpySGbcYVfiZp4B9lg2psxKLWvpga8pSkwMV3+OmcawGtP
         PRXG9KccXxkMxbrvWknNbo1pt2Qse6vkbWH8wMrgIZK7MCHiCSWw46Xkh5xCj6Y29frt
         CeWpnEniK5/ML1xXFr1Y+iHvSn4UMBiKswq9xLWH9JfNwnaQe3sWXkIdol77UoYTY9PS
         +LxbNsNnt3KRtiPHiZbX1iZX/q62De1LNhZbtYaqWAP6+QSFi2mk1nrUSl9iLAJhMpXf
         6w9Q==
X-Gm-Message-State: AOJu0YwuI/0XRyuWoPl1U3yEezdTELwwJdvEKXWAYKD8dgUA1TD4axaX
	Rmd36MX22naZxKYHTTBRxPQSReavxm2NRhpkLwQ0FcskXQKX2/bkGe2WoHpX
X-Google-Smtp-Source: AGHT+IEpcOZpWimZfxM4NINnI6QvsQQ7u2jwn1bDZRqOzqjdgSlPhY6sgfsvGx6vVTtUGB8EXnoTvw==
X-Received: by 2002:a17:903:2405:b0:1db:f830:c381 with SMTP id e5-20020a170903240500b001dbf830c381mr7841491plo.44.1709448919321;
        Sat, 02 Mar 2024 22:55:19 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001db594c9d17sm6149644plh.254.2024.03.02.22.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 22:55:18 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] image-live.bbclass: Adjust the default value for INITRD_LIVE
Date: Sun,  3 Mar 2024 14:54:54 +0800
Message-Id: <20240303065454.4141916-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 06:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196555

From: Kevin Hao <kexin.hao@windriver.com>

- After the commit 26d97acc7137 ("image-artifact-names: include
${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and
${IMAGE_LINK_NAME}"), the image names have changed from
  core-image-minimal-qemux86-64-20230307181808.rootfs.ext4
  core-image-minimal-qemux86-64.ext4
to
  core-image-minimal-qemux86-64.rootfs-20230307181456.ext4
  core-image-minimal-qemux86-64.rootfs.ext4
So we also need to add ${IMAGE_NAME_SUFFIX} to the default INITRD_LIVE.

- The ${INITRAMFS_FSTYPES} may contains multi filesystem types,
such as "cpio.gz cpio.xz". So it can't be used directly in setting
of the default INITRD_LIVE. We choose the first filesystem type
in ${INITRAMFS_FSTYPES} for the default INITRD_LIVE.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes-recipe/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index da919d52f983..2029807d2d2e 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -38,7 +38,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}${IMAGE_MACHINE_SUFFIX}.${INITRAMFS_FSTYPES}"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}.${@d.getVar('INITRAMFS_FSTYPES').split()[0]}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.40.1


