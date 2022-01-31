Return-Path: <vivien.didelot@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB2BC433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 15:08:25 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web12.33199.1643641704343261107
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 07:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7KIJ1X7;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: vivien.didelot@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id g10so12175562vss.1
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yu/sdT+UX/VHHqSBsaDq1E+hvStUOekvkktfTQXLngo=;
        b=h7KIJ1X7vMrjD2fRW5PzNc+owYsEj7P8K/xDOHXrr8vMfNIB3MVAnQU4s7HWjD75rs
         jeVOUvrMpz11CGEY8Hws7fYKofFSE+vFxw/MSf8N91ozxBF7uUzpLiz9I33pZWpxUGPB
         U6/V3LupIGW5w1d0uQmFkGA/yGm/22ImYANr8/3vbZKc01rrE6vUGhRkM+pSQwbXCU43
         AGCX3MN/cDAM2ouwSJVv7zRNRWxb91OfhJrgAzNnfKVwPlQI80uvbGg5r6pS3APQAwyG
         B/FekYZYLK99JtiI7sDtwG+pMZ2d8lneVLwCfz1t5HyBhcLVYfw7T9ORZ0kHNPETvdoz
         OLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yu/sdT+UX/VHHqSBsaDq1E+hvStUOekvkktfTQXLngo=;
        b=bH4sE40ia3IOsFfuhTHL0zdDT8uLlKzYTlkpEW/Sepk0u6ShIPLS+a1nPhfRk1q6ko
         sLJ6uApyh4V8RlY2bTVvJchWoJp3qOnMIgBnmPOVBfDDf6abQN+49PsbhhJoOY1A0prC
         1HTcKa29RRZE3ctYFTeqhKKb4ZxfJFuYalltsKU8jOPp6WsESxcMsBnRrq3bzzkmhaEp
         ZigtjoG9OLpb4RLCqjKxxJjFYMirlK4cbWXWh8humWAqUNSydF6mbfkTxfEUyYPw2TUq
         jOM4qwXQsXnxuFQDQdaLeV602Xlk8SEFCQQy1s31Sj9mYunfrQV2OGwvM2uZJqAH/enC
         PPKA==
X-Gm-Message-State: AOAM533Ay9VIaIF50dfxa0Rq1UC+c8uJ+xxSpnsZU7Bt5pk/bno0S5g/
	no1gq+qPz/uaVmYb7WtixvU6anm0w9Y=
X-Google-Smtp-Source: 
 ABdhPJwwZvujsmROgiUdSMeoBV6uLpSFfcF5QFf5w3Y/TZIAhYUutcC8L1WVnTA7qTJ6aXxBnwusWQ==
X-Received: by 2002:a05:6102:2435:: with SMTP id
 l21mr2334089vsi.23.1643641703205;
        Mon, 31 Jan 2022 07:08:23 -0800 (PST)
Received: from localhost
 (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id
 t14sm1899604vkb.2.2022.01.31.07.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 07:08:22 -0800 (PST)
From: Vivien Didelot <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [OE-Core][RFC] kernel-devicetree: fix KERNEL_DEVICETREE_BUNDLE
Date: Mon, 31 Jan 2022 05:07:02 -0500
Message-Id: <20220131100702.3726634-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 15:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161128

When KERNEL_DEVICETREE_BUNDLE is set to "1", do_deploy tries to cat
zImage from ${KERNEL_IMAGEDEST}, but only zImage-${KERNEL_VERSION}
is present in this directory.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index b4338da1b1..2fad475f05 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -91,7 +91,7 @@ do_deploy:append() {
 		fi
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
-				cat ${D}/${KERNEL_IMAGEDEST}/$type \
+				cat ${D}/${KERNEL_IMAGEDEST}/$type-${KERNEL_VERSION} \
 					$deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
 					> $deployDir/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext${KERNEL_DTB_BIN_EXT}
 				if [ -n "${KERNEL_DTB_LINK_NAME}" ]; then
-- 
2.35.0


