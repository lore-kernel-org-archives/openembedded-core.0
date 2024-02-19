Return-Path: <wslim87@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BBBC48BC4
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 01:53:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.32412.1708307610041548107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 17:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LaKNmAJC;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: wslim87@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d911c2103aso19132685ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 17:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708307609; x=1708912409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xnmmGktOU4H3Y6wNIRA3zKnBHuLioCYNjBKnDf5VSbc=;
        b=LaKNmAJCk1qMAy938V0XIfH+A38BJc9I0+l6Mw5Wj6ibmTbDRl/qxWm/76g/riDk7l
         eGL8Oz5LouBL8VAAsgnlmscYO+f4ES7jHLFTqS7QMjllRZ5Yf6mDNy+QUVr47nd6yQMf
         T+9pwgJ9cSYk27iXzvvg5xhz6EeVIjtJdNSTS6NJ8I1WSXS9bBDubQG7YAukR4lJ/CKJ
         egYzqAvUuA30qJhOO2Pw2BHWBpUljTW4zKboRsD+6fghNI7KIdtLyIQRZ7o9iZEdegS2
         FUNC+0Qkczwrcqxy29ZIGKiLAQkzUjbbXDwv+jST5YgV4mKfArJHwYhxleHy7j+t/eAi
         bkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708307609; x=1708912409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnmmGktOU4H3Y6wNIRA3zKnBHuLioCYNjBKnDf5VSbc=;
        b=cl4/8GMXtGyyTFqfzV/axp+8CXB/do0Sz1Dk0bi0PTObNGRiBCf86j/USSLF2Uswn2
         jpcSNHDFnWp8fgVr0JLQZuZVVCD6XUoLuJXDv2mHq+bEMlEwzARAMNw5XA5IswJXYF4s
         rNCBjLKn15Limr05Q4XHyCYO2nRgmxIqGlq+9R/PVYKwZP8I0pSRvOlXaHS5y0ohU42d
         hihnLSCy/dGBmIg0Uyaq7cLlwqa72f/12x5txKJy0FoMOWS39CxblGHl3oYFhpj7HbiB
         EREC6y1ei1yEnHyzJ8LNMFdta7jhCKyyUBJvAAWS59z/iQsIb+aFnj1w9Xb5mSDauINc
         MSSQ==
X-Gm-Message-State: AOJu0YxKGCXRB7YY5ZLSyzI8x5ungwHt1TYs+s7q7jYIJKwt1DTI2f89
	BsfSrkF3YlOXJsdH7hyfFrnF0lvhAjGBzAn+/48XcXtzPb7I/QMMjPZJhakJKvHmDg==
X-Google-Smtp-Source: AGHT+IE3pNiJQUpEjBq+GO805PI023IKRWT1+c8pNRrNXBySwM9CB9blUHRyjVdhiiTdZH9enqnIpw==
X-Received: by 2002:a17:902:bf0c:b0:1d9:6de3:9980 with SMTP id bi12-20020a170902bf0c00b001d96de39980mr8846383plb.48.1708307608515;
        Sun, 18 Feb 2024 17:53:28 -0800 (PST)
Received: from archlinux.. ([2001:d08:d9:e466:be54:85da:1506:26fa])
        by smtp.gmail.com with ESMTPSA id v13-20020a170902f0cd00b001d8d1a2e5f2sm3254452pla.216.2024.02.18.17.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 17:53:27 -0800 (PST)
From: Siong <wslim87@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Siong <wslim87@gmail.com>
Subject: [PATCH] useradd.bbclass: Fix missing space when appending vardeps.
Date: Mon, 19 Feb 2024 09:53:21 +0800
Message-ID: <20240219015322.184606-1-wslim87@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 01:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195858

Missing space character when appending vardeps for populate sysroot
causes USERADD_PARAM:%s and another variable to be concatenated into
one word, consequently both variables are not valid for vardeps.

Signed-off-by: Siong <wslim87@gmail.com>
---
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index a58f8287c9..f0ec080920 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -196,7 +196,7 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-        d.appendVarFlag("do_populate_sysroot", "vardeps", "USERADD_PARAM:%s GROUPADD_PARAM:%s GROUPMEMS_PARAM:%s" % (pkg, pkg, pkg))
+        d.appendVarFlag("do_populate_sysroot", "vardeps", " USERADD_PARAM:%s GROUPADD_PARAM:%s GROUPMEMS_PARAM:%s" % (pkg, pkg, pkg))
         if not d.getVar('USERADD_PARAM:%s' % pkg) and not d.getVar('GROUPADD_PARAM:%s' % pkg) and not d.getVar('GROUPMEMS_PARAM:%s' % pkg):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
-- 
2.43.0


