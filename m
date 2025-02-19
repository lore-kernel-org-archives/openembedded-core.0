Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E54C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 06:53:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.16700.1739948020294673947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 22:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZR70TwaU;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220d28c215eso92479975ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 22:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739948019; x=1740552819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyX3lc7i1j2E8hWW1kpQfn1OUiE/fhwyD2CCxIOp+Jk=;
        b=ZR70TwaUrk+TA5zrrRw31Bi9oycKylZ1Cf40SzItyskVZD5gfGwftbvOWKwC2kdHRK
         lMyY5/d51bi6z1BXKUpaNzgmulTHSVToy0jmz/oaZiSBe+qNu1JyW9aUlIRe7C8oVLPh
         9SzCDcDpMqtFqjnCAlR1J9OnrQuGDteohMfbFFYztit+JoLahsuDnbDSpsYGAsxrR1bq
         Ra8EJPy0uGlg504MX3bcs4e0AT8JM08S2ILGQgL9CFFcnqeY4x2cUqEOkt/DP2ms8Rh6
         mUV+4xF7eCEzw44eJrOURAXdmREWuVDocrT4IwNugJHDEHk+JBCTUHsGoSprCR3CvVdE
         NY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739948019; x=1740552819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyX3lc7i1j2E8hWW1kpQfn1OUiE/fhwyD2CCxIOp+Jk=;
        b=mjS/v8UK0/fwlNYIXaizrg92scbRce0LkAXMEhKv/6UCis1KCcC4dEbF1G4HbVZ7fp
         UUNtilPH7EU4WOvhGV9l3itbOFqPhXI0FVYI+O8xIdvxhAocQS6sexrM7AEpYveT6XZ5
         4OStojYHLf+RorwVwA3c1jG9CcagIYNI6eveiT9PLLuTPp0M9a6lXEwGvo3NPLV3hxQu
         sJn8/rwkBQjMkOf3BhqAscvPcH8/l0GeVCtCZghqP6goK1SMFYhuIm4MeHiRor2Dtg+T
         9OCAMpj/x3QfmYVD18x/pzD1aJvRp8o70vykPnbyQ/e9DNhQbJmN5G6izHnmp4HTOYsv
         zdMQ==
X-Gm-Message-State: AOJu0Yybmuzoq1vXEKWV832RDNfcc4GCj0RE9uidemfI+27xvKLmjsCV
	NbRhGJE3dkZ7iYOje7dtLV7cJXJCRMnmY5t4JxPNwx+Z1gBM5k1BVuZgEe2F
X-Gm-Gg: ASbGnctGvyUqIOuun8NVulOeHGK9RdSRmiyhUuv2Wb4rZZKdbg6PeO6GENras4dTtnG
	rF2hczgPV+OnrhSoEV1qpNehxo+/3ZDho6Dhldv5D9wqKp4r2nWE2w9dX9z5B2eg6Jk9e5wKfGC
	EBXocV8sg8CPptQjL0VoYPkAOPX5mCw2QVv2st0BhgjU16pAhCn4hQVNUvE5XNtOdkFEzg4lOBe
	v8e70yEzQ7i8tyUW7YGF27EOuQktFi95X6AByAvofK4jknT5U+XzIs9Dqm02Ljx2/20LYi/91p7
	I00DOy8=
X-Google-Smtp-Source: AGHT+IFLXsHyqWTm3rTWyCv9d9uPhKFSOQVWBh5MzxLeL9ZpYBwj98N2TInYu5jDKr56gLHhri85dw==
X-Received: by 2002:a05:6a00:1a89:b0:730:94e5:1ea2 with SMTP id d2e1a72fcca58-7326177d5ecmr28286888b3a.4.1739948019428;
        Tue, 18 Feb 2025 22:53:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::dd76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm11204531b3a.30.2025.02.18.22.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 22:53:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3: Skip test_write_read_append
Date: Tue, 18 Feb 2025 22:53:34 -0800
Message-ID: <20250219065335.1632645-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219065335.1632645-1-raj.khem@gmail.com>
References: <20250219065335.1632645-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 06:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211665

We use editline by default and test_write_read_append also fails especially on musl
since this needs to be fixed upstream, extend the skip for test_write_read_append along
with other history manipulation tests being skipped.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-test_readline-skip-limited-history-test.patch | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 337e69cce07..862a7f5ea77 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -16,11 +16,17 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  Lib/test/test_readline.py | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
-index 50e77cb..09b644a 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -141,6 +141,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -70,6 +70,7 @@ class TestHistoryManipulation (unittest.
+ 
+     @unittest.skipUnless(hasattr(readline, "append_history_file"),
+                          "append_history not available")
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_append(self):
+         hfile = tempfile.NamedTemporaryFile(delete=False)
+         hfile.close()
+@@ -141,6 +142,7 @@ class TestHistoryManipulation (unittest.
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,7 +34,7 @@ index 50e77cb..09b644a 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -382,6 +383,7 @@ readline.write_history_file(history_file)
+@@ -382,6 +384,7 @@ readline.write_history_file(history_file
          self.assertIn(b"done", output)
  
  

