Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0439FCD492F
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:34 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.3195.1695249092788808135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WLKkzUfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-34fcd361e91so1036815ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249092; x=1695853892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ikBdKbffiMK3Hqf8Y6j/StX2Tmh0ZiMYRNalirBmew=;
        b=WLKkzUfjZ5JMykYxMDh4YU7qlWSBrdrzt8jG6e2anmx5yYiHFdAv1NU0x9YyGw3tyD
         LZ8ixoNZFti+y6i9hU7ezOrLQp3QM7JYLZispJGmG1jPjHXUBiaX9F0k0fGIXAA9kLhx
         EEaxV4kg3B8n3/ATcQ/+AJeC/EEBOn/Hr8QBY3xMvZ+xcLTPRyfeN9atxHaFZ+UaqAAp
         Mj3UOKYl5mqGiOPZ6CsdJV22ylv6TLRrckZuuy6GOc+Mp128xkA03n7gtfeANdASW1KP
         k7X/tSLIGpdkqknWCDwY9bz4UXJFgW9Wy3G4vksQ/URFpCG8YuL3SqxBzwJ0HOM4fnUG
         SI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249092; x=1695853892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ikBdKbffiMK3Hqf8Y6j/StX2Tmh0ZiMYRNalirBmew=;
        b=V7BfqFFgQbE8buaUvLGBvlbMJQH2ig/GuHJ/wbbbb2u7NtR61eXi6rzRJADggg9J/O
         Al+vHnAr4G7mYkhoqTL+Ikoui1FeYvYSFlOigO7E1dYBpJR0THnwtKK+GVTOguOWn0h6
         CtQKI0Htt5j8c5aSNTfCgp+WXf4Y6uffPC+RZdKqOAHHajyg5oNr0WZJXSKoXs508zfg
         WzMDM2v1Ix7bH8hOhyXHB8vwIC6tP1okdY2HAMe3JJ+mCcpyfYye36ma4amfWEoXK1qq
         y4KCnyccBqbcETVf/AUCJDVkeBFNX03fbV0gr7ojCAtopYaozsFbC0KspOZOvX7ML8RJ
         o8oQ==
X-Gm-Message-State: AOJu0YzZdAUP8c157TnHTPKpNXJfcwkMRa7U456yLcPzLfPO5RZn8nH2
	OZ0c+/6/sH0t33Mbd3TlZWq/ieKjfXFk37ocq10=
X-Google-Smtp-Source: AGHT+IE8QFYbvma/GMI8giDv13Gst2HD3F/HAoH8Lu1o0OqaJe4FsiiHeYWrOOL6vk35z038cnGoHg==
X-Received: by 2002:a05:6e02:1a8f:b0:34f:2cb0:5d0 with SMTP id k15-20020a056e021a8f00b0034f2cb005d0mr4535370ilv.30.1695249091725;
        Wed, 20 Sep 2023 15:31:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/20] build-sysroots: Add SUMMARY field
Date: Wed, 20 Sep 2023 12:30:53 -1000
Message-Id: <29fe45fe8857f72705183a87b4e85a3723900a78.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187964

From: Khem Raj <raj.khem@gmail.com>

Fixes build QA warning about [missing-metadata]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f4c7130f11c069ab18c374dcbfb1276ef37be60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/build-sysroots.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index ad22a75eb2..72da88921a 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -1,5 +1,6 @@
-INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "MIT"
+SUMMARY = "Build old style sysroot based on everything in the components directory that matches the current MACHINE"
+INHIBIT_DEFAULT_DEPS = "1"
 
 STANDALONE_SYSROOT = "${STAGING_DIR}/${MACHINE}"
 STANDALONE_SYSROOT_NATIVE = "${STAGING_DIR}/${BUILD_ARCH}"
-- 
2.34.1


