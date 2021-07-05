Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.558.1625524634592084547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qcela1vX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id u11so22361018oiv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rKVZcHbyNc6FCeuS5CjNS4Bk7pXY3SbkndUZr7/YqYU=;
        b=qcela1vX9sSy4vrecaoaQbZiEzQuvE97YHZoo4ev+tVdFY/7j2enDBwD3k6e+8HZYn
         omm+0VaWVUPvgUEzI4wtjimlWutifuHwD6atDtynqSM0CG0yLka4C1O84FCmagZBsuo1
         0W1dmyRzMgK/MnpwAVkSMUyA9jB8NbZWnbEW5lmNvhowhBXKMSOPDAcYSwCExHSMSKyE
         ityhlonfAy+yzqJqeqANn+4vblj6OS0mp7xboI+ZQOG0KUEHCQFPXed+0qhqaTQjoHLN
         AWCUVexOOuvupzzAZAcUUgIoYEWWyKzM5IDtETyk/X3qEw6XejvGddqml+83FMgYf6F/
         GOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKVZcHbyNc6FCeuS5CjNS4Bk7pXY3SbkndUZr7/YqYU=;
        b=N3CUfqHG581Hq81jXVB/7sEKz9QgzabfO+hNFRN1DXaYP8L5vMBT0INEEFzRne7t/x
         zuoOBLLHIrRpH6N/vwLT5AKKV7buAIKZ9dSy2XP7/uD0hFICJK5RySb3QrDNDrvyLQWe
         TFv7GO3+S++eW+udn69LwsVbvM/Zg9j7eiXndBiqWL+a7+ywLAEvJJKKrjJzCFVyyJVt
         Zygr7jNpaVqQlCSmrVisoStN0eh/TV6hIji02hEk8j2KUyFfg2LjRQH+naCo6PBXfFLG
         e/cARzcQ1QTU4IK7hkdGi77bxTv/AZ5EoPAtz1GlREs/Q1OSsaHBJRHL23uz6c6Y5hKY
         bG3A==
X-Gm-Message-State: AOAM530oO6cv3b3Ia8hJSECxhW9ioZuwibSr6ytmA8T2z9vtzHWLLVxs
	zxb0m9OzA4Vt6H4hwoSE7YtQtPDVdRBlM3I8
X-Google-Smtp-Source: ABdhPJzzKJJAVhHRR/n1B2yI1MAJL/FfTjzHsPo8a2shsM1Ewv2p81+msjsuuNOyQthGEz5mJQiQ1A==
X-Received: by 2002:aca:eb43:: with SMTP id j64mr1044727oih.101.1625524633416;
        Mon, 05 Jul 2021 15:37:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:37:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/19] oeqa/selftest/archiver: Allow tests to ignore empty directories
Date: Mon,  5 Jul 2021 12:34:56 -1000
Message-Id: <5581cbfc33e11e05c839e130202ec00f4337d394.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If we tweak sstate to not remove empty directories under conditions
where a race could occur, we see failures from:

"oe-selftest -r archiver.Archiver.test_archiver_filters_by_type archiver.Archiver.test_archiver_filters_by_type_and_name"

since an empty directory is left behind. Update the tests to ignore
empty directories.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10cda713faea9a348fd278137ac75e4a6d76a71c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index bc5447d2a3..6a5c8ec71e 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -35,11 +35,11 @@ class Archiver(OESelftestTestCase):
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
 
         # Check that include_recipe was included
-        included_present = len(glob.glob(src_path + '/%s-*' % include_recipe))
+        included_present = len(glob.glob(src_path + '/%s-*/*' % include_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % include_recipe)
 
         # Check that exclude_recipe was excluded
-        excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
+        excluded_present = len(glob.glob(src_path + '/%s-*/*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
 
     def test_archiver_filters_by_type(self):
@@ -67,11 +67,11 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe was included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipe))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipe)
 
         # Check that native_recipe was excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
 
     def test_archiver_filters_by_type_and_name(self):
@@ -104,17 +104,17 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe[0] and native_recipes[1] were included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[0]))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[0]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipes[0])
 
-        included_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[1]))
+        included_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[1]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % native_recipes[1])
 
         # Check that native_recipes[0] and target_recipes[1] were excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[0]))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[0]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipes[0])
 
-        excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
+        excluded_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
 
 
-- 
2.25.1

