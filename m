Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F45C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:21:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.16137.1700648470866257217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ca9RgVHN;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700648470; x=1732184470;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SXLjzjj71WWdAo37CIc6Zt3npU87Bwp5QT+lZLgRgUg=;
  b=ca9RgVHNHgFw70Nx+Vnr995669C6VeYOVIRdBJe1uqnGbhA/hxEvyZ3j
   p3b1+f2GS+ad/A8LpyBuEUxOkTyG8YKAsYqLhwTUPRWM5enx3rje13mR8
   CSr99T5kh+e+smGwxdxQJfFq/0m+XSqBolcFRLhFq0Reh2dw3GX5I0MIj
   sa5rioM+DSs43eKRL1GHOtks/Nxns9vgrw/tjjURi5rQF2s+DbRS+nRgP
   tkQUPOftDiz75m9iKFFUv6g46vMdnZ91nBYOs33NDliMwxGvov8b7kA4s
   vy4UWTUibuuJ5D3tDOxB+nHGn8DnqSMg+9BGyAoYxEm1y6YCHjEiEb9ct
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458521812"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="458521812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="15209310"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 02:21:09 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: add test for partition hidden attributes
Date: Wed, 22 Nov 2023 18:01:31 +0800
Message-Id: <20231122100131.2389782-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191054

From: Lee Chee Yang <chee.yang.lee@intel.com>

Add test for the --hidden argument introduced in Oe-Core
rev 7a111ff58d7390b79e2e63c8059f6c25f40f8977.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b4866bcb32..ab248c5898 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -748,6 +748,30 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
 
         os.remove(wks_file)
 
+    def test_partition_hidden_attributes(self):
+        """Test --hidden wks option."""
+        wks_file = 'temp.wks'
+        sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        try:
+            with open(wks_file, 'w') as wks:
+                wks.write("""
+part / --source rootfs --fstype=ext4
+part / --source rootfs --fstype=ext4 --hidden
+bootloader --ptable gpt""")
+
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+            wicout = os.path.join(self.resultdir, "*.direct")
+
+            result = runCmd("%s/usr/sbin/sfdisk --part-attrs %s 1" % (sysroot, wicout))
+            self.assertEqual('', result.output)
+            result = runCmd("%s/usr/sbin/sfdisk --part-attrs %s 2" % (sysroot, wicout))
+            self.assertEqual('RequiredPartition', result.output)
+
+        finally:
+            os.remove(wks_file)
+
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
2.37.3


