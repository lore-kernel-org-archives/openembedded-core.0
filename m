Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6960FC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:14 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3035.1790190279627835827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Uot4EL95;
 spf=pass (domain: baylibre.com, ip: 74.125.227.40, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-78a4c5c582eso526297137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190278; x=1790795078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B/rcPkV5E6GfN4glogKw7ve5nZfAHdS8Seqwj0/4QZs=;
        b=Uot4EL95cm3aeTOlW4cz7FYbPTr1JFd/SQpD1YkBvJQ2cVhppEjozCE2OaX4ROksdg
         Hduqd57FdcvFFf433U6Eb/Vhc3ZzX7PKnyVmgZua92VeYvjLqLBtKDcU7lEF4u3rwD5+
         iQZyACsHGf1RGY/I6mso+PzqfOwwqFsBK2swK7xpJnygPxdiZR0wq3USJK2ll2FtsYwz
         sY2DUz8JPWYv09c5bKSw8A5pWDcYFCzqdcZI3MbuW2jAei1icIDSKuYGoT6Hk65geA+Y
         1xAsx8dEY1D4SeWiXiTy/u+atYp3U/6pi1nhx1TUHNp3IgBq2twy1r1ytKRykmFBhz+F
         7N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190278; x=1790795078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B/rcPkV5E6GfN4glogKw7ve5nZfAHdS8Seqwj0/4QZs=;
        b=D5dg8NcZ7cJjxW+6y1zrBr5cUhEdBpoF/uexOtXN1OaEu/i2YTlD1qi8u7rS+bsh1/
         zwc9wFgZMzFbIN70yVFrwm07hQ3CG4R93JOvfiOtCYh05czChhAY73nOcpQWyY6hlNVt
         v7dlzXWehvOc9Q3d3aZy30azbHRti/Joo7b7pavTOxeNe7hJF8/vo5EUtKIU1mCmI2zE
         PvxFfRAM1Bi9xfR7gO01dP2lM84Cide1vw01OnDVP9EYYXRrLKqDZjNyAIhMTcDfv7Yw
         NRMrnevhreY6hSN1ouX19Ol4E2Bvmbr50/Mw0Bl6Dp60Y4XEiBWjDWTI0NBbTfM4sJG5
         gVuw==
X-Gm-Message-State: AFuF++kBR8RjOaDxU95ouKNv9wuWUigpVyHxzJkZmHpZWVRPKWVKQy30
	v9dHzI4tOWBE6Jl1iI0Wv8eXEgd1SbFQKnsOCys/NrQo4krEqCT2C5shzhaoHl1/0ChVe1yEdjW
	XspSR
X-Gm-Gg: AYBFou0h2DT4wouERdMeHq547C+lNVlCqGmtDoFR1V2VJQZrrKCgZdGIEqeWooETSrD
	iPxoWam0Dl5tyr+1vQVBorKW21mxZrm8yp8dnwgQQHmFpovsF8UCj8PxH81AzlSGMIp4J7saPuS
	/rnnHXmp9N4JIgu8SD/GCqtLGC2M58QbzkdYWvBkLwPB6ttZEwwswtHZhU/OAfbRtecj5trvfRp
	ClbnH/waI3Zg3UCHE2PxrQYZwnPNLmzXqXFq9xwzYzetijLAtJOqKJx1GgxUZBPTnd9JsA6bYyL
	ACouFGY4F7NIJ7W9KFhuH38/BSvLpKh+GDR2xylaWFUTX4/rhdRbLIQRN9z+5vpDKvbgSDRDtXM
	SMS/yZnU8NqHGyYSs5Q/ZmBjilUBUe8yPGaQk56xZM3qjFGO4BMnUSoQkEBgaQujHolTOzgRWQ1
	1a/vrPn5AZsct0Uu3yzgloIEAguzPI/EqtcSZYi7WqGPY1ZG4PkdBnvJTk+FEQfUh533i3amuSa
	PWdNBx3trXNSdf85T1uhRkOu99K32KMtA==
X-Received: by 2002:a05:6102:4b17:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7af1bd77fbcmr156706137.14.1790190278421;
        Wed, 23 Sep 2026 12:04:38 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm3999471e0c.13.2026.09.23.12.04.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:37 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 07/13] selftest: resulttooltests.py: add threshold-disabled test
Date: Wed, 23 Sep 2026 15:04:13 -0400
Message-ID: <20260923190419.353493-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246547

Add a test for resulttool.durations.filter_sort_rows(), covering that
a threshold of 0 (the default) disables filtering entirely, so all
rows are kept regardless of their delta.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index a884de3949..76bcc53711 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -762,3 +762,12 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=50.0, sort_by_delta=False, limit=0)
         kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(kept, ['big_change'])
+
+    def test_durations_filter_sort_rows_threshold_zero_disables_filtering(self):
+        rows = [
+            ('big_change', [10.0, 20.0], [(10.0, 100.0)]),
+            ('no_change', [10.0, 10.0], [(0.0, 0.0)]),
+        ]
+        args = SimpleNamespace(threshold=0.0, sort_by_delta=False, limit=0)
+        kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(sorted(kept), ['big_change', 'no_change'])
-- 
2.55.0


