Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F11BC48BF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4902.1708035441082531418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YRrOc+71;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso8404135e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035439; x=1708640239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vpudt6jNN1yAEoz/e+sUy9Utg2xomIy1upS1JCnxes=;
        b=YRrOc+71ULT3Dq2glBU44G9aJBA6BXqUHtbRqT3A7prgRiEtwtyEkHZDH3/18hJoUZ
         7o8HkIJVXjfVTRWQf5W1e0CNWhKR4F0WbwDCZQpW0WzJ6p1IKs7UYlQ0C9ePSj2L0ANc
         vaobFHQJlCxkfxoeiV8ieIPf+d4kTe3FC+0z5b+iZaZpONR5iLfdXST2zK+HsyJxf/8a
         KkJjvJk6IfuPHEd2Fd+Qk99qTP7aYRy96ePncW90/RCEaF5Udku+nXASNxDjZJ3eku0h
         0lbuy7Bpa0uJS9rbTGd8HYgcI4tSvVDwz7Bo5e4GUExWrjuHpz6+4Me8aL+FrKT2aOFL
         Ehzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035439; x=1708640239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vpudt6jNN1yAEoz/e+sUy9Utg2xomIy1upS1JCnxes=;
        b=YO8MI6SW7kxgycOsMZEWPoNeFwmeOALp8i5ax02gvr1Xo3I+vf/in1MRev/HPzTnt+
         MiXfaZM7bl2+KZjHFIgYCfbkEsQi4cE3BmkoyJPMtPusZ7BxKrXLlVHEcnA/sEZdh6nH
         rZmT70bdGA/tksIMNIi4YxMIlfl/s1RBS7o087E4jITVZOfd/hwz7NDSkgvYRLOJ/gte
         PlxSBiNjq8gU7GLYRkXABDJhFhEboCLutkpjHwkiaXkRVhqGJ5aPeA7rzbZ9tuXEKkQ6
         z3nP+K+zcREUyGQSnrHVwGxg3KVWtAFfKrGCaeKY6yWmcPdfaOBY2aQXLskHpnnX4+pK
         XOLQ==
X-Gm-Message-State: AOJu0YzVytzWxHSjbsH9lxGs17kOO5ai+Ev8UWfOU/E2tbm5J0YG3axg
	RG3bvNVu0LhJttixsVp9I6zVSOozs/oZ6QtdzK0W1p+SYDd36edM4k2JLVmM/8Q=
X-Google-Smtp-Source: AGHT+IHipCzBKRrCSGdyPXJFA1fbsjybbASjbucm7LVRJUm88CYge3lBP7U20UYd11PqdBy8QMd4Bg==
X-Received: by 2002:a05:600c:1d81:b0:412:107d:cd69 with SMTP id p1-20020a05600c1d8100b00412107dcd69mr2819272wms.1.1708035439336;
        Thu, 15 Feb 2024 14:17:19 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:18 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 03/12] populate_sdk_ext: use ConfigParser instead of SafeConfigParser
Date: Thu, 15 Feb 2024 23:13:49 +0100
Message-ID: <20240215221711.332614-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195714

From: Ross Burton <ross.burton@arm.com>

SafeConfigParser was renamed to ConfigParser in 3.2, and the
SafeConfigParser alias will be removed in 3.12.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Cherry-picked from master: 71b3e7f71727137b4b996cc4160c9cc1581824b8

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ca1b7753cb..bdd86863c6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -227,7 +227,7 @@ python copy_buildsystem () {
 
     # Write out config file for devtool
     import configparser
-    config = configparser.SafeConfigParser()
+    config = configparser.ConfigParser()
     config.add_section('General')
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
-- 
2.43.1


