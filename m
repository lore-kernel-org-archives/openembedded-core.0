Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16292C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 12:38:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.80777.1703594296823071179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 04:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jzZVWClA;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d410fce119so10344895ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 04:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703594296; x=1704199096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rm4xfvxH8+dvK8CbjLaQ0Co+dfxYHwMaTaejfq6MGM=;
        b=jzZVWClAYSE/EJnps28J//YdZJfoCMEk6Pa5p5CLWDLp4uELPQIcfugWKI/dqTM3zi
         xnc0X0K/jDMo0xFoBJ39f2BbEHpvWsJpi/4xmJKOLJln09a0Nh8mno4mLvVxL67aj7tW
         yg6Z1GOudJr6ADGFJ3/FwUuLXgnJ3hdp+FnC4vPqPLxjKJzI6YmbfWc6A6lojhtT7Ecy
         gB8pYKo9jWGdpNQ55aiEtq7s/3t+li6H2F+IQDM8Tbxt8hC4srk//Pv+fQciLP7irwiN
         GQ4OpqO/gVZNYMmnl65pzn0gAZA7LkWLfLrfwftPv9FJT3kMTXuzkBUzTw1XOYhumI8l
         BifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703594296; x=1704199096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rm4xfvxH8+dvK8CbjLaQ0Co+dfxYHwMaTaejfq6MGM=;
        b=ibSyu4ETS8tvirmP/T5/c3uCY4ieMSD5KtHMIYLY3u7PEwy5E4JxVOeExEBJcSp3Og
         tsvSJTdlNh+8DWFNSGMu5i4dMeIo6wXfBlTo60kKu3/bSf9p1C1l5sPCcoTl+z1/IwQ8
         03/itFhuNRk5ZZdQlmsDpUYsfQPaN4/8XTmfmqv8ZJUhUw1UKX75/qhHeCMAzvmQrTnS
         whN5Z2RMYvd0x/BSYDB6C7R0OzH48c6sDer0yywojVFs1mux2WkP8D0ARG4AJQLkcVY7
         0sqcmSrRb3dioNgASQjPIUVXshdI3KCPFGdKJ2CwPdDrYtKT4yjX7UleMVdd1OpjNQst
         U2zA==
X-Gm-Message-State: AOJu0Yzd8zOPiE71TKKpg0nMbwPfZU3EvHJAoxyYfvnjn2265QGraYVx
	rrUMb3UpXFr1ASB4L9RgYA/4rwqrMeM=
X-Google-Smtp-Source: AGHT+IHviVwcTRBPrTL7qqcgGnp2CVqdkKN92iKFS2jxkcBy60z6fY2uD1ytwnERsAc5v3vF2FAwgA==
X-Received: by 2002:a17:902:ce86:b0:1d3:eecd:b296 with SMTP id f6-20020a170902ce8600b001d3eecdb296mr13547057plg.6.1703594295909;
        Tue, 26 Dec 2023 04:38:15 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f0ca:97a7:a1ed:752e])
        by smtp.gmail.com with ESMTPSA id iy17-20020a170903131100b001d1cda6bdfdsm9936054plb.34.2023.12.26.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 04:38:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] kmscube: Upgrade to latest revision
Date: Tue, 26 Dec 2023 09:38:10 -0300
Message-Id: <20231226123810.495126-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 12:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192910

From: Fabio Estevam <festevam@denx.de>

Upgrade to the latest kmscube revision.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 4cdc0f06bb8b..aab582281ac3 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
+SRCREV = "96d63eb59e34c647cda1cbb489265f8c536ae055"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.34.1


