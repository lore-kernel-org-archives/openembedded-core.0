Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4280CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.21958.1655667078683328496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2p/Z2RIP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id s37so8450410pfg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7oA2AhRfIoJhCbkIqQJQSS61zrcaQY4SSRduorD9V2k=;
        b=2p/Z2RIPQ1L0HJFaNBxgebvblisEHfJ9WO3DSfe5+WF0gtFNrr8cLqH/+APJFXauqu
         AaVPb7o1+FKsIHY3kBKftvmmfw9bF0Ce9lubsZQMh8nadnaTuGE0r/IFuzjwA4gWtSb1
         UrARMrMPYZKfefG+bl/6sa5zX1MZwZb24obEUTfEXXlf5YphzCmwCg+N/62Ez+eZFE/O
         VJs2v/Bt5B1aBH9eqXl+/T3zCAlCMvJYpDW9Tmc+PYhsJ4SmOnrzkqM0LAoMIwbi2WtN
         ItEQ2d8PjTYqvQDtfU4fm7As3S2hN4Ulidl8S5fnFmTWKc5Z1qW6Liwh3bCX8i14QBF2
         EEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7oA2AhRfIoJhCbkIqQJQSS61zrcaQY4SSRduorD9V2k=;
        b=wLI1sUCzlpGjMWZPHxTq2shTfCbA/Xe0BTeZm2lGFdfmp4uk8BGVRZRXAXMY1zHT0p
         DvyKX66phSrR9MIZ7/2imxnNzeZupzP6lYuH7yzQdpUVMLRQMAt12jDiL0rEkfFCkkCt
         1qmmn9GqnPETh5LVIM/j2T310bc7oIv3raAl1WOkvvcbd3RnSCwVBu+OqclfxGyK7kfh
         s89JSpNrGbttBun346rzJdmVi3sKioyPTAv/tyP75BjjxSXAjD6gTr9Ih9C1MvUymtr2
         77u9PxtEuD5kVKeHZMfXgKlCoDGIKggrULCKk+xPyJ+NuBxi7sXtv+PcrDn4L3r8bVGP
         /USw==
X-Gm-Message-State: AJIora/fmumAcaA2YnSfxCaoUOegHDKBgbcE9PNaGBKyofiUMumeoOWp
	xFtHwkS9T6eiJWJI1fJ2567kwgHpJzPFAgkl
X-Google-Smtp-Source: 
 AGRyM1u5KnPOy31F8SJLKcYKiRjJJfNzHNLcF4PuvjBvCuALQof9yvs6+qROlBELDfQabgM8ABwaSw==
X-Received: by 2002:a65:6a4f:0:b0:3fe:9ef:1c49 with SMTP id
 o15-20020a656a4f000000b003fe09ef1c49mr18412149pgu.229.1655667077645;
        Sun, 19 Jun 2022 12:31:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] xxhash: fix build with gcc 12
Date: Sun, 19 Jun 2022 09:30:42 -1000
Message-Id: 
 <d8e454b370089e4a33c8373742178ef4d540e848.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167053

From: Kai Kang <kai.kang@windriver.com>

It fails to compile xxhash when '-Og' is set in CFLAGS via such as set
DEBUG_BUILD = '1' in local.conf. Check and disable inline when '-Og'
exists.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3464c67cd34acbb1a6705369e34dee8af7e348ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/xxhash/xxhash_0.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.1.bb b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
index b3b9702598..222ba7b77c 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.1.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
@@ -14,6 +14,8 @@ SRCREV = "35b0373c697b5f160d3db26b1cbb45a0d5ba788c"
 
 S = "${WORKDIR}/git"
 
+CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
+
 do_compile () {
 	oe_runmake all
 }
-- 
2.25.1


