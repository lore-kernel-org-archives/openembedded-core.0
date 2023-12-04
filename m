Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5504C10DC1
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.72362.1701705588637596096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aWT5GQcv;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c0a03eb87so14578785e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705586; x=1702310386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALFBlN3RXfM8G++9dipMmPS4BJazwTbEs56PXQLqvUY=;
        b=aWT5GQcvM7rZ0BWnvjh1EeM3Fe03sAEwoORkZHdNqUCl2Andw5oo3LBjsJuIP7FgwB
         xQk+SDfRbD4bAuK20qw/ru6sXaGRzX5k2mjpo0kW/Mc/uGEkXAL9IGbj8krPl4H/cK3l
         OxXYVOfxbYCUy1bUWbGu0XWyXi4YHzO6UvLrRPC6v9eojomHsgnQlPBbI5PDsaL1kxlG
         fBjOj4qhWi5PMMBoCeG/ynylBsCVhafEbmfIRbdBzWCl6K472LJwLe1eM/I5n06oSm2a
         wdGKZ+e1LMcov1qg3Uv1Pt2gOSR71S/leip6QObofSEiia7VDf9vL7KEs9lTbApg5ZxN
         Q0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705586; x=1702310386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALFBlN3RXfM8G++9dipMmPS4BJazwTbEs56PXQLqvUY=;
        b=b2PkVOh9Y5YhgpfQpkxvPvplS+uLPsMDFK2TuvvC+l/4aeK1DEj2eLlt4L07LwaGrf
         Xj4O7Rug+nu4GkCkIaUl7+UIL7sxCHkadgT49pZ2NNHBD19FWbmgZUJ2P7GUijHW0YZV
         Gt0IH1obC4wv8HF5KiKmuOhSEo3P0mE7k9a9F/0hRVKLSBC3ySgoQc6T845+3UEdA7Gt
         PBBzNFFoSek5Jq66CnZM8mLWqV/Qxl7ekpg9NLwgYkDhLdEIsSI972vpCesL/9vc9qa7
         ASoYt5JrnsWve0KfuVlEo0pNdyBzDi5m5HYOwfMq4wIdyyo63exvy9nhAY0iZqhULphf
         zKpg==
X-Gm-Message-State: AOJu0YxwY6r9EVyg2e8qkfF5ZaegKb4BbaRX/fGzJZ4xcJ4h7p2NNx9V
	lbOsPSVvjof841+IRpBEQIzB8YKvvFcG5qe+Fm2h6A==
X-Google-Smtp-Source: AGHT+IG6G7yIosMQzG2R0PY+KaNVw3gF9QYhXWsOc+JKzPvANlTR9S95PkXnRMSmchprOn1Y4H6pSw==
X-Received: by 2002:a7b:ca50:0:b0:40c:aa3:c65b with SMTP id m16-20020a7bca50000000b0040c0aa3c65bmr529306wml.313.1701705586608;
        Mon, 04 Dec 2023 07:59:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:45 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 6/7] oeqa/selftest/recipetool: remove spaces on empty lines
Date: Mon,  4 Dec 2023 16:59:33 +0100
Message-ID: <20231204155934.836992-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191760

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 55cbba9ca74..4bc28a4f2ee 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -853,7 +853,7 @@ class RecipetoolTests(RecipetoolBase):
         self._test_recipe_contents(deps_require_file, checkvars, [])
 
 
-        
+
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir = basedstdir
         self.assertTrue(os.path.exists(dstdir))
-- 
2.42.0


