Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD32C77B72
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 14:32:21 +0000 (UTC)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web10.10957.1681482738651960775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 07:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=YwwTNQJU;
 spf=pass (domain: amazon.de, ip: 52.95.48.154, mailfrom: prvs=461effbcb=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1681482739; x=1713018739;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M7uMXd6ULusmVcEswpr9DKChXyAjhDQ6Ye20hbOZsbo=;
  b=YwwTNQJUiFiTnCVy6VyKqluVXRUr135a6aKyQYoHxTVvhYpxHvGKXfFa
   IM7k/6rRz/yt3WqUe4d/55sV0a4YhC72L0OEBQRoaccB6tKV9rxXFS9Nb
   X7tbXm3Gg73bRn2kRrzPCItg1eO4omlVQK2o2WcINFxwi7yf4dLapGOab
   8=;
X-IronPort-AV: E=Sophos;i="5.99,197,1677542400"; 
   d="scan'208";a="320491231"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 14:32:16 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1box-1dm6-7f722725.us-east-1.amazon.com (Postfix) with ESMTPS id 82B5987207
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 14:32:15 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.99.97) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 14:32:12 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] oeqa/selftest: Use SSTATE_DIR of parent build dir
Date: Fri, 14 Apr 2023 16:31:40 +0200
Message-ID: <20230414143140.309820-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.99.97]
X-ClientProxiedBy: EX19D035UWB002.ant.amazon.com (10.13.138.97) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 14:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179998

From: Thomas Roos <throos@amazon.de>

This will configure the build-st/conf/local.conf with the SSTATE_DIR
of the parent build dir to speed up the build, test, dev process.

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/selftest/context.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 0a7a9da72a..f2a5ba792f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -16,6 +16,7 @@ from random import choice
 import oeqa
 import oe
 import bb.utils
+import bb.tinfoil
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
@@ -79,6 +80,12 @@ class OESelftestTestContext(OETestContext):
             self.removebuilddir = removebuilddir
 
     def setup_builddir(self, suffix, selftestdir, suite):
+        # Get SSTATE_DIR from the parent build dir
+        with bb.tinfoil.Tinfoil(tracking=True) as tinfoil:
+            tinfoil.prepare(quiet=2, config_only=True)
+            d = tinfoil.config_data
+            sstatedir = str(d.getVar('SSTATE_DIR'))
+
         builddir = os.environ['BUILDDIR']
         if not selftestdir:
             selftestdir = get_test_layer()
@@ -118,6 +125,9 @@ class OESelftestTestContext(OETestContext):
             if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
+        # Set SSTATE_DIR to match the parent SSTATE_DIR
+        subprocess.check_output("echo 'SSTATE_DIR ?= \"%s\"' >> %s/conf/local.conf" % (sstatedir, newbuilddir), cwd=newbuilddir, shell=True)
+
         os.chdir(newbuilddir)
 
         def patch_test(t):
-- 
2.34.1




Amazon Web Services EMEA SARL
38 avenue John F. Kennedy, L-1855 Luxembourg
Sitz der Gesellschaft: L-1855 Luxemburg
eingetragen im Luxemburgischen Handelsregister unter R.C.S. B186284

Amazon Web Services EMEA SARL, Niederlassung Deutschland
Marcel-Breuer-Str. 12, D-80807 Muenchen
Sitz der Zweigniederlassung: Muenchen
eingetragen im Handelsregister des Amtsgerichts Muenchen unter HRB 242240, USt-ID DE317013094





