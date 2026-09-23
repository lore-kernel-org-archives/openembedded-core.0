Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78693C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:54 +0000 (UTC)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3043.1790190293848195891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Z+MUPzKI;
 spf=pass (domain: baylibre.com, ip: 74.125.226.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso471496241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190293; x=1790795093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vcn4Xk0RYHbovD1Lv13ZGM8D7UHyVOTf5efP4CNEAmg=;
        b=Z+MUPzKIhXN7+LAcBpFIw2wZvD/6FeIBxccB9ESXxdDxu6qx06szt0EC7rV0XV+hvS
         GKMsGbec7STeqWPGk8g0dOBuUNeyW50RcVgQ5lUalExCHUpehQHYTdXZUySpeS83GZCt
         xJLyLFWy4NjOBX1U0NBINJZp48Mte6o5gKtHA57had2UasZG02sICe4w9sAUkYD2OFrN
         bQieZnv7FnIJEpTSCuNhcvRICUaTvbDr9BaawgFJhyltX73a6RvVFLYzyM9S53fHYNhK
         BftzFflmWcOmlo1oQ+BW/KzM0ha6fvoR/sZSoUklyKQAi3jOJppYuj1SKhp6XYNRbcG5
         TnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190293; x=1790795093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vcn4Xk0RYHbovD1Lv13ZGM8D7UHyVOTf5efP4CNEAmg=;
        b=UeylBdARev87jce6zf3ke3afMrQW4k35UO2Y7Dbp8yfkO3rkaGxGvTKY7PdLgc12kj
         Q4kvxOjLTC/iN2xowS/lnpZsWru8g1cWBkqwicX5O7s5HwSJl0vvOaI6KILZ68/cY81M
         nr9KlqiHRdyvFQowyHogrB5OrC8OxdC2ku4josN68wGg2tLnwvYKciBzxBb1FHtSWIx/
         pZQ7X5ndF0lEq7mqNYh+RzEmWSVsje2BOUoh7/jM4Agk1/WMhQJHLywb//eXhHXOron+
         scTFTjsGTb8euS+W3RT6TO+DCn6aJZuLa5IKNCouXK8q9z7264AVVpfFu425qp0oInGZ
         1EUg==
X-Gm-Message-State: AFuF++kK+68RztsJJ+z3fnQIV2ZFPUaZ3G7yJhDdqYYTf14hTGiuJne5
	mThV4cBFPqcVHrlpuIF1uq3xWapYASH41M1q8H8v/VEj9f9ATYSVJidbuhauhzSF92+dz5OngZF
	rtj3v
X-Gm-Gg: AYBFou2wTl9TtL+FVR4zo388oIWJjnd2rEpnHZTrzNLjE6SImxoMApBQZGhaNbMQeDJ
	j+tVbordKqj8K5Qyn9/usPjW5WFz7vvVHxYIV5w04PQVo6jujwSWFWNEKEOw2oBbCGGr3HtK+eu
	DBGMkE7DLDTb5ZzHe9qkz8c0GryiPX3sUT2mtUvCDpVh3aIjasPHcCZGh80TN3a9eJ1ZxgaUCVP
	qBX1YUBOa07+tP7v32kbsFIc+9qbSyLRpqBjzYasJ1H5QwGTlWHMNtuxxyPjYbX0bUenHv37Ve5
	EMwADxAOEF/NUqekRN9zu9t2RTrlpu2YW0aoOUIMohEYLi+QU1qlFfjnFcRImlT4QrTWlRr6LRx
	OukpzY23nogD8yM5Xhp5JQh55Qzwv7ZXiUjP1W0CyYPMeyuHH3ToYsP+daxEoXDY58cdYfOggXL
	4W12kX61N85Oxc2PI3Hs3ZBkvX3rescHViwIVsVvCtwsoSqvmlOAOmHOc4fA56Gcj8mSRiRCfXt
	IV7MpNySgdBSfTftZzMxxeTq+20VYBAdA==
X-Received: by 2002:a05:6102:809c:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7af1c99c6c7mr176033137.7.1790190292710;
        Wed, 23 Sep 2026 12:04:52 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516a42fe6sm4283536241.7.2026.09.23.12.04.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:52 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 13/13] selftest: resulttooltests.py: add min-duration default test
Date: Wed, 23 Sep 2026 15:04:19 -0400
Message-ID: <20260923190419.353493-14-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246553

Add a test for resulttool.durations.build_tables(), ensuring that
short results are hidden by default according to the default
'-m/--min-duration' threshold of 10s.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index d93d04aaad..9c3b9bf869 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -855,3 +855,18 @@ class ResultToolTests(OESelftestTestCase):
             self.assertEqual([k for k, vals, deltas in rows], ['ptestresult.sections.longsuite'])
         for title, rows in tables[2:]:
             self.assertEqual([k for k, vals, deltas in rows], ['ptestresult.sections.shortsuite'])
+
+    def test_durations_build_tables_hides_short_tests_by_default(self):
+        run1 = self._write_json({'result': self._duration_result('qemux86', 50, 2)})
+        run2 = self._write_json({'result': self._duration_result('qemux86', 80, 3)})
+        try:
+            args = SimpleNamespace(sources=[run1, run2], labels='', sort_by_delta=False,
+                                   threshold=0.0, limit=0, min_duration=10.0, show_short=False)
+            labels, tables = durations.build_tables(args, self.logger)
+        finally:
+            os.remove(run1)
+            os.remove(run2)
+
+        self.assertEqual(len(tables), 1)
+        title, rows = tables[0]
+        self.assertEqual([k for k, vals, deltas in rows], ['ptestresult.sections.longsuite'])
-- 
2.55.0


