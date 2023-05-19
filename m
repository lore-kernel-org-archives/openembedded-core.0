Return-Path: <throos@amazon.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886D5C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 12:10:18 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web11.23953.1684498215867000965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 05:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=qm9hSnve;
 spf=pass (domain: amazon.de, ip: 99.78.197.217, mailfrom: prvs=4965c351c=throos@amazon.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1684498217; x=1716034217;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gEKU88S/HoCE4uBsCeY2Qf/hxDdvCL+8KxUK9TwHYcI=;
  b=qm9hSnvej3gRec7sGR2lepZ7HTQH052/Z2DrfLtK2tkKwllIoBABsNyy
   9+7QGz0hldybsayR16Iyq0Bg0+qC4rp32GQhNy7m9TT2OPmN7ayyPJdAP
   7cTwjKHOEglrx8hecG9/etRzjZoX/0xYzTaB4BsF+Fc5IkwBSo8gYO6R0
   E=;
X-IronPort-AV: E=Sophos;i="6.00,176,1681171200"; 
   d="scan'208";a="214919447"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-d23e07e8.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 12:10:14 +0000
Received: from EX19D016EUC001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-m6i4x-d23e07e8.us-east-1.amazon.com (Postfix) with ESMTPS id 1835F80C9B
	for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 12:10:11 +0000 (UTC)
Received: from u182adcbddbfb55.ant.amazon.com (10.85.99.102) by
 EX19D016EUC001.ant.amazon.com (10.252.51.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 May 2023 12:10:09 +0000
From: <throos@amazon.de>
To: <openembedded-core@lists.openembedded.org>
CC: Thomas Roos <throos@amazon.de>
Subject: [PATCH] oeqa/selftest/cases/devtool.py: skip all tests require folder a git repo
Date: Fri, 19 May 2023 14:09:58 +0200
Message-ID: <20230519120958.250320-1-throos@amazon.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.85.99.102]
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D016EUC001.ant.amazon.com (10.252.51.169)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 12:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181548

From: Thomas Roos <throos@amazon.de>

Devtool selftests require poky dir a git repo, when downloading poky as a tar,
this is not the case. Those tests will now skipped.

[YOCTO #12389]

Signed-off-by: Thomas Roos <throos@amazon.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1896944250..397895c936 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -10,6 +10,7 @@ import shutil
 import tempfile
 import glob
 import fnmatch
+import unittest
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -40,6 +41,13 @@ def setUpModule():
             canonical_layerpath = os.path.realpath(canonical_layerpath) + '/'
             edited_layers.append(layerpath)
             oldmetapath = os.path.realpath(layerpath)
+
+            # when downloading poky from tar.gz some tests will be skipped (BUG 12389)
+            try:
+                runCmd('git rev-parse --is-inside-work-tree', cwd=canonical_layerpath)
+            except:
+                raise unittest.SkipTest("devtool tests require folder to be a git repo")
+
             result = runCmd('git rev-parse --show-toplevel', cwd=canonical_layerpath)
             oldreporoot = result.output.rstrip()
             newmetapath = os.path.join(corecopydir, os.path.relpath(oldmetapath, oldreporoot))
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





