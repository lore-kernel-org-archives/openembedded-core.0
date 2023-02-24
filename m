Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A52C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 04:01:26 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.10231.1677211278524074137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 20:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=UgRdK926;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677211278; x=1708747278;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kq7HMBse4ChIqmZGgufIXJujClW4TEWje64vLeG7gao=;
  b=UgRdK926TQILL+3OAA+OrN8l9AxxMnSax42oVMqC9jrmUHLihw09Ub73
   9FtXMDceTxyG9ZM9tV/azhy8HeD53HzLIxSPthdXlOPScji8nCwIttj8t
   OS+3mRvoKdk36TmEO65FgnrbnNrLkEvXAwgM2AhUnxCOsnM3PqbOWq0Lh
   eMa50dqbr2Jr7jqi5R19keeOov5NrZT3S3sVlcliAx75hIjmmyauTMZaN
   jP31caFgUG0AIMjtfZK7qUyq1y1n2ORv2evytJlOLt4YE/xu/RQ1ieYjY
   Uvc2XbnVm/7Xrron6GAf4aPVhUbe1phXCwToRvWrJVrIga4U5X2LSo0sk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313780125"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="313780125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 20:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736663534"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="736663534"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2023 20:01:05 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] checklayer: check for patch file upstream status
Date: Fri, 24 Feb 2023 12:00:56 +0800
Message-Id: <20230224040056.2677539-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 04:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177656

From: Chee Yang Lee <chee.yang.lee@intel.com>

yocto-check-layer to check all .patch file in layer for
Upstream-status and list down all .patch file without Upstream-Status.

set this test as expected failure for now, so this wont fail the check
layer while still able to capture any patches with malformed or missing
Upstream-Status in report.

[YOCTO #14642]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
v2:
amended commit message
switch to oe.qa.check_upstream_status to verify upstream status

 scripts/lib/checklayer/cases/common.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 722d3cf638..97b16f78c8 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -72,6 +72,21 @@ class CommonCheckLayer(OECheckLayerTestCase):
                 self.tc.layer['name'])
             self.fail('\n'.join(msg))
 
+    @unittest.expectedFailure
+    def test_patches_upstream_status(self):
+        import sys
+        sys.path.append(os.path.join(sys.path[0], '../../../../meta/lib/'))
+        import oe.qa
+        patches = []
+        for dirpath, dirs, files in os.walk(self.tc.layer['path']):
+            for filename in files:
+                if filename.endswith(".patch"):
+                    ppath = os.path.join(dirpath, filename)
+                    if oe.qa.check_upstream_status(ppath):
+                        patches.append(ppath)
+        self.assertEqual(len(patches), 0 , \
+                msg="Found following patches with malformed or missing upstream status:\n%s" % '\n'.join([str(patch) for patch in patches]))
+
     def test_signatures(self):
         if self.tc.layer['type'] == LayerType.SOFTWARE and \
            not self.tc.test_software_layer_signatures:
-- 
2.37.3


