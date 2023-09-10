Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96E3EEB594
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.39059.1694362769153463124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lehGL3O0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31f4a286ae1so3341079f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362767; x=1694967567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv7+Ku4KF5JgOBQ3HF31jwDkk7kvG+2IIEvPIX8kbRU=;
        b=lehGL3O0KdF9Hytgjk2pSHVGXneHZktxwIGxCDjFogQMrtAPE3IdD24iAC87tCwnMg
         1PLE5zW8qKj5LX7SnN+Wz4QILMERKUCitISFBCrVSp6+o02yl8h7h1jMTxTPOxSEF4/5
         0g3GRxYHHcbX7vnlN1LEJkymSVs7QFDIvFk1kZHC/XRDbaLQtilT7f83PMqeFkfC+HPx
         gQj5PqgmG9tkuKZt94zsDVMiARkDZo1KGFIdsPkNbWZUt4SJXo1/XaLuFEh9htmPMTw5
         RdOzIodgjnMvwi3H7azRrFDfcx/knRvYPT1rLN/+x7oMKy+I2DdQVt2bKrpLvWMgIBvg
         Ygrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362767; x=1694967567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv7+Ku4KF5JgOBQ3HF31jwDkk7kvG+2IIEvPIX8kbRU=;
        b=rMea7Z5y2cmvwNiKWl3++nDOSoQbq+jdwrVLnOmP5Nu5f2RJCvK4xiGjYP93v0h4oX
         zOhqcJa30ry1SCuF+wR54eGG6BMv3jeYk/KHhj6eWu+Md02tTy5JXax/oJF537Aj1js9
         HmQOZ7meBg1XEQ2nv+mDMEDSRGAaArxKxqzahuzYUrPVcVoebOXgDG/bqjILrEoi0dA8
         z08Zbc9ME74oNAcf1q4K0ncBp3wibVf9A5IR/s/NCqT4rgxZ9P9Dhcn4t0QhZxBZzzbA
         e2SMwbYz8aGcnSY6Yj9WggoKWqsVy+3q6fIffPwIRRAHRNEnyC0ids6N2dJislCc8OsB
         JVhA==
X-Gm-Message-State: AOJu0Yw0e74wuub5Sx8i1YfOB4QiqT6Rl+RrWoMauM0WpYAa8t+JyV7L
	TrG+9mRPfDFiYLb4srbBj+HOOZZEM6k=
X-Google-Smtp-Source: AGHT+IEXxaOAaqahLJsS8+X5V2EQM0enRL13Sn2lwZ9byX7VHsIN8rdlrfP160h2FDpJxSBNEThpeA==
X-Received: by 2002:a5d:690d:0:b0:31c:6697:6947 with SMTP id t13-20020a5d690d000000b0031c66976947mr6248046wru.69.1694362767295;
        Sun, 10 Sep 2023 09:19:27 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:26 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 10/12] oe-selftest devtool: refactor runqemu pre-requisites
Date: Sun, 10 Sep 2023 17:52:36 +0200
Message-ID: <20230910161850.4032227-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187468

Split runqemu pre-requisites into a function which can be re-used by
other tests as well.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 48 +++++++++++++------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a2b77e528de..b577f6d62a1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -256,6 +256,31 @@ class DevtoolTestCase(OESelftestTestCase):
         if remaining_removelines:
             self.fail('Expected removed lines not found: %s' % remaining_removelines)
 
+    def _check_runqemu_prerequisites(self):
+        """Check runqemu is available
+
+        Whilst some tests would seemingly be better placed as a runtime test,
+        unfortunately the runtime tests run under bitbake and you can't run
+        devtool within bitbake (since devtool needs to run bitbake itself).
+        Additionally we are testing build-time functionality as well, so
+        really this has to be done as an oe-selftest test.
+        """
+        machine = get_bb_var('MACHINE')
+        if not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
+        if not os.path.exists('/etc/runqemu-nosudo'):
+            self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+        if result.status != 0:
+            result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
+            if result.status != 0:
+                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
+        for line in result.output.splitlines():
+            if line.startswith('tap'):
+                break
+        else:
+            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+
     def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
@@ -1616,28 +1641,7 @@ class DevtoolExtractTests(DevtoolBase):
 
     @OETestTag("runqemu")
     def test_devtool_deploy_target(self):
-        # NOTE: Whilst this test would seemingly be better placed as a runtime test,
-        # unfortunately the runtime tests run under bitbake and you can't run
-        # devtool within bitbake (since devtool needs to run bitbake itself).
-        # Additionally we are testing build-time functionality as well, so
-        # really this has to be done as an oe-selftest test.
-        #
-        # Check preconditions
-        machine = get_bb_var('MACHINE')
-        if not machine.startswith('qemu'):
-            self.skipTest('This test only works with qemu machines')
-        if not os.path.exists('/etc/runqemu-nosudo'):
-            self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
-        if result.status != 0:
-            result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
-            if result.status != 0:
-                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
-        for line in result.output.splitlines():
-            if line.startswith('tap'):
-                break
-        else:
-            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        self._check_runqemu_prerequisites()
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         # Definitions
         testrecipe = 'mdadm'
-- 
2.41.0


