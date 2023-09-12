Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C44CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 14:56:50 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.27411.1694530607898418378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 07:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YzWl8yOV;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a81154c570so3541469b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694530606; x=1695135406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ycooBT5oZ52LXFtS+Sm23UPcJn1aRJu8IqjxaCloZI=;
        b=YzWl8yOVZkyFNFLgOLIgqekgunQ6OChzFH1TnUa5WqAgNFcSgn9c/9ipjZLu7eirbw
         OfmGv/vtcyu4pcT9A5xNiv1tbxFxptIlzkLXcv2V83+UxrLCwRVhw+XozSCM6TK9Neqc
         HF1HjhVStZ+RkeLR/CGezw++awWey+P8BHQmITwnCMM4eoM7bXxCMMul75q04PwJDbLh
         ERp1jYBou3AUXxVcsu6vHaNyfuV6xyymrgeF5TsUqyJYhOq8Us5d8kaDpaJlyNdPlRZ3
         rGHev6nuwumyyLFjJbEO+CxKewuJAJm7BrKTL7vwTK4p8Ano01nYU1QTdEoAgKh5PPTo
         a0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694530606; x=1695135406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ycooBT5oZ52LXFtS+Sm23UPcJn1aRJu8IqjxaCloZI=;
        b=G2uBwKgRwo5fA0jFqj7k47w2d4utnaTR2jw6HO0Nfl8ldRGW7u9dMJ6ms5DObCSiWm
         9QpJVAwQWIu2w8Q+Rg86XMMr8p4I3w6LAwUl4LniKAMBE6T9WdWXq/YLGvSKYprn9jOO
         z23MT6ZFbRCG1vfx1Q5Ds3Oe8gfFl8YsufOyPYlVXncO/j0/FWrfebq/l26Da2q3oS01
         amt91IFmh4XCxmbcme7wD/Y2+M1VflTn9ogKQN/dvefNryohL3H61OtvB3MQVBo7w4jU
         v4whMz2YqI2/gfiU6wTS+R5n4GS74+4fMubEsKLjN9j8FzQm3IEnW4tcRqgytwSird0j
         lsRQ==
X-Gm-Message-State: AOJu0YyRwKrCdl7Illbo8OQkvCBEcS67zUXdANdO9PMif3zWWBQ5ufBC
	yNfdlwgEGsRC8OU7RL8n8F9nl8YxpzU=
X-Google-Smtp-Source: AGHT+IGv/i0jq+ZjZfnWv4JyMfS8CN6Bfsjjce62EZEAvewY335l8xbQBgBL0Fyo9d6wzwazklqhwg==
X-Received: by 2002:a05:6808:8a:b0:3a9:6400:62cb with SMTP id s10-20020a056808008a00b003a9640062cbmr10004126oic.57.1694530606502;
        Tue, 12 Sep 2023 07:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::88cf])
        by smtp.gmail.com with ESMTPSA id bh29-20020a056808181d00b003a99bb60815sm4267166oib.22.2023.09.12.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:56:45 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] nfs-utils: Add StateDirectory for systemd services
Date: Tue, 12 Sep 2023 08:56:44 -0600
Message-Id: <20230912145644.1553508-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 14:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187534

Adds `StateDirectory=nfs` for the systemd service. This ensures that 1)
and .mount services required for /var/lib/nfs are started before these
services, and 2) that /var/lib/nfs exists before starting the services.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service | 1 +
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
index c01415de842..ebfe64b9ced 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
@@ -12,6 +12,7 @@ ConditionPathExists=@SYSCONFDIR@/exports
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
 ExecStart=@SBINDIR@/rpc.mountd -F $MOUNTD_OPTS
 LimitNOFILE=@HIGH_RLIMIT_NOFILE@
+StateDirectory=nfs
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
index 5c845b7e82f..15ceee04d0d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
@@ -18,6 +18,7 @@ ExecStopPost=@SBINDIR@/exportfs -au
 ExecStopPost=@SBINDIR@/exportfs -f
 ExecReload=@SBINDIR@/exportfs -r
 RemainAfterExit=yes
+StateDirectory=nfs
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
index d1ac785b04b..b519194121c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
@@ -10,6 +10,7 @@ ConditionPathExists=@SYSCONFDIR@/exports
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
 ExecStart=@SBINDIR@/rpc.statd -F $STATD_OPTS
 LimitNOFILE=@HIGH_RLIMIT_NOFILE@
+StateDirectory=nfs
 
 [Install]
 WantedBy=multi-user.target
-- 
2.34.1


