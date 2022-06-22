Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2046CCA483
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.5653.1655894022402083039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o91XqR8C;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id eo8so23303940edb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eo8/XsyRswPrP5txETahSKh/CzkDHY6Z8B0UBfKQpdk=;
        b=o91XqR8C1JjaPcGDqkUdcxHoUHPwIe3geilqGPgXudwOrEz3rG9aGcWXvOzDA3APUI
         ergaS/Ifa4d4QatK6kTMz5Z++qzI6vkMLG7tbf9dF3dLh4tS9hYZ9u+q4wjj3hGvAvzY
         EcNXI7hGZ7Pl7btXxnY65iFPGA3sny0dKhaS70Kq7bVpB+hu/MrI7MzmcbZllCmpx0iB
         oKNT+7uQf5WQAlKQ8EWOGlTyffawvTsaJZEE4u5B22CD+J7HsXySd//ya33JDR3sPXHL
         DXEwbNrxDOJllyyEejfHENyy8shIoNCXWOcTt/arryF6LBw0p8acGVovU+kcAkLPGDAI
         Wt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eo8/XsyRswPrP5txETahSKh/CzkDHY6Z8B0UBfKQpdk=;
        b=AwGMpiyZBuHxdv7lrVGHBSAsHywhY8SVXAxcSQodMMCCv8XxbJ0XBNsBktmuTIi3c6
         pDjmCBQJgMVmvA6HTdxDKy5lT0DWk29oofc1Zf8pG8oKI66YDFNkDDcbW7kLBVhND/Z9
         Q8Z1COcBTCm400IMxDf06aOisxGbVwJATPiIUtMxyl/4JjRNSpWX3g2dwpzseGppSulv
         QW4cgraxHPoF9TFzQ6Jql997lPIGUpczs2g/i0SqQP+29v9ZADuJiqliHRPr6unQWtvA
         22hYuiyAMyIXk3FlCWg3pLmXXvVJmCKGPameoA9Z8ZyVMNpa2JJW6rODDdKxryj3NhRe
         JwgA==
X-Gm-Message-State: AJIora84Na5hT58QPkx+iz2p15Kpx5y9w8auDsqxsMY5c9B77JlAcn+F
	hSq79v375YP8eJfHeYx5+8DpUoPthAuLXQ==
X-Google-Smtp-Source: 
 AGRyM1v70EK/qxJIE8f8PZP/F7NTvjTJE084zOtcJt3ACzfug/dH6osjlS6xnt9CDX2pK/kuu3afpw==
X-Received: by 2002:a05:6402:2752:b0:433:3a08:27b1 with SMTP id
 z18-20020a056402275200b004333a0827b1mr3302535edd.235.1655894025208;
        Wed, 22 Jun 2022 03:33:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 4/6] selftest/meta_ide: add a test for running SDK tests
Date: Wed, 22 Jun 2022 12:33:10 +0200
Message-Id: <20220622103312.1098389-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167229

This also shows how the SDK workflow inside a Yocto build works:

bitbake meta-ide-support
bitbake -c populate_sysroot gtk+3 (or any other needed target/native item for development)
bitbake build-sysroots
. tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux

And voila: just the same environment as the (e)SDK.

Adjust the location of environment script to be in deploy dir, not in tmp dir.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 6f10d30dc9..ce7bba401d 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -16,13 +16,14 @@ class MetaIDE(OESelftestTestCase):
     def setUpClass(cls):
         super(MetaIDE, cls).setUpClass()
         bitbake('meta-ide-support')
-        bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'TMPDIR', 'COREBASE'])
+        bitbake('build-sysroots')
+        bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
         cls.environment_script = 'environment-setup-%s' % bb_vars['MULTIMACH_TARGET_SYS']
-        cls.tmpdir = bb_vars['TMPDIR']
-        cls.environment_script_path = '%s/%s' % (cls.tmpdir, cls.environment_script)
+        cls.deploydir = bb_vars['DEPLOY_DIR_IMAGE']
+        cls.environment_script_path = '%s/%s' % (cls.deploydir, cls.environment_script)
         cls.corebasedir = bb_vars['COREBASE']
         cls.tmpdir_metaideQA = tempfile.mkdtemp(prefix='metaide')
-        
+
     @classmethod
     def tearDownClass(cls):
         shutil.rmtree(cls.tmpdir_metaideQA, ignore_errors=True)
@@ -49,3 +50,8 @@ class MetaIDE(OESelftestTestCase):
                         msg="Running make failed")
         self.assertEqual(self.project.run_install(), 0,
                         msg="Running make install failed")
+
+    def test_meta_ide_can_run_sdk_tests(self):
+        bitbake('-c populate_sysroot gtk+3')
+        bitbake('build-sysroots')
+        bitbake('-c testsdk meta-ide-support')
-- 
2.30.2


