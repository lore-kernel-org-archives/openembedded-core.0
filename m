Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEABDC46CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5140.1701377875399781983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GKkfRpJs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6cbe716b511so1407109b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377874; x=1701982674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR0sNvsIDrPgt44HAwyi4g1vlxO3gpmty61bBam4NnA=;
        b=GKkfRpJs/YIbtvZRB2GKH411CeEocQzng+aZuN/jS8BNRgG1sWbnIXxwuIgNUR3lrV
         gE16MnxpisPMVO8ovnnVvjapr1ERHkWH0GnoQE/2IFxafrPzuMuyGwbCbRvnf9rjhGPW
         p/Xihp3LrVbu0GL8+bxJGOP2RIdfpyiUFbCz3K5rw9zAl3HGE2lOQ6F64F/18849eMj0
         pu3mWPj6GkcSxaLBQoO96s3rt4T6bG/S2x52iJ+7DWs7+9y3u7gXQZHrZ8PqNmQGc3MJ
         KuNf0ee1U1/H0yAGED8odg2/+jXlCZ0aY96S09/okWIWZ1ZG77USFJXcDCMSEsGiARbQ
         UErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377874; x=1701982674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aR0sNvsIDrPgt44HAwyi4g1vlxO3gpmty61bBam4NnA=;
        b=k1yhEdVGA9BvmKdUjx0NisYHcDqsx4dlBVo/F5YdsKgP8Ik6GXHXjidfoAJx3Rlqmx
         3FQly+9k8Qy9DvU9jbu3hIbkSaLPQF2l6ZfQSwPaKVQ3MmXW6E4x34cFkoxHBEKL2BEn
         M4o6FxREDottXvPgNvZkKqtjya4mjw5nZ/wQCat86EtwQCPS0tUWzbmLyHAMaoExlMVU
         +oei2grgGTBvho6C/jZ3SZoxROj9hH3FIfJl42E/9kvEcUDUJJVPrDlXq9DsocJuesVY
         onFTiOCfcdicSvl+stXkCODon/bjvlFvyMBU5r6YXF+Ex5i/RHuwQlKHcf2lHqcFGMeY
         q/8w==
X-Gm-Message-State: AOJu0YwsmHb2Fm4ibXxyfv6p77JhJSyHGAm4nWrgNBw3n0thuRodwf8K
	oOYJCkAZ/LaAV2qsVG3MjY5l3Vv78oQy/0WUpTrGyw==
X-Google-Smtp-Source: AGHT+IGaEr8ltDU2pruDmtMhFCcvxKyH3Cv5SIb+f4iyDv1+F7o0xnna2KddmI+bMn0RLJ/Rj5M66A==
X-Received: by 2002:a05:6a20:3944:b0:18b:3168:d1a1 with SMTP id r4-20020a056a20394400b0018b3168d1a1mr26847858pzg.46.1701377874507;
        Thu, 30 Nov 2023 12:57:54 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/25] xwayland: upgrade to 23.2.2
Date: Thu, 30 Nov 2023 10:57:16 -1000
Message-Id: <afaca63391f3d0318dd9ad79512d8a792e4052a6.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191526

From: Ross Burton <ross.burton@arm.com>

e4487cae1 Bump version to 23.2.2
1e8478455 Xi/randr: fix handling of PropModeAppend/Prepend (CVE-2023-5367)
829a99117 Switch to libbsd-overlay
4f8a851b6 xwayland: Cancel the EI disconnect timer when freed
cc79b2a83 glamor: xv: Fix invalid accessing of plane attributes for NV12
07c18c90e xwayland: Give up on EI on setup failure
10353a01a xwayland: Add an option to enable EI portal support
4f8e209d2 xwayland/glamor/gbm: Set GBM_BO_USE_LINEAR if only LINEAR modifier is supported
c9a842e60 xwayland/present: Handle NULL window_priv in xwl_present_cleanup
2bd43be92 glamor: fixes GL_INVALID_ENUM errors on ES if there is no quads

( cherry-pick from commit 7d0fc94d09db76d4c4d6ca9d2da1b30768f68c9e )

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
index e97a921a96..9feac147db 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eebc2692c3aa80617d78428bc6ec7b91b254a98214d2a70e997098503cd6ef90"
+SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


