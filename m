Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E5DC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 20:53:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.103710.1701982415795400553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 12:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNnhRxzL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so16131295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701982414; x=1702587214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzvwhVBLaFwCFnKT7Wy3sABu5MEzs8VM3acdZVZIRbA=;
        b=MNnhRxzLv/gNiMtSbVcxc1AHUibolVDYxv9bFnsE3Z86m/MXXePqkEDyYavRrllpcE
         /8s+hrHZfSgFBrY1qv83ceVOQG6lsRLrEauEOnBJUMf1Bjbl800GBzlvokKW5lbH7hd6
         8TbpjtptYDrsv/8eKEbGaW6Bd6w1CbNabGOrDX3bGZOQlOjeiQveT1D0Da1UXcTOtLFM
         2Uq/I/kc4LfizrspHFgBBT3opAdqbXPPYGyBQNbN8GMgHN7gOyfe5MlGNlLlhnZ7c/cn
         bAwIEJ0+udJVKridi1tRNM506lzzwDcXi7ZEL/zS0ArLLh8PyoUQfeR+UbHpmSOfzIzf
         SuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701982414; x=1702587214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzvwhVBLaFwCFnKT7Wy3sABu5MEzs8VM3acdZVZIRbA=;
        b=imWn18j8AOhOIrK8kdgQAONbQq5nxkFFsxefVNvT71uP+kclqRna/49tsm7I0jcw3T
         lA/Lvi36EGn+F+wpb/73TZ/zjsPrDXvXDLfE0cKyQg0Gkk95TJdkhZjoxfQZoyAsXlv7
         4+Kc6Lq5Ds8ZfqexBcAG/jRF3iaklFNkv3nU5P0aiOBOrefDs3xYLP3mieYvpewd26XJ
         vIcCjNGrS3HV7VX5p4QyGgSx9luIWyYzhJHeN4BCm91Z7vrGAlAZRx0jTXaHn4slfdUi
         XwGsDoDR05StszYuA4FkZEs2QZY3PjNtQ42lkn4CXE6o/hmW5u+G/AgYrUoC50C5kKPG
         fl3Q==
X-Gm-Message-State: AOJu0YzDhGo5u6jgLVhQlFffOTYURvfuVS3yTT94iZQ3e88rquIwmw39
	TstRJ+mLgW6nkpvUcADS4A2oxElCWo8=
X-Google-Smtp-Source: AGHT+IGdTvHqd+0sD3S22kdgoNR7V61nCTlEku9+7t4Y9MCkOq7tKzPA5PFjGDreje7xM54cCr+dbA==
X-Received: by 2002:a05:600c:4704:b0:40b:385f:24b5 with SMTP id v4-20020a05600c470400b0040b385f24b5mr914045wmo.15.1701982413998;
        Thu, 07 Dec 2023 12:53:33 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b004063cd8105csm3032484wmb.22.2023.12.07.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:53:33 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] oe-selftest: add tests for C and C++ build tools
Date: Thu,  7 Dec 2023 21:52:51 +0100
Message-ID: <20231207205251.4152034-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
References: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 20:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191976

Add new file for C and C++ build tools. The initial implemmentation
contains a class for CMake and one for Meson. At least these first
tests for the qemu-usermode share most of the code. That's why there
is only one c_ccp.py file and not for example a cmake.py and a
meson.py file.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/c_cpp.py | 60 +++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/c_cpp.py

diff --git a/meta/lib/oeqa/selftest/cases/c_cpp.py b/meta/lib/oeqa/selftest/cases/c_cpp.py
new file mode 100644
index 00000000000..9a70ce29f56
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/c_cpp.py
@@ -0,0 +1,60 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.data import skipIfNotQemuUsermode
+from oeqa.utils.commands import bitbake
+
+
+class CCppTests(OESelftestTestCase):
+
+    @skipIfNotQemuUsermode()
+    def _qemu_usermode(self, recipe_name):
+        self.add_command_to_tearDown("bitbake -c clean %s" % recipe_name)
+        bitbake("%s -c run_tests" % recipe_name)
+
+    @skipIfNotQemuUsermode()
+    def _qemu_usermode_failing(self, recipe_name):
+        config = 'PACKAGECONFIG:pn-%s = "failing_test"' % recipe_name
+        self.write_config(config)
+        self.add_command_to_tearDown("bitbake -c clean %s" % recipe_name)
+        result = bitbake("%s -c run_tests" % recipe_name, ignore_status=True)
+        self.assertNotEqual(0, result.status, "command: %s is expected to fail but passed, status: %s, output: %s, error: %s" % (
+            result.command, result.status, result.output, result.error))
+
+
+class CMakeTests(CCppTests):
+    def test_cmake_qemu(self):
+        """Test for cmake-qemu.bbclass good case
+
+        compile the cmake-example and verify the CTests pass in qemu-user.
+        qemu-user is configured by CMAKE_CROSSCOMPILING_EMULATOR.
+        """
+        self._qemu_usermode("cmake-example")
+
+    def test_cmake_qemu_failing(self):
+        """Test for cmake-qemu.bbclass bad case
+
+        Break the comparison in the test code and verify the CTests do not pass.
+        """
+        self._qemu_usermode_failing("cmake-example")
+
+
+class MesonTests(CCppTests):
+    def test_meson_qemu(self):
+        """Test the qemu-user feature of the meson.bbclass good case
+
+        compile the meson-example and verify the Unit Test pass in qemu-user.
+        qemu-user is configured by meson's exe_wrapper option.
+        """
+        self._qemu_usermode("meson-example")
+
+    def test_meson_qemu_failing(self):
+        """Test the qemu-user feature of the meson.bbclass bad case
+
+        Break the comparison in the test code and verify the Unit Test does not pass in qemu-user.
+        """
+        self._qemu_usermode_failing("meson-example")
-- 
2.43.0


