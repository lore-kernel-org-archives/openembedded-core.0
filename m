Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42EBC54E73
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.34066.1710728532998911171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x+agqXAD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e67cf739d0so1497127a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728532; x=1711333332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1W8P+YHa0tYHZaZ41j6AyaPdxoNKtvn8GCrnpX4pwI=;
        b=x+agqXADAAre2/83KmvRKyP2cbsK4TpWyMhZNXtEXB2Ytekusfk4UCyGQNFh8uQJLs
         21KaS6WJUgVL0d3HQd74/JlnAnqEb6x3DZNEBhX6BCJUuDn4o61kcXF2MDgMxALH2eqh
         8PsiFUbgOrefSJS2R/PgDVQEpZ7oGm4lq572GDdEnhSWgcsIf01tlMkWlFC6iG+uwH9f
         a10tP8uT4CzjOJxe2xlTotnOdWZBnDsveK8FxeS1cMJO32F9OQcw5MN7Wuwz5nDakFHZ
         hlGos0d5JTADpygsbb/TnojZ6TEITxanBGXe1f7lRO9LZA6bYMq3mOwXq4HFDXUAbSGc
         KMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728532; x=1711333332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1W8P+YHa0tYHZaZ41j6AyaPdxoNKtvn8GCrnpX4pwI=;
        b=CJd7EL+sI2C4Ep0Dsunwd3CAOtVufLgQsVelKPNyMgjr+NaaOarDe2GEP4MtVINapS
         qiCxJMUkZCXbaEfcHlmx8q4OtOp/Bfv0tsUpouPjZQGGhIzWWH1tKpp7yssyrU9DJ5d3
         Lm9GSZvidH7/4/ESnwXpkdNBC2IwQRITT0ZGLDFTeH9mX/d6Lg8dcfbt2foX/6kAJghS
         IlqZQCVCrvyhWS6GmZLX68IDXqo7t6wdt6CNL/xPrQ2nMt7dUMBwT1AXX0La07F7QupQ
         ey1tr0NAkS4MfeJ6Ck3bP2V9uzqSxR4jOTJ8qzOVfL6RGmWMLJuc8o5Oaap2E4bAmeJ1
         SDng==
X-Gm-Message-State: AOJu0YwUh9ebznuN+SgruYXAMW7Q8+e1VcXuOBI7YtqmDodHhP3LDYBr
	6NJNJhwLaC6hg4j/zexBIp2KmnMAKHMGr2+4qoa7AEoH9CXLTFtHlBZE9DMzHEi9kmQD0oiQisw
	kXbkdHQ==
X-Google-Smtp-Source: AGHT+IGlu74e0vDvxPIFmYodqR/ihM/SQmOCY6hcbIIq/qILzRwGa+TjBKWc0bZAm6huMvMaOyTbIA==
X-Received: by 2002:a9d:6e08:0:b0:6e6:7d92:d5ab with SMTP id e8-20020a9d6e08000000b006e67d92d5abmr7492620otr.10.1710728532113;
        Sun, 17 Mar 2024 19:22:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/14] cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
Date: Sun, 17 Mar 2024 16:21:49 -1000
Message-Id: <572ee5512a3d8941c6842af451ca6c9bb75773d3.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197280

From: Yoann Congal <yoann.congal@smile.fr>

CVE_CHECK_DB_FILE is already defined in cve-check.bbclass which is
always inherited in cve-update-nvd2-native (There is a check line 40).

Remove it to avoid confusion. Otherwise, this should not change
anything.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5f3f223885c17b7007c310273fc7c80b90a4105)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index d565887498..8bdb4a4b46 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -37,8 +37,6 @@ CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
-- 
2.34.1


