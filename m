Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B534CC48BF0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.4922.1708035447253226455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTI/18eb;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-411d76c9ce3so11514685e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035445; x=1708640245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL5bbV6PegO7Hw/DFKm3cHodje+2IMFbVortKt1eA+Y=;
        b=ZTI/18ebyrzys5nFTENWCCjQV9dz94Z62EJNhg5maLrS33fKbE+ajCnNQMP1K/Fo6M
         ZkwwSbjTmKHibthQHuV2gitQN8uzcBMm+4ypgC6mPsY5inDmAGj6JaYeOB/hzXbYHwLK
         T0aSbBu8zqhqEZI/Bd8HP1ZWLPspFb/ZWyOU1dozlt1bw43Mtj5WzjzhdYfim/0EuoZ8
         60X9BlnX42EW5GyMUM8BZZcPT4nG7QykB1rqhR405Ae7kmS8VzW7D8XtiMMGL8Q5Vm3F
         xdPq6ldEpwtBLfzVOzQ11xk9OwX6VGPdam9RY+GaJMe0okQ66APo0ki8avhZkPh3YtfU
         a/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035445; x=1708640245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL5bbV6PegO7Hw/DFKm3cHodje+2IMFbVortKt1eA+Y=;
        b=Gok5yN1U8luktkuSR+00TvbwfQFAsOFj0XuOixaVT9HvEn13ngA27VSnF5Kqo4bmHF
         amQ7ygsUkx2ZsB5mOG5dGHQ6Ppue0jZKPJgW2zKp5ypbrxc2XtD7fcRDbvYJSmJSdp/E
         XZjESwFhb1o8MYsnOb/N4oIwyN0uAU8mtAnh3vNZb8ZxmkIEw8cV3LEjfTnXwhpbU7AE
         UDmL6d/tEe2Cm3Bkb6h+zqoepmquHY+Jnj/tbiMaNle/o5BMz2IqV8PxxxNjf4xlQuH5
         /VB9vZC0lsPIV8u5cabpRiKjx+TQA/qtd7uOnqbKhujd8ClGRrEpPRhv82BpaEPhpiAU
         PVCA==
X-Gm-Message-State: AOJu0Yzp1BirHrRCH1MIlIL7NqfGf3cgYQ4qC+Wll9sdRiIUIZwOVaH9
	mSK7y+aLYcFJZ6BFH69+sHkJR/vbEfLZp2wg8AWZ6iJj/Uva8My2YoC+0R2dAdA=
X-Google-Smtp-Source: AGHT+IHWQxVsP+K25CUPhDFqjnqC1WQWqJYCisfxVNYerkQQsrzX1XhxMcg57lfFDdTQd6aIng7iIg==
X-Received: by 2002:adf:e450:0:b0:33b:60ca:269f with SMTP id t16-20020adfe450000000b0033b60ca269fmr2108777wrm.43.1708035445384;
        Thu, 15 Feb 2024 14:17:25 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 10/12] meta/lib/oeqa: python 3.12 regex
Date: Thu, 15 Feb 2024 23:13:56 +0100
Message-ID: <20240215221711.332614-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195721

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 9002850f0c2e409d3bc629e36bb360b96326bb64

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/oetest.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py | 2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9c84466dd0..b53c611062 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -256,7 +256,7 @@ class TestContext(object):
 
         modules = []
         for test in self.testslist:
-            if re.search("\w+\.\w+\.test_\S+", test):
+            if re.search(r"\w+\.\w+\.test_\S+", test):
                 test = '.'.join(t.split('.')[:3])
             module = pkgutil.get_loader(test)
             modules.append(module)
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 7d74833f61..0b9f16eeae 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -46,7 +46,7 @@ class BitbakeLayers(OESelftestTestCase):
         bb_file = os.path.join(testoutdir, recipe_path, recipe_file)
         self.assertTrue(os.path.isfile(bb_file), msg = "Cannot find xcursor-transparent-theme_0.1.1.bb in the test_bitbakelayers_flatten local dir.")
         contents = ftools.read_file(bb_file)
-        find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
+        find_in_contents = re.search(r"##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
     def test_bitbakelayers_add_remove(self):
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index d732a9020d..4d820faf92 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -202,7 +202,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Configuration', ' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match('^ *', line) in (' ', ''):
                 in_signed = None
             elif in_signed:
@@ -521,7 +521,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
@@ -675,7 +675,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         signed_sections = {}
         for line in result.output.splitlines():
             if line.startswith((' Image')):
-                in_signed = re.search('\((.*)\)', line).groups()[0]
+                in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
                 in_signed = None
             elif in_signed:
-- 
2.43.1


