Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA19CA0EF2
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 14:56:50 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.27407.1694530600469341572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 07:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eTmKbJWJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a9b41ffe11so4270092b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694530599; x=1695135399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrxOd1Qk7NoT7P/eVKA/7io7bwLrRUxOv//BlpxMlk8=;
        b=eTmKbJWJqHEECgGbpncYNBvududpSvoTj2/jJbJDZTJtIIIs5TV3Kodt8Kz1YE0Zg2
         k9JitkQJp5YHpwYoSVxiIDChvkYAsvGCF7Z3Sgom12V//WjrqL0wEiLxi8AQp61KJRkv
         TR6tV3o2HGHK+cwXPU4/TT08lYqrKqYRIg2lpYDw38B9eP+ykmVX0H5ZzN4CSlyDqOS5
         neEgEJVRlrA0Kyu5U0swyGtmpyZygl4AsruS2fgtF1MkDcbMCFK1L2IzhMgm+ravNIEE
         0P7PL7dtcNMJ31+ACe7JM4YrA7YKBl410CTUxsSXTDBiBZaZgclI/RcCuxs+u0iu1a2I
         vdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694530599; x=1695135399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrxOd1Qk7NoT7P/eVKA/7io7bwLrRUxOv//BlpxMlk8=;
        b=M5D7DZmc9FQaOL7e/4jl0NBjTJtVextBLOk6D3RXjRMEn2Lcq21B8IWEpb05GTEC2F
         vhcFmzaStXOR2SI3gDFsE2SlKQmx3R/mXgSNapCVTvH6sRbCaPt7GdYgJraUbWDWm3PI
         RMs3Q2Y/TsFupTCcQ0aXONq7HGcjVzYMpko6o5dzzY9z5TWtEeVGonP9Pki7kgSWfR/K
         1GdERGso+Dpo6hTS+yEKEYqu+IhDVj3IO9+a9CcPEutvHGpztq+dK/c9N60U2twjbwxQ
         J2tgcU5OPrAXUyF7JdWcYt11yK+zHGWy8pbRmuM+n7DqyBu4oA5icGFby5OHGHDnUUAg
         FrNw==
X-Gm-Message-State: AOJu0YzWJ32qUURfiJuNkY324kXSQuJyPV0/G14dW+n+4+hRg9/GDGGq
	3jNjIh2TP7RHVr3gzlc0Ju0A8vwAx38=
X-Google-Smtp-Source: AGHT+IGShkooMc88mOHXBMUIlxzKU/0/iee6W/hrVi//4rc1z1cMGsOwWUeSNSp6CxJYf8HBLvZPtw==
X-Received: by 2002:a05:6808:4081:b0:3a7:4fa4:edfe with SMTP id db1-20020a056808408100b003a74fa4edfemr13354446oib.54.1694530599069;
        Tue, 12 Sep 2023 07:56:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::88cf])
        by smtp.gmail.com with ESMTPSA id d24-20020a0568301b7800b006c0b9ec2802sm4090912ote.14.2023.09.12.07.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:56:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] nfs-utils: Don't start nfs-statsd.service without exports
Date: Tue, 12 Sep 2023 08:56:30 -0600
Message-Id: <20230912145630.1553461-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 14:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187533

Adds a `ConditionPathExists` to nfs-statsd.service. This allows it to
match the other NFS services and not start if nothing is exported.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
index 4fa64e19980..d1ac785b04b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 Conflicts=umount.target
 Requires=nss-lookup.target rpcbind.service
 After=network.target nss-lookup.target rpcbind.service
+ConditionPathExists=@SYSCONFDIR@/exports
 
 [Service]
 EnvironmentFile=-@SYSCONFDIR@/nfs-utils.conf
-- 
2.34.1


