Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCC0C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:40:03 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.631.1700498395096991216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UGvQyz4/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6bee11456baso3822825b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498394; x=1701103194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRaclDhFvofpi6AFgieetSGTXcEabygt22uRHgpzbH8=;
        b=UGvQyz4/DamVFsvFfyj1Vt9gbG3erpJ30AGP5D1v9fstyaIEdFmi51J2RZ90APKC6R
         nYaGrDsKMNnyqSoVfHneUlCOrips6qmxQGDAre0RubiD9wehoEj1Q9DGb5VZRnCMkHBk
         duUB/nYO6DyXjSEB3abo6AKgii15wFjY9WlivEBMLOr2ki/okeMgQA04CSqDEnQbT/pA
         iMMF6d8Ugk0145gTzKOK+WnZ17JqAvFOkWAyRNfH4brRNLyvz30mNgojvomPm2vRNjuD
         vK5cY61AVn3JKRrBsKEXE7UFDqRUeM2yx7yRYff24fzZHU3UiPxd0dyWZYHACeBQ3RVK
         azPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498394; x=1701103194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRaclDhFvofpi6AFgieetSGTXcEabygt22uRHgpzbH8=;
        b=huf6r3OE5i6uZHxEu62dTokM15KbPrq45aBg+qrSFPkfHSuuOdGwOrrgJri9RdNf+M
         WhsmbD2PfZcjORFw+zFVW7L+X2oGQ/iOiKxx/CgP0SWIbuhyUY/RHd96S/yyX8froTaw
         QtgCV4P4YIPJYZSCg6m8sDTHk+V15op84/iZJplANQapTeeHJBtnRDGNZyglQoA+FGSb
         2iXlkCVC2tkhDA9eCzLy4jNwwsIWXePTCuhChIYBJng9JqOqpkSK8t66x1wW8feAHTuF
         WC/aWwAPG8j0hemC9G5U3kL5IPZyuSV5gYxcDk1XAaFaYhyyoE/5gPUqKkVPlDew5vk4
         MG0Q==
X-Gm-Message-State: AOJu0Yx1ORjo4EASYaLYVytzfXjRKaBd66qnYqD4UwguqC01zM84e9Nl
	BnQWIwAf4I+4h9ODrr4CNQHwuFMzo+x7W/u4Ttos4g==
X-Google-Smtp-Source: AGHT+IGjILgutSazezCycAKE9AOwoRgjA5/0R8TGCVLU6jBJiUet9aq3gSZIN2My+UPR2PeXc1hYwg==
X-Received: by 2002:a05:6a00:80b:b0:6c3:3bf9:217e with SMTP id m11-20020a056a00080b00b006c33bf9217emr7345582pfk.19.1700498394170;
        Mon, 20 Nov 2023 08:39:54 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 30/33] patchtest: make pylint tests compatible with 3.x
Date: Mon, 20 Nov 2023 06:38:44 -1000
Message-Id: <61365d562ee7b0c46a09565cadf38475a524c9ae.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190919

From: Trevor Gamblin <tgamblin@baylibre.com>

pylint 3.x has removed epylint, which is now a separate module. To avoid
adding another recipe or using outdated modules, modify the
test_python_pylint tests so that they use the standard pylint API.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72be3d6a116febf46130cccbe12afe5ad93779b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_python_pylint.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index 304b2d5ee9..ef315e591c 100644
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
2.34.1


