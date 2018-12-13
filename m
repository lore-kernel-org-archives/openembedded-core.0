Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB3D79E1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g62so1718499pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0SH0C8slwCcBidg+ey0ufFf1aG/h+gHTi+OAxjBGZFA=;
	b=pKfbs1MwU+oGQjV6jw7xKuY4MFieiDIsaAaxhF29Qd8pQdyXqMQ4povu4VdfBYhB4e
	AVndsQ1Uv1ixVZk/DmYnh3rCuRZOlfA8f3nKEb8fc/MR/MgU63T9HPEsumOYrw6gOi4M
	WWcSjepug5L8ez/0o4gZOOKc7MkWEvisPh7QekShBv9BzhXStByDKyaTPM1Ci+YEugpR
	RmD15Zk7Lw6Jd53vOk/Jhlf7W5sdWv+9jnDLiAS1J4FBr2HRJAGm9xWr/SwbzCxLGYe4
	1iWieWrDpRWH0/2NCtrQBtvJESHyotAxXs7OYMz5b/iPDjJ3yQftgp+ZK3EW98K1oSZj
	OJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0SH0C8slwCcBidg+ey0ufFf1aG/h+gHTi+OAxjBGZFA=;
	b=hDOmuv6MQCqF9ZCo/d+nQU0U8mLqQ+AiKXV3EOPU0KK1JsaFISe82N/RHcDKRnySmr
	y59T7bTspcB+Xbs3dCGYdS4rMhZOWKp/mBZmkNMxnyzUqjwzJ87exCL8+4EeqvA54zJ6
	W9nXmpcSqhzG+OH4bpe1p58rrlHZvfQR3Yd3ft2Caz0Zn3p7CFHCI7htumKQZF+tiGlG
	RPT0/wohoyxC8Tzl02zvSXVmqOPQ7yi6DRt7vxWONKcv3R/4H6XzkWSQrtjomjl0xcYf
	WaQ8ERCXzk3xVIqAIjE71LcDDiw6XCISlcsBlydYtyJGUM8Uh3jsM/vj6sjWPuNzVBUd
	2ebQ==
X-Gm-Message-State: AA+aEWYJinHzZanmHEYzshBM8pyS5MiMrT35xN3HaQ70yUyRePVYHJlK
	83gF7n/UX6AqxmDxz6LrHH3nQkky
X-Google-Smtp-Source: AFSGD/VEsTu5O+oyeVnEHhRrlfRhU3inTSLJrspj/KOQw0dp2nHX53nyPMpaavtO7KhSsIrPP+fW8w==
X-Received: by 2002:a63:6c48:: with SMTP id h69mr373867pgc.139.1544737183497; 
	Thu, 13 Dec 2018 13:39:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:43 -0800
Message-Id: <23f4886b177baf6c30adb55669ecfefe2bbe8d9b.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 35/45] oeqa/selftest/context: write testresult to json files
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
OEQA selftest need to output testresult into json files, where
these json testresult files will be stored into git repository
by the future test-case-management tools.

By default, json testresult file will be written to "oeqa"
directory under the oe-selftest log directory.

To configure multiple instances of bitbake to write json testresult
to a single testresult file at custom directory, user will define
the variable "OEQA_JSON_RESULT_DIR" with the custom directory for
json testresult.

(From OE-Core rev: a95218525a4c8228fff9908ffbda85c6b85e101c)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 33316d3..964a46c 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -202,6 +202,31 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         self.tc.logger.info("Running bitbake -p")
         runCmd("bitbake -p")
 
+    def _get_json_result_dir(self, args):
+        json_result_dir = os.path.join(os.path.dirname(os.path.abspath(args.output_log)), 'oeqa')
+        if "OEQA_JSON_RESULT_DIR" in self.tc.td:
+            json_result_dir = self.tc.td["OEQA_JSON_RESULT_DIR"]
+
+        return json_result_dir
+
+    def _get_configuration(self, args):
+        import platform
+        from oeqa.utils.metadata import metadata_from_bb
+        metadata = metadata_from_bb()
+        configuration = {'TEST_TYPE': 'oeselftest',
+                        'START_TIME': args.test_start_time,
+                        'MACHINE': self.tc.td["MACHINE"],
+                        'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                        'HOST_NAME': metadata['hostname']}
+        layers = metadata['layers']
+        for l in layers:
+            configuration['%s_BRANCH_REV' % os.path.basename(l)] = '%s:%s' % (metadata['layers'][l]['branch'],
+                                                                              metadata['layers'][l]['commit'])
+        return configuration
+
+    def _get_result_id(self, configuration):
+        return '%s_%s_%s' % (configuration['TEST_TYPE'], configuration['HOST_DISTRO'], configuration['MACHINE'])
+
     def _internal_run(self, logger, args):
         self.module_paths = self._get_cases_paths(
                 self.tc_kwargs['init']['td']['BBPATH'].split(':'))
@@ -218,7 +243,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logDetails()
+            configuration = self._get_configuration(args)
+            rc.logDetails(self._get_json_result_dir(args),
+                          configuration,
+                          self._get_result_id(configuration))
             rc.logSummary(self.name)
 
         return rc
-- 
2.7.4


