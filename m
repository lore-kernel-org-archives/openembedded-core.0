Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABA9C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 18:02:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.312.1704909721467522363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 10:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/PGvSTf;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e43928c10so6517385e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704909719; x=1705514519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqal3YDDsOshJsJdEC98d0Bga4JomS4ILoB1VZE5RN4=;
        b=L/PGvSTf1yANiQ0TXAxfBnc+4mMdrqynBw7PHBAXfF7xMFaIN2q+LPx/l5PrCLyZtF
         VqNBRo4+0F53AoZu25ml+WYOdrShNe5m/OOHa7CQMThb5ZZJOl29wCDEpDXwsqzV1+zO
         eTZGkXt8iSEhlo4Mf+ZXca2nxwQynOVzabwe9x76NRQ6d6U2eGEPA5EobLQIz/Yv0b2m
         s6B2CcUhaPLFO6T4xrlLwknp5KNB0pmPEQ5kWDWgpY0j9DRKroR2ZLrLH5WCFkXUEnbE
         YLDYycHdKQifdKWfAiDyr3mTFbikAaSMg/BYgyDVTWMXik0hVU6Q4ucQAJcMFMYs1NCt
         7lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704909719; x=1705514519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqal3YDDsOshJsJdEC98d0Bga4JomS4ILoB1VZE5RN4=;
        b=EHwDyaGxK/2sdeA6Iv4KYwPbMREl2XkRsfCHfuMqq74QtNF9Y16YjG/dF8Mjl+jf+/
         4vdw7JfGTAjtfWNJDD7kVV52Q0Tg86phtOAYHp76XYV4RFc762Tdc8kSQxANc/4mgj4M
         9msKHl1GWJcSqlsq40NICqDC9+pj9kqo1EKRqt8JhYEWWixx6YU8gV26Y8biPGSN8YZX
         7IJXjm2nfPZsZRZUjQ3jJWNn4WCIrbCEEbC0xjVHcIyNEFKwVBm3gMEXwtHyvt3b9YHu
         kDOr3KIKvuGix62JwXo+RKGqpTA9ZB382s35l1flpoVDjbSCz5UEuew3XtH9uDJu2hmv
         cEFg==
X-Gm-Message-State: AOJu0Yw5nRZCfD04ieeYk6Jt1GsCPC/ayOZWa5Hx5P9LbfEs0ILM2lXR
	3VgZhDpvW6FBNKmkd/DhfQU1pIZhliI=
X-Google-Smtp-Source: AGHT+IGWazrD/zJ8p5ECNczY3Fa6SW8iTlRiE/AIVRty/6pzt7sdESckkVaeJzDtRljZHBv8W2XT8A==
X-Received: by 2002:a05:600c:1c23:b0:40e:4875:1fde with SMTP id j35-20020a05600c1c2300b0040e48751fdemr1786489wms.4.1704909719353;
        Wed, 10 Jan 2024 10:01:59 -0800 (PST)
Received: from localhost.localdomain (ip5f5af2e2.dynamic.kabel-deutschland.de. [95.90.242.226])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c155100b0040d62f89381sm2993664wmg.35.2024.01.10.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:01:59 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iw: upgrade 5.19 -> 6.7
Date: Wed, 10 Jan 2024 18:01:53 +0000
Message-Id: <20240110180153.43-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 18:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193518

52ae965 bump version to 6.7
ac7e46b update nl80211.h
44686ac iw: allow extra cflags
e2224c7 iw: S1G: add 802.11ah support for link command display
7298198 update nl80211.h
a1c9376 iw: connect: Fix segfault during open authentication
ea706b3 iw: fix attribute size mismatch
cb491fa iw: add more extended capa bits
cf26fc9 iw: Fix EHT rates printing.
f2d9f5b iw: S1G: add list command support for 802.11ah
1bc6ab0 iw: S1G: add parsing for 802.11ah scan IE's
a32046b iw: S1G: add frequency set in kHz and offset options
f5e3b43 util: don't print EHT info if not present
7794573 interface: print links
221875e link: update for MLO
5f64b70 link: fix some formatting
29555e1 iw: scan: set NL80211_SCAN_FLAG_COLOCATED_6GHZ in case of full sched scan
997e5f1 util: add support for 320MHz bandwidth without cf1
81d112f util: add support for 320Mhz bandwidth
de3da80 update nl80211.h
d6fd275 iw: event: fix printf format error
cc660cc iw: add support for retrieving keys
c4743bb iw: info: fix bug reading preambles and bandwidths
82e6fba iw: add cac background command
ad2f2f8 iw: info: print PMSR capabilities

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_5.19.bb => iw_6.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iw/{iw_5.19.bb => iw_6.7.bb} (90%)

diff --git a/meta/recipes-connectivity/iw/iw_5.19.bb b/meta/recipes-connectivity/iw/iw_6.7.bb
similarity index 90%
rename from meta/recipes-connectivity/iw/iw_5.19.bb
rename to meta/recipes-connectivity/iw/iw_6.7.bb
index a19ae304d5..b46b54bc93 100644
--- a/meta/recipes-connectivity/iw/iw_5.19.bb
+++ b/meta/recipes-connectivity/iw/iw_6.7.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[sha256sum] = "2a44676d28a87bbc232903d5d573e7618e4fae0cea3a1aff067a26fa66652b75"
+SRC_URI[sha256sum] = "b3ef3fa85fa1177b11d3e97d6d38cdfe10ee250ca31482b581f3bd0fc79cb015"
 
 inherit pkgconfig
 
-- 
2.34.1


