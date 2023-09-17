Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4904ECD13DD
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.27411.1694943552867663787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLNdYDIP;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99c93638322so765971466b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943551; x=1695548351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6n+SSmAYQF+bX9qlLwYV1MT/+6SepRHTahZvHieEvA=;
        b=NLNdYDIP94USLfS28/1nXwOfVgBw97w41lIApeoX1BpxIhKjYKUZW1EIcORxcEA6Ml
         W/2T1cA402qcOZCuF/muEYV4Un7t0kPo2cKR6fdCJeb4uqeqmkqAy3wca70wUlgToafJ
         7FXorSl3s96daE16gOJxEbt5ZNwTYRXYhu9FOFRKLl8jq/6WY9rWJ4G/kLYaw0joLfNX
         fRW2wpsRAIwKorWC+aLEsKq++07LY6CGZKG+iQWl/y8V3pGlCOOi3UsWTeaNiGK7PqIQ
         FGSCVaqnbWiJVbVpjRXdRQgxcB3QvvcxxAzK9XZEs2qGPelFOBgbugyVx4pVkJFEceNF
         SCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943551; x=1695548351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6n+SSmAYQF+bX9qlLwYV1MT/+6SepRHTahZvHieEvA=;
        b=kBnvztE2GeS2tIX9aWgO4nDjncuJ0UXvlGKNn5kmD0WDrppYJ9kBZv88f68RRwuJhe
         ZqTQFIV1819+1eHyUk9r0R94I8U126yyOcwYLApLbn5TV7nhxjyodx3yFI8m5bXd0ato
         6E96neUlx06OeRFFbKPnk9bg5I+6iFSrbHygDKcGMNn3nXMoEc3SGotBGARnlZkzs6QQ
         EX0i79X8673d/kuyj8X9sMgOBkT0BBc6Ve2d72u38OHj6b/7g0Gyzj8MAFnibFVJZUYd
         tKcoS1JHCARpTFeA079zeUY+usqctq9gQe8jAECuqi2UJNneINhE7gcPwp1eG/VGKeua
         5Xeg==
X-Gm-Message-State: AOJu0YwoxKcgDWmtFRF27V0p8rkpe4lXiwbBZlEJETrHhWBtCLaT0iXU
	hh3G6jAPfsEFYJ4lfxyhaZn5llE0Ago=
X-Google-Smtp-Source: AGHT+IEIxyhI0+HcNe5r/X4m86JaOP+z9RdOdHkoXLU8hYA6ZBokXb17DY/51ugh2RK67F4EynytPA==
X-Received: by 2002:a17:907:75fb:b0:9ad:b046:bc50 with SMTP id jz27-20020a17090775fb00b009adb046bc50mr8203067ejc.10.1694943551329;
        Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/29] openssl: parallelize tests
Date: Sun, 17 Sep 2023 11:38:43 +0200
Message-Id: <20230917093901.428214-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187784

This brings them from 15 minutes to just over 4.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 8dff79101fa..10c9b49e4ad 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+HARNESS_JOBS=4 perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
-- 
2.30.2


