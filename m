Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8E7CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 22:31:18 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.31801.1759750840945976097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 04:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=da07Iezk;
 spf=pass (domain: baylibre.com, ip: 209.85.218.42, mailfrom: ukleinek@baylibre.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d50882cc2so923403866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759750839; x=1760355639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NHFkDwbtN6fxGV4HfM6/MckfKYRAoB01edhk52YS2N0=;
        b=da07IezkrTSi0jNnH1aR1fyodDUXIdtKfNykGv+ZVCYrvxpou4haYDcCLqIOAM5uj+
         s4vic3zeu4dixPFlE3DbPxrrGZJ/wf/wEMU7diLnQC6kdVA9bmhHR38/wdS5l72dFA/H
         Of4dtOtj83U7cfY3U6vH5GSiGPLHGp7EPtO3kiu0uh7Vqs4S1eToKkUC7qoPN2AM01XM
         XoK8vDmvQzVzZbLnyxFyrpbDRAdZuTZGvNrZ+qfQtZWsOaHIoZCSAwuiU/2zClpoZt+I
         X1RPJ/P8c7PKAfHsl/Id5CAOJ00tx5RVp83OmZgczyX8nm0As31mjHT6wCPHW+wnlgzv
         mxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750839; x=1760355639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHFkDwbtN6fxGV4HfM6/MckfKYRAoB01edhk52YS2N0=;
        b=Y210GkxQB66bHl4lcsLOg4wwGsG3gTXgJLRN33baIdz9ArYVv4NXnt+T1zBKYS7p+o
         UBCR9u4LP1tr+gu1r2XcNXCd4AWxcG0xRwH1qDEXws2T1Keo85yvvLv4nD7py/t5McuS
         f1aabWv2TpxtTpFvirAQ83Sfp3XryjTKuOVx2k6mgfzmZ0nIXSsPTWfDLB0a+kVWlzm/
         8zproqlZjvzcHj5o2LYF9avFh+rcynH0oUpZ799vL/XcOw4EifCTlWNymtZOGnPi6xDu
         GjgE2HutqXi3DH3tAICqTx6gacCDQXxgz+EejCUpMU03LZ/rO8/CpDnEzZp5RX8duBb8
         rGWQ==
X-Gm-Message-State: AOJu0YzgkT+7B9kSz3lXwpusd5yY47+wi5cjpU8jbYkeWzB50ZCGHxaH
	4NNKE9bsM+cj/zVof8ZAiYsMXX8D/0xmDj/FwadQZdBM1wKcxA03LaXyy+becDaMgV5pHwTf3/H
	JF64P
X-Gm-Gg: ASbGncvoTb7LCxbK/ZhzYn4S7QDp1KApEPjhBtWQUlp4QS6VLDjOY5OZECsbLwVKl+I
	Oj7be/w20Ag0EMGarCvgXd3hsnLCqrM/Cy309gmjbWTJEQBzOLM4l/zP62cO2HQgyXfEElQQBU8
	yrZWkkC5VWHW4hGeBqZaSWBB+9IfJ62t2+EAlEFqUhrvyWqm75Erl+xbIAQcj021kSv2uMZEYTJ
	Aq08+DpvlegZQ4MRF4h1YFpXhr5I4iy9kuVD6/uWscRfmYztWZnIrKLnokLfHC6tQwBDOJmj3kl
	S8GvK4zSEhVS8mv2zPSt1eOyDHlpeV/ZyLGpmGIQBTG/OCTGgJEVUoNMmLNK0plskIwcjIl0kZF
	247JvDxCew3Uq7EVMROuAjb580QFice1UzA3MDMmvrjgVS9w+xznMlqHGJwb9AlU2zgvd5RubyN
	c3XWtBHXHxsuWICQ+yi9dpbwony4UiYoOjsQ==
X-Google-Smtp-Source: AGHT+IG74x83J7p5c+18LydPJsgECZGAbQ9YziaGvqcikiOwhNmG/S2R+jAx0YiWiAaeONMMSKB71A==
X-Received: by 2002:a05:6000:2305:b0:414:6fe6:8f97 with SMTP id ffacd0b85a97d-42567176cc5mr7841938f8f.38.1759750439759;
        Mon, 06 Oct 2025 04:33:59 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6c49sm20598485f8f.3.2025.10.06.04.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:33:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipeutils/get_recipe_upstream_version: pass ud.name instead of 'default'
Date: Mon,  6 Oct 2025 13:33:52 +0200
Message-ID: <20251006113352.2448172-1-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 22:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224508

While all but the osc fetcher ignore the third parameter of their
latest_revision implementation, 'default' isn't a valid name in general.

Since commit 2515fbd10824 ("fetch: Drop multiple branch/revision support
for single git urls") in bitbake a fetcher only handles a single
branch/revision and the only sensible thing to pass is `ud.name`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 102789ce735a..54bc3d766627 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1073,7 +1073,7 @@ def get_recipe_upstream_version(rd):
             upversion = None
             revision = None
             try:
-                revision = ud.method.latest_revision(ud, rd, 'default')
+                revision = ud.method.latest_revision(ud, rd, ud.name)
                 upversion = pv
                 if revision != ud.revision:
                     upversion = upversion + "-new-commits-available"

base-commit: 9f1a1fc1a163e74602d8a359483087f1117f23c2
-- 
2.51.0


