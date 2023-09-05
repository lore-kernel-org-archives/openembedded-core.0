Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE82CA0FF8
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.27506.1693933182129853152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fT8gwW8R;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-402c1407139so28920855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933180; x=1694537980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv7+Ku4KF5JgOBQ3HF31jwDkk7kvG+2IIEvPIX8kbRU=;
        b=fT8gwW8RXhly/vf6kiBpD8dtiNg5KnB4GYiFJDLa0Pm9bONIXSNjDAVtYdh+yDRxL1
         UvNSy0AZgr/pULP6tQjkJE2AzfbT9ke4Y8qSoPzA6DnzbpcMsniEMRCXO1dbFr0G/4aG
         w/xJ2g3zxnRGCmz9dcVyV6hZAE/PgX20/HUuT+MtPQLoBYXKcJffObx+ZdDymA/9tq9W
         k11YBd7SY+EpI7geB8ln1lIq0tb4tzKBxYb+VU/ZVd4m2svRoGesNrK1IwEXHibW82NB
         x6L87+QPNteBbmMrHqHvkOPFq5WNGH7HDydLYSBxuBkPRyVc2fZDvnAY3jbdyzrGS0AC
         SeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933180; x=1694537980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv7+Ku4KF5JgOBQ3HF31jwDkk7kvG+2IIEvPIX8kbRU=;
        b=fmZ/n+NtX+bgi00a997gI3Ku4PMm291n0C8YPry6yo4tBD7/cnF8f4xR0F38I+H52W
         LrSd/NAPLANAoI8MKA1NwhWDf6wSu//ufLHkQOSa8eoEFmb+4sj2n/pDzljXrdtUvHp8
         bV3LioMOO5kazy6qSfb5CNrg4UQVLjbNzqmJmc4WzSURbwL/TxIqhJIVSUhbm95UYSuG
         k/cus5NRp+vv4YGWw6ejwAixwgZFCd3b3XdKU+/adlyDC3Wclff/In4f/EsBNeqUWzBL
         +mLjsIVqY/f76qO7iTtSANqe9kEB6E2V5v9tpKUBiqrcB21Ur5ljdIWK4QVL5PQdCNR/
         nZGg==
X-Gm-Message-State: AOJu0YzRSaPuCRTrHDGoBA+JZU03uufb4cyh649WU8YQPY3isKXmvuyv
	8cwruclzOjsGzVR+r2JEd0zna7CWPVA=
X-Google-Smtp-Source: AGHT+IGHobYKEBwnAZdA0X065UGIoe5Qa2veTWXV4JL2GywSIdwYcpbKvueGcRk7pZAm9kd3H+46Vg==
X-Received: by 2002:a05:600c:210f:b0:3fe:1871:1826 with SMTP id u15-20020a05600c210f00b003fe18711826mr235403wml.27.1693933180262;
        Tue, 05 Sep 2023 09:59:40 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:39 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 12/14] oe-selftest devtool: refactor runqemu pre-requisites
Date: Tue,  5 Sep 2023 18:51:21 +0200
Message-ID: <20230905165913.2560907-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187244

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


