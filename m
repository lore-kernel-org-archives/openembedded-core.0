Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5BFC98312
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:34 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3004.1790190284527479239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=MZYGSQNB;
 spf=pass (domain: baylibre.com, ip: 74.125.227.40, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9b0bdf5b5so571390e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190283; x=1790795083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7pMoA2SXn2GIMloMAwGzAo9oEt0PkPrmvsX4rfKHKiI=;
        b=MZYGSQNBPI6iHkLMD9QyfY93XtmaAJCwqIDF87BevVDYJwSZZ+knO1tem7Z+4ZJ2tp
         6gVoLS/JMnWgfDAMzGJfGohK0xTgmRUeCGQFqk1fqCyTU5o6AAIeRy6YmrTWEfMR2Dgi
         V28nW82bhsijaHHGsmrXeQxsvSUbjzByvxuRX1+RiogPwfI6goYsrpC1omGe+yrzXHrY
         np1P43oDsE1vMY4tvb3T69r0HZ4SxCpLJjtnBekLkPUat8OXNfC/mSOfPbazZD6jzjoz
         YYNUrGmAxS6i6M2gnlEu2WWVR86UTBrCUTMI288tdR2ZJw29ZtYfoZ7AGCMnBS+iSiUB
         ki9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190283; x=1790795083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7pMoA2SXn2GIMloMAwGzAo9oEt0PkPrmvsX4rfKHKiI=;
        b=mkUgq8VocJ+M7WWq/sXg5VAuhgCLDsCNiwIPtPRbOWj9lBWsNFazCdX9H9ZFEY3LCr
         NzFqeUTReVK8z6d+C+EBZpwE+9feAveQSzfdv+0zMxAM3me+r5FeIZytRhhkDbyfVj0d
         H0PuX48lSBHT515A5hm1DDN+TL9EgnXtRuC3HYBAwddLhubuD7T0kEJXB3Q/rrTScswM
         ppQRc8GIWCFB7YRf5Bx5u3u3s8XyivonZm/LLxs/hlGiSP7Jn/H2OTlwqDmK9R8CmiJi
         U3HMpYmWP/tfPGdJFWkZ5ALANRiq4B2JUlazjvApfL1iip2LyVb10Yt0zhSqFjnvQ4cv
         MLqg==
X-Gm-Message-State: AFuF++lRJM7JcdJIQ/kMXYDhBDLFxrxRiSpq/g7zTheh5/797sDyBjdU
	30PbK7p8a3y8g1A/mUV7usJC8HcelW8xkLbsadw3/9B4gS07SrpQp6PfZRrPiKvdZJk876T6Ns+
	Yu5/H
X-Gm-Gg: AYBFou2G+KVTepStIgdPENeHmZJLCott5fyhTIgIR6kqXy0RJW0Fsp/jnGrxElo48Fn
	1Sge5HGTCia7Ml5DSlarILVoFugb9eknwIW2q2MXuGli7P9r8gZJn85s987WsFIYb3JZvKrArG2
	KiAqUmlAhR2n/a0OpqPlHFoM4N6KqZDwO8NxiLzvz/EKQNppmog0XM+NlgP/bxgHjYwH0VjIFoO
	eR+sG9zNXbZRmN2GIb2xRqSreZIFtyYZjJsY27o9QTDm7Lvby4MGN4rAXTJP4WNR3IYsJ9hcjlA
	6wBneS0bC1skhzYEiLEZRLrSR77Q5cRi3M91PDN/cCkomFRlXbR9C/eXsHPKr5+bZLnGt9lLKpj
	g8MlucIK/xcW4IcNEz9zOQ9xo1EV37eEkVxkgcLM99CwzQZPrdn5Pet5Jlz1lXNN5IwG3smk8Hc
	w7og5Rhw7Fth8XjPsQmfxaK3a2hrS1W2aMn/N1zrAsAf5PYJk1O1lQsIr3zStP+eph7G7Ux/Gz7
	76dwcEebcVbKrV/qixBNUtRBsMFYTGQNsLdDeKQGNXLzw==
X-Received: by 2002:a05:6122:d02:b0:5c9:a60b:e5ca with SMTP id 71dfb90a1353d-5cb0a6cb326mr177656e0c.13.1790190283394;
        Wed, 23 Sep 2026 12:04:43 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c161fsm3951356e0c.4.2026.09.23.12.04.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:42 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 09/13] selftest: resulttooltests.py: add None-pct threshold test
Date: Wed, 23 Sep 2026 15:04:15 -0400
Message-ID: <20260923190419.353493-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246549

Add a test for resulttool.durations.filter_sort_rows(), ensuring that a
'None' percentage (i.e. when both runs round to 0) never satisfies a
threshold.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index c80027bfed..e6e75dd9b9 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -778,3 +778,13 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=50.0, sort_by_delta=False, limit=0)
         kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(kept, ['t'])
+
+    def test_durations_filter_sort_rows_threshold_ignores_suppressed_none_pct(self):
+        # a None pct (both runs round to 0s, see build_rows) must never satisfy a threshold
+        rows = [
+            ('tiny', [0.2, 0.4], [(0.2, None)]),
+            ('big', [10.0, 20.0], [(10.0, 100.0)]),
+        ]
+        args = SimpleNamespace(threshold=1.0, sort_by_delta=False, limit=0)
+        kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(kept, ['big'])
-- 
2.55.0


