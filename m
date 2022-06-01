Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5484C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 19:31:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.2343.1654111868864941595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n/YsWwqD;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 f7-20020a1c3807000000b0039c1a10507fso1640073wma.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Sq58Fz4zvvEoqerWWczBfFOvGV1ImWRoS8973vh8ac=;
        b=n/YsWwqD4ci1sH9JEfjsoUR5SQk6ODjkUg+YOnUg55xFmA9QKpBzVQYDLxqjfvCG/6
         9lZR0eoosvO57yjjdAObbIucoOMAWrkF3PlSPH98kxaabeOJM3XonqFJ8haE688zZGvu
         UYwALt1iSXgHDyRA/NwWZggPeu9ghpFBKX32rAOgOCWuR+Q3+sU29dDWlVzFTMldY3ID
         H2XEa6OYyFLJ2UX5dSC4FEOLr6cPTDMBOaRDUKmcBetP7DTZJ+gd5SO+CT1xnaUUh8hH
         p7CfUgzu1T7CNgppoNRMWkK7VzLMHrR1LE7HLhZ2u01XScCBLoioEvwl9G7a2Pt7MWS/
         brQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Sq58Fz4zvvEoqerWWczBfFOvGV1ImWRoS8973vh8ac=;
        b=pOLHaShRMNc9fqszHRJ++BHNOJIEQ/28uHnt728NIOolpr0SLolEYVxbHNbsMQGx76
         I5FY22nm1MUDQ9VN0Y08vlOmseEOClgobtaumfa7+umZofibkohrkbZm728mnRaBZbmQ
         pB87o1fdO4LUMVuEDFtUvoddxlsBrMODWrF2vcvTl928IqMxt5PgNduiaxDDBmohVlqK
         fI2x43XC4riVWjj+qd/04vGhbERJxIF+pkZuCY++VezcXjwfkfpE6HcX3y8GuHhyUj3y
         YBFUO7tGn+jUBSBgLOwlZAxxtA6r9PtfcSTGWbvWvyQheg9cOavWv/3Qqc7OmwNmNWgv
         NqTQ==
X-Gm-Message-State: AOAM533vnZ+GdrEU/GcMx3tQAbKQmhkDUusMIr+PQRj8bhSM6obZIcum
	6dt8UojmeTwx86zhTRmAB3wmhfDpcf9lUKmE
X-Google-Smtp-Source: 
 ABdhPJx8y5yHDxPuvp+LWV7aBHNnmDlc5rZKcWItQ3dZt7d5JOehBCSSms/Y6e9PAD97+y014lYnbw==
X-Received: by 2002:a05:600c:3ba4:b0:397:47b2:588d with SMTP id
 n36-20020a05600c3ba400b0039747b2588dmr30562683wms.64.1654111867186;
        Wed, 01 Jun 2022 12:31:07 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-242-088.002.205.pools.vodafone-ip.de. [2.205.242.88])
        by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039756cdc8e1sm2914262wmo.37.2022.06.01.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:31:06 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 2/2] files: respect overlayfs owner from lower layer
Date: Wed,  1 Jun 2022 21:30:11 +0200
Message-Id: <20220601193011.1172771-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601193011.1172771-1-uvv.mail@gmail.com>
References: <20220601193011.1172771-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 19:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166440

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Permission model of overlayfs uses permissions/ownership from the upper
layer after mounting. Fix up UID/GID of the upper layer, when lower
layer already uses something custom.

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/files/overlayfs-create-dirs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/files/overlayfs-create-dirs.sh b/meta/files/overlayfs-create-dirs.sh
index 06c7587a6b..9954c34352 100644
--- a/meta/files/overlayfs-create-dirs.sh
+++ b/meta/files/overlayfs-create-dirs.sh
@@ -6,3 +6,6 @@ lowerdir=$1
 datamountpoint=$2
 mkdir -p ${datamountpoint}/upper${lowerdir}
 mkdir -p ${datamountpoint}/workdir${lowerdir}
+if [ -d "$lowerdir" ]; then
+    chown $(stat -c "%U:%G" ${lowerdir}) ${datamountpoint}/upper${lowerdir}
+fi
-- 
2.30.2


