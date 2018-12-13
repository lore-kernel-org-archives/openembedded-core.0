Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 58C4879E2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:43 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m1so17538pgq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=P3G2oHXhlG6l7T8L1qrzrZSFDy4s7s3cqJx766ToEgg=;
	b=FYlf0sXAqpFd1L4GjM92RCogd7xyA6S7c+jwrCrvoBvbLMWPFUIsOmA1iXeMlFNE80
	NzvYMmc4F6Ga26Cs25to/NSwVN2GxaYep1A2UQ/mY/mckkvPdif+ClYr6FYb87V+6kIW
	I+0BJpl5Loo6flgtL9ZiHPujnRpKi83F0P5PTY3WSGfLULCgAmGyj2V/4WrUuFuBW8XT
	RXtuTphN2ea3CELK7XyjVdQiMukfOFvqDjHBcedDf/lfoHkj9NLn9/hUkpIVxCERG5TZ
	gRZRoLCPcPUsFs0HdfKh6PLTZLnfMGC04hJm0BrBt9zdZoaJSpByKa6Fs1lqaMa5Xybg
	JkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=P3G2oHXhlG6l7T8L1qrzrZSFDy4s7s3cqJx766ToEgg=;
	b=NKkv+0+M1aqr2uOLewusW2vaV9PJ8Dx6A+T87SZrLdaZ8HIrUDp7IXhzbWZmqGi0ZM
	iIb8QkNXHtyNZybyAkK9rACFhDaxYo5PMx5IzSwxi4jmZW58ykHm3qYS3lbpixnvHHv9
	zs0e5ruuJkjw7FamMVzVxpr6jixjXrmPPzCsnko8+9o2L1KqHl/Zs+GkEa/0/1EPTCdH
	cSxTpCxwckU3RTZ7Ql6XowiKP8WaF0xzeK4bL+CJpjXYVOUxGtOdOBkB+SI3yFENclGs
	drb+NmxHR9tMUuGpzo/eJTZhkWrxKKXCeARX562MVQ7yDbe3lFI43psjV1Hz2SoNtpqL
	YnIQ==
X-Gm-Message-State: AA+aEWYrhpJSRGQ1XJMo9yt1hb3RL/bi7Jk8s3D3Lvdjd5VOjHtUFCD7
	Yq/txORNRJiUzA1MjVSepMcbsJM/
X-Google-Smtp-Source: AFSGD/V4YmuOht/pubyZc4nMYQppdfXKbT2XpjgSJR08tk/YTN/16QuoiMgAWMA9olB/XgKdLXSbTQ==
X-Received: by 2002:a63:e950:: with SMTP id q16mr428443pgj.138.1544737184499; 
	Thu, 13 Dec 2018 13:39:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:44 -0800
Message-Id: <725b3dc5727a9b364ea7e14bd803fb51f3892b80.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 36/45] testimage.bbclass: write testresult to json files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 21:39:43 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

As part of the solution to replace Testopia to store testresult,
OEQA testimage need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, json testresult file will be written to "oeqa"
directory under the "WORKDIR" directory.

To configure multiple instances of bitbake to write json testresult
to a single testresult file at custom directory, user will define
the variable "OEQA_JSON_RESULT_DIR" with the custom directory for
json testresult.

(From OE-Core rev: 2b8b47ec8ee835d2e70cc4ff3ec484f9e4e4d02d)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 9feb267..e95ce0c 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -2,7 +2,7 @@
 #
 # Released under the MIT license (see COPYING.MIT)
 
-
+inherit metadata_scm
 # testimage.bbclass enables testing of qemu images using python unittests.
 # Most of the tests are commands run on target image over ssh.
 # To use it add testimage to global inherit and call your target image with -c testimage
@@ -132,6 +132,30 @@ def testimage_sanity(d):
         bb.fatal('When TEST_TARGET is set to "simpleremote" '
                  'TEST_TARGET_IP and TEST_SERVER_IP are needed too.')
 
+def _get_testimage_configuration(d, test_type, pid, machine):
+    import platform
+    configuration = {'TEST_TYPE': test_type,
+                    'PROCESS_ID': pid,
+                    'MACHINE': machine,
+                    'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+                    'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-')}
+    layers = (d.getVar("BBLAYERS") or "").split()
+    for l in layers:
+        configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (base_get_metadata_git_branch(l, None).strip(),
+                                                                          base_get_metadata_git_revision(l, None))
+    return configuration
+
+def _get_testimage_json_result_dir(d):
+    json_result_dir = os.path.join(d.getVar("WORKDIR"), 'oeqa')
+    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
+    if custom_json_result_dir:
+        json_result_dir = custom_json_result_dir
+    return json_result_dir
+
+def _get_testimage_result_id(configuration):
+    return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['MACHINE'])
+
 def testimage_main(d):
     import os
     import json
@@ -299,7 +323,10 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn, forcelog=True)
-    results.logDetails()
+    configuration = _get_testimage_configuration(d, 'runtime', os.getpid(), machine)
+    results.logDetails(_get_testimage_json_result_dir(d),
+                       configuration,
+                       _get_testimage_result_id(configuration))
     results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, forcelog=True)
-- 
2.7.4


