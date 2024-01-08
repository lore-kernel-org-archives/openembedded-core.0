Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE11BC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:27:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.7880.1704724053553752599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgOFsWd+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e4b20a52bso1548185e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704724052; x=1705328852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JqHznKfeOxH8mTy7Mj3icpEvz+eWVQ009sx/DaJmao=;
        b=PgOFsWd+KvWaISrJH8GHx2KhVsrfTwPwCJSVk36tXL2aArDNzHKpHLmPzKeKFqlJTP
         /lKUXKl+auB+LQyqL/qaq9UxFfHRTe2baEBhQ38Pp1Nz+pSjrobFFD3hRPM3JTkNA7qc
         MGBIMkbnUd0CK8y/7k2ADbVbA6VCuQB/wT8cbJv74kssmTQnzld27rIi2p60VQpJXHb5
         t+3R9bbt7e/gl4wBABSuNtNDwlnK5EDSvab07Qz9KXUQ1K9M6EW41eiLvWZ3QBNUOtRF
         vOwf8hD6BF3R8QKOmpRznssdIJE/qyVOOsUDt9acaHRoCk5EYyaxKoOrETAo+AKxf0Ea
         NLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724052; x=1705328852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JqHznKfeOxH8mTy7Mj3icpEvz+eWVQ009sx/DaJmao=;
        b=UgjpYT5lysnhsHURKVcxdu4T+PhllOxKqBjHpKhWFDsXL8rG7EraPGE+CkeIjQ9fc8
         Zvrn09PfWi6NEvlbFz/QpciuG97HSNSYhQ/6KnhA7G02bxMcFFTjRNtNznrtgdvLyHjU
         ks+QO2t8bPemhiFIqRveL7SwuTy1mM5tvbK6kN0cdQSXKeqUxz31vi40eIbRrovijaub
         NyiOpmJlo0dVnNp2U7D1pJYEuVZI+acyaTYMEaRXpK4kEt27iYRnAGf023armo75ct+h
         fsMyr2KI2tgLebC52YWKAwTxEqUk3nYFVV54DVkdWe/5yDMeIZ5wMH8DOkOS1WVFmif9
         LhIA==
X-Gm-Message-State: AOJu0YwdFOBUYENOa0LfIGS19FThvUNr2u+YNQbRf1kSwB7UFxZmqWPk
	8P5gVFTS+/s6g2anLAiIJOQqUjoQF1g=
X-Google-Smtp-Source: AGHT+IGMeYgKMZHGmuXOyUEjZAYx44j6sXIELbLxo1Y4EWojSoziYK23ZnKL9ikz4oeFvPAtJqC/vA==
X-Received: by 2002:a05:600c:5407:b0:40e:4358:cdda with SMTP id he7-20020a05600c540700b0040e4358cddamr1352521wmb.158.1704724051978;
        Mon, 08 Jan 2024 06:27:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b0040d8ff79fd8sm12274wms.7.2024.01.08.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:27:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/sstatetests: include fetcher diagnostics into CDN test failure message
Date: Mon,  8 Jan 2024 15:27:26 +0100
Message-Id: <20240108142726.2293394-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193406

This will help finding out what kind of error the server actually returned,
as sporadic CDN failures continue to occur.

[YOCTO #15335]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 340f41162f0..6a6c2e5f11a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -905,6 +905,7 @@ class SStateMirrors(SStateBase):
             self.fail("Did not find 'Sstate summary' line in bitbake output")
 
         failed_urls = []
+        failed_urls_extrainfo = []
         for l in output_l:
             if "SState: Unsuccessful fetch test for" in l and check_cdn:
                 missing_object = l.split()[6]
@@ -918,8 +919,11 @@ class SStateMirrors(SStateBase):
                 else:
                     missing_objects -= 1
 
-        self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}".format(missing_objects, "\n".join(failed_urls)))
-        self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}".format("\n".join(failed_urls)))
+            if "urlopen failed for" in l:
+                failed_urls_extrainfo.append(l)
+
+        self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}\nFetcher diagnostics:\n{}".format(missing_objects, "\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
+        self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}\nFetcher diagnostics:\n{}".format("\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
 
     def run_test(self, machine, targets, exceptions, check_cdn = True):
         # sstate is checked for existence of these, but they never get written out to begin with
-- 
2.39.2


