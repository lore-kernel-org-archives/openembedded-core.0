Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Zv4+EHOe;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107530; x=1676643530;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=757DHpfRm/LOtdRdhUxrzla25DD+bZx/BB6v0Tnyux0=;
  b=Zv4+EHOexcMCSxWST3aZhgnAVqWZmB/6t3cMu+R1qIDC7rMxgd8mUM8R
   xnAcYDSpxN7EKRLxb08Z6sD9GC3MDPqbOjRhAocFGrkAGyHlGgihK29wQ
   QwA3EdIUZEC9KOYaYVaG9uVJFNTfVkFNk45CWRuRypZ37hf3UOpQ+9Si7
   yTbr4FfxzZhNlScCO+FntgGl9K37hkOaKaIKInKGtWZhj1UDrJg8sfQhW
   z/RomDj9f2qz7Ra9s/70q7CUbvtpNhXqcSWEowW/rzubWjyickLIR+OvD
   tig/RogHe/DoVqrzq87JDQKnbRBQWGxdiUwd8EmyOgxJkvj2nYE26V1TB
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618062"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249420"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/14] runtime_test: skip virgl test on fedora 34
Date: Thu, 17 Feb 2022 22:18:23 +0800
Message-Id: 
 <4c3d0463b413a0c070aa34d50e60bf184c726512.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161814

The gtk and headless tests fail on Fedora 34 because of the host libdrm
version so skip them.

| runqemu - ERROR - Failed to run qemu: MESA-LOADER: failed to open iris: /lib64/libdrm_nouveau.so.2: undefined symbol: drmCloseBufferHandle (search paths /usr/lib64/dri)
| failed to load driver: iris
| MESA-LOADER: failed to open kms_swrast: /lib64/libdrm_nouveau.so.2: undefined symbol: drmCloseBufferHandle (search paths /usr/lib64/dri)
| failed to load driver: kms_swrast
| MESA-LOADER: failed to open swrast: /lib64/libdrm_nouveau.so.2: undefined symbol: drmCloseBufferHandle (search paths /usr/lib64/dri)
| failed to load swrast driver
| qemu-system-x86_64: egl: gbm_create_device failed
| qemu-system-x86_64: egl: render node init failed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 2148e84ff3..f9649339e5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -232,6 +232,9 @@ class TestImage(OESelftestTestCase):
             dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.skipTest("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+        distro = oe.lsb.distro_identifier()
+        if distro and distro == 'fedora-34':
+            self.skipTest('virgl isn\'t working with Fedora 34')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
-- 
2.35.1


