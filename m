Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFE5C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.6588.1635842586855467828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAy1WtFZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1481157wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMoF2lp+mOJEvqA5vgnX4mQgP69kqpEiXTae2WNNTeg=;
        b=BAy1WtFZ+s5dnbrsicvtKYOFsRqtrGVVcDJI3cd9VZ+mS8ioR/Cz7K4X8cHqlE+bTT
         QX2l7tNxyfs8XAs6gTukk0qmpI3ZY4jT1A+HK/xP7ULRVSV/9DSb+Kss3Z/Mj24Kb2EC
         2Xyu+jZKUaPDW1bWIDTWIJDu8a6YXVRRH8IT3yImDxpyj4828pDS07/68/ADz3+PpNf0
         ZGqhClpyeuBWKn6GpKHPDNGZobDZZRtSkw20XSRrrF3KOfJPJIK3mfj6P/5h6IjwKIeu
         i4S5dstAvi7DiEwAylV5T0C6w4ALfpw/Bq3dD8ZkoYDVOh1Rv/u+gCKcOdRkfVnW7nNt
         doyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMoF2lp+mOJEvqA5vgnX4mQgP69kqpEiXTae2WNNTeg=;
        b=p5NpraCgPoPT+XxkjmcsJjXbEeS/GESBcJtjNFAqOo1i8cUMPCePahLQdnyiU7l32s
         9B2mir339TWd4eZJBkowWBDEijRVdmWK2lAhfjepjb+JQBY/FU7K8QyOzDP/tG3FFxe5
         XsBjIpavLff5JIfvgV91Hl/sqvD+Uzd2n7xRX0zo6HoVBYy0/5TRirtSkGWlqZHrYXQu
         6bCnNYVwlYEhJE8dh3GhYU23+bFwDuhxsXhB7E3HL69NuvDGViFnKGzpanRYsiI8ewLz
         XSDG+5Uc0mfrUOdL0GBJDamPxWTCzAUkP8VaFKqGEEesWcFox2pyueigR8xaDBv+qM3v
         U6DA==
X-Gm-Message-State: AOAM532nDxJewMYNe5oyUIOzfAThs1U98EyWMLbc5kmXZBz7qwX4+QaI
	H6IdSAJFTQshDcNBJjAY3u8qFtc/rAk=
X-Google-Smtp-Source: 
 ABdhPJxXTWscD4JgcEjwgH79DWwaY3ZzhViYVEqvV/JmAvpoi1+Q7+ohZtqT9XdFq8qTXPtMpsGBrg==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr5387340wmq.26.1635842585298;
        Tue, 02 Nov 2021 01:43:05 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/33] curl: submit patch upstream
Date: Tue,  2 Nov 2021 09:42:31 +0100
Message-Id: <20211102084303.2974802-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157739

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../curl/curl/0001-replace-krb5-config-with-pkg-config.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
index a7db1b3c9e..330c6b67c3 100644
--- a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
+++ b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
@@ -3,7 +3,7 @@ From: Roy Li <rongqing.li@windriver.com>
 Date: Tue, 26 Apr 2016 13:13:01 +0800
 Subject: [PATCH] replace krb5-config with pkg-config
 
-Upstream-Status:  Pending
+Upstream-Status: Accepted [https://github.com/curl/curl/pull/7916]
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
-- 
2.20.1


