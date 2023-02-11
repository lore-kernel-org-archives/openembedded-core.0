Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C95C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.19584.1676150680131795539
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WGM9ta9t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id be8so10031892plb.7
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzwyH/O+uT7KMI2OIEzlQBxnj1siBUCN+7Kaos9Co3I=;
        b=WGM9ta9tfaYneGk1cYEPGZiQkFtM8BeTbbSqayftvKP7JUrrrJjnbA1Yo8IuZboSCl
         FG9NAVrs2Gb2bf7upi51ZAB+YWtpW7a+fC/Oy6ZsBYiaMGQsxb8ADYvxZy6Dg82RhbnI
         jgeyFFmYrHV6NiT3EOG2gb06xqgYb/OyHkiNERkG/8oHCouQuAzvoF1aj/Vw7tWdjJtG
         BRId9x9gCW6K2p+kjxDy41rdFECpDCVnubPS9k2BiX6ylk9m0RYy/ZFwAzznKQJfQv3P
         FPftqCFvv0ZL3YLadApAYym2Le2+8P/gXWAAbQzWxeio7T5ups5mg864nVqhIC38sAkn
         OgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzwyH/O+uT7KMI2OIEzlQBxnj1siBUCN+7Kaos9Co3I=;
        b=zObY3z81/YAt0/e61rRC6XxNDl9g4GtQzzDVE4EOpe1BuLEFr7GMbN/r8KLoyS8wMx
         7ZWj/DeOoZhgT8hnjoRA+jv4uYDZ4kH/nPzP4zOhzbvHYyPKLJD45/wSLbyADRKE//m1
         UvKfKG66FjVxcAVE04fwEOl21Clf3o15nYnwss24N9GS6rry2K8QTQbGKm/E+NZPDm23
         G78NqpqXYusq85lCjd4rWQ6203p7pZ2rQpbrMa6IedD+Z8cEXfsWluGCqf+qOawCP5JP
         RjSVZ7KgGrIsc34EzZg7C61v0VjjgC3PihumKG/umTdZOquOY/DyA0PISFI03eTCS2qU
         JpHw==
X-Gm-Message-State: AO0yUKXxt4tRQGC4X7fqQMg+eBpIt/PyaDZ9veuySXeCK0VLWSAMEhBW
	M2xAEm9IfWxyX29XQCjGpK5zJ84HKX8f68o1ezM=
X-Google-Smtp-Source: AK7set+eVkZfc4ZlVSLx5BTwj9CEk3NOTjZuZD3C0XmIdr3JNZgm8/2PN++3cQoRYoN4x9StGDkX+g==
X-Received: by 2002:a05:6a20:6929:b0:be:b878:6d77 with SMTP id q41-20020a056a20692900b000beb8786d77mr20504008pzj.1.1676150679281;
        Sat, 11 Feb 2023 13:24:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/28] libc-locale: Fix on target locale generation
Date: Sat, 11 Feb 2023 11:23:47 -1000
Message-Id: <99b3e9101dc931e8d68158e7cf268dd7c6fee84c.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177034

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If on target locale generation is used, it fails at first boot showing
errors about a missing directory. Ensure the directory exists.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2844c9f1bbb729562063d96a3d1cc9d44dafa0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/libc-package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index de3d4223a8..8a99f73ae7 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -51,6 +51,7 @@ PACKAGE_NO_GCONV ?= "0"
 OVERRIDES:append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 locale_base_postinst_ontarget() {
+mkdir ${libdir}/locale
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
-- 
2.34.1


