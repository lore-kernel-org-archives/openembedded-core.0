Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55108C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:49:55 +0000 (UTC)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com
 [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web08.4954.1659620984759482581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 06:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=sOAXhmTq;
 spf=pass (domain: amazon.de, ip: 52.95.48.154,
 mailfrom: prvs=20828d0fe=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1659620985; x=1691156985;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m6RRZNKaF8OBYoneh12MoskW9NWcHoWS+3eUQeVPt1w=;
  b=sOAXhmTqxCJaHqSrMJeif7EgnsoxPxDlP61jFekzOpFvpkjpCOYMy/3h
   fPVhBQcwizJ7UG+X8lHH7kQowSwjNZJkGKpaUrjiJsGtOM+XfXoO62AQU
   DJhNq6TaF5I+8Sp76ykCZZXA3Is6hu6VsrJjVaXTMa2/9M5Y/to71VEKz
   Y=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2b-6e5a0cd6.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 13:49:33 +0000
Received: from EX13D16EUA003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2b-6e5a0cd6.us-west-2.amazon.com (Postfix) with
 ESMTPS id 4CF43A0F5C
	for <openembedded-core@lists.openembedded.org>;
 Thu,  4 Aug 2022 13:49:32 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.43.162.134) by
 EX13D16EUA003.ant.amazon.com (10.43.165.51) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Thu, 4 Aug 2022 13:49:30 +0000
From: Thomas Roos <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] oeqa devtool: Add tests to cover devtool handling of
 various git URL styles
Date: Thu, 4 Aug 2022 15:49:20 +0200
Message-ID: <20220804134920.167173-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.43.162.134]
X-ClientProxiedBy: EX13D32UWB003.ant.amazon.com (10.43.161.220) To
 EX13D16EUA003.ant.amazon.com (10.43.165.51)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 13:49:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168848

Add two test cases for git URL styles that trigger reformat_git_url.

[YOCTO #11394]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 34 ++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 34fc791f3a..5a4b0d375c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -246,6 +246,22 @@ class DevtoolTestCase(OESelftestTestCase):
         if remaining_removelines:
             self.fail('Expected removed lines not found: %s' % remaining_removelines)
 
+    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')        
+        result = runCmd('devtool add --version %s %s %s' % (version, pn, git_url))
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
+        checkvars['SRC_URI'] = resulting_src_uri
+        self._test_recipe_contents(recipefile, checkvars, [])
 
 class DevtoolBase(DevtoolTestCase):
 
@@ -379,6 +395,22 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
+    
+    def test_devtool_add_git_style1(self):
+        version = 'v3.1.0'
+        pn = 'mbedtls'
+        # this will trigger reformat_git_uri with branch parameter in url
+        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https"
+        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
+
+    def test_devtool_add_git_style2(self):
+        version = 'v3.1.0'
+        pn = 'mbedtls'
+        # this will trigger reformat_git_uri with branch parameter in url
+        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_library(self):
         # Fetch source
@@ -540,7 +572,7 @@ class DevtoolAddTests(DevtoolBase):
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





