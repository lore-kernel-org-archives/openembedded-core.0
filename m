Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E0AC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 11:41:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.4089.1675510897248177918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 03:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhGoPsMc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r2so6673539wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTs76lwUzrdrIuDp6iqcSafpKuZlEEjzCVQxZ25FfsQ=;
        b=hhGoPsMc+h7BJR83od5UnPJUMGxoLcsOqC/JJWe1qceDzuvn0zhyundd8UL+puuV6E
         a/X0mcLT4ycQBcDMcJVxh2xBFCWQrOJdd/LlRkpuJbqzouh471mdwWTDv8x0EcGNo0jv
         UzZk+RZU3v8i4mbscem4dAGqSc2vuAqDOu9To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTs76lwUzrdrIuDp6iqcSafpKuZlEEjzCVQxZ25FfsQ=;
        b=2HxGOydw7gKQeJpbD9btMhHJUVd2rDhGYzpOrS8bl8M0NaSQJM30j+nrWwWQ7GXVos
         DcjHJlyrxYTmZKd9XARSdagNmdmlkt+uv12fTstfYLwlZVPfheP2qLUKn3GmIQz4yGYm
         fxasFWV7VmRyOsa7mZVo7TVlFZx8gAX+So4TlTdauS8fNwOjqh+KnmayATse+9nHCEdN
         0HGkHoZeIXvDUU68O+KvRZrcBN21KYyc5VSmFVf8FI0LhAAekqzBxOkXkYq4WQMn5u6s
         DNaMWErVAtAl8SJum8POk5U86pWzRJgZwyuau+0ILlj7JBoTWT8rTn8o+JR64H9g48H+
         pgDA==
X-Gm-Message-State: AO0yUKWj1535ioWPU64gW5TTHjAfr8G1qOomafVf7Uly5zk+Ofm0QyFd
	g6s6foAXt/bXGrCOkKSwqCfra2LO42psjwfS
X-Google-Smtp-Source: AK7set+8mNm7Dw7O48J4cyJHc0Sl8K73DjzZgHKaBZ+cgmLjqG+nQrUIwGR2uBY3nnI3ggBAzZEJsw==
X-Received: by 2002:a5d:63c2:0:b0:2c3:d809:e3aa with SMTP id c2-20020a5d63c2000000b002c3d809e3aamr2413715wrw.65.1675510895417;
        Sat, 04 Feb 2023 03:41:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b45c:7b35:1c6a:a06d])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d4ac6000000b002c3e18119f2sm721970wrs.29.2023.02.04.03.41.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 03:41:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/selftest/locales: Add test for disabled binary locale generation
Date: Sat,  4 Feb 2023 11:41:33 +0000
Message-Id: <20230204114133.1178502-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
References: <20230204114133.1178502-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 11:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176761

Similarly to the recently added test for binary generated locales, add
a version to test on target locale generation. This was broken but should
be fixed now so we can add the test sharing code from the previous test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/locales.py | 31 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
index 433991abf9d..4ca8ffb7aac 100644
--- a/meta/lib/oeqa/selftest/cases/locales.py
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -9,23 +9,17 @@ from oeqa.utils.commands import bitbake, runqemu
 class LocalesTest(OESelftestTestCase):
 
     @OETestTag("runqemu")
-    def test_locales_on(self):
-        """
-        Summary: Test the locales are generated
-        Expected: 1. Check the locale exist in the locale-archive
-                  2. Check the locale exist for the glibc
-                  3. Check the locale can be generated
-        Product: oe-core
-        Author: Louis Rannou <lrannou@baylibre.com>
-        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
-        """
 
+    def run_locales_test(self, binary_enabled):
         features = []
         features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
         features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
         features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
         features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
-        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
+        if binary_enabled:
+            features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
+        else:
+            features.append('ENABLE_BINARY_LOCALE_GENERATION = "0"')
         self.write_config("\n".join(features))
 
         # Build a core-image-minimal
@@ -43,3 +37,18 @@ class LocalesTest(OESelftestTestCase):
             # output must includes fr_FR.utf8
             self.assertEqual(status, 1, msg='localedef test command failed: output: %s' % output)
             self.assertIn("fr_FR.utf8", output, msg='localedef test failed: output: %s' % output)
+
+    def test_locales_on(self):
+        """
+        Summary: Test the locales are generated
+        Expected: 1. Check the locale exist in the locale-archive
+                  2. Check the locale exist for the glibc
+                  3. Check the locale can be generated
+        Product: oe-core
+        Author: Louis Rannou <lrannou@baylibre.com>
+        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
+        """
+        self.run_locales_test(True)
+
+    def test_locales_off(self):
+        self.run_locales_test(False)
-- 
2.37.2


