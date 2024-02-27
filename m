Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17430C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:31 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.2009.1709071048149730167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MofLgYYe;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c19b79535aso2538960b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071047; x=1709675847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz9bHYvM3Dn3dS7kWQIq1olgrVUI5ZZJHfuGrRW9Acc=;
        b=MofLgYYev0VNJ+XflfxtfCkiKGpfd9ZgQd23pXQiBvQtXYU2P3P1XJG4UzAHfLs1F2
         ZcZ+csE2ecOrdY+m/Jq1v/cs1QaNwP9bQtJvGx8c1rGN8OpHxA9LwFi/89i/gW/z3zjf
         WaAQjBbJWP04xiBZbXV8g4DzpSBGmxH9K2edTrCMlUD7N6ncT2yQu/losGxLWxwaZu1g
         /JBTREtrYlUL7WgBn3nkXKnciZ6zywHeq/MU5YHppBcVqwS01NmCLLjC1Kh/F8dJIb03
         OPCh/s+Pa53FrU1knMh4wQXdzvtR10/a3aszQHvLqSVBuejoJl74Pwf8bl2oxjzEbpRv
         QXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071047; x=1709675847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz9bHYvM3Dn3dS7kWQIq1olgrVUI5ZZJHfuGrRW9Acc=;
        b=Mfe3++HBYMx5SmSJm+mW7ZOZgNVxm0Z8Xphxvb8xr/pAhLWPXYJ8XVYIA1i2Vc7jKx
         /WlAMZ/30iLLc/0SniSeH8hjnh1L6wYAexsZ+YiMqB8D6+p8uQtMpzMfMoVXAMraQHkm
         uP4bpi3CJqjSkPU9pUvypl6l/Up6SfcuRcEU6gLkxLTqUWIONMk8YoOCP1DZDZYevqx4
         8n+luFM6auPsPcM1eV6KC76ZeP1xZzWNx3klub0ZDzyvlFiczyc0cariufGKbHuePjNP
         TCPmSMnOeYsJepHWbcBM7O0eDnbozX1MahPZZWlZSsJTEsBEI6KVawy8q5jx84iaNzCF
         Y1IA==
X-Gm-Message-State: AOJu0YzpUOe2fJ+1xaYNSf4CtU3JM48lGBciFfOoFqGj/5Z97RSugDL0
	iM8t5Wam+Z2UbWeRqHnmKEK2uRyzw0BahoD8xeDXtGzVs9u9S9rQ3CL4uIYH0Av2xWwNzJMoFUz
	EwBg=
X-Google-Smtp-Source: AGHT+IGXb67RD3q1Qw71eTJm7bcSYM2T+g5fR44Q7wNQFMe6NJmGav/X0Sv/AsSfiWPKaMb33Ed13Q==
X-Received: by 2002:a05:6808:170e:b0:3c1:7875:1c78 with SMTP id bc14-20020a056808170e00b003c178751c78mr3704126oib.55.1709071047390;
        Tue, 27 Feb 2024 13:57:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] feature-microblaze-versions.inc: python 3.12 regex
Date: Tue, 27 Feb 2024 11:56:57 -1000
Message-Id: <2331982cf4f4649f1ec271640f8f7d33fa6ea88d.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196309

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

feature-microblaze-versions.inc#

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 662f52f1713c9f070550fc0c874eb62312218ea4

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../machine/include/microblaze/feature-microblaze-versions.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 5c37f49abb..658e87b8cd 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -16,7 +16,7 @@ def microblaze_current_version(d, gcc = False):
     # find the current version, and convert it to major/minor integers
     version = None
     for t in (d.getVar("TUNE_FEATURES") or "").split():
-        m = re.search("^v(\d+)\.(\d+)", t)
+        m = re.search(r"^v(\d+)\.(\d+)", t)
         if m:
             version = int(m.group(1)), int(m.group(2))
             break
-- 
2.34.1


