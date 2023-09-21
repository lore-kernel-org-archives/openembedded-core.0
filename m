Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D5CE7D0B9
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 22:37:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9203.1695335833719955423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 15:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNNSDxFn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4053cb57f02so2639365e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695335832; x=1695940632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTUtY8JqwQ5GVpjd2xBuGPAllu0C2it4V3IR55QIAhw=;
        b=UNNSDxFndBTcB0QzonTS0a0jZxegDMXuOHSuL1UDKbTaY1VRnPjrLOMBH86kNzSoXy
         MGr7/mXnN5EXIvXZT/qQPXS+W1bJq3pe4YKwnHFPtzCLBkFvvamyFn+vDzlBRws01Lgz
         ar8FOIYg4WTb/7XzLmkjf/wBV4QJ3cQD6jhGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695335832; x=1695940632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTUtY8JqwQ5GVpjd2xBuGPAllu0C2it4V3IR55QIAhw=;
        b=L9AygD3bb1aesGbMM8GOEOMzYjguKuZS+q8anD+BqLBS1jYiq2JRf4nW1aIUeOsGax
         T5wTr1yyd8aod9KsNYPp3mtU5PpflyGrj8Kn5aemjD3afv+mgJAAY/piRzz+Lb5umJHa
         TQjsmvOHTVcuh1Q258YIb5xXPI5EE+4lfT6rwbOD8PzizQGiksnmoihqHdGqFX5p1tPU
         eDEKaWXTuaQkqRHIlZPayf+qimRHo+Csz0utd30Yo9QHL0p5jqzhK66Vz+dAGH7j5VVg
         IAMaWcqHiFAu/B1JvJtgATd+IP4Tzt8F9lCjfyDt8HaYaH1+CAKmcqn201DjLtgCXhwx
         PtCg==
X-Gm-Message-State: AOJu0YxwThZmKlS6V65/H7Ydh+2KC46eMtzOKbbli+zLK3wPD7TAoJMo
	FiKBhKtUOXYCdgOIpJg2pOv/HICQTG5PhjcAwzs=
X-Google-Smtp-Source: AGHT+IGszWi4BmEUvA1UdjZKQRRmBelIIrB3u7ioWKB3ThXuXwSGKfJVky7aHni6mMBNiqoSQh0R8A==
X-Received: by 2002:a1c:6a12:0:b0:401:d1a3:d7f7 with SMTP id f18-20020a1c6a12000000b00401d1a3d7f7mr6209815wmc.30.1695335831932;
        Thu, 21 Sep 2023 15:37:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c05cb00b003fc06169ab3sm947410wmd.20.2023.09.21.15.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 15:37:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] oeqa/selftest/oescripts: Avoid variable access at module load
Date: Thu, 21 Sep 2023 23:37:08 +0100
Message-Id: <20230921223708.1333390-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
References: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188033

Using get_bb_var in the class setup leads to slow startup of oe-selftest.
Move the calls into setupClass instead to remove the overhead at the expense
of some code duplication.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 7d3a00e2ab9..f69efccfee6 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -36,18 +36,16 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
 
-class OEScriptTests(OESelftestTestCase):
-    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
-
 @unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo module is not present")
-class OEPybootchartguyTests(OEScriptTests):
+class OEPybootchartguyTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
-        super(OEScriptTests, cls).setUpClass()
+        super().setUpClass()
         bitbake("core-image-minimal -c rootfs -f")
         cls.tmpdir = get_bb_var('TMPDIR')
         cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
+        cls.scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
 
     def test_pybootchartguy_help(self):
         runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
@@ -65,7 +63,12 @@ class OEPybootchartguyTests(OEScriptTests):
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
 
 
-class OEGitproxyTests(OEScriptTests):
+class OEGitproxyTests(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
 
     def test_oegitproxy_help(self):
         try:
@@ -126,7 +129,13 @@ class OeRunNativeTest(OESelftestTestCase):
         result = runCmd("oe-run-native qemu-helper-native qemu-oe-bridge-helper --help")
         self.assertIn("Helper function to find and exec qemu-bridge-helper", result.output)
 
-class OEListPackageconfigTests(OEScriptTests):
+class OEListPackageconfigTests(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
+
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
     def check_endlines(self, results,  expected_endlines): 
         for line in results.output.splitlines():
-- 
2.39.2


