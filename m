Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B268DC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:16:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3006.1698776177344316449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 11:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=koDWV2zh;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-77a277eb084so189151085a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 11:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698776176; x=1699380976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=me0dTPas0bnp6MJr9uVXjYUv6Nzr/6GYO87cXJWjLZs=;
        b=koDWV2zhRUara41Y8U92gAseCitW6HPdT1+pZjteyHV8CXPvhjfOFaikxfe/CzVN9n
         SVo7/H1Ok6Bc69bnwVOa4WOdbU/wzJ3P4ioofeJPDNZcYayJ1uZxoYTN6dol5KUDrwoR
         SIGo9ihQ3hAmQNiRPWixfbNUQeE3cbP+SH9oVJQl6eB9BrL7WY+AO2ORiOWVubwKZTyD
         YutCXmgduccbwMYlUHLbvRR0CCHdMS3bI1p7FXszEQUZRhLQhHBzyoqInrzsmI2H1UYT
         HRq+lNXNZl1DZeWGKF7yulqyDaXj2pepvHLUGW/2W2WkEI68Z/0p2maRIuRMTp+JRHqI
         uz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698776176; x=1699380976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=me0dTPas0bnp6MJr9uVXjYUv6Nzr/6GYO87cXJWjLZs=;
        b=JneZ7kdyhlSc4d/25KbNtJFpyetq6xffckvuEJ921AgpfarauYY0gU6lGdwuhiA6PK
         SPTiYUmXF78Dg8uBrQIxIzWyii6Dr1KLjlEISq6F9rl+f2naKLAYAGGwXNtLINjEE4xm
         9mH2zjupBESXAwNiPxE39yay700ufZCx2kLXyPTEwSanCXKIa40UEug2AWqi6MrmpijD
         lrwByyW/KFWBGYYIILR+1dP38r9ECnTqcj48mXaYw0a9F8wb+MkFmQcsFOvnvCKI+Jop
         oP68/ZpKEUvap/th7TUALZycVq5TVel/P8tV7qdk8TjbfgjzQNlzsuJOtHYtPilaVI5h
         e1NA==
X-Gm-Message-State: AOJu0Yz53sXYgz5dPQL9XJJ7Rzf15XeE28Huh3BVDDC9gvDT1XbdRpvV
	PosnkMQw6hqA6MWB/wuDbDoFy5wsf9rpIGLVsbGkXA==
X-Google-Smtp-Source: AGHT+IEMVOhlej/N+LagoRe6Hv6qhGWbNueooK/99JqSKoOE0DjWxzoaTstCEY/P0DauOe73wz9Mtw==
X-Received: by 2002:a05:620a:1662:b0:777:7314:ee19 with SMTP id d2-20020a05620a166200b007777314ee19mr12042416qko.21.1698776175830;
        Tue, 31 Oct 2023 11:16:15 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i9-20020ae9ee09000000b007770d47c621sm712436qkg.66.2023.10.31.11.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 11:16:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: make pylint tests compatible with 3.x
Date: Tue, 31 Oct 2023 14:16:13 -0400
Message-ID: <20231031181614.2092124-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 18:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189867

pylint 3.x has removed epylint, which is now a separate module. To avoid
adding another recipe or using outdated modules, modify the
test_python_pylint tests so that they use the standard pylint API.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_python_pylint.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index 304b2d5ee9a..ef315e591ca 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -5,8 +5,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 import base
+from io import StringIO
 from data import PatchTestInput
-import pylint.epylint as lint
+from pylint.reporters.text import TextReporter
+import pylint.lint as lint
+
 
 class PyLint(base.Base):
     pythonpatches  = []
@@ -32,8 +35,10 @@ class PyLint(base.Base):
     def pretest_pylint(self):
         for pythonpatch in self.pythonpatches:
             if pythonpatch.is_modified_file:
-                (pylint_stdout, pylint_stderr) = lint.py_run(command_options = pythonpatch.path + self.pylint_options, return_std=True)
-                for line in pylint_stdout.readlines():
+                pylint_output = StringIO()
+                reporter = TextReporter(pylint_output)
+                lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
+                for line in pylint_output.readlines():
                     if not '*' in line:
                         if line.strip():
                             self.pylint_pretest[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
@@ -46,8 +51,10 @@ class PyLint(base.Base):
                 path = pythonpatch.target_file[2:]
             else:
                 path = pythonpatch.path
-            (pylint_stdout, pylint_stderr) = lint.py_run(command_options = path + self.pylint_options, return_std=True)
-            for line in pylint_stdout.readlines():
+            pylint_output = StringIO()
+            reporter = TextReporter(pylint_output)
+            lint.Run([self.pylint_options, pythonpatch.path], reporter=reporter, exit=False)
+            for line in pylint_output.readlines():
                     if not '*' in line:
                         if line.strip():
                             self.pylint_test[line.strip().split(' ',1)[0]] = line.strip().split(' ',1)[1]
-- 
2.41.0


