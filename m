Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0935DCCA47C
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.11473.1658515171520880319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aGdPZrUG;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id va17so10060291ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R8FBVLq9AFCEW9Z26eOWgsInvYCIr3eVsYaje6tixiw=;
        b=aGdPZrUGP6xFUfgIpHgB6Oo/xIGKMQvXjsKAvFJ7TwXTy5JWLAOCkL6eiHt9SKUR1s
         hK6j4Ka+vMx6XGXqJXxoFaidhm52ZyhIhxF6Viyf+PFYwDMgMoyhHcMZw7N0hoDJz/26
         2GHY+W3XNTRSx72j5RHQ7zrMdUYMfxrak9aZHDQoDtvmWzBEr3RpZUwzfBochQhzKC/X
         7HvZbK4phwIeDF0/5LJ6KaQ8GBAaQ7muE8UMwqvOgb7uuBui4AXdQiPJ0upx8sZI9sZ2
         3Hl7SCh/G7bDNLiUzGE4O6Cm5mvL4+ZStvYCiVX7j5nlXQXhhzqFJ1ullZRPQnfwKecJ
         Yl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R8FBVLq9AFCEW9Z26eOWgsInvYCIr3eVsYaje6tixiw=;
        b=bKr+cGxL5x1mti+KnKJCu7SN264Lergim3S8yOK3a+VU62jRMMrPrL9SqrHwMnPICb
         t7l/1peTBNObRX/4J76cGI86okmxxcvM2UqPV8SErqcpEaKZbmN4VseUFvQmbScEK3TU
         ISBv6RtzaA6lL2rDw4kazkU+gzn3SbG1EuMiEj8rn7OM6utR0zwexsCfABfQHvY+Vxhz
         ZCfhC7Hp2rtDV+FoNLvdeEW6mvqjD75eGeu92wlOSJMPk2WO8Bh0vPqgLsOf8hveoP08
         DMyoScI6VTgejDmBy5jAdtgxiJaHt7CmzsObwK1vTGvQ634nAModIn2HY/YWThReGd79
         cyVA==
X-Gm-Message-State: AJIora/+5d21F6tx5FPqjl9Su1AxgDwmhwv9t1szWsWu2xykZPWsSNGg
	wurqoEWeOTe3CUjVbU+TOSXjNN2q2pY=
X-Google-Smtp-Source: 
 AGRyM1s2RrF0EDwn+v1T3oBAyaG0ZrMOtxTQbF60AtteceNS8fP26Le1ESfpLUM0xg2GfRqDZI0Uag==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr918448ejc.762.1658515170045;
        Fri, 22 Jul 2022 11:39:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] selftest/meta_ide: add a test for running SDK tests
 directly in a yocto build
Date: Fri, 22 Jul 2022 20:39:16 +0200
Message-Id: <20220722183916.360600-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722183916.360600-1-alex@linutronix.de>
References: <20220722183916.360600-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168423

There's been a recent discussion about how we can make the Yocto SDK
experience better [1]. One of the ideas was to eliminate the SDK
as a separate artefact altogether and simply provide everything
that the SDK and eSDKs do directly in a yocto build. This does not
mean that people have to 'learn Yocto', but rather that the integrators
should provide a well-functioning sstate cache infrastructure (same as
with minimal eSDK, really), and a few wrapper scripts for setting up the build
and the SDK environment that run layer setup and bitbake behind the scenes.

[1] https://lists.openembedded.org/g/openembedded-architecture/topic/thoughts_on_the_esdk/90990557

So without further ado, here's how you get a 'SDK' without building one:

1. Set up all the needed layers and a yocto build directory.

2. Run:
$ bitbake meta-ide-support
$ bitbake -c populate_sysroot gtk+3
(or any other target or native item that the application developer would need)
$ bitbake populate-sysroots

3. Set up the SDK environment:
. tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
(adjust accordingly)

Et voila! The Unix environment is now set up to use the cross-toolchain from
Yocto, exactly as in the SDK. And devtool/bitbake are available to extend it,
exactly as in the eSDK.

Theare are numerous benefits here: no need to produce, test, distribute and maintain
separate SDK artifacts. No two separate environments for the yocto build and the SDK.
Less code paths where things can go wrong. Less awkward, gigantic tarballs. Less
SDK update headaches: 'updating the SDK' simply means updating the yocto layers with
git fetch or layer management tooling. Built-in SDK extensibility: just run bitbake
again to add more things to the sysroot, or add layers if even more things are required.

How is this tested?

Exactly same as the regular SDK:
$ bitbake -c testsdk meta-ide-support

This runs the same toolchain tests from meta/lib/oeqa/sdk/cases as the regular
sdk testing does.

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


