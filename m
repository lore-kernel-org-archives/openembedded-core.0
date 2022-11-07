Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2211C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:20 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.97.1667835431162102587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oqaoicj7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id b11so10932977pjp.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN8UkqRHvdJK0tun2fThiKoBxNDP/jmI8eXvgo2+uZY=;
        b=oqaoicj7uZh4gt5eG0fIwuJdC4FFwW3ybjD/3TW/WMxgIuKsud9Amw/xEpFhMOUYz2
         buPWMjU2Qh78YvQlltIaXraN2Hw5tJLqitrgvFklvcE7HmJ42lh4lfIWfNRU+H8wQ5n3
         8Yth9pAulWNTthV1rusVh0SKQH2vEixoGs2mRPofEF5UgOsRuMA4ZtJHaPhE9b3i4Fmb
         sdaTBI/JrRzLhND8ZhJ8bz0EldRDg2y/Dyb2OQhOlpkpQ7tB/9K7ULHSvkr/R3STn22H
         LjUt+J4Gu7B5zuMN0Y/QeLb5jdJpC0z0NqNg0+d5g8ltbzyk+9PBbc1vfolhqXX3Rph4
         FR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN8UkqRHvdJK0tun2fThiKoBxNDP/jmI8eXvgo2+uZY=;
        b=aklhDnazNue687qSa1xW5hI+hCS8V3A8YRiA+91HwdnGogoQVTQNsUFHEqwXLjuI66
         s3bw9A70YGaA3Ox9DO+rqPzJuZIobuQv3fCHmRLOXz4BOBYL3Ag/h//qf+WeLavIXC7E
         vp9ORy6tbKlbmO819a+97qUqX5FigqkARgYCunoYTQEBRwIT2Yj1KLU2bjy+ua2yqKmk
         eXDSQ2nm3kHd1edrhGt7JAX9sKmiH5h4guuUk2F6+jQxftnnmtGcxoB8kSqvx/bFJbVx
         BEZVkF45keo+QrxgaJCUgBgVPD7OsBIYLZxvZ7yGm+ajMjiJBcSm+Z45KQ9KVOOq8dFV
         9CEw==
X-Gm-Message-State: ACrzQf26HEGFrep7Xn6UyldwlTG0MAz4kZx4AoRJYxCNZ+fzUClP3s+S
	OORtPPpwYC808bSp+bjf07MVIiDyj8POOXlO
X-Google-Smtp-Source: AMsMyM7sWYBmGFJHqJ8257dmdIDzrQnA/Ij9XMs96dh1FD3j+3vdeD0UhC7vSCVCfFaX9RGGlqXtcw==
X-Received: by 2002:a17:902:a611:b0:178:6b71:2ee5 with SMTP id u17-20020a170902a61100b001786b712ee5mr50455839plq.53.1667835430191;
        Mon, 07 Nov 2022 07:37:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/25] lttng-ust: upgrade 2.13.4 -> 2.13.5
Date: Mon,  7 Nov 2022 05:36:27 -1000
Message-Id: <92408e3a14d7f3a8944131ae0cd24e5f1844aa6d.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172907

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* Fix: bytecode validator: reject specialized load field/context ref instructions
* Fix: bytecode validator: reject specialized load instructions
* Fix: event notification capture: validate buffer length
* Fix: event notification capture error handling
* Fix: lttng-ust-comm: wait on wrong child process
* fix: 'make dist' without javah

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 569d6c271bf782cb4a524603693adbbe3d020f92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
index 56200ac3e1..916408bff0 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "698f82ec5dc56e981c0bb08c46ebabaf31c60e877c2e365b9fd6d3a9fff8b398"
+SRC_URI[sha256sum] = "f1d7bb4984a3dc5dacd3b7bcb4c10c04b041b0eecd7cba1fef3d8f86aff02bd6"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


