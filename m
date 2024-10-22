Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3B3D2CE05
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.23734.1729616290355568646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=PsyDSr8w;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b1418058bbso440626685a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616289; x=1730221089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWW7hQQtmc+kg5hsOwnyP8XQMvaloTi3KG5Vy1TJYvc=;
        b=PsyDSr8wHHNPJrwPmUBR1PKFnDFtsFZ93kSLnBXZ4FcF1bRtYNPx0SzQgH/nIcFoRC
         l6X27NhjxatKzhnNde9jDDWXxrrHtKBC6RSkCmW+6p6s6MYnpqRIeUGBQarp6S9VsD1M
         fs9i8kWdq1uSM6B2xZXUzlzii7rnqrSIloKVHYaQo9iKUMbV4UozJB1Aq7eUvndkcm/c
         ttd2PDKfW/l/lnQQWYJltFskmaMBZnkiDJEDbqpVPDHz3qWkKWlXgPGG7momQg16eXz4
         VjBWlX5Tr6DmdL3BH5FUuDnIehlFvwOgBCpHIHCF9sHGQViSbHgrI+cwnoIpSDPYVM8h
         oOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616289; x=1730221089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWW7hQQtmc+kg5hsOwnyP8XQMvaloTi3KG5Vy1TJYvc=;
        b=px4IgoRiiPfq55kjTJ1GhJ89YrpaYgn/2KfzdhVEjGS9fZEI6iMG2lpEgm6URdT9C1
         x0JW/qrwlpvsGUJkC7Ddca6NeOP9cD1GZc12u5Q/R4NIWQ9LoSbAXoB2uOz4IZtPcdXw
         8UyTLszf18tyUQmPRUfx2S6wrYuh8FrDGYZMT+oqYwgv2CjMWIP2n2QE3CXrOMfF7qZJ
         6lcY7bnyOO9kRoDfsiHSLNGQI5aGlB6tH1QJUrzLRoAehFkACxC4xMi4VWH8reXovR2C
         0qhLc2Ar1VV0pYpgLn/UUHt423BKG/ZByaod32qcoX7wndmigi6OJtZ15MXO5m/iZ1eg
         ffQw==
X-Gm-Message-State: AOJu0Yy2bhFHJ84vGav14Cj8GmjA9YSvaxoPwpJl03LQ+jemC5NTGj/E
	GRSRfDt4P3fSQOsplt3pRnB3QjkHFN1rvQDOQm9GHvItAcLSUxX13FAwC2W+ZkT5uuXCGLLSss/
	R
X-Google-Smtp-Source: AGHT+IEBOpvTFQIPE+Nd6eD9Q92bA+83S3kzgZjjEHzm9IOxtlXxmfp0QZhWruHlwkXamZokeOm8TQ==
X-Received: by 2002:a05:620a:4085:b0:7b1:45ac:86b7 with SMTP id af79cd13be357-7b17dd0ca35mr13595085a.17.1729616289227;
        Tue, 22 Oct 2024 09:58:09 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python3-pyparsing: upgrade 3.1.4 -> 3.2.0
Date: Tue, 22 Oct 2024 12:58:03 -0400
Message-Id: <20241022165807.2601020-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022165807.2601020-1-tgamblin@baylibre.com>
References: <20241022165807.2601020-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206162

Changelog: https://github.com/pyparsing/pyparsing/releases/tag/3.2.0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pyparsing_3.1.4.bb => python3-pyparsing_3.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.4.bb => python3-pyparsing_3.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
index f256b047e3a..de28d71faba 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032"
+SRC_URI[sha256sum] = "cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.39.5


