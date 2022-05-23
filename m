Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BB4C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:51:54 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.27027.1653310306771367813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24NCpjfI011993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:51:45 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 23 May 2022 05:51:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 23 May 2022 05:51:45 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 23 May 2022 05:51:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oescripts: change compare logic in OEListPackageconfigTests
Date: Mon, 23 May 2022 20:51:43 +0800
Message-ID: <20220523125143.2907463-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:51:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166019

From: Mingli Yu <mingli.yu@windriver.com>

When multilib enabled and add layers/meta-openembedded/meta-oe in
conf/bblayers.conf, it reports below error when run oe-selftest.
 $ oe-selftest -r  oescripts
 [snip]
 [20:36:33-0700] 2022-05-16 03:36:33,494 - oe-selftest - INFO - RESULTS - oescripts.OEListPackageconfigTests.test_packageconfig_flags_option_flags: FAILED (585.37s)
 [snip]

 It is because the output of "list-packageconfig-flags.py -f" as below:
 $ ../scripts/contrib/list-packageconfig-flags.py -f
 [snip]
 qt                     lib32-pinentry  lib32-wxwidgets  nativesdk-pinentry  pinentry  pinentry-native  wxwidgets  wxwidgets-native
 secret                 lib32-pinentry  nativesdk-pinentry  pinentry  pinentry-native
 [snip]

 But the check logic as below:
 class OEListPackageconfigTests(OEScriptTests):
    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
    def check_endlines(self, results,  expected_endlines):
        for line in results.output.splitlines():
            for el in expected_endlines:
                if line.split() == el.split():
                    expected_endlines.remove(el)
                    break

 def test_packageconfig_flags_option_flags(self):
        results = runCmd('%s/contrib/list-packageconfig-flags.py -f' % self.scripts_dir)
        expected_endlines = []
        expected_endlines.append("PACKAGECONFIG FLAG     RECIPE NAMES")
        expected_endlines.append("qt                     nativesdk-pinentry  pinentry  pinentry-native")
        expected_endlines.append("secret                 nativesdk-pinentry  pinentry  pinentry-native")

        self.check_endlines(results, expected_endlines)

And the test will fail as line.split() doesn't equal el.split() as
line.split() is ['lib32-pinentry', 'lib32-wxwidgets', 'nativesdk-pinentry',
'pinentry', 'pinentry-native', 'wxwidgets', 'wxwidgets-native'] and
el.split() is ['nativesdk-pinentry', 'pinentry', 'pinentry-native'].

So change the compare logic to fix the gap.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index cd687816c8..bd84f151cb 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -129,7 +129,8 @@ class OEListPackageconfigTests(OEScriptTests):
     def check_endlines(self, results,  expected_endlines): 
         for line in results.output.splitlines():
             for el in expected_endlines:
-                if line.split() == el.split():
+                if line and line.split()[0] == el.split()[0] and \
+                   ' '.join(sorted(el.split())) in ' '.join(sorted(line.split())):
                     expected_endlines.remove(el)
                     break
 
-- 
2.25.1


