Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59B7C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 19:53:10 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.16377.1711223589930361708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 12:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=K6VNEtNF;
 spf=pass (domain: limonsoftware.com, ip: 209.85.210.41, mailfrom: anibal@limonsoftware.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e68d358974so1504024a34.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1711223589; x=1711828389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgJpdTyZdArhux6BIfCLiSAvofNiF2B64au2qELLyzA=;
        b=K6VNEtNFWXA7oWYIDTHWSzwzpfYaQZZh94qpNKXLXpjeAYSkveNv7G266zPnUsfi/A
         C6PQ4a4+Qz9VSHXVFaanne4JdUTYVKQXDZhTxrjuwNVMkCEWWwzPXsWflX8rT63Qqt5C
         Iiuy4gVCEOQxGl0V5AJQn+9x/crXcTqlWzM6ry3JvWS0JEHOpx4Su3PuUxnVaz/2ZBTu
         GVwpzrn3l8sd28qiXxc6u1vZjv+n0an84O2OzOG6dT8tgRVsMQDi8V5kd7J+a7ebCrI+
         QkUuq/+3yj0DHHsS0Hl+CEs4EtP3Z2LANGK6MeP2KkLnz+EmF745Xh/pYuW3bjNHI/el
         SCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711223589; x=1711828389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgJpdTyZdArhux6BIfCLiSAvofNiF2B64au2qELLyzA=;
        b=Mj/oW9sMXm6mdFEA4iJTPcv5/E/ts6Jye6h+XlR+0+Gsp63OlTmBHMWegxyMOwIvIm
         EyMkdIkssCbPw7FPVg4T8JqLD6tD/NK4nv0RkqTWpSuPoUSpAVc3+LnQA2hbKKF+QjxW
         ZuvBAdgLq5Gwnuj0c4xtJ97cXyIrDgN80xiS5UVsrHnJboMtnrUB+tga9wmdBMj4vWkn
         leByGYelNMJHthWWzYKoyU5dgcpyu+UzjOB00Hk9uxOr9YXK9ESVt6OgW2DAtr37jSqD
         TKQ8SATyfDa6fcomtPV5YYgCHO+Vc2TvJxBjWEyQD38yGkc6dHqIooaOl3Wtboui3ItA
         KyAA==
X-Gm-Message-State: AOJu0Yz4hozyspypFfsP+GEYsIu1OVBidpvDx1E5rxZwas/5ijRlBBo6
	2qT9f2lxTAHTh6vr23fXSwI89S89Bic/d6k3MFPpEyP+60pHhgKeQMMjhw9Dk+bKzUz3g/Myzs6
	U
X-Google-Smtp-Source: AGHT+IHM8Ynz0Fd1wWHkGtwHnUBfIK/0LdrcmRoHkoEXEmElLNgcgIjBIpNiqhbtdhcCqcTlDRjOSA==
X-Received: by 2002:a05:6870:8a07:b0:220:c9cd:b2b6 with SMTP id p7-20020a0568708a0700b00220c9cdb2b6mr3867282oaq.14.1711223589059;
        Sat, 23 Mar 2024 12:53:09 -0700 (PDT)
Received: from blackbox.. (fixed-189-203-87-105.totalplay.net. [189.203.87.105])
        by smtp.gmail.com with ESMTPSA id et13-20020a0568705ccd00b0022a0bedad96sm440475oab.12.2024.03.23.12.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 12:53:08 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH 2/2] wic: plugins source bootimage/isoimage rename to allow be imported
Date: Sat, 23 Mar 2024 13:53:04 -0600
Message-ID: <20240323195304.2909926-2-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240323195304.2909926-1-anibal@limonsoftware.com>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 19:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197471

Python not support importing modules with - so change to _.

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 .../source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py}     | 0
 scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} | 0
 .../plugins/source/{bootimg-partition.py => bootimg_partition.py} | 0
 .../wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py}   | 0
 .../source/{isoimage-isohybrid.py => isoimage_isohybrid.py}       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-partition.py => bootimg_partition.py} (100%)
 rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py} (100%)
 rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py => isoimage_isohybrid.py} (100%)

diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-efi.py
rename to scripts/lib/wic/plugins/source/bootimg_efi.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg_partition.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-partition.py
rename to scripts/lib/wic/plugins/source/bootimg_partition.py
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
similarity index 100%
rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
-- 
2.43.0


