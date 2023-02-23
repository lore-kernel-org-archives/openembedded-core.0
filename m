Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4503C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 06:28:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.5145.1677133684580502872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 22:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=iU3m4FVJ;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677133684; x=1708669684;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O3OyIIMppxFZUKEbuwb7BsCgATW/LUI1KXWHRO10qE8=;
  b=iU3m4FVJvM+yzcNP2KcRurncmJgFPaQjWHNIbkAUK7RjR/ngsovBvoXn
   ifA5aTdAWpqBsu3G3MRuIdpeGEWWvrISCGTVZC5phX2pKjOpLa2hoQQkP
   geIfiN+Q5+qui/BY/koJOohv4UbG/eSbt6he9h0PRCZVlipxo4PKCSjvh
   35e7S0oJ7F9g83dj7nxh0oLDuxtn0R/hpqc9JDN5+XfJWFdwSWtaqeqhs
   cIsBmpYMVWkueA1Pw3XDunoro0ulAlDHyTuzH+IWjE3+HrCSL9t0zk5Jc
   vPFAn8gTWzsoRSA6XSgLmpZwcRzc2Sn1Mwx//06MNXdXrMcqRbOzhSUrg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313499413"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="313499413"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 22:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="665639156"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="665639156"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga007.jf.intel.com with ESMTP; 22 Feb 2023 22:28:03 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] checklayer: check for patch file upstream status
Date: Thu, 23 Feb 2023 14:27:54 +0800
Message-Id: <20230223062754.3162249-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177599

From: Chee Yang Lee <chee.yang.lee@intel.com>

yocto-check-layer to check all .patch file in layer for
Upstream-status and list down all .patch file without Upstream-Status.
Since upstream-status is additional Yocto Compatible requirement,
set this test as expected failure for now so it wont fail final
result.

[YOCTO #14642]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/checklayer/cases/common.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 722d3cf638..8fb37e175f 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -72,6 +72,21 @@ class CommonCheckLayer(OECheckLayerTestCase):
                 self.tc.layer['name'])
             self.fail('\n'.join(msg))
 
+    @unittest.expectedFailure
+    def test_patches_upstream_status(self):
+        patches = []
+        for dirpath, dirs, files in os.walk(self.tc.layer['path']):
+            for filename in files:
+                if filename.endswith(".patch"):
+                    data = ""
+                    ppath = os.path.join(dirpath, filename)
+                    with open(ppath, 'r', encoding='utf-8', errors='ignore') as f:
+                        data = f.read()
+                    if not re.search(r'^Upstream-Status', data, flags=re.I + re.M):
+                        patches.append(ppath)
+        self.assertEqual(len(patches), 0 , \
+                msg="Layer contains patches without upstream status:\n%s" % '\n'.join([str(patch) for patch in patches]))
+
     def test_signatures(self):
         if self.tc.layer['type'] == LayerType.SOFTWARE and \
            not self.tc.test_software_layer_signatures:
-- 
2.37.3


