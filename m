Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D087CAC5BA
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.305.1758229693813018085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=j3+AEDqc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250918210811f03bd141f90002077d-ygx63a@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250918210811f03bd141f90002077d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jHuoZ1vmCMrzN1A70z6651NN2iQBJrCokS/381CBZx4=;
 b=j3+AEDqc26S5GgAH7J6zQv6sl4nYGor/+THyX1m47xHShsrtCGce41Dgbdswy5lhISn+Kd
 VdYSreCbXIQ4C1R/PKLBtxdkSvjxOSGEywQERPGPJOUrdcrz/iJdRVuDGU7luF+wiyAx+WOK
 izdcllrzh4sZowqKQcnLHpQ2y4ljRYaXIv9kFtqu1FA9YD+Bh7kZEcHcGfGjxmmzophbb3im
 Oe4NYZ40XKBnM4/ZrapPRMkJZWFfr3sYVJHZ1cN6c5CODUQMCS03EAvk/MxM2kOpPk5m6BvC
 m7kOVJhiFZ+uo3nlIN/9eG1/g2Lu6gsrCp5SnAO5byIk8Ciw/q7vdNhw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/19] oe-selftest: devtool: add missing imports
Date: Thu, 18 Sep 2025 23:07:05 +0200
Message-ID: <20250918210754.477049-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223660

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Cleanup some indirect imports. This does not solve a real problem, but
it fixes some issues with IDEs that do not properly resolve indirect
imports.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 19a205912ba..b92f017b811 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -18,12 +18,11 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, runqemu_check_taps, get_test_layer
 from oeqa.core.decorator import OETestTag
+from bb.utils import mkdirhier, edit_bblayers_conf
 
 oldmetapath = None
 
 def setUpModule():
-    import bb.utils
-
     global templayerdir
     templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
     corecopydir = os.path.join(templayerdir, 'core-copy')
@@ -79,12 +78,12 @@ def setUpModule():
                             shutil.copytree(pth, destdir, ignore=shutil.ignore_patterns('*.pyc', '__pycache__'))
                         else:
                             destdir = os.path.join(corecopydir, os.path.dirname(relpth))
-                            bb.utils.mkdirhier(destdir)
+                            mkdirhier(destdir)
                             shutil.copy2(pth, destdir)
             return newmetapath
         else:
             return layerpath
-    bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
+    edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
 
 def tearDownModule():
     if oldmetapath:
@@ -96,7 +95,7 @@ def tearDownModule():
             else:
                 return layerpath
         bblayers_conf = os.path.join(os.environ['BUILDDIR'], 'conf', 'bblayers.conf')
-        bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
+        edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
     shutil.rmtree(templayerdir)
 
 class DevtoolTestCase(OESelftestTestCase):
@@ -404,7 +403,7 @@ class DevtoolAddTests(DevtoolBase):
         test_file_content = "TEST CONTENT"
         test_file_package_root = os.path.join(tempdir, pn)
         test_file_dir_full = os.path.join(test_file_package_root, test_file_dir)
-        bb.utils.mkdirhier(test_file_dir_full)
+        mkdirhier(test_file_dir_full)
         with open(os.path.join(test_file_dir_full, test_file_name), "w") as f:
             f.write(test_file_content)
         bin_package_path = os.path.join(tempdir, "%s.tar.gz" % pn)
-- 
2.51.0


