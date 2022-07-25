Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112E7C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:54:37 +0000 (UTC)
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web11.26569.1658746474219436800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=LMpFbiCI;
 spf=pass (domain: amazon.de, ip: 99.78.197.218,
 mailfrom: prvs=198ea936c=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1658746474; x=1690282474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G35QTmu0q1zkAqv+GlWVJJlUmvUoAcoA0G/zU7PHPW0=;
  b=LMpFbiCIHV+31MhOcH20KUqMNC0KDiRKZlAuNH/04z6W/Jzy8wr4UkMn
   oWwToEYU1xrKHejI6unvw9XymMFsxICgqStNKv2k8n0jsjN6sDwX8kxjm
   ps0MJ715VsOAlZECu3uMfIy7dqyUQaQKNt755rMRndlYy5fNrPASdIfU0
   8=;
X-IronPort-AV: E=Sophos;i="5.93,192,1654560000";
   d="scan'208";a="112020672"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-8be8ed69.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 25 Jul 2022 10:54:19 +0000
Received: from EX13D16EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1e-8be8ed69.us-east-1.amazon.com (Postfix) with
 ESMTPS id 43D76C0ABD
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 10:54:19 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.43.160.111) by
 EX13D16EUA003.ant.amazon.com (10.43.165.51) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Mon, 25 Jul 2022 10:54:17 +0000
From: Thomas Roos <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa devtool: Add tests to cover devtool handling of various
 git URL styles
Date: Mon, 25 Jul 2022 12:54:07 +0200
Message-ID: <20220725105407.79478-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.43.160.111]
X-ClientProxiedBy: EX13D42UWA001.ant.amazon.com (10.43.160.153) To
 EX13D16EUA003.ant.amazon.com (10.43.165.51)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:54:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168481

Add two test cases for git URL styles that trigger reformat_git_url.

[YOCTO #11394]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 55 ++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 34fc791f3a..dc3c4fba65 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -379,6 +379,59 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
+    
+    def test_devtool_add_git_style_1(self):
+         # this will trigger reformat_git_uri
+        url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
+        version = 'v3.1.0'
+        pn = 'mbedtls'
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')        
+        result = runCmd('devtool add --version %s %s %s' % (version, pn, url))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
+        # Check the recipe name is correct
+        recipefile = get_bb_var('FILE', pn)
+        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
+        self.assertIn(recipefile, result.output)
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(pn, result.output)
+        self.assertIn(recipefile, result.output)
+        checkvars = {}
+        checkvars['LICENSE'] = 'Apache-2.0'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57'
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = 'v3.1.0+git${SRCPV}'
+        checkvars['SRC_URI'] = 'git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master'
+        self._test_recipe_contents(recipefile, checkvars, [])
+
+    def test_devtool_add_git_style_2(self):
+         # this will trigger reformat_git_uri with branch parameter in url
+        url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
+        version = 'v3.1.0'
+        pn = 'mbedtls'
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')        
+        result = runCmd('devtool add --version %s %s %s' % (version, pn, url))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
+        # Check the recipe name is correct
+        recipefile = get_bb_var('FILE', pn)
+        self.assertIn('%s_git.bb' % pn, recipefile, 'Recipe file incorrectly named')
+        self.assertIn(recipefile, result.output)
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(pn, result.output)
+        self.assertIn(recipefile, result.output)
+        checkvars = {}
+        checkvars['LICENSE'] = 'Apache-2.0'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57'
+        checkvars['S'] = '${WORKDIR}/git'
+        checkvars['PV'] = 'v3.1.0+git${SRCPV}'
+        checkvars['SRC_URI'] = 'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'
+        self._test_recipe_contents(recipefile, checkvars, [])
+
 
     def test_devtool_add_library(self):
         # Fetch source
@@ -540,7 +593,7 @@ class DevtoolAddTests(DevtoolBase):
         result = runCmd('devtool status')
         self.assertIn(testrecipe, result.output)
         self.assertIn(srcdir, result.output)
-        # Check recipe
+        # Check recipedevtool add
         recipefile = get_bb_var('FILE', testrecipe)
         self.assertIn('%s_%s.bb' % (testrecipe, testver), recipefile, 'Recipe file incorrectly named')
         checkvars = {}
-- 
2.25.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





