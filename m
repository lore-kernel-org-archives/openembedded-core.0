Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755D9C47DA6
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8419.1705393474524943383
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNQWQB/I;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3376555b756so5259101f8f.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393472; x=1705998272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLxmOWSLj+4LEi9ZlDNGHsMQU71zY56f98sBnO0AlSs=;
        b=XNQWQB/INKmCJxa+r2A9disH3xN9dADCtFduEseSydle5YYgRprgBhZ2qihUAxSh2K
         1JNNe93mU57PxRioj7uU5x+CZaGc8Vtfqy3Xgvz17pEv1+azZ3lZAh8qJts5uJEMDGOv
         r6TTjZHrG9zCkO4r/wJyLicHTW5oLIbE3Yzf+Rauq/k94JZS6xYuUfKvtB/G7WyMp2Lw
         lC28BTHldrjSlZW4KPm7UF+BY3ntN1Q+2Rr3G0ZnW1U2kXMHf7zdQ46W5vFy4tH4CURK
         TbUoTcviqPGi3UvWv810agFop1E3OKfB9hBKxU3QjAEeVaGZCXobY0eyBi5gkZSbRceV
         mrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393472; x=1705998272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLxmOWSLj+4LEi9ZlDNGHsMQU71zY56f98sBnO0AlSs=;
        b=g1Sl2uj7HhQibhy5IVuRQFVvbSD1PpUGNNa+zmD0Jcwt7cFiIfKuTRBQiU3JUVzCpz
         MgM/OAM9b0KRDA44mYkw7gMM+MPycJ4MWvOVDP+yzKRQaeISoLj2clkV82ozJA7dJuHI
         Wyr0MLd9ps2/Lu6LWeUZOUYhjNhcc+KkWjO8YHgXi+ukK6NXuC4trlY9FUpOwVuQJZxZ
         Jv8pGPF2MBYO7PZMQCNgAB+N06a0ie5Y+QOTB4kl30CqJ7QsjSrvHBsDoqO8JH2ykfjP
         xCHm1vQOKom70MBhG1pqXo4JPqNJEwcbblY1FNMkjnOaMXPlz1SOmC0sKvE7Y4kV50ns
         Al4g==
X-Gm-Message-State: AOJu0YwWY0s5E4aBsk9e6mJwzFkmYFyij2Xou00sNn3Sp5soDW8UqKbm
	khM5792QNNx/wEnaLtHpN7LbSzHtY7lXjA==
X-Google-Smtp-Source: AGHT+IH3Ry94M/JwD9fDzNmvI3yN9EqdAPV9wkDrR/UHnRQsHqAYAH/2pkGgJE1Np4qnCaSYS4gTMw==
X-Received: by 2002:a5d:59a6:0:b0:337:aa92:74cb with SMTP id p6-20020a5d59a6000000b00337aa9274cbmr1408368wrr.0.1705393472400;
        Tue, 16 Jan 2024 00:24:32 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:32 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 5/9] recipetool: Proceed even with a missing license file
Date: Tue, 16 Jan 2024 09:23:23 +0100
Message-Id: <20240116082327.128990-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193828

Whenever the recipe uses a CLOSED license, the list is going to be
empty. It's a discouraged practice not to have a license, but proceed
anyway to finish recipe generation.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 scripts/lib/recipetool/create_go.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index 668a24b8dd..035ab9f7c1 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -730,6 +730,12 @@ class GoRecipeHandler(RecipeHandler):
                 new_licenses = []
                 licenses = origvalue.split('\\')
                 for license in licenses:
+                    if not license:
+                        logger.warning("No license file was detected for the main module!")
+                        # the license list of the main recipe must be empty
+                        # this can happen for example in case of CLOSED license
+                        # Fall through to complete recipe generation
+                        continue
                     license = license.strip()
                     uri, chksum = license.split(';', 1)
                     url = urllib.parse.urlparse(uri)
-- 
2.35.1


