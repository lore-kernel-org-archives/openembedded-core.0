Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C01DC7EE26
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 17:37:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.462.1684172271339380227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 10:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KVDComjj;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30771c68a9eso12329907f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684172270; x=1686764270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dATkPclsLhlmy3bJxxWBVuS2XHP5rqp3nHUDTbJ3kIU=;
        b=KVDComjj80MvOnvSa7XZF3x9MTkdvQZyrCbHswu2gTaePBHtda5Ae74gI/ldkKG8IA
         9rM11Mea5+l/mvA0KHT0cQuI98q7R1S5keGhsgI5pQwGGtFczIqPAg9c3XNKx/RZFDGd
         o0/jJ/G3hqX5u0itDbb5DR5Ch/J14//DtJO8maCidVNUlW5cERq7Xa0hFyKIk9qyLteX
         stxcYfxIo4ItlHi4uJ/sjDunbMHR32kqT5I3t238YlpVR/2TUvHxJUGr89erf4fQx20L
         CQP2x1PnPVty7kR03b6h581xA2kXbbmQNCqnURIoY/hx8Eu+BuDML85++6NtKgoVPfsZ
         zD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684172270; x=1686764270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dATkPclsLhlmy3bJxxWBVuS2XHP5rqp3nHUDTbJ3kIU=;
        b=EG7Ca5aZJYPb2xmU4n5m2C2KkHeBnFFEYnnlOauoDsC6qIq9zc0ngav1BXzPh13Rov
         V4nQAxYiYKkDsCkZDtDIHwhvJfIM8BQO9qEUClBkVrkG3glmlGEl43L//YXTHPZpPRwO
         04CW/MXL/CtjJku0yMOMgEZwVmP6wssFU19ZS911xPwZLwwNr23uNvDENgVumz+yI1Vn
         KU9XXWcGWHCtpGagnuZmJNRBv1i4vIoIJfqoIr3ArEA3+T5LzECMc7t8RYI9jUn77RcF
         iVG7k+bRcRJQNIknfvmHJJY+nS04lOJMKyu8RrPObm2QJLqaG28adsENGMexzenhnHxo
         9xDA==
X-Gm-Message-State: AC+VfDzpovUglrori1vcRiNuFpZOnQR8Pto+Mu9Pv0nmDTORAA32eB9d
	V1t0se5T+jKrtwMR5KGxnaeJn3LTJgY=
X-Google-Smtp-Source: ACHHUZ68s59nj6PHtrVwzmHdZzvrAsSHA62wrtC5qoQKfl+HJZcBEAMasoeuAFhRtWsP52As+eEh2w==
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id q6-20020adff946000000b0030632fa6750mr21809863wrr.33.1684172269609;
        Mon, 15 May 2023 10:37:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r10-20020adfe68a000000b003077a19cf75sm398817wrm.60.2023.05.15.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 10:37:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] image-live.bbclass: respect IMAGE_MACHINE_SUFFIX
Date: Mon, 15 May 2023 19:37:40 +0200
Message-Id: <20230515173740.2095615-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515173740.2095615-1-Martin.Jansa@gmail.com>
References: <20230515173740.2095615-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 17:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181270

* fixes:
  ERROR: core-image-minimal-1.0-r0 do_bootimg: /OE/build/poky/build/tmp/deploy/images/qemux86-64/core-image-minimal-initramfs-qemux86-64.cpio.gz is invalid. initrd image creation failed.
  ERROR: core-image-minimal-1.0-r0 do_bootimg: ExecutionError('/OE/build/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.build_hddimg.2001892', 1, None, None)
  when IMAGE_MACHINE_SUFFIX is set to empty in local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index b95e714258..95dd44a8c0 100644
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
2.40.1


