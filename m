Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04D4EDEC66
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:31:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.13491.1694615468483178770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YVhD4BD6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68fc081cd46so3193245b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615467; x=1695220267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=YVhD4BD6cWGhyO8GtTc/4kOru7/SWgPPKfHr6iiExknYr4dgJM8HmEKv1Za3e9g43i
         uHcl8l0/H+VmoUHT/fYU9mfTHhEIqW9aW51e3qClh+DHHK1OdzFfVpEgtJdzUlRoB7B4
         DENOMxVB0Tvj6E0uRJs2xo9xZ/WTMJfQ8BGXIzn117jaRBvvREd4ZAiS4EPG7Oe6d60o
         HEUsAV0X2U/ehKUumQlSnQoB8MbhgC+fEMzdPeXRIvUGdtE/mGGDWmeR3tmBoYPvMrA/
         q98BknYnMN5U/mSkk0gjPH93+2PxpDs1EY6mGdx427CfBmx3r79cHeJUpKbncHazy4R5
         lF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615467; x=1695220267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/N/udGn6sNecScK3cObMOu0ZKZhmOhVngaykRJTIcY=;
        b=aFzrgzmskE28q3sY/k7jrR7RJ5zbcncRfM/cCCUh54DBHQ9mJncifILwVjHgMiQonN
         tfbZgMmvml3xwjYIZHlc5IF4dGaNDP+6XPyxg68yLdk1de5XJVkFTKkdKRhOserhc0CK
         KZuZL63edylC9WEar0DAMXwySkyvlGFOynF8f80xmJMVJ/lWF2SsU3q5t7EgATit85zy
         y1OeyjksNftnwO3LICzF8N7ryK61tIqCWPWFxpPw+hsU6nwSHDKhJA8dOLtIWs+dwpiq
         z4G3aiYzAhFh9tS3B8NPqtKrKJjX+XDw+y2X1Jh/tWq1df+/F6kqYwV7zVqj2xgOtChI
         UugA==
X-Gm-Message-State: AOJu0YwZMPbVyfyQQMJ7OkKDcZJhJTaYT9YSUsoQ/RGZzxBkbwu1ELTE
	Fnk6VF0U94TNng3UIxQNGtamxb4xYTZCz0F5r9U=
X-Google-Smtp-Source: AGHT+IFbY9AesKxOAeCsdWeQNKR0yBdz6muQJujbrv+tzetH1PM1ENjFqM62GrAJS8fh0IH+Wb6G/Q==
X-Received: by 2002:a05:6a21:3d89:b0:133:f5c1:57bb with SMTP id bj9-20020a056a213d8900b00133f5c157bbmr2222725pzc.20.1694615467205;
        Wed, 13 Sep 2023 07:31:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.31.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:31:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] yocto-uninative: Update to 4.3
Date: Wed, 13 Sep 2023 04:30:40 -1000
Message-Id: <26309ba6ef5b776d6bc45b984261b91e6c8c5a94.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187603

From: Michael Halstead <mhalstead@linuxfoundation.org>

Add in stable updates to glibc 2.38 to fix malloc bugs

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39f987fcb20ad7c0e45425b9f508d463c50ce0c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6596c0f4a2..eaa3e9b31c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.2"
+UNINATIVE_VERSION = "4.3"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
-UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
-UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
+UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
+UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
+UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
-- 
2.34.1


