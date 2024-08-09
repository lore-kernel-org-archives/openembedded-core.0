Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C383C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 12:22:25 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.82630.1723206140194844218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 05:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dlOhgg1Y;
 spf=pass (domain: baylibre.com, ip: 209.85.210.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7093efbade6so1275620a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723206139; x=1723810939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQuG8Kwu1eF5BynoyvIuseRvXgVIlsdMeeMUFxP9AzE=;
        b=dlOhgg1YXKe4lj4ELK6w+6Daw09HQ0B2pM0GFPMp5XN7uSl9hpwNQH6rtFoyG1+ziQ
         X3kGcBkBeesjdp4WAC2ecqnxRzKpBmEgx5yAxb9M9WzqVK9I8hMCbDMkrXHv7Nc8qcTk
         L9uPuy2s457s7HZ9LSEIR/dTyK2tfl+iFZz8ngI35Tj+df69yNffR9xPxXAJFRtGRtSr
         bzmY8LSWPIvlmvUAGLRQE2top6AZbBgN1iJkmjz7BZO91U1KqitfYUe/2ZNMokvdq0wA
         b2hyS5/bFlCYxPRglxEXfrgZKhVnKg3lNJD4Z/N0a/zf+sF36FQUnIO5c91Xijor3tjc
         7hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206139; x=1723810939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQuG8Kwu1eF5BynoyvIuseRvXgVIlsdMeeMUFxP9AzE=;
        b=b0ZjuypsIRBBFJLe1+YDeVHvvmoGYPZ8eznlcspwwlismROJhyC+DvHgjkPEQTSh2G
         iffMVU9wnbIVL+/a2zPx5a+pS50lmepc+CD+ZWLZABLqwRWtv4nAJtrxZX+7MCmRyz8P
         EcoWkI4536wgiJ/t/fXCdFYHwYYcv9C/f40HRDFmuPQoGOwj9zulcALbKd7054czj5k9
         7k8fguiKOvBc7jqgTqIBeOlc5prvXOzT3NKzK/3b0s2c4Sv9fkxkGwo5I4nGs0JFWP+E
         mywlmcTyBSzJ1nhQ6aZHYcHijEXSN1oMANHXp79rz025323Klx0DDY/zo8N5JWQfuNJ4
         A0ig==
X-Gm-Message-State: AOJu0YyzuFQrrXepkyp0K0T6jup9Xu8qwe80sn21LCkbL1aZqIxVqWPd
	DKPGtUZ9Eu5LM/DVeP/NlfLmmiatcB7bWnnfypwwkJBagOnjU7uniZ0hMOj3NnXX0Jg/7ouIpPl
	A
X-Google-Smtp-Source: AGHT+IGzg+AXEJiX6LEp3+gwhpL0fRq9iaUgJYNzov36R7TE/mtjed4zRV/CQyIG1W5eQBhzvyE8Ww==
X-Received: by 2002:a05:6830:6002:b0:703:5c50:82e2 with SMTP id 46e09a7af769-70b74728af5mr2002300a34.16.1723206139099;
        Fri, 09 Aug 2024 05:22:19 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87183bfsm21059361cf.37.2024.08.09.05.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:22:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
Date: Fri,  9 Aug 2024 08:22:15 -0400
Message-Id: <20240809122217.3825274-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 12:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203168

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 119fe10ca9..5665c90fa9 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
+SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.39.2


