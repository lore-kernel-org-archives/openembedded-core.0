Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80FCCA100E
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 10:51:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.9814.1694083867481128572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 03:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zc9Z6iaw;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9a65f9147ccso96756866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694083866; x=1694688666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YEd8IN7RsANLxszBkc9dhYro/zla41MG0lzQm5bT+c=;
        b=Zc9Z6iawwVlPQQXxOhmpEe75P0WrKMVIdkgAYagTRVIBLSq7beRvAqUbSQ9gL/DJQj
         CkuIcLvvuFKNvldgGR+cucyAKWt0QoOnouV+rNULuqKz1bMHuRRNBheD0rZpPupz6xGt
         xlrreYC6ke0TQXwtcrfcggZ+NaMqHk6sIFa1L3DxCHaIRVmk+v4QNsrNIc902azu3NYk
         kTv3zQ+d7FxP6kUNuzyCy0AYIdYQQgYOG52y960Wdr8JMCg1mmLel4AfNUMXC8tb03LK
         QXxaQIGmXSrCSrG/z0IermsNkgVXS+1qzc4BjehhQ0cDR9UCBo9ot9Z8orXZAfxIQpdo
         MLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083866; x=1694688666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YEd8IN7RsANLxszBkc9dhYro/zla41MG0lzQm5bT+c=;
        b=a18qMQaYs+8QCjfN/dQof9wWrBB+LdfVa7ptMfdoCUdVbJfSx9xHyz+D1CGq8hGoR2
         rTr9Wmm/Mg9u+UsVkVSye3lTn8N8XZKNF++GFLV71rU27vgDfAz20xhhEbkKENRuavOh
         1ZAm23BFZdr1pnFQWzhfle49jPxISRch6gz9Om0r+aKMFl/amtw1PiZ/wFxL/wSCH3fu
         hy6/dZzV62FmAtRt3rXJVjDopV8tmC4m5iKacQCnks81UBrsGhgkXPtagx7Cq77jsR4E
         xrSkk1umeaoOxudqIsq6T5tPNOIPdNKSuz+bk+y0eangAgnDcoTc+pkUGuN20LvAMRPM
         F/QA==
X-Gm-Message-State: AOJu0YzymJHqL3uzX5MosEc7RKM6MCq7Rn6Fh/NjkygD6QNJ60SimjfZ
	eXGhJmG+gpKx7d4ztyUy+tpcZ2pG8i4=
X-Google-Smtp-Source: AGHT+IGQc0XDmB68+lWm6F+SZ7tOfYTfoDZB9tPCqnpb4uHBJgHiaIOBi3rSZ11021165uSO3KU6vw==
X-Received: by 2002:a17:906:116:b0:99c:5623:a2f1 with SMTP id 22-20020a170906011600b0099c5623a2f1mr3927688eje.48.1694083865645;
        Thu, 07 Sep 2023 03:51:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906078d00b009a5f1d15642sm10172857ejc.158.2023.09.07.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 03:51:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] build-sysroots: target or native sysroot population need to be selected explicitly
Date: Thu,  7 Sep 2023 12:51:01 +0200
Message-Id: <20230907105101.7825-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 10:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187374

Running them in parallel is prone to races as postinsts from target sysroots
rely on executables from native sysroots which may or may not be fully prepared
yet. This was observed for example here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/468/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/467/steps/12/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/ext-sdk-prepare.py            |  2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py |  5 +++--
 meta/recipes-core/meta/build-sysroots.bb | 12 ++++++++++--
 scripts/lib/devtool/sdk.py               |  3 ++-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index d191e5e19c5..89b04030899 100644
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
index bae98359e54..59270fb3e06 100644
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
index 1a3b692a1b1..db05c111ab2 100644
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
index d717b6c2b82..9aefd7e354e 100644
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
2.30.2


