Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEF7C54E56
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 09:19:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.16677.1708939174531800098
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 01:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ftx+Iobu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C52291C0008;
	Mon, 26 Feb 2024 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708939173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nlKC1Y4YQ0d74xo32fD1eWVIGdKj0SmcVaahgs5G2Us=;
	b=ftx+IobuwT7bAAWxMoICsOvoVyXX3dqjVX3L91AiGSbMAzTBoxqGQS4KU5D9XF/DlDCUk/
	ZBAFcHqVTWMJ2TiNDML0nn37SoZZywUIQmZkqP+RN2tJZEHzLRurCPxB07bBvb27eYriSn
	FfQVaZGO+fT95Lt16tvseRADMfubV9l4prFqWHKf0Hzwdz+fpSyrvA6Cq0kcWxdp9LVvnE
	/9WXtr0/Jvgg33+X2LOVubyP6vKXgINQc7LCWYuJtQNgbhASnJEn3gbITCRmZU0FSaHTvb
	VnQAgNIpMY3n9vpzsie9AeyZSXaL2rZNpcNtjbFfItuOhVUR9aXAdgwB4tOY9Q==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v4 1/5] lib/oeqa: share get_json_result_dir helper
Date: Mon, 26 Feb 2024 10:19:18 +0100
Message-ID: <20240226091922.41801-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240226091922.41801-1-alexis.lothore@bootlin.com>
References: <20240226091922.41801-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 09:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196192

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Multiple places in oeqa need to get the log output path, and redefine a
small helper to accomplish this

Define this helper in lib/oeqa/utils/__init__.py and import it wherever
needed to allow using it.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
There is one additional place re-definining (slightly) differently this
helper, which is in selftest/context.py. This one does not check
OEQA_JSON_RESULT_DIR from the datastore but through test data embedded in
the test context. Based on Richard's feedback in v2, the datastore
functions may be correctly simulated even in this case, so I may do some
tests and come up with a patch after this series

Changes in v4:
- fix missed function name update in TestSDKExt
Changes in v3:
- None
Changes in v2:
- patch introduced
---
 meta/classes-recipe/testimage.bbclass | 12 +++---------
 meta/lib/oeqa/sdk/testsdk.py          | 11 ++---------
 meta/lib/oeqa/sdkext/testsdk.py       |  3 ++-
 meta/lib/oeqa/utils/__init__.py       |  7 +++++++
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index d076102f9691..959c226072aa 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -149,13 +149,6 @@ def get_testimage_configuration(d, test_type, machine):
     return configuration
 get_testimage_configuration[vardepsexclude] = "DATETIME"
 
-def get_testimage_json_result_dir(d):
-    json_result_dir = os.path.join(d.getVar("LOG_DIR"), 'oeqa')
-    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
-    if custom_json_result_dir:
-        json_result_dir = custom_json_result_dir
-    return json_result_dir
-
 def get_testimage_result_id(configuration):
     return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['MACHINE'], configuration['STARTTIME'])
 
@@ -224,6 +217,7 @@ def testimage_main(d):
     from oeqa.core.target.qemu import supported_fstypes
     from oeqa.core.utils.test import getSuiteCases
     from oeqa.utils import make_logger_bitbake_compatible
+    from oeqa.utils import get_json_result_dir
 
     def sigterm_exception(signum, stackframe):
         """
@@ -426,14 +420,14 @@ def testimage_main(d):
     # Show results (if we have them)
     if results:
         configuration = get_testimage_configuration(d, 'runtime', machine)
-        results.logDetails(get_testimage_json_result_dir(d),
+        results.logDetails(get_json_result_dir(d),
                         configuration,
                         get_testimage_result_id(configuration),
                         dump_streams=d.getVar('TESTREPORT_FULLLOGS'))
         results.logSummary(pn)
 
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
-    targetdir = os.path.join(get_testimage_json_result_dir(d), d.getVar("PN"))
+    targetdir = os.path.join(get_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
     os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index b4719110edbc..518b09febb61 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -22,14 +22,6 @@ class TestSDKBase(object):
                         'LAYERS': get_layers(d.getVar("BBLAYERS"))}
         return configuration
 
-    @staticmethod
-    def get_sdk_json_result_dir(d):
-        json_result_dir = os.path.join(d.getVar("LOG_DIR"), 'oeqa')
-        custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
-        if custom_json_result_dir:
-            json_result_dir = custom_json_result_dir
-        return json_result_dir
-
     @staticmethod
     def get_sdk_result_id(configuration):
         return '%s_%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'], configuration['MACHINE'], configuration['STARTTIME'])
@@ -72,6 +64,7 @@ class TestSDK(TestSDKBase):
 
         from bb.utils import export_proxies
         from oeqa.utils import make_logger_bitbake_compatible
+        from oeqa.utils import get_json_result_dir
 
         pn = d.getVar("PN")
         logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
@@ -134,7 +127,7 @@ class TestSDK(TestSDKBase):
             component = "%s %s" % (pn, self.context_executor_class.name)
             context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
             configuration = self.get_sdk_configuration(d, self.test_type)
-            result.logDetails(self.get_sdk_json_result_dir(d),
+            result.logDetails(get_json_result_dir(d),
                             configuration,
                             self.get_sdk_result_id(configuration))
             result.logSummary(component, context_msg)
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 159f0d135b9a..9d5a99d900fd 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -16,6 +16,7 @@ class TestSDKExt(TestSDKBase):
         from bb.utils import export_proxies
         from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
         from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+        from oeqa.utils import get_json_result_dir
 
         pn = d.getVar("PN")
         logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
@@ -91,7 +92,7 @@ class TestSDKExt(TestSDKBase):
             component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
             context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
             configuration = self.get_sdk_configuration(d, 'sdkext')
-            result.logDetails(self.get_sdk_json_result_dir(d),
+            result.logDetails(get_json_result_dir(d),
                             configuration,
                             self.get_sdk_result_id(configuration))
             result.logSummary(component, context_msg)
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index fbc7f7d525d8..53bdcbf26618 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -90,3 +90,10 @@ def load_test_components(logger, executor):
                                 "_executor_class defined." % (comp_name, comp_context))
 
     return components
+
+def get_json_result_dir(d):
+    json_result_dir = os.path.join(d.getVar("LOG_DIR"), 'oeqa')
+    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
+    if custom_json_result_dir:
+        json_result_dir = custom_json_result_dir
+    return json_result_dir
\ No newline at end of file
-- 
2.43.1


