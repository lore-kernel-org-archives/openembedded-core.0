Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF84C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:59:54 +0000 (UTC)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3005.1790190291981664625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Xo4Yk95+;
 spf=pass (domain: baylibre.com, ip: 74.125.227.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso1108388e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190291; x=1790795091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g3NwAytRnVtPHIJIPdjA/9dveqG1/DPvlkqDjOsY+R0=;
        b=Xo4Yk95+C+JupUVnaaTGKaagj/qUMvZB5xE8FxPPJN2h096+BlpAT2fxubhdB7KUmb
         6VXYxnPlAPoZAwnoNu0f9p63sA35VSIWYoWHfnAqlSvpYCWVcyqKH2mBSXp/MSPOuLQY
         j6cfjwtpDeLWH9qEhX/Vla51cgRcm75tNL4NSe9jxOF2q9ZUWSj4kWKo9ow0t4QvsM6D
         IxSur6jTY+bUQ8thWZTdyHaBWjRaRX/Wh7LQKPpnrWPwNe17jPvK/ysLc6uzrLX2TaRp
         ucpMiEBBNnSx6EU7DImogHwEHZ8ERYHqMhzvQ22hjUDGbVRmSjMY8FZtv8pTmBBOMJ3/
         e5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190291; x=1790795091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g3NwAytRnVtPHIJIPdjA/9dveqG1/DPvlkqDjOsY+R0=;
        b=fJm0P/qqR2m9QX9NdIuPLc5DIqCS1qpFbz4wra/bIJ2LSbH/33gA7UVKnUgJcsFy79
         o8XmW7RQOFc/5tk5KgQkEAA1Rmfh1vLck9svgHM31XonpewBZoHnfDsMGPRxKKrZXZhK
         yghERdvA01a4ldPOCZGEv24Q2FFBBOfhsnW2QfOxtD5ghQuoApk6GT2rXxEge4121liP
         MyKBZKTvJsnycqAzqNzd7BhYuMiGL9jnUEDd8ru3mtFqLMeMfOwS4D7i+bZtHlrQPO9S
         aVJWG66Wr90X4J+ZbCVxKN2mGHLB7QNkB+8AMHvEGnHl24iwb4DgepYfxKHB5eYw6UL5
         /bkA==
X-Gm-Message-State: AFuF++nCd/YK9KjJRhWQIoxlJWtyHg0q8JMebFvdcsgp4VWNwID/N5o/
	RJi3PmAYwMkQ+U8s2EljFXf9+uqddT0if9/xar98obtn5Hl8+p/S7KYKKtD848iUz0hWLPR/SrR
	BQklc
X-Gm-Gg: AYBFou0Y1woGjUW65xQLZuIxuFX8QJW9GmVnhskEB6VryfIzydGFFsD5GmxqxdzVrXQ
	yEEn4S7s/kzwMFw10OXx4GpRJ2GHzvsxAqr4y+OY5vjn9TZCyTMrJ007XggLL1W/kjTKpLBFbB9
	JT/joWOJ/Ah4omTQ9PfKeDfOvaDF151i7depKcm218IHtgEh3uaFYEyeaztK0aZmI0eViBzsHJ1
	5rzLyfLeQlj4HLuK21vhjFm4aHEBL+o8OyDxWIVGk6cs4za3x3YOBWYhhVSWvN0HXl9b2VgHD4W
	c4AJva6HH00tGTbe/qVpcY+pr3kCa+rjyfeAPPFW4ogwUTiYaWru6+PHXINQnK7GmsTgYCeqhda
	rEYswxtrDOKrOUuIc/DJC2p8ENYcm+aFVeC4Ii8TQG7KxSuNYctB7VXX3zXIQXaRkMhdXVWLfRT
	wV+FcG6jUacUUDILBJW8TsigYTw6DDmyx2iRYZexpvq4x5kQYCJfOWYNye1qKD2ZHPy5wyY6ZjT
	Qx3wVrbldhXxNPJduxQEG4gcXnd4h9lluRnNxmC7zz+UmQm/EoELOs=
X-Received: by 2002:a05:6102:5344:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7af1dde1da0mr132625137.29.1790190290797;
        Wed, 23 Sep 2026 12:04:50 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566d033sm4538842137.5.2026.09.23.12.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:49 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 12/13] selftest: resulttooltests.py: add short-tables ordering test
Date: Wed, 23 Sep 2026 15:04:18 -0400
Message-ID: <20260923190419.353493-13-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246552

Add a test for resulttool.durations.build_tables(), ensuring that the
'--show-short' tables are returned after every other table, rather
than interleaved per test configuration.

AI-Generated: Uses Claude Sonnet 5
---
 .../oeqa/selftest/cases/resulttooltests.py    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index d45213b5b4..d93d04aaad 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -808,3 +808,50 @@ class ResultToolTests(OESelftestTestCase):
         args = SimpleNamespace(threshold=0.0, sort_by_delta=True, limit=2)
         ordered = [k for k, vals, deltas in durations.filter_sort_rows(rows, args)]
         self.assertEqual(ordered, ['big', 'medium'])
+
+    def _duration_result(self, machine, long_duration, short_duration):
+        return {'configuration': {"TEST_TYPE": "runtime",
+                                  "TESTSERIES": "series1",
+                                  "IMAGE_BASENAME": "image",
+                                  "IMAGE_PKGTYPE": "ipk",
+                                  "DISTRO": "mydistro",
+                                  "MACHINE": machine},
+                'result': {
+                    'ptestresult.sections': {
+                        'longsuite': {'duration': str(long_duration)},
+                        'shortsuite': {'duration': str(short_duration)},
+                    },
+                }}
+
+    def _write_json(self, data):
+        f = tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False)
+        json.dump(data, f)
+        f.close()
+        return f.name
+
+    def test_durations_build_tables_orders_short_tables_after_all_main_tables(self):
+        # Two machines, each with one test >= min_duration and one under it
+        run1 = self._write_json({'qemux86_result': self._duration_result('qemux86', 50, 2),
+                                 'qemux86-64_result': self._duration_result('qemux86-64', 50, 2)})
+        run2 = self._write_json({'qemux86_result': self._duration_result('qemux86', 80, 3),
+                                 'qemux86-64_result': self._duration_result('qemux86-64', 80, 3)})
+        try:
+            args = SimpleNamespace(sources=[run1, run2], labels='', sort_by_delta=False,
+                                   threshold=0.0, limit=0, min_duration=10.0, show_short=True)
+            result = durations.build_tables(args, self.logger)
+        finally:
+            os.remove(run1)
+            os.remove(run2)
+
+        self.assertIsNotNone(result)
+        labels, tables = result
+        titles = [title for title, rows in tables]
+        self.assertEqual(len(titles), 4, msg="expected one main and one short table per machine: %s" % titles)
+        main_titles, short_titles = titles[:2], titles[2:]
+        self.assertTrue(all("under" not in t for t in main_titles), msg=titles)
+        self.assertTrue(all("under" in t for t in short_titles), msg=titles)
+        # the main tables only contain the long test, the short tables only the short one
+        for title, rows in tables[:2]:
+            self.assertEqual([k for k, vals, deltas in rows], ['ptestresult.sections.longsuite'])
+        for title, rows in tables[2:]:
+            self.assertEqual([k for k, vals, deltas in rows], ['ptestresult.sections.shortsuite'])
-- 
2.55.0


