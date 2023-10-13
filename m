Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F15CDB484
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.51149.1697234007429971435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NEDeCabQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso366710b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234006; x=1697838806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9Nxr34LASJQh3dumGc2mAVzTOweuKad35QwmgcClnU=;
        b=NEDeCabQq2BZPGgu9H/msjNU2vN4g+/AuiUf1CJeDgpgvR2JcMW5JNGEjfxBOCEeWg
         lEbKEBXvDLxZhmVU0ZybqLXVo0/0h1L+at4hZ7bghMqQv8y+dfB2bCwSO7mJgeBszpB8
         vTxdjyZw52rN7entC/XRQUC764qTgKrcA7NknNKTs1PW5ypLZaf+ifPngudWGuS1x+Cj
         nBT2IDLX8GxB3JyaGeE1VDCWriBPDQ0U4bu3E2bycDz51AMDhuEhqMy8LmnFo1ESnO+R
         h/7WS1CODJWg3dD9FgYyTzsJQzQJqDal/iImQ3lYS+d18cl/plEUSNKpITYmdX29kFbY
         ibbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234006; x=1697838806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9Nxr34LASJQh3dumGc2mAVzTOweuKad35QwmgcClnU=;
        b=LWRhBsZvD36AZuv9PzyuAsNxA5EXt6d7exMojUFzoseIatNT7l2DoVu+R+bsU+IJ0d
         lmbtIBsUKwlyh7niM+ceTW7ZBSwVm7DhygJ2GmD06sSTwhgAoLoAeQgZw+W+10/xneAc
         Ihifm4xz6AD48Y/3OLQOuSEhqfd8hRLBC8UneinLM3y9EC9F89K1oPbkxnLyUJUQbQSG
         4L3lamM9OG4iILooyjXH7k8nm3ak8SBT+BUpMYSbId/m1pfQjNz+n8hCdtpRVomXihex
         TmDbw6TzfUpOxnOjDAaDMhV3bjsRmjWmy0KoiqrqtRnCkzVNvElcFUu0OKnVKFgp8Eo5
         so7Q==
X-Gm-Message-State: AOJu0YznBwwvrq9bQY9IRa9KQRDzNM/R2Rr9/BHL4KtFTer1hD2LPTnv
	TPwxMBw7EtkaLKOFUkFd9gMqJ1OQw1pA/QP5P5I=
X-Google-Smtp-Source: AGHT+IGtdOdxtbDSplMLNcz8YpfrbJDTxWtMctkDlSB/ZzPfEsnGpSWzge4jTgl9jYprZ4sf5d+Uvw==
X-Received: by 2002:a05:6a00:2394:b0:690:2ad9:1454 with SMTP id f20-20020a056a00239400b006902ad91454mr35271667pfc.33.1697234006544;
        Fri, 13 Oct 2023 14:53:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/27] build-sysroots: target or native sysroot population need to be selected explicitly
Date: Fri, 13 Oct 2023 11:52:38 -1000
Message-Id: <93e864a23e3f82edc2b2fa2207b2bc4b56c230a9.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189091

From: Alexander Kanavin <alex.kanavin@gmail.com>

Running them in parallel is prone to races as postinsts from target sysroots
rely on executables from native sysroots which may or may not be fully prepared
yet. This was observed for example here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/468/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/467/steps/12/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 38d7a2e45b883cf999a86af05bcc0eaa875bb47c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/ext-sdk-prepare.py            |  2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py |  5 +++--
 meta/recipes-core/meta/build-sysroots.bb | 12 ++++++++++--
 scripts/lib/devtool/sdk.py               |  3 ++-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index d191e5e19c..89b0403089 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -71,7 +71,7 @@ def main():
 
         ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
         if not ret:
-            ret = run_command_interruptible('bitbake --quiet build-sysroots')
+            ret = run_command_interruptible('bitbake --quiet build-sysroots -c build_native_sysroot && bitbake --quiet build-sysroots -c build_target_sysroot')
         lastlog = get_last_consolelog()
         if lastlog:
             with open(lastlog, 'r') as f:
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index bae98359e5..59270fb3e0 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -18,7 +18,8 @@ class MetaIDE(OESelftestTestCase):
     def setUpClass(cls):
         super(MetaIDE, cls).setUpClass()
         bitbake('meta-ide-support')
-        bitbake('build-sysroots')
+        bitbake('build-sysroots -c build_native_sysroot')
+        bitbake('build-sysroots -c build_target_sysroot')
         bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
         cls.environment_script = 'environment-setup-%s' % bb_vars['MULTIMACH_TARGET_SYS']
         cls.deploydir = bb_vars['DEPLOY_DIR_IMAGE']
@@ -55,5 +56,5 @@ class MetaIDE(OESelftestTestCase):
 
     def test_meta_ide_can_run_sdk_tests(self):
         bitbake('-c populate_sysroot gtk+3')
-        bitbake('build-sysroots')
+        bitbake('build-sysroots -c build_target_sysroot')
         bitbake('-c testsdk meta-ide-support')
diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 1a3b692a1b..db05c111ab 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -22,6 +22,14 @@ deltask collect_spdx_deps
 deltask create_runtime_spdx
 deltask recipe_qa
 
+do_build_warn () {
+    bbwarn "Native or target sysroot population needs to be explicitly selected; please use
+bitbake -c build_native_sysroot build-sysroots
+bitbake -c build_target_sysroot build-sysroots
+or both."
+}
+addtask do_build_warn before do_build
+
 python do_build_native_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
     nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
@@ -31,7 +39,7 @@ python do_build_native_sysroot () {
 }
 do_build_native_sysroot[cleandirs] = "${STANDALONE_SYSROOT_NATIVE}"
 do_build_native_sysroot[nostamp] = "1"
-addtask do_build_native_sysroot before do_build
+addtask do_build_native_sysroot
 
 python do_build_target_sysroot () {
     targetsysroot = d.getVar("STANDALONE_SYSROOT")
@@ -42,6 +50,6 @@ python do_build_target_sysroot () {
 }
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
 do_build_target_sysroot[nostamp] = "1"
-addtask do_build_target_sysroot before do_build
+addtask do_build_target_sysroot
 
 do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index d717b6c2b8..9aefd7e354 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -300,7 +300,8 @@ def sdk_install(args, config, basepath, workspace):
             return 2
 
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots', watch=True)
+            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_native_sysroot', watch=True)
+            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_target_sysroot', watch=True)
         except bb.process.ExecutionError as e:
             raise DevtoolError('Failed to bitbake build-sysroots:\n%s' % (str(e)))
 
-- 
2.34.1


