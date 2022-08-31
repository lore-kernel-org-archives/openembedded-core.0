Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE8AECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.26241.1661956825220919756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nlt+3VDq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 199so14552668pfz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=3dliMds10YDzHe7Z+TJpQxXzr7RV/uQHKjq8j+Z0KwM=;
        b=nlt+3VDqQNwgGbuVY1rbXtdHLs3S1EcaQDaa8wb/TeIhAwEwAlZMANLPQ6/9hLMxEf
         s1j3gGTebxqBtgWtkkcvSfhyz9SQGwMt+aV2LftGcs1/GcCEYQ2/HNG6tTHj6UFzyei9
         B+g6cuYas179anLcAiBwKwH+7f0VGcXFwbChdl2VXmhUG+0LVWI7LsMKe/i8Qj/YyklY
         zAUxonjPGU3vdPF7QXsbCeCSTDb5NceUa6Dv8mH612N2RRbWZkMClEuslsB4GCuB5yC+
         krh+Sy8CgXTRo8mBl/trSy5wX+foIadLzIhIRe6ULHiZKuw8QSxqktxeFuQeuemvnH6X
         zgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=3dliMds10YDzHe7Z+TJpQxXzr7RV/uQHKjq8j+Z0KwM=;
        b=AWWgqnrIkRJlv2k4GtxGwnnXLmXEG6HcrdEofDT8mxUXBkaOtCiDhbF9mczAJZNz8R
         tOFKnZ8h6ltD/BDJLx/nZtj7X3cMjbffQid63SR4pbYDv0FlogZvcphSpLJBx774L7yx
         qmuSb4bCSbuUL6isNWm6HZNEXMKsKVFb01MvBaPYRvCRMhb5zMN8ia/SwB45f4cH7Fxv
         xh7JmEuMGqN9BGmvLzpW1VQ9EB9xSIvcKtRMWnVb3zeVyzHWd97ibZVFbzw+1YaYTcbK
         8SmkLsDejMRq1DJXzu8QlEz/eWNrRiPaPFAohxM3heXhmBRxTs7eizCyvJvzFZYdnK4s
         pbmQ==
X-Gm-Message-State: ACgBeo0vX21DmxgaCn1zsfh93tmWvJb3rkYxsXmtKD/IVJZ882Dw8npu
	Wu9GnBvUwnNMbBCSiKaAqrIHXpa6iRSRi/m+
X-Google-Smtp-Source: 
 AA6agR5k84BUvI35uwRJnAUDDSVlgPV15nirgdF0k5pVLRrWJVkgJV/WMqTF0wOGFqhoRHnqU92WyA==
X-Received: by 2002:a63:1cf:0:b0:429:889f:4e60 with SMTP id
 198-20020a6301cf000000b00429889f4e60mr22693841pgb.410.1661956828582;
        Wed, 31 Aug 2022 07:40:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] pinentry: enable _XOPEN_SOURCE on musl for
 wchar usage in curses
Date: Wed, 31 Aug 2022 04:39:37 -1000
Message-Id: 
 <701a1aa484e6971ddf9d6c640517a1ff056e699a.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170128

From: Khem Raj <raj.khem@gmail.com>

This is defined for glibc automatically with _GNU_SOURCE but not for
musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84375186570af548b49e44e884925f4feaddcc7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/pinentry/pinentry_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/pinentry/pinentry_1.2.0.bb b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
index 169cac8965..e6cc71a547 100644
--- a/meta/recipes-support/pinentry/pinentry_1.2.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.2.0.bb
@@ -32,5 +32,8 @@ PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 EXTRA_OECONF = " \
     --disable-rpath \
 "
+EXTRA_OECONF:append:libc-musl = " \
+    ac_cv_should_define__xopen_source=yes \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


