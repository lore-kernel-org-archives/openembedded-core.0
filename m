Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD31C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:04 +0000 (UTC)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3033.1790190277088612240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=DW/yJ1QD;
 spf=pass (domain: baylibre.com, ip: 74.125.227.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78564421fdbso459116137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190276; x=1790795076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OW7HqZBhcYssfenPdoPQSFJd/w/Rf16DhcBvS444WBM=;
        b=DW/yJ1QD0nnkWmVO06bRHAZGUfLbIsVZ7WAIxWvAcF1v6JATIiml8ei2HAO9+3foo4
         uFRCD9XD74kKkNPdyU5MANXaqYET7P7NYbS7QHGa8G8rR6CyZ3ZOKCIUX3WC7pnHvSAY
         kzAoqK9o8/+Ah+YzUj0IW66z2VRkOVJifZE5+T6ZVbspjD5NL8n3t6p9lBc0ouWZRLtz
         VmcuepwT/sTU5dpLVvUnGeWNR6J4pjvUKK+opFABab9W3S8+G5fBLvvngtzUe9Ak8/Kv
         Ux8XN3aj0BfD/QWW0xkK3k0l+Q9HkyPd3++cv2MUVSwdFkmjWkmbICa/TlUuTayGwbAZ
         xqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190276; x=1790795076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OW7HqZBhcYssfenPdoPQSFJd/w/Rf16DhcBvS444WBM=;
        b=h1AIvzFij7xo64v7g2FB+qR4FMmBdax9pVRO2p3X4Xz6QJa8kVthED/7cuLJfR27oA
         Rxa0JWpFEMZbnXRhUkQBGQRgR1mWnZguKUb+faZWUQaAvN1YbcD7jAdA6Kst4cRAhVS3
         F58iILNr/grYUGuzTl84N11wlkgNXxTLNt8sibUPj6Ih0NhtpxCeiAJ/jd8/Dj+xIM3L
         iMhAEaoCdty0wYqsfSurEXDmnhkcjWu053nXPkU3sg/UjKYaP1tcJTtrl0EgXfCAVLQ+
         /XFiEKgrR3DxAIXnbUfxqy3JJ7pY92QYPG9+4n3VCTmoqCORRxUwIBpdvCoGk5tsklAg
         XoVQ==
X-Gm-Message-State: AFuF++lzd+OggirixJFHLcWiBozDvMbARt3JUo2WaqovCDje7BGCjKow
	Jah9tdtef5vJ5ueEbMOAhHcUfBIUGOIdGvD22+y8l62IGq8U4yFPZfk8kzYCl20BboniKc+ZrUn
	+Gh+C
X-Gm-Gg: AYBFou1ulo3Yf75TNGU2oGWZB3GfXoEEtQJ/bjyVzMxAxouUnf4Q3qiFD1fEgjGVCyI
	WcbO6F7hX2NZK3+B52hicKcpvIg1R2YKjdYwV7NqZw9EPnr1mlt6sx2XtT7/WZebtn1SGi81jRQ
	ZRO6jZnwYlOt3lWJMBnZ61l8oM7ZwlgHWj6L6NMv6btoO8mhZ/yWAWIyBKNVLXYX61ZtMKHhUMx
	I691ZYYuKBvDc/GEZeLffUDVx2Fri/9XrbHU3Vbdv9n3OYxwiMLM3B01hgEEFyEfIgm1b6Lb6G4
	1FrAi3BXCBlJGDmVgbcjpK7g4RZh0bjaD+gsoB2Et39MV8lST5qrHFxo+m9DbTM7E1pv6+TEfno
	Qbiy+k0Fo3J7/aSpqmbaCQui22bAUZar/4gx1hBUaNM42NUf8vcP3Y2GM7PE77oG48ceOcxG3oK
	kfpmytm5dW9QhhKH+6TgRsWklQ/QkW1Om9iHHjX9jVv2/mPndhEnQH4D35kqUc1fSW+wyOKB9J/
	4AkujWQbgman643Lfsrm87VqMPaG3Zjip9D1hVa7fN7
X-Received: by 2002:a05:6102:4b17:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7af1bd77fbcmr156627137.14.1790190275980;
        Wed, 23 Sep 2026 12:04:35 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9852407d1f2sm1063533241.6.2026.09.23.12.04.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:35 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 06/13] selftest: resulttooltests.py: add threshold filtering test
Date: Wed, 23 Sep 2026 15:04:12 -0400
Message-ID: <20260923190419.353493-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246546

Add a test for resulttool.durations.filter_sort_rows(), covering
correct filtering when the '-t/--threshold' percentage is used to ignore
result rows below it.

AI-Generated: Uses Claude Sonnet 5
---
 meta/lib/oeqa/selftest/cases/resulttooltests.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 28acc939f1..a884de3949 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -752,3 +752,13 @@ class ResultToolTests(OESelftestTestCase):
         self.assertEqual(len(deltas), 2)
         self.assertEqual(deltas[0], (90.0, 900.0))
         self.assertEqual(deltas[1][0], -89.0)
+
+    def test_durations_filter_sort_rows_threshold_keeps_rows_above_it(self):
+        rows = [
+            ('big_change', [10.0, 20.0], [(10.0, 100.0)]),
+            ('small_change', [10.0, 11.0], [(1.0, 10.0)]),
+            ('no_change', [10.0, 10.0], [(0.0, 0.0)]),
+        ]
+        args = SimpleNamespace(threshold=50.0, sort_by_delta=False, limit=0)
+        kept = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
+        self.assertEqual(kept, ['big_change'])
-- 
2.55.0


