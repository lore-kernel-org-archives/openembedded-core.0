Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F45EB64D7
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:33 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1241.1687401384109320502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hRvafqbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso2701302a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401383; x=1689993383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=hRvafqblQV0JKs7rD/+2L1EW1ywpLwg94KHJXLPp09gBomxHezBfCd6z5BwIxclotG
         a+Aaa4OZLyz9kHwg2NKOc7OWbh5klGIzHf129i93SKNRwtnMuUykb+BQdpteTuyLh1iC
         MY4JiQn1DURhBPVlHAazXvXvQXpJeuhmY6JNvGPQYGN6ItIY9aA5SoB+L4M1vdxTzro6
         cWTC42PpE8igBA7zr7jEzd2bd5I4okRX15GW3FxiWfo/L4Y/BlvspbeUzhz8ULrox5RG
         cWJfpeEPhGvV00Issau3t1/Zwym4P73ILxgRS/V8+uIVdDOVzvutd56ftfOfBXbd96LB
         Yomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401383; x=1689993383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=TUeZkq2zyJEgV4d9GJk7skioDjnrsFMf6ZQhZL/3GJEFJ/7+PtdScOQ1oRf8+TsIZi
         sMoHFQG/l8b0h0UFyD0Vzc6GxxCsQDafXyX4NtNU7Nd2nES1mnC7Y/ycZuP7NKMnrYsi
         QxjewFCCSWwY8UcenrSCCy/P+I5TVMikWN48uh4vArUtmOJC2k/mG6cjpCxOymwmMp+r
         OJOBylbzekEsIE9/K7dakbEC2LHBVt4ZT+8KlzOu2S/8+S72ZsQl5Lm/xSYt6GVoujya
         PzChg4b/yV76A9d9PWdz2WQhFBV3BxqAxr3Mu7qFRW0fi7wXSEu6LzfTdcXp/ts2G3IF
         WvYw==
X-Gm-Message-State: AC+VfDybkGffu8RShvIjP8/2VXSJSXoyhnnJ6QywKZG7d7a4hyxm6cp1
	oLVYVSP0YoOCknTHzFYuVfhsiwXC9sMYUwoLafM=
X-Google-Smtp-Source: ACHHUZ780H5FV8vZxeIgKx62UQBBMKE0qYrkAcAXphGZTg6HV65lBUt4vweynDZCvj0KUPQ29nW70Q==
X-Received: by 2002:a05:6a20:158f:b0:10f:6529:5442 with SMTP id h15-20020a056a20158f00b0010f65295442mr16858271pzj.49.1687401383226;
        Wed, 21 Jun 2023 19:36:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/23] mobile-broadband-provider-info: upgrade 20221107 -> 20230416
Date: Wed, 21 Jun 2023 16:35:41 -1000
Message-Id: <387a26b9bdd54aff6984d22693145eed0a71e932.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183209

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 125f72393c9b6fea02757cdc3a22696945e0f490)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e802bcee18..a4030b7b32 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
-PV = "20221107"
+SRCREV = "aae7c68671d225e6d35224613d5b98192b9b2ffe"
+PV = "20230416"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.34.1


