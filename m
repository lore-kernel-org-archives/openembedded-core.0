Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B1C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2553.1698880279021954983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=UtY1tKCV;
 spf=pass (domain: essensium.com, ip: 209.85.128.44, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso2038385e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880277; x=1699485077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN7ScpIHoHFZpMmQrLEskAiIeB5gMQfYDf5bd+vgIP0=;
        b=UtY1tKCVT+eN9gyqlCLR4mnt5Yd8UgIlz3jNkzswmaeixzh5a+V+nV0YJnzlN4PnTa
         m1tT2zXUk53AESlLwm5MTWsXOmhXlepeXKvZcGCqmCL7U8TsoJ2g20QHRYXq0AvC/U88
         cIQzVgcm2tIZuEOnytsBsl+Nbe05ZppBPGDkNEQ4wnb32+dZ2qCQG+FxK1TkuIoBSn2v
         24p8I5FvnUC4QA9Zf7jblgKX6uOKgWFWLN99Dwv5RMlv/TPjF4YJ2Dtwh6H0k8F2/39b
         sgcVCaO6G42A3faNgrdz/4k+kJGNA1P7Lpk9N8Uo92JLSDbNpXTKTJNcHDVXGPGZ9wCp
         N1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880277; x=1699485077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mN7ScpIHoHFZpMmQrLEskAiIeB5gMQfYDf5bd+vgIP0=;
        b=cWVDTgwhvhXW7BlLNOPtvFikipbURozJfzaMozmgJURnFMHkwKcsw/ZG3fkNc6P9mE
         0MCB7ZCdcy4Wdp82qOKaNgI+wYhtpF2EV76pHAyWk+eMTVAbK41B2Rao3loBzRVSGoWp
         gU4VEmbM677kdgzhlPA98as+QSSz9NXmSlJuPpIoLcO61rM7AIZ8vBtdEILS1bV7slbQ
         6CvJJStBoAV8jLoQhdpz1NbW++QnqVIY1nscKfrSIB6NoeBWnfapaZCWSloqfTbrOeSk
         PwZ+4g97n8CINSX5iG0wk7TCgrM8WVLGCxFFWvcrcD9rKJxOh2bHJoMaJ9OylPtuZkCD
         ssvw==
X-Gm-Message-State: AOJu0YxjZPd81cbvMsPEhjk6PoJjqzcdJlqKDmkdbidGMBbGmeOaNe3T
	/+0xZLfsXwUpyAsi+4Uqvr+mxBWyE9bWSerNv+s=
X-Google-Smtp-Source: AGHT+IHnTqFKKLrq7qmSgCCakFIDfLLwhm4TOmQKoeilyN+BDV3A2bsXvZ15JN/k9p2ADxAIcvMHBg==
X-Received: by 2002:a5d:64ce:0:b0:32d:b031:9719 with SMTP id f14-20020a5d64ce000000b0032db0319719mr13962464wri.42.1698880277150;
        Wed, 01 Nov 2023 16:11:17 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:16 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 1/5 v3] image_types: add python function to get the IMAGE_FILE_MAXSIZE:fstype value
Date: Thu,  2 Nov 2023 00:10:50 +0100
Message-ID: <20231101231058.86928-2-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190049

It returns 0 if the variable is not set for this filesystem.

In case of fixed partitionning where the rootfs partition can't exceed an
amount of bytes, there is currently no automatic and no generic way to have
this requirement met in any case.

Until now, ROOTFS_SIZE value got from directory_size() does not takes into account
the size of required metadata for the filesystem itself (and does not work well
for other block size than 4k BTW).
Obviously it's a difficult task which depends on rootfs size and filesystem type.

The workaround was to set IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
to add the required extra margins. But when the final rootfs is closed to the
maximum size, it's difficult to adjust them correctly. And if you remove
or add new recipes in your image, you've to recompute these margins to have enough
space for these metadata when the rootfs is small, and to not have too big final
image when the rootfs is big.

It's cumbersome and error prone to just have a build failure when the final output
can't be flashed into the partition.

The solution is to follow how it's implemented in buildroot by having a
specific variable, here IMAGE_FILE_MAXSIZE, to create the final sparse file
and trying to fill it with the content of rootfs. If there is enough space,
margins are well compressed and does not consume space in the filesystem.
If there is no enough space, an error is triggered to warm the developer before
trying to use it in the device.

If IMAGE_FILE_MAXSIZE is not set, the idea is to keep the previous behaviour
for compatibility reason and to met other requirements.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 4aed64e27f..be8197f1f6 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -54,6 +54,13 @@ def imagetypes_getdepends(d):
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
 
+def get_max_image_size(d, fs):
+    max_size = d.getVar("IMAGE_FILE_MAXSIZE:%s" % fs)
+    if max_size is not None:
+        return max_size
+
+    return 0
+
 XZ_COMPRESSION_LEVEL ?= "-9"
 XZ_INTEGRITY_CHECK ?= "crc32"
 
-- 
2.41.0


