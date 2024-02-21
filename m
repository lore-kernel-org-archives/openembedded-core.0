Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB23AC54791
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.506.1708544451303112473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gi6wpUpn;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d18931a94so842252f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544449; x=1709149249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL5bbV6PegO7Hw/DFKm3cHodje+2IMFbVortKt1eA+Y=;
        b=gi6wpUpns1b44wUS3jN/XcMLDWZ4Lct8c67wlPUdCDGDQrA5LuorBxx+cv8s41id5P
         DcSi3L3gkJhjNcky1WsGql71rKCClWB8juAW+vTkxiK5Vc+pioAolQqQ4XPQ5tUVJ71M
         gKxVyW2Hm3g42QPlq3qiGuViMwK9LCe0ldzFtnmX7NySDEEUDeFE6u9dONSMbocxlhdn
         5HPQQ+YM6iam4E8ihyPWZfX43VZDoNb0pm5dOQBduynlXX7z6zJ1fl1Df4ODmx6/aJJk
         Qn/KgpZI0Z+x6ncoRZD9vYekk+mk404i+hAhzjXEOBT4hoiD07qnXc/88L2DucibYnCW
         KjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544449; x=1709149249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL5bbV6PegO7Hw/DFKm3cHodje+2IMFbVortKt1eA+Y=;
        b=aKykfo1YCzjLo9nzoomAkXvy8dg8t15mOXhfZOD4GWAu0V8n6R0pTeCuAmdDCCEBlc
         eBGSNN/dctNq+g/K9eXGIg2oQ0ZugB2LkCdYewTbJwjgISvYJXNaZEjtgIDcdjP0ge9M
         CNxNlds7RND0VdghKseZWuWn6MbcTP9dzLJRilEF7E9SmyKV0z/OOGcMJgHCQfbwc6DG
         +y4OmJCNtFCqD8wn7iitR6vj35ePXMAWoqxk6h2bsiYKB/mkqHssqaWgdXhuTFJGrMOt
         5v1XuuNqxqqmcbTKbKZSyv7A4sVivHTwXo7/X1XByQhMvQrhfJH4UAs/lPTaT06b8p/1
         ZRsg==
X-Gm-Message-State: AOJu0Yw5ravuzRcofjciaziIjYkfFJNfIXLduxBKPCjSAleoBfApMLEK
	UwYbVvnDEHsKwp4nXEFsGANVuYtZYhr4Yt44AhRdIqhrUGIn/0yL+e3+HBSt
X-Google-Smtp-Source: AGHT+IFD4dzUlz0YOWsvT9TyffBQ/bk1KKeAH6PVdgIpK5Ch4rW+8g87iAeMo/vSks+Tzl3wAAS5Sg==
X-Received: by 2002:adf:e74a:0:b0:33d:6984:3f80 with SMTP id c10-20020adfe74a000000b0033d69843f80mr3949218wrn.67.1708544449520;
        Wed, 21 Feb 2024 11:40:49 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 11/13] meta/lib/oeqa: python 3.12 regex
Date: Wed, 21 Feb 2024 20:37:03 +0100
Message-ID: <20240221194036.1804463-12-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195995

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


