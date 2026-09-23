Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A63DC98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 19:58:54 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3030.1790190271602473449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 12:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=gBjIX6uq;
 spf=pass (domain: baylibre.com, ip: 74.125.227.40, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9b0bdf5b5so571313e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 12:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790190270; x=1790795070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PU9YjQx0iNzugWOiJuyXtJ5V8EbsG4G9b4A0qWeen14=;
        b=gBjIX6uqeGLqqc5bElmmVbI8XMmU5UAsPgiPeLQ/1GLU647rfbaqlfV32nqyEj7qpq
         dYHfJ3XJzLUDl2IVligQLewgfPCQMjLR6u8is8DOqe/aMgME2gOA6HtUzOmRRmM2dpdg
         3WFO+WAcBCWmIfvXKnKVa8IbkX08h3xXNMqVsIetqKXgroJh3CzYGXaFZC73ARGgJPpH
         VIvbrjH8DRpEX82xkfCt13WgCGy2xZlOIe0FUvgNJL0I9Eps6MEKE5RYX0io9TJFn9bf
         S6tUXprTCqtRifZnwemY7CAIKjrZgNBJwaD7yaIJbNxqFMurkB00mvF2dKqQIR48uWNP
         So3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190270; x=1790795070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PU9YjQx0iNzugWOiJuyXtJ5V8EbsG4G9b4A0qWeen14=;
        b=gTbjrGNBJ1qLtx9D3h92uKOZvEsrcKva8TpJS0NmggvKTQAkGflUVVMi3WXw9TWdSy
         9G2kcjav7Fqo3tvKPlsWl8J9ZqSWeenH8tRG2HeSAuhk7qcUBmeuutHAOgriLzBdmBIv
         Tr46FiHHkzFghFlvFDMGJ8EdfpgA4EDZsFRwCe/8DVSrbdyEEzCAj6BEoB7FP+lhM0NU
         xyJcxzzLnBwVfkVj1r3/aZ+ld0xDDgmG5sJ/EV/PXRHIKQNpATnFuQkNedkV0KziHW7b
         jNSk1EtqwCdZwzN+d35p6qyZih2zGpIzYNAlym/mdAoxMcz6YHT2ch7mbkWz2WLNA7xD
         Xm0w==
X-Gm-Message-State: AFuF++kricluZ3iHD/wEA+Lzl3ITDt6Is2u5AcVxID+FF4ATmWPcQ0jr
	/Vdo+k52kEDyIpVhh7H3mf8FRe0lCSDb6DwpqCJ4LHny/QQxka3ENtKlxc8cMZuUU8AdPKFnaUf
	AnwlE
X-Gm-Gg: AYBFou3ZqWta6g8ZYVnd2elstoWpcAAY8Wul8W6Dnbuf4Ni6H4A2UsE+mugtG7wU83x
	qlhcaR529t/sklZQdLGyKwBgfZ9a2UDZhDjGjKan48Xv7S/l2A+Pc+vvE5VnSXiakJ6r0Jips5X
	64pmS16S0V1B8wLxx4yx0HxUjmgpglnWU3aIHzCLRUQaSQn1LrCY2UIZSgx6FV+/5/0zXyiULMN
	FVFDdzMErKukXvrRuitjKnxYnboAXKv30o1TxwkH/bZYBYXYU+aY4JzA2rX0Y12oapgAFFJSrpi
	jMjH/tlxH3PeTLUTEYoG74ilrFT+2i4woYeeOaAeIaEEkz1XNo+Eznm+atm9k/sCpxkJ9YjcU23
	Jg1PxqEVphhhrQHRasbu5xQ7i0UluubQUGXp+u+2spgrwlfLT/saM58QCYhDN/juojZXv6gB+Do
	kmrxcJQaDy/os3Nu5uQ+yDutLLS2BYWjAQbE5mxhmikJuCIjyP8HRREv7iso7Vv0CK1M6KBJQjG
	dPv+m8o0qN9Rfmjg8qr+TuMHDVFNK0FxA==
X-Received: by 2002:a05:6122:2985:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5cb0807358bmr215347e0c.4.1790190270276;
        Wed, 23 Sep 2026 12:04:30 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c2a36sm4356028e0c.5.2026.09.23.12.04.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:04:28 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 03/13] selftest: resulttooltests.py: add report-log Time(s) column test
Date: Wed, 23 Sep 2026 15:04:09 -0400
Message-ID: <20260923190419.353493-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923190419.353493-1-tgamblin@baylibre.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 19:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246543

Add a test for resulttool.durations.parse_report_log(), covering
correct Time(s) column extraction from a 'resulttool report' text log,
and confirming the unrelated percentage-based status summary table
above it is not mistaken for a Time(s) table.

AI-Generated: Uses Claude Sonnet 5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index a380d08156..b3c6f3329b 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -697,3 +697,36 @@ class ResultToolTests(OESelftestTestCase):
         self.assertNotIn('test.Foo.test_no_duration', flattened[path])
         self.assertEqual(flattened[path]['ptestresult.sections.bash'], 5.0)
         self.assertEqual(flattened[path]['ptestresult.sections.timedout'], 30.0)
+
+    def test_durations_parse_report_log_extracts_time_column(self):
+        content = (
+            "==============================================================================================================\n"
+            "Test Result Status Summary (Counts/Percentages sorted by testseries, ID)\n"
+            "==============================================================================================================\n"
+            "qemux86 | someresultid | 6 (86%) | 0 (0%) | 1 (14%)\n"
+            "\n"
+            "==============================================================================================================\n"
+            "qemux86 PTest Result Summary (Libc: glibc)\n"
+            "==============================================================================================================\n"
+            "--------------------------------------------------------------------------------------------------------------\n"
+            "Recipe                       | Passed       | Failed | Skipped   | Time(s)   \n"
+            "--------------------------------------------------------------------------------------------------------------\n"
+            "acl                          | 1            | 0      | 0         | 1\n"
+            "bash                         | 43           | 0      | 0         | 48\n"
+            "timedout-suite               | 1            | 0      | 0         | 30 T\n"
+            "--------------------------------------------------------------------------------------------------------------\n"
+        )
+        with tempfile.NamedTemporaryFile(mode='w', suffix='.log', delete=False) as f:
+            f.write(content)
+            logpath = f.name
+        try:
+            parsed = durations.parse_report_log(logpath)
+        finally:
+            os.remove(logpath)
+        section = 'qemux86 PTest Result Summary (Libc: glibc)'
+        self.assertIn(section, parsed)
+        self.assertEqual(parsed[section]['acl'], 1.0)
+        self.assertEqual(parsed[section]['bash'], 48.0)
+        self.assertEqual(parsed[section]['timedout-suite'], 30.0)
+        # the status-summary table above (percentages, not a Time(s) table) must not be picked up
+        self.assertNotIn('someresultid', str(parsed))
-- 
2.55.0


