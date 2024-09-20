Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098E7C78849
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.18275.1726839571515402228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=icmtnKd+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718816be6cbso1585945b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839571; x=1727444371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2s+jlZy9q610+trA3pSYKwI8NIFnfoHF5Rezwb+tW9Y=;
        b=icmtnKd+OH9GdkAIH5etZ82gBKgI3ysUkkiCVVsAIz4J/6WK8V38sd3Fn5YXTc0O/b
         apEIjYHs0ep0bXMyrbRwmgDtFt/PigffsyGvOmC7AuAQxfpRuP64i2PzfcfFG8P3/6JP
         VcG5qPUtCC6EV+KBtAY7H69khB79PYMFJt5ZRcMLE3YAj+r4DISuS0cKo2oaN1iGEUiw
         sJX0m3yeoK2+Ty+XjAQJL4i0BlM5iNjbby44BpI3J760P/JdQeBAMAxodP/BlKEebQKA
         CoH+vKobh4x5yzccUCZThUHzPyNBCy8Z3y7jpz3+n2HRwFvRDoVZWmYt18D4SFImGAq6
         361Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839571; x=1727444371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2s+jlZy9q610+trA3pSYKwI8NIFnfoHF5Rezwb+tW9Y=;
        b=JBKkAkUIVrXn+1C+kf4uTD//vZKlHngWPdeOEs9Txy/U8O24UP6dLewGPptEQfJClv
         1MRvMDcX+G4IzhrtxpMmhrKgLWNi32p1tvUhkmr5Ddp/+KQ9juUsleBmaAwbBlF/FBaK
         JMAshCO3NwHEGsBTlTL9dlOOXyklJVDmfR5dWiq2nG0TBtXdABxq2vqOAzcRrvygppEO
         gf85+nvMVzDh8Nu9Tdx8dgwyHr1Q+7wGtVAXxNvu7N8uaXx2HrCjkRHCZNRwu2ExAuTD
         irZXTx3PVovIUIwLMQo62Vj5YGTolaQwCIyYCAGhsDVykw18s9alAv26Ka7fhdmQNRL6
         2skg==
X-Gm-Message-State: AOJu0YwsV90jf4PbT/J/XyxXdyAS0QXT0CH8wKhYk1dqsicHQDu1aLos
	6t6J+exqOQ6tdNCFtAzV5CiT26sedb+UwpXzIu8EV+Y0YdIOf9mPNBfC5CtwW4BEh3zMduUHWKA
	R
X-Google-Smtp-Source: AGHT+IGANA91+AG7MzmzUqLjqfTqeBEgBZL98B3jvOqY2Rxh5bWDRiorWwYW9nkse58zQKoC+9kuJg==
X-Received: by 2002:a05:6a00:178d:b0:717:93d7:166f with SMTP id d2e1a72fcca58-7199ca4a382mr2895683b3a.20.1726839569218;
        Fri, 20 Sep 2024 06:39:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/16] python3: upgrade 3.12.4 -> 3.12.5
Date: Fri, 20 Sep 2024 06:39:02 -0700
Message-Id: <ae0e8f6932359959535e901e64bdb47189de14cd.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204744

From: Trevor Gamblin <tgamblin@baylibre.com>

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

(From OE-Core rev: d9e2ebd6b24b802d1d4cd38b3b910e068c308809)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 3ac83166ac..5c3b7a92f8 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
+SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


