Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B652E743CB
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 21:57:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5054.1695938233648999663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 14:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=X8L2Ro++;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4063e3ce085so53741375e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 14:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1695938232; x=1696543032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxG4uhXBm9np0okgEMX6H5ya30bgJg8gxoJqg/99YTQ=;
        b=X8L2Ro++CJBIv/bB8kFjwBnyFIBr+pKYscQwJtlwlDzIQ5cjDhnxxUolxQ7WDXwlSa
         e0RLXtipr/sPspj0pqxViFBVJcPzzPlRB7+KmqTXZl4xlLCYBe5swrjqdgb7ntgsZJu4
         QHafDjH9jNSLng1SDvouhYVnxMeaw/RsCatsLDo0DgnH72nuBeCHL5so9zhpF5lZvIPg
         ddtnMCNz71MMFNBDYr2PfkRIhXMk7uSPcNxJXOyDQGaPNf4vZ5qnngnLKVgcovu/2LEm
         SrPeUXv6qsQQRu5h0iCy6yQrVhxGZ4YN9Ra81cAifMgDI+gB4to34L/DhgHOInH4gAGa
         4BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695938232; x=1696543032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxG4uhXBm9np0okgEMX6H5ya30bgJg8gxoJqg/99YTQ=;
        b=X2rnoR0I2hE8ziyo+Y77lAQ37ol5+zFLKpWIlOlvSIZEuDoAGWLvLWXsxODACk44ID
         RQPKOP0M1e4UqHGlqReTPwt79MVNTZ4PzAjgh8YdB7egnKlLdTkmGjjcnU8qBoRWExFJ
         WSibfz0HBk/+nvD0e07oKPQEwT4dQIWXcwiu/qOOOZrvqnVYfvcuk7TJzKi5LaY2YYnz
         cWYJKUMu8qNSzWW9v0O5dJqlOdlW8W/EbDkr2Myodty7nD2HXvOVgauMnE0BaBjKHySO
         PnpPSMQmYkbNGoKTEAmiu5Lw66XqZLpGOhPjN+RwRhml+gtQJJs3sOChaaJ5PIy99PAh
         i7lQ==
X-Gm-Message-State: AOJu0Yxokgq5eRU5paVyxr9PIVCa7c+o0Jtnv9pccUO/5iPiIo4JLXEJ
	hp+u7tHsAiKrlQP8/wELBspo8+/8qq+1fX9Y3iQ=
X-Google-Smtp-Source: AGHT+IGgcZaryWRrK9VHcYLyssiZ+OzB/dPX/i/OufO+CUf8l2g4oNuWIxiFM18ATTEQ0t4YOIuvLQ==
X-Received: by 2002:a5d:5488:0:b0:31f:ec91:39a7 with SMTP id h8-20020a5d5488000000b0031fec9139a7mr2242226wrv.14.1695938231718;
        Thu, 28 Sep 2023 14:57:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c25-20020adfa319000000b00324853fc8adsm2257044wrb.104.2023.09.28.14.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 14:57:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/2] Empty packages and bogus dependencies (Part 1)
Date: Thu, 28 Sep 2023 23:56:38 +0200
Message-Id: <20230928215640.2683961-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 21:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188381

This is the first step toward better handling of empty packages and bogus
dependencies (e.g. ${PN}-dev -> ${PN}, ${PN}, being empty).

See: https://lists.openembedded.org/g/openembedded-architecture/message/1701
> a) Add warnings for dependencies (RDEPENDS or RRECOMMENDS) on packages
> which don't get created for some reason (either not in PACKAGES or not
> ALLOW_EMPTY). We should be able to properly check this using
> packagedata which never used to exist as it does now when these bugs
> were first created! We can leave the warnings disabled at first until
> we clean things up for core and our key layers

Regards,
Yoann

Fawzi KHABER (1):
  meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workarounds

Yoann Congal (1):
  insane: Add QA check for RRECOMMENDS on non-existent packages

 meta/classes-global/insane.bbclass                    | 11 +++++++++++
 meta/recipes-connectivity/bind/bind_9.18.19.bb        |  1 -
 meta/recipes-core/musl/bsd-headers.bb                 |  1 -
 meta/recipes-core/musl/libssp-nonshared.bb            |  1 -
 meta/recipes-core/newlib/newlib_git.bb                |  3 ---
 meta/recipes-devtools/gcc/libgcc-common.inc           |  4 ----
 meta/recipes-devtools/python/python3_3.11.5.bb        |  1 -
 meta/recipes-graphics/mesa/libglu_9.0.3.bb            |  3 ---
 meta/recipes-graphics/mesa/mesa.inc                   |  3 ---
 .../recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb |  1 -
 meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb        |  1 -
 meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb  |  1 -
 meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb  |  3 +--
 meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb |  3 +--
 .../linux-libc-headers/linux-libc-headers.inc         |  1 -
 .../make-mod-scripts/make-mod-scripts_1.0.bb          |  1 -
 .../argp-standalone/argp-standalone_1.4.1.bb          |  1 -
 17 files changed, 13 insertions(+), 27 deletions(-)

-- 
2.30.2


