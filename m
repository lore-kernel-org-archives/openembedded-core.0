Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AB3C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2948.1702391315343209512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EcSaq4AI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso4486402b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391314; x=1702996114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU/MF/yQpb4h+XLGZimi8I0wZZ8BgX0ViWXV7HcYreQ=;
        b=EcSaq4AImPU2vgRQRPYG5YkxbU4dP1qchzUzCpoAXaDEMeG2udlp1+lLzpiLIedCyH
         Pbc6NTxhXXFoifR4hkBEGudC0+6PRz5KZdJZIu74v5cYT3Ox0XslGBdXaMatPkurOV5Q
         Kn1aS5e3Ig/GTcpDFRuKPEkb5/oKf92IctWQvjykLSnJd4Awih/K8pz4QSSaMM5Ekxo4
         1vru8b2Uha1o5vUzI+u7STrAxTF9AQepMv8Nnd0UXDP+xlUT7nl4MrqejmfDvSQkdqDI
         6XjrcseNhU8rfUTAaMLCl1shxyMCn8t12eLMF/V+8z7quY05JYcJGQyK5efoSVmiIiMX
         Ciqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391314; x=1702996114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VU/MF/yQpb4h+XLGZimi8I0wZZ8BgX0ViWXV7HcYreQ=;
        b=GI3s7RVpPsEmEf8eYKwT/biQt5WFUKopijvFEybn08WxS5X6LzPfgdLqbPlPZRyLuf
         CvmFTIql1Q+apljR6zQkwk6zkK9NFAvaMcGnQdcCjY/D7AtAfW9ccreXfdF3L2bPKvrG
         zGNXA4qbudeQ82z5aiKps6mYUA2eLdIQlCCYmt3csre0X4O8uzw0bRxuVBTNX5IeO/GV
         ekG9/Jqfb3lXu1zKs2KW6Zav1TW7vM3PildxOIUmITkLLopENPqXETnvu40dvz57JmQQ
         fJYHIss/8kOerWNMLmbyg/q1u26Zqqd+r7N0EGRGCSclhRIdg6CaOKER0UAucZXpRomG
         CgLg==
X-Gm-Message-State: AOJu0YyYgmnw9Fyiwtr2NQV+8+Wut5X8OuSUyotsgblFzrAwIsGb809B
	GplMbitrnmX6aLRp+QguAMLQ1hlo3zZVZD2Cg/U=
X-Google-Smtp-Source: AGHT+IFygM0/XmfAxODiRHaYjp5rAuUZOcHttfdzpqnbv2wsWfxvYpHpAS1KnHRUB8up9a8COOetuQ==
X-Received: by 2002:a05:6a20:6a03:b0:18c:b464:ec5b with SMTP id p3-20020a056a206a0300b0018cb464ec5bmr7968223pzk.61.1702391314136;
        Tue, 12 Dec 2023 06:28:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 27/29] oeqa/selftest/tinfoil: Add tests that parse virtual recipes
Date: Tue, 12 Dec 2023 04:27:33 -1000
Message-Id: <f415c97ad538ce046c87af3fc9eeec6599313764.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192231

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Running `devtool search gcc` would result in errors for virtual recipes.
The reason was the newly introduced :layer-<layername> override.

When tinfoil parsed the recipes using the parseRecipeFile() function, it
failed to properly identify the layername for virtual recipes, which
resulted in the errors.

Add tests that exercise these code paths through parseRecipeFile().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index dd13c20402..21c8686b2a 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -48,6 +48,17 @@ class TinfoilTests(OESelftestTestCase):
             rd = tinfoil.parse_recipe_file(best[3])
             self.assertEqual(testrecipe, rd.getVar('PN'))
 
+    def test_parse_virtual_recipe(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            testrecipe = 'nativesdk-gcc'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            rd = tinfoil.parse_recipe_file(best[3])
+            self.assertEqual(testrecipe, rd.getVar('PN'))
+            self.assertIsNotNone(rd.getVar('FILE_LAYERNAME'))
+
     def test_parse_recipe_copy_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -66,7 +77,7 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
-    # The config_data API tp parse_recipe_file is used by:
+    # The config_data API to parse_recipe_file is used by:
     # layerindex-web layerindex/update_layer.py
     def test_parse_recipe_custom_data(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
@@ -80,6 +91,18 @@ class TinfoilTests(OESelftestTestCase):
             rd = tinfoil.parse_recipe_file(best[3], config_data=localdata)
             self.assertEqual("testval", rd.getVar('TESTVAR'))
 
+    def test_parse_virtual_recipe_custom_data(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            localdata = bb.data.createCopy(tinfoil.config_data)
+            localdata.setVar("TESTVAR", "testval")
+            testrecipe = 'nativesdk-gcc'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            rd = tinfoil.parse_recipe_file(best[3], config_data=localdata)
+            self.assertEqual("testval", rd.getVar('TESTVAR'))
+
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
-- 
2.34.1


