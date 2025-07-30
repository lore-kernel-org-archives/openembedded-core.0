Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C5FC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.46615.1753909723192044224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j3/gKt07;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76858e9e48aso232434b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909722; x=1754514522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pZ/G80W4japwGCjlP70+jlGgalgzNC++LvVw+CeWBQ=;
        b=j3/gKt07VBkGqzJvUOeEYkLggXywb69HSSbMIdmmqkWisMyTsJjxXrMoP3EipJQktu
         W2e4QSu8kPGHVVx85K7nJ7Vhba9yPIkRezrg5EdZIyHBMGrWIagQqmj0lWhEua6BrhQ4
         xYj4YPyI+CzqzwIoFzSn1gxB6T6NNbqiSyvS/ek3ze5CGTMWPCNdlggnclYlOAPC+zgn
         sBi0VwoTB8DRB5CJ1X75XQcIx3KfawqCprcJgA1HZr9WsXXdh0E725El3rCBnA46NUbf
         9WSbRICGUVEZbcy/VBjTur0tp3p2YHO7/TyNPOZaPjmI5kFgb2CVOqeUq1LJcROCET02
         FrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909722; x=1754514522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pZ/G80W4japwGCjlP70+jlGgalgzNC++LvVw+CeWBQ=;
        b=oQjIydwU45C6TVPUjGwWBTAV6FqDPpj4DZuqB9M0JIg+MjQIcAIcidak5ciQzCLqMo
         agyhKb0BIqeDJkrQYdQ/koE5sygUB2HSSIxt5AZZgd4DZvr76HFZl4nis70rz+ANk1pZ
         oz79m2g4TjtyBTSGPDosdrpJKS/FMxceu4QAmQgfUwk/esklJdsPuX3zXUVefIAh1u8d
         Qb3DyVfAipiB/7Lt/d3TiCUsnXBNgPY+15I8cJJvr7ZbpLcQY/AgGWb0IBzVlJ5VvMxk
         npNem/xSV3bIxKOULEY6fAPv/ftOVodfG5ddYah+g6Gi4kZYe/RTQ+SMK9UhyDCMKWLF
         u0ZQ==
X-Gm-Message-State: AOJu0YxfD68T4+fbosx0lzel+79OGVCypdw/CTBt+X+Tw5UtR5H9G/aN
	0ez9nTNuKCqpYMLUGYhlrfNgxriJIxW65uFKIjFUHHP3AQIHbZOHpWtiipjCeOHzeOEDfNjBxNa
	Fae2y
X-Gm-Gg: ASbGncuvyEr0CuQrCFKkatPVwvQjIPGabW89ogdnQFCT5k8FeL1NohSHhHhp8WmBY6y
	N1GxJGjk4rz8C/6eOrpxw8MfdVvkP/Vkd4CqLreru7Iox0JrX0VPggBkmkTkcl76LkiqVao9hlk
	1/Gmxy76ln//qeqZ4bxq/9pJqnj8nW5/Y+rlcOoY20O88Omwpaq3rCdgA8fLCCf3H8W6lcXYKTM
	q5rs6kHN2o5WUMLlevkk7eRDRhPm6C2Eh6uMytidrAUF2e7jjd6xqEBOeeoz9lfzZQH08EMoD/F
	3oOeP7Slo2D9Rwv+1XIlmeoWD0wcWexNKd5qNWKca+PISf8p9oMkZECG1Ei9WUPCRcYkN/5MfyY
	ZZSKNBkuB1hWs
X-Google-Smtp-Source: AGHT+IH1cw0gKMniqf9uS1pbx0X73+Ry8VgkKpq3GaJMkodQTzmEpecNGWIN2A7VoyRJvp4USvpDcw==
X-Received: by 2002:a05:6a00:14cb:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-76aae05b1d9mr7411114b3a.0.1753909722355;
        Wed, 30 Jul 2025 14:08:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 7/8] bind: upgrade 9.20.9 -> 9.20.11
Date: Wed, 30 Jul 2025 14:08:26 -0700
Message-ID: <32920c292d96d3f66e50e5cd55bb05bd3adc01e8.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221157

From: Praveen Kumar <praveen.kumar@windriver.com>

Overview of changes in bind 9.20.11
==================================
Security Fixes:
1. Fix a possible assertion failure when stale-answer-client-timeout is set to 0.
2. In specific circumstances the named resolver process could exit with an
   assertion failure when stale answers were enabled and the stale-answer-client-timeout
   configuration option was set to 0. This has been fixed. (CVE-2025-40777) [GL #5372]

For additional feature changes and bug fixes, please see:
https://downloads.isc.org/isc/bind9/9.20.11/doc/arm/html/notes.html#notes-for-bind-9-20-11

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.20.9.bb => bind_9.20.11.bb}                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.9.bb => bind_9.20.11.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.9.bb b/meta/recipes-connectivity/bind/bind_9.20.11.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.9.bb
rename to meta/recipes-connectivity/bind/bind_9.20.11.bb
index 93ff957fc5..8d230f6e95 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.11.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
+SRC_URI[sha256sum] = "4da2d532e668bc21e883f6e6d9d3d81794d9ec60b181530385649a56f46ee17a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


