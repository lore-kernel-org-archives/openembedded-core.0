Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17033CF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:34 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.36190.1727097264754613641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F0rHq1Zh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71971d20a95so2930455b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097264; x=1727702064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiifeqi2iA5evzFTZ4RpLuvd10JpWaqwikORa1nXA7Y=;
        b=F0rHq1ZhltV0XDeOoKSUR7RJ01wPa8jfpXN4ev9iE3Pjk7i//QwUzupj2nJZ0REQbH
         L0IJumsP7X2z7aTpv3n/oQ5Sri+rH3LQSiIAMVvhWnYuEMS6jHexOQq6Ee8+py2n492H
         c2j8fPjqt6hdq2WRwNzs1rLXfApJrop3KupJZaNpSa/fgtusAde1SPHM7OLv9v5qCszm
         Ph0fdkC6VHhxdh1ghRwsUFQbP3iOOlVL8cXlq+rmrIlXrpMDdRPF1PXLpa/rLEWa9/0a
         LGi5uCyGuRsWsgMdQIxfwFjg0JF/WZY3gMpkoX4GkvWsa5gJYhEe3tmsH2u1tRr70wvs
         inGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097264; x=1727702064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiifeqi2iA5evzFTZ4RpLuvd10JpWaqwikORa1nXA7Y=;
        b=RGnUB/Guq1te/3MIGYjwa7sydmj9YEXXH+m1GOcNftvzdWSO9UvVOHg0srRveZWmMR
         miGCoC5LzhOKs/92bdpYhAYMAdkW7dgW9WWanFfyRmrSoxhOKxaZ7hogBsAD5CBu7JiG
         xlnHvSv4USqQWdmlj/2ENKzPOxt5IQ9a6Ud7YLREhnaqimq/a6yBtQOZwKn6yEQLpSnZ
         ZPbgZaVO8PCXhoihMN/O0qXbGUclNhYW+JTwsUsnLeMqDU421EhvXgys+b8mKOYPBuXH
         02kQ86GAIVtKF9d9f7+g4FBBzhTJ9wBegaj+GObcqYxJ/Kry6qDEG0ugBtyzJt8uRuR4
         8bvQ==
X-Gm-Message-State: AOJu0YxV8B4xwXsbIG6hf4dDfbHPOu/5KO7JHif4r8s2x30ytwjtmPzi
	d2agBBGY5EbXzBvYTF8558biasfSjGxPa55n8HeQXEaMaCxiRTVZm1ivH3sOlnmBsFnXd9Ua8kV
	8Zag=
X-Google-Smtp-Source: AGHT+IEr+evnZJdkIRSqn/RVfeT1lEYLXluP4RMxEHU4KQ1f2stATUb1E2RBzmu9pJHFN+vXpIhvZA==
X-Received: by 2002:a05:6a00:1388:b0:714:1bd8:35f7 with SMTP id d2e1a72fcca58-7199c973753mr15103376b3a.15.1727097263820;
        Mon, 23 Sep 2024 06:14:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] testimage: fallback for empty IMAGE_LINK_NAME
Date: Mon, 23 Sep 2024 06:13:54 -0700
Message-Id: <5b4c7a39f7a99d5c98eab3aaf693f4d3000c7ac1.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204819

From: Konrad Weihmann <kweihmann@outlook.com>

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testimage fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

(From OE-Core rev: c7a4e7e294992acc589c62adcaf6cd32659f2f9b)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 0241f29dfb..a91cdb9a1f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -98,7 +98,7 @@ TESTIMAGELOCK:qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
-TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR IMAGE_LINK_NAME"
 
 testimage_dump_target () {
 }
@@ -209,7 +209,7 @@ def testimage_main(d):
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
 
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')))
 
     tdname = "%s.testdata.json" % image_name
     try:
-- 
2.34.1


