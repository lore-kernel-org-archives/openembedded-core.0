Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72165CAC59B
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 12:25:25 +0000 (UTC)
Received: from o1678988x14.outbound-mail.sendgrid.net (o1678988x14.outbound-mail.sendgrid.net [167.89.88.14])
 by mx.groups.io with SMTP id smtpd.web10.18328.1758025523861891348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 05:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=s1 header.b=DIicOFDy;
 spf=pass (domain: delivery.danfoss.com, ip: 167.89.88.14, mailfrom: bounces+41880229-a31a-openembedded-core=lists.openembedded.org@delivery.danfoss.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=2kdRqCfD9hACw9KXGsHw2XNvggknBamyDtdZLza213M=;
	b=DIicOFDyeiPeS5BfBjhYURWuy14BMOohNqMv9YosTIH65vNY/LLt3v+meg6fz/lGYT72
	80m6UoNViTj8nIZvI36FrhNkoN2KRRGIxv+3Cp3VwbleKvvujGr2teC4ve6zE91FKYhbrJ
	sWk5GbefY+J0VmTdih7Y4E8P0GNN660FlresVulUr+3ujbZUPGjtEQOXRXp6g+/+pa3E7l
	HI6ui1WxAgiQLgrB1xV0j/Dp35oi/j6ov0o5jvxz+UWK/pbsn7PAJ2uiGRf8k3F6EbeY7c
	xyZakwQp/eoSUXFHgUMAv+jJAlnxEf46QDQnuqLFa//v47toST7PGlfmeu7BDvGA==
Received: by recvd-65696df74f-gsmz5 with SMTP id recvd-65696df74f-gsmz5-1-68C95732-32
	2025-09-16 12:25:22.954698145 +0000 UTC m=+8970091.292328328
Received: from PC-5CG2490WFQ.danfoss.net (unknown)
	by geopod-ismtpd-5 (SG)
	with ESMTP
	id 6LYeJDxOS0qHM-qeB74TMg
	Tue, 16 Sep 2025 12:25:22.846 +0000 (UTC)
From: Barne Carstensen <barne.carstensen@danfoss.com>
Subject: [PATCH] Fixes [YOCTO #15965]
Date: Tue, 16 Sep 2025 12:25:22 +0000 (UTC)
Message-Id: <20250916122517.1965-1-barne.carstensen@danfoss.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2E=2FTauPrjZw6tdXz2Pck6EKIfeV+Osq25MJTGhiRon1Zqf4kmVhwvm=2FrBjK?=
 =?us-ascii?Q?vlQ6LK6xhEtbMkLCUGXnBMfC+Pf+Xuf2moEc19x?=
 =?us-ascii?Q?L9icZmQNekcTKKe667r2m5ymFuQ00rG2Kdr=2Feft?=
 =?us-ascii?Q?bjE1F+VwQGk2esi0DOeZHs5EVahAtbzhXJtYZrm?=
 =?us-ascii?Q?7ZHYiZc6+ZRninCDFw1DQKr3iJ9KXCELOCvGD4k?=
 =?us-ascii?Q?QEqBUdF1YXlUERuCO2J8ZlS3d5mVhq052oO4vUN?=
 =?us-ascii?Q?F=2Fcx8QjfuZBaS=2FZHudlfwzp9QKqZRo7gYjAcZkm?=
 =?us-ascii?Q?4e2UfpxU=3D?=
To: openembedded-core@lists.openembedded.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>,
	randy.macleod@windriver.com
X-Entity-ID: u001.f20y1lF57MqL8KX+pChZqA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 12:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223546

Copy all the parselogs-ignores file so that they are always packed into the testexport.tar.gz (even when testsuite parselog is not selected)

Signed-off-by: Barne Carstensen <barne.carstensen@danfoss.com>
CC: randy.macleod@windriver.com
---
 meta/classes-recipe/testexport.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 843d777e3b..2f473a8811 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -79,6 +79,7 @@ def testexport_main(d):
 def copy_needed_files(d, tc):
     import shutil
     import oe.path
+    import glob
 
     from oeqa.utils.package_manager import _get_json_file
     from oeqa.core.utils.test import getSuiteCasesFiles
@@ -120,6 +121,11 @@ def copy_needed_files(d, tc):
                     oe.path.copytree(src, dst)
                 else:
                     shutil.copy2(src, dst)
+    
+    # Copy all parselogs-ignores files
+    parselogs_ignores = glob.glob(os.path.join(corebase_path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-*.txt'))
+    for f in parselogs_ignores:
+         shutil.copy2(f, cases_path)
 
     # Copy test data
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),

