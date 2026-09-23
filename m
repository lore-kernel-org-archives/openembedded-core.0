Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C050C98310
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:04 +0000 (UTC)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3031.1790190273458535601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=V3bOJPjP;
 spf=pass (domain: baylibre.com, ip: 74.125.227.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so812399e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190272; x=1790795072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rq2PUkUgDF4QSQbcT7VM4ag8ooc0+5lyOlpRL8Qfk0c=;
        b=V3bOJPjPbFdZ48JPtAaYZWJtm8qs/NrhOWaGJqyBdVuAR/0yyJixDZs1d4zmkZuLZ+
         TZn8IQV7ZaNjTrIeYbUUmCEFtBIYmbaf8ftiTukXOoyqh7qqt81MqfW6DkM1u4s4yjBD
         Dl/PxDUhODcgOCMOnxqzqdFEnk68k0xFik0U4liyfFOtx8zUvk66+AYbmIbWXQ3YIhxN
         x9SJBKTNFuLcvsPKLRGEm2398LBfeELLLHzd6MuiKb/ojQLPRWWplOHavFHMfLNjF4ZS
         pSPMizh+pmOugxD0EiFUcM4r8FkoMZHUTVPflLq+RvuYRDVp5V6YY85deWyAzv1+l5bW
         qNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190272; x=1790795072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rq2PUkUgDF4QSQbcT7VM4ag8ooc0+5lyOlpRL8Qfk0c=;
        b=TXg6RMYnOuLIjDpyiwe6n4Pv1/MFTm7ZJDC/8TQFhW3HdyDMGPl48ST9x1cjn7LCJc
         pMSw9khm6jQA9Ryo3ZM95ZlW9+twCdyLycrRAE2wQhMaZIcVuJrHXBkuEDMej1h3T5Sv
         nhO35EdafK6qq6GLwihTkOI3gZuXse4KfppBd/0dNOV7jN+fUfDRDJld0YgHevtf3I9r
         3I7ECWYgy4z4PV2PeLgYPoW8J7vzRdEYJlOb1Ou6oMfLzdUVfh8QPIo8SJlFCpphFhJ6
         AiemeEIXkTgDHZFk/OGVlIZ3ihWeBr6vL/Ib9UZFzN4teVEcbvcp+CIybolSYfjU/btf
         qy2A==
X-Gm-Message-State: AFuF++kd1m0asu9mXsZ7PkzygAzs1KW+SfSDif7Eoweeb+mbwPyGxY2n
	ewXurOgApYqYoAya7vcJx3vrNJrGAwQxCkD8NSA6nIWNigZC92ebo28QsvW9t+XWpbbvohlKxUu
	rwNRR
X-Gm-Gg: AYBFou1o4ToBQdzwQuMhVQjP7EjyabIb+CHBxWO3cUV9roji7cX0+vLzbxzy2peEgSD
	+aqIxtwXtjgRbyyky+gySp3zlgpnpf6mJJPl34LqOhcbHn+OQOvbC9USyWxVLPWPxrz9VTx9BlC
	Scds8i4bgMpupPBC0QY+hwixBXNBT1Z+yNrchE+ZJBmuMvkV+QH/BWOIPHin/juFWeyLTRnPPJ1
	2K83r2j71Fn9kEM9w9yFCCa1d6pd9BeNbE1sN/k+R6p3bBHk7cOd2JX7yuHHlJOnvr4UBeSHwks
	M7gr2UDz2Z5RRWVez9jssV5w0UquA2FGB/G5YZt2zdrPOLz0hljRsweFGp9rwPF4X+qtRfbFrgm
	BLUsJbUzlRk+eDUICA7V56l26+hCAqvYezeHcnNDJ4aeKRxb8heBO2Xhawfa9ysXtfSIk2o+v/e
	AVd5QluhK+TRk7mtv9WT5cvI0lB6s56eOLc0J35A7sEVIVt1r7OLTt+/hkMCSlQ/cDDB1paqIHz
	r+tnO2KxluGVyzDJpRytMhmDS0AViRlRg==
X-Received: by 2002:a05:6102:5e91:b0:796:1ed:ba47 with SMTP id ada2fe7eead31-7af197369admr189441137.0.1790190272186;
        Wed, 23 Sep 2026 12:04:32 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm4015858241.12.2026.09.23.12.04.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:31 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 04/13] selftest: resulttooltests.py: add zero-round pct suppression test
Date: Wed, 23 Sep 2026 15:04:10 -0400
Message-ID: <20260923190419.353493-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246544

Add a test for resulttool.durations.build_rows(), covering suppression
of delta/percentage reporting when durations round to zero. Times are
reported in seconds and fractional times can be calculated, so we
don't want to show (for example) RUN1 = RUN2 = 0 but a large delta
because one run was many fractions of a second faster.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index b3c6f3329b..dfaa4edbba 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -730,3 +730,15 @@ class ResultToolTests(OESelftestTestCase):
         self.assertEqual(parsed[section]['timedout-suite'], 30.0)
         # the status-summary table above (percentages, not a Time(s) table) must not be picked up
         self.assertNotIn('someresultid', str(parsed))
+
+    def test_durations_build_rows_suppresses_pct_when_both_runs_round_to_zero(self):
+        alldurations = [
+            {'path': {'tiny': 0.2, 'big': 100.0}},
+            {'path': {'tiny': 0.4, 'big': 150.0}},
+        ]
+        rows = durations.build_rows(['tiny', 'big'], 'path', alldurations)
+        rowmap = {k: deltas for k, vals, deltas in rows}
+        # both runs round to 0s: no meaningful percentage to report
+        self.assertEqual(rowmap['tiny'], [(0.2, None)])
+        # normal case: delta and percentage both reported
+        self.assertEqual(rowmap['big'], [(50.0, 50.0)])
-- 
2.55.0


