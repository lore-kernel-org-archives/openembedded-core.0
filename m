Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D0C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.13258.1707571062561263229
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WG77U4Tt;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so244634966b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571061; x=1708175861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N+g7vT0ABTx8/gxZxBS/XbecktzjossJ3rJkbP+LaY=;
        b=WG77U4TtghK0hR68L37sc2PCVSutn1sIdS/w+w/5ongU44ByO/ch2F9ZZwPeXCfjLB
         xpIPaozB7Vl2LE23HdzM3VaPXOZxcCaSULsJlnNWess/eSURzMRTQdbEwyQf6d4RuH2y
         0AARa/bDf/biBZkUbWpJH81KvvhFUl3Zslk/lWQwuyZXw1Nd9P1j54WhBR7CA8hB/tj+
         s+JjMvp5S1tT0jUEPA7NGPf+n0fW1HB4Fg8ExBs65qyJ1wPmRRuoCCbsbRNITc2l+WwY
         VwXLpHVyhSfAztYol6JmSozQAhrOjkHyhF110HuNXTAvGLhoY7yMOuaB/dCDOUZSNYnP
         roZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571061; x=1708175861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N+g7vT0ABTx8/gxZxBS/XbecktzjossJ3rJkbP+LaY=;
        b=KHf5G/9KWFRnprxytKxsxq73pysKJaCUo3jNEyEqB9NucWe7ejlACrNKOgUYiQZ+e7
         s+ICB6G3vqr8UFJNSCAy/XucYEIRwOT0e9BDnYXPYicjBjkSyIwy3P/wXVXwiPB+v96g
         htTKGjBBndQP4TgrcblrI0cG/pbaTEUycjgBjW8DkfrUZNtMxVXXg6G5zNPE6ZXVMNzg
         ahD0vOS7fYEU/iNDNdtUO2OUE8ZSF7na9PoUti+uf0bCF6+s8L/CJ9XCDiTTqmLx+qOT
         e4UjBuCmCwJqpEVkdk0UjuQBGCpgDr957XIsDTWTc0G6/0iXnZekvN5FFeK6uWSPyYFg
         rbnA==
X-Gm-Message-State: AOJu0YwpJ0E2xmERX3CAOEdC1eGKkGlsIVjhTFJS8+vlXrPl5OPJoLVP
	+YrLZa+uO/7z7SYydVoR7TDbp4WdDpe9E+jxjzHUZm7ZezOIbZDNi7gO9v3s
X-Google-Smtp-Source: AGHT+IFDXy9VdJiZVy37abhAoRXqNTGQVxSypm53z1QIuL2USNUbxGB2TUX7vjC4KqZsnbogyhHvcg==
X-Received: by 2002:a17:906:1b12:b0:a3c:efb:5a08 with SMTP id o18-20020a1709061b1200b00a3c0efb5a08mr1271902ejg.63.1707571060774;
        Sat, 10 Feb 2024 05:17:40 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/7] meta/lib/oeqa: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:57 +0100
Message-ID: <20240210131727.342583-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195269

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/oetest.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index cf417db0d42..bcb6a878c7a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -241,7 +241,7 @@ class TestContext(object):
 
         modules = []
         for test in self.testslist:
-            if re.search("\w+\.\w+\.test_\S+", test):
+            if re.search(r"\w+\.\w+\.test_\S+", test):
                 test = '.'.join(t.split('.')[:3])
             module = pkgutil.get_loader(test)
             modules.append(module)
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa0602348..2475a79468f 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -54,7 +54,7 @@ class BitbakeLayers(OESelftestTestCase):
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
-        find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
+        find_in_contents = re.search(r"##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 9383d0c4db1..347c0653776 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -204,7 +204,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Configuration', ' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match('^ *', line) in (' ', ''):
                 in_signed = None
             elif in_signed:
@@ -525,7 +525,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
@@ -680,7 +680,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
-- 
2.43.0


