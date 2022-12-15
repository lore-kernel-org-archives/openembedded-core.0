Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2959C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.143561.1671132080383036978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6LXB9g2o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d7so7877054pll.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIsLAKq86nR/NKMv7gZjtgfew9+7+WWjBiGhNNp41dw=;
        b=6LXB9g2oUhNvZcgGW8rno8gCh2zPQA6ME1R3MWA8AUlVYkifSjL8RYhn+mR5CYEfdz
         FXVsgblM//WbyROXv6Eh+BLcjpltILwz4CDPW3Nb7h9salSdiksD/a9OQXJSnngrb5LP
         jcuPkDw+Hs5aJVi4RUln2si/QD2SWsBNszDl7BuACk1LPjYDNLzWGU59xr8DeLQmU8ki
         0PlLwkuwIXK/uJlvDmt6RDRnlgBDu+WLBsd9WOiqYO1k+G2SrvRJQgIdyG6V0pzH5O0F
         iJtrfu0LTD/LT6U8wr3rHw8Xb8ywusSAB0PeeM7upGK2URMufhsLEjozg4Xa3KwLCXOX
         SAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIsLAKq86nR/NKMv7gZjtgfew9+7+WWjBiGhNNp41dw=;
        b=BhEPHIwsgV4wzcMQwRHm+Zf0eK4968EKOrXkJ5nSQxsQapt4GDnFg07kWbPNM374MZ
         +ZBHxwhSrQ97UJ3jYZ/Azy3LiFiC5tJPZxt+0AHdoQat8Mf7fznnS9jJGDzgYZ3PfaaH
         t/4AYdwgo3GvwSmc1CbBJ9Ydr4UVta5MX+amuQ4vuODF9TuukRH+yqs7RfAyXJRCoFWu
         COjezBcH4V43qUH0wNG4IfZXHlRl+gBF/TGYn6kK54cm3LYLkpy1R1ZXpoWAeID5tJUc
         3YhvUr0yR/EbGzO5h2qwPfKhgYaxwaeo0/4c5neHo5oLDB+DdsmJU35XC1Ad67Ig+3xJ
         Q8qA==
X-Gm-Message-State: ANoB5plPvk2ykNPxhmz5zAsuiw89SYQXyRK2XR0N0abpWY8QrDnHTGvT
	VbjbjwlLyO0ONxeVHVY2EX8QlWSi87aWbuVf+uo=
X-Google-Smtp-Source: AA0mqf5ONEW3nXUehixLyTBusnfvpqCfBnE9r1UJaeITssLTFpZm63ux5OvAJM7e2zUdvx/BjHzxLw==
X-Received: by 2002:a05:6a20:a028:b0:9d:efbe:52b2 with SMTP id p40-20020a056a20a02800b0009defbe52b2mr42082126pzj.34.1671132079336;
        Thu, 15 Dec 2022 11:21:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/30] kbd: Don't build tests
Date: Thu, 15 Dec 2022 09:20:34 -1000
Message-Id: <4956b3e187e758fec800f903d5b7361d8e409640.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174602

From: Ola x Nilsson <olani@axis.com>

Add --disable-tests to EXTRA_OECONF as the tests are not usable in
ptest - they can only run in-situ - and fails to build when building
with -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ec63f507362faacf49edb22b3c472e54e3cc62c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index aa3ab6e121..7662b8f685 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
 
+EXTRA_OECONF = "--disable-tests"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
 
-- 
2.25.1


