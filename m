Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A831AC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.28186.1658155873210798043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FXel+QQB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id b9so10819519pfp.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3uOrr7pmv04opixLh6bQPRBQN7qKjxjpO6BJi15Y3FQ=;
        b=FXel+QQB3+ZUB/FsHalDjs81cNhxtrhF+Gk5u3g0fSWZrwERR3pMnbOdgvpY4TnL3i
         EXyOCrjQvYDjbNQOhLKHcZtYcEQAM4fMvRwMEkC3q6QwFAbnkAMAzoDhbINQ+87oHI6n
         a69jHeFm95H5vChCxoPoIe9NQbDhopvswXZh5e8DQlvm/6IdnDvEXVeY52NcVwqC1dmb
         QkU66nDvVcpyyWZlCIMEtT/2/Kd+zlcrzZK1lzKdPu8NsPZmwLjD1NoR4wK018bE7oXz
         NSYqu6j7FdHx7WL8GBWC280LBBssHJ7W7DHVfuifritHfAVnkQd1uLCymjDe+/KqBw5c
         29BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3uOrr7pmv04opixLh6bQPRBQN7qKjxjpO6BJi15Y3FQ=;
        b=BNuRaQsxJexp91qeyxhEvf8w+J3GOYBJK2LGUu0pYJynKX9xKGMgSYmKmgHi4h22FX
         ht8nQH6PYXrK6yEwo304preEGOwWsQ4QvPIVokFOjpY6GN5tHr8PLGBrH6PxbtbBlq1E
         e6IIiTaNwkLyhRfd+eVe0rKr/kCC3qbPBLbRretR5O9cBBIf5+5FicKTWkJUfpS+Rghi
         vAZt2O/nCLMKbDB8III7v+Ab82/1wJmLojemChWujNCGRh+kCj2+mZ7kIdz8Zwxy/3T0
         KJ11YHbAKnJDvF0t4DqOaVa4zG2wz/qQnF051VKsHhwqPQc0Lt5iyZLOA+YuoBHwQSxK
         3xtA==
X-Gm-Message-State: AJIora9gkieG/ywypF2d1Vy/UTK96950VWmRc0p0ZB8TDAP7cpWIRxR4
	ztoBfKZOcMs+0V9bKHmPpMX7HKhf32lYSL/L
X-Google-Smtp-Source: 
 AGRyM1tjZr639W9PbHhziHu9cBPFPdBGPvtMQI1OkiBtempHWKEzTtS/BZnbPUY+2APK68d1ark20A==
X-Received: by 2002:a05:6a00:2446:b0:528:5da9:cc7 with SMTP id
 d6-20020a056a00244600b005285da90cc7mr29153947pfj.51.1658155872148;
        Mon, 18 Jul 2022 07:51:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:51:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/35] externalsrc.bbclass: support crate fetcher
 on externalsrc
Date: Mon, 18 Jul 2022 04:48:59 -1000
Message-Id: 
 <73cc5a1cc62df616c2705280c8de27c38bb2ff0f.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168234

From: Chanho Park <chanho61.park@samsung.com>

To support crate:// fetcher on externalsrc, we need to make pass-through
the URIs in SRC_URI.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Pastrick <ripastri@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index b2f216f361..90792a737b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,7 +68,7 @@ python () {
             url_data = fetch.ud[url]
             parm = url_data.parm
             if (url_data.type == 'file' or
-                    url_data.type == 'npmsw' or
+                    url_data.type == 'npmsw' or url_data.type == 'crate' or
                     'type' in parm and parm['type'] == 'kmeta'):
                 local_srcuri.append(url)
 
-- 
2.25.1


