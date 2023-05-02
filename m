Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130A7C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:44:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.3548.1683063873731896092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 14:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WtJkCGok;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30626f4d74aso2383531f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683063872; x=1685655872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lmk3zjPoEzx61zkXwMHGnGBKWOI15h9SPLyTLyJ/jU=;
        b=WtJkCGokLnJp3kq3yEUmo1u4cwd1WNwlCy5wZdr9jtshFIr9OzsY+DuKveyFS5XriD
         CYgb4lprn8JOmNlzpilHL7Rqr/IenS7VBNLBDdTDoNEpw/a6CLvslreN1QaA8khty+J3
         CpCKcQUmUs4WAIRf2ovX1vzs16lM2Fpx99TUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683063872; x=1685655872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Lmk3zjPoEzx61zkXwMHGnGBKWOI15h9SPLyTLyJ/jU=;
        b=XtiZ6qKj+EI4xKCfCf6YAmJVhZnti0ZQyxRN6hjMUNM88t080StdxRj2RkFtXE9g9n
         TJ5BDt9cTg5Ey8c9/LlJuvCyyvtSJldIXi6Of/XWGg4sChmwt33Dj++36tXrvZtcbBz8
         sTxcE988SyXpMhgZMOAAEzE9ATBfqaPE9YQPtA3AAt8zrM9XYTcUy1KgXCkHlWmlx8tg
         e9hfqR7mi9Psyw6Ii3R+vzR2hR2ljpnNGVl6gzPYuWooS2MCyCmgGFu26KdMjHb6cpeQ
         vAGTscdPDPLsWzd6uqXatU9ujgnNuIWyQF849VAYUhSzvcEeSB5SD+5nEtUB5ZxA5Bou
         1K4A==
X-Gm-Message-State: AC+VfDz016JwNPk9snS/ZgsZYKfLMWe+kkqh//JlyV/l8RS1BBDXZdAS
	wLXyNP8NR+pJfDhnTkXtgy7e7aSMlleeIP2YK+s=
X-Google-Smtp-Source: ACHHUZ4e9EuqPyrJUVlxYmF2+TZRWpmBNLBsG/E633Wgmtok7UCKqy71JomQ6iDAqMEn9EFaq14PvA==
X-Received: by 2002:adf:fc02:0:b0:306:36e7:db27 with SMTP id i2-20020adffc02000000b0030636e7db27mr2636382wrr.16.1683063871764;
        Tue, 02 May 2023 14:44:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id z1-20020a5d44c1000000b00304a876c3c1sm16422861wrr.5.2023.05.02.14.44.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 14:44:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-psutil: Drop nativesdk class extension due to breakage
Date: Tue,  2 May 2023 22:44:30 +0100
Message-Id: <20230502214430.2927913-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 21:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180772

We're seeing warnings like:

WARNING: Nothing RPROVIDES 'nativesdk-procps' (but virtual:nativesdk:XXX/python3-psutil_5.9.4.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-psutil-dev' (but virtual:nativesdk:XXX/python3-psutil_5.9.4.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-psutil' (but virtual:nativesdk:XXX/python3-psutil_5.9.4.bb RDEPENDS on or otherwise requires it)

which means this likely has never been working in the first place. Drop it
until it is needed and fixed to work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-psutil_5.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
index c0977c74d30..019ea2dec15 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
@@ -38,4 +38,4 @@ RDEPENDS:${PN}-tests += " \
 
 INSANE_SKIP:${PN}-tests += "dev-deps"
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
-- 
2.39.2


