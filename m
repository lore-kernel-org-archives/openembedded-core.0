Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DF1C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 17:25:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7414.1705509011249743133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.net header.s=google header.b=hSB5NOOK;
 spf=pass (domain: meraki.net, ip: 209.85.214.180, mailfrom: william.hauser@meraki.net)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d5ecea2e46so13207505ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.net; s=google; t=1705509010; x=1706113810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BmF0tT0CYvxSwzqnb1NVRk5PGD1JOZxHzmEfwXMbBs=;
        b=hSB5NOOK+Zdk9w9pO3c8gdA66r9+JMl5KrTJPUCXwM2CZa4FL/tBgyGgrr7NLKko1W
         r9nSX1wcoACINb3BJi18JKxAvKeK5EkuHp4EcsTj84hasU2+sXy2p2tVEjXHWAXHYMHn
         lcCQ6HdZI/7iUBmOLZv+Q/BM7ldqLOBi5ZHhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509010; x=1706113810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BmF0tT0CYvxSwzqnb1NVRk5PGD1JOZxHzmEfwXMbBs=;
        b=tgdZeuMIj7WWdphJ7ZgbAZM7O+9/8GKWS7zY4e+M8DilJ8bjOiAsESkhtuyB+DQ8EI
         z3P82sS9LCayBV9qtfgH3fx7x6IXD01g2ut+BGKW47LieBkJi22eZ5cGYfNR5hZdWWlO
         NoJD3RedizbY2Sy29/TUYHl+tI8FIdW/iyJAlFJiC+Dm7jb1ka2bYxi1pVbTZQwR/FS/
         NLRAb9Y+4aMcmr7FqpScLy/05M7+z9YHQ9X2OfiwsKMPMeN9w16I3RgwUyLOTC/CI9KE
         gaz+baAgzkI/K8OaIxHehFMeD+B4V1PP+OJYF8Wke6oEs/pAM4M4c4wu6NIhA/2T2ZBH
         b/3w==
X-Gm-Message-State: AOJu0Yy2Lq+MqY72zWXHO5zBOtjg3gGIzMb2piEIc1J4OHAjqUbqYf1u
	ox56qVvqcN0FqrqSsD3NcGjsNgbOA5Je0EvCZK0vxp9MhA==
X-Google-Smtp-Source: AGHT+IFXPV5FMLk7xEj6ypBCtjOB+JyGbqdcjsshbUGmyOnZPD1X+J1wTtkBdq1jZYsb3N9yOmWO0w==
X-Received: by 2002:a17:902:8d85:b0:1d4:a179:e697 with SMTP id v5-20020a1709028d8500b001d4a179e697mr9801582plo.55.1705509010363;
        Wed, 17 Jan 2024 08:30:10 -0800 (PST)
Received: from localhost.localdomain (162-226-211-114.lightspeed.clmboh.sbcglobal.net. [162.226.211.114])
        by smtp.gmail.com with ESMTPSA id v1-20020a1709028d8100b001d4816958c2sm11073938plo.166.2024.01.17.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:30:09 -0800 (PST)
From: "William Hauser" <william.hauser@meraki.net>
To: openembedded-core@lists.openembedded.org
Cc: William Hauser <william.hauser@meraki.net>
Subject: [PATCH] native.bbclass: base_libdir unique from libdir
Date: Wed, 17 Jan 2024 16:30:03 +0000
Message-Id: <20240117163003.27667-1-william.hauser@meraki.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 17:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193939

Use STAGING_BASE_LIBDIR_NATIVE for the value of base_libdir instead of
STAGING_LIBDIR_NATIVE. This will avoid conflicts between the two
directories.

Signed-off-by: William Hauser <william.hauser@meraki.net>
---
 meta/classes-recipe/native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index cfd299d0c8..84a3ec65da 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -77,7 +77,7 @@ exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 
 bindir = "${STAGING_BINDIR_NATIVE}"
 sbindir = "${STAGING_SBINDIR_NATIVE}"
-base_libdir = "${STAGING_LIBDIR_NATIVE}"
+base_libdir = "${STAGING_BASE_LIBDIR_NATIVE}"
 libdir = "${STAGING_LIBDIR_NATIVE}"
 includedir = "${STAGING_INCDIR_NATIVE}"
 sysconfdir = "${STAGING_ETCDIR_NATIVE}"
-- 
2.34.1


