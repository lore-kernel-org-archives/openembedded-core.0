Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66F4171BFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 13:26:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 06:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,221,1488873600"; d="scan'208";a="91344538"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2017 06:26:34 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 46C096A4006;
	Wed, 19 Apr 2017 06:26:23 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 16:25:57 +0300
Message-Id: <1492608357-18045-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] package_manager.py: Reverse rpm arch order
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 13:26:36 -0000

The architecture list used by dnf/libsolv was in the wrong order.
As a result, the images were built with wrong and unpredictable
packages.

$ MACHINE=intel-corei7-64 bitbake core-image-sato
$ MACHINE=qemux86-64 bitbake core-image-sato
$ MACHINE=intel-corei7-64 bitbake -ccleansstate core-image-sato
$ MACHINE=intel-corei7-64 bitbake core-image-sato

The first image had 0 core2_64 packages in it, but the last one had
583 core2_64 packages (which were built for the qemu image in
between).

Reverse the arch order in etc/dnf/vars/arch.

Fixes [YOCTO #11384].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

The fix was suggested by Kanavin. It works correctly in my tests but
obviously there is potential to break things for rpm builds here.

Thanks,
  Jussi



 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f7190cf..f1b65bd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -489,7 +489,7 @@ class RpmPM(PackageManager):
 
     def _configure_dnf(self):
         # libsolv handles 'noarch' internally, we don't need to specify it explicitly
-        archs = [i for i in self.archs.split() if i not in ["any", "all", "noarch"]]
+        archs = [i for i in reversed(self.archs.split()) if i not in ["any", "all", "noarch"]]
         # This prevents accidental matching against libsolv's built-in policies
         if len(archs) <= 1:
             archs = archs + ["bogusarch"]
-- 
2.1.4


