Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFE9279DED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:45 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e5so1672482plb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qdTKYdRUY+fyvEZRHQebNbkDZo590BTrJtL6NER5Vcs=;
	b=NODskHFLh3uwhsGxMXolyOOk4sRYWd58Aqca3GTNTnCUBq+F9vi4RWblmQavRcWfD6
	xOEG4aY+Qw5IxcwV3XaH7ONvqhenXwm2dFm3fcKNb/Bdec5EzKqyXxgn0DJJZnpPBecj
	2IfR2bjFxFUjYU9rClyoQE/yKUeFarkvXTXiHrs+SW3VmzgwLqNBRNzbRmlI0YbVm6m2
	kj/LtfIKbrkFYZs4iMxVa9bd2mHOsxC2dQ/Rw792LFCp4bZhVdydupl4+Kf0HE63kEOf
	osabC8bnYureQajZs0tIPMe0CbRskTKtGUJitB9ssVNPiWmL8vOgkGv7tu0QZQ96mAnh
	iogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qdTKYdRUY+fyvEZRHQebNbkDZo590BTrJtL6NER5Vcs=;
	b=Kq/sd+ErY86MDJSb6yWXgXXFABUc4gF9/Mv4gLCbvMmWRN3RxPcHYneMNt5rzyCOyV
	otlMfjWgk9nB7Isv4fhlp4NJXhIgO2EpoMGGs8VferqY/9XX0FktjKJbctqQ8Ngfx7nk
	y83xpazSosMnmVh/swCHheJgGXdKydKjzagXHEByzJVG+uF+8KShbH6nx91KYMgA/+rj
	TA+0ium6GqEmWVi9L5IEy+ruV/z6fkwoobujxdT0SwYKDvS7yddcHGzmwISQ4F8Hy/G/
	yzpUrKQN9S+PlDJMaJZHQM0OW69c0amh+aV7oj7DZXybhoumB/UfKvqOfE6KwpRU1LVz
	LT0g==
X-Gm-Message-State: AA+aEWZas0uECN14HweI/VL0B+S2LFIL0rCZe9wuVnNUtDnk3al6l0ve
	NDSrR95I25Ud1M1WnNeQ3i6IJ/bI
X-Google-Smtp-Source: AFSGD/VnZGzV/9UwMI1KVzsRwnpeUieOUGWWLssYZO+PpLnqc8LN7A7cBr49xnOYStx2T3hFuZWZeg==
X-Received: by 2002:a17:902:7d82:: with SMTP id
	a2mr428391plm.163.1544737186836; 
	Thu, 13 Dec 2018 13:39:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:46 -0800
Message-Id: <50ed4a3b117863bf97fcc258e9dfd4a39f93a439.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 38/45] oeqa/selftest: Improvements to the json logging
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:46 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Tweak the preceeding commit to:

* Add STARTTIME to the identifier to make it unique
* Use LOG_DIR
* Store the layer config in a more natural json format
* Drop '_' function prefixes

(From OE-Core rev: 173f59acf9722e2ef27fdd49c20f7d3d664917eb)

(From OE-Core rev: 3b69099edc7db99c11bfb41eab2af50bd0e3d4f2)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 964a46c..a5116a7 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -202,30 +202,27 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc.logger.info("Running bitbake -p")
         runCmd("bitbake -p")
 
-    def _get_json_result_dir(self, args):
-        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'oeqa')
+    def get_json_result_dir(self, args):
+        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'log', 'oeqa')
         if "OEQA_JSON_RESULT_DIR" in self.tc.td:
             json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
 
         return json_result_dir
 
-    def _get_configuration(self, args):
+    def get_configuration(self, args):
         import platform
         from oeqa.utils.metadata import metadata_from_bb
         metadata = metadata_from_bb()
         configuration = {'TEST_TYPE': 'oeselftest',
-                        'START_TIME': args.test_start_time,
+                        'STARTTIME': args.test_start_time,
                         'MACHINE': self.tc.td["MACHINE"],
                         'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
-                        'HOST_NAME': metadata['hostname']}
-        layers = metadata['layers']
-        for l in layers:
-            configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (metadata['layers'][l]['branch'],
-                                                                              metadata['layers'][l]['commit'])
+                        'HOST_NAME': metadata['hostname'],
+                        'LAYERS': metadata['layers']}
         return configuration
 
-    def _get_result_id(self, configuration):
-        return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'])
+    def get_result_id(self, configuration):
+        return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'], configuration['STARTTIME'])
 
     def _internal_run(self, logger, args):
         self.module_paths = self._get_cases_paths(
@@ -243,10 +240,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            configuration = self._get_configuration(args)
-            rc.logDetails(self._get_json_result_dir(args),
+            configuration = self.get_configuration(args)
+            rc.logDetails(self.get_json_result_dir(args),
                           configuration,
-                          self._get_result_id(configuration))
+                          self.get_result_id(configuration))
             rc.logSummary(self.name)
 
         return rc
-- 
2.7.4


