Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C3A3671DA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:24:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 12:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087278619"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:24:07 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:20:05 +0000
Message-Id: <b57d9496e5f996e0356fc518911059f5d3a999d6.1485346622.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/3] runtime/cases/smart.py: Check for IMAGE_PKGTYPE instead of PACKAGE_CLASSES
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
X-List-Received-Date: Wed, 25 Jan 2017 20:24:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

smart test requires to build the image using rpm packages, this check was
included, but it checked for PACKAGE_CLASSES=='package_rpm', and this is
not true when building packages for rpm and deb/ipk. So this would check
IMAGE_PKGTYPE instead.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/smart.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/smart.py b/meta/lib/oeqa/runtime/cases/smart.py
index 9b4d0d2..79bd9c8 100644
--- a/meta/lib/oeqa/runtime/cases/smart.py
+++ b/meta/lib/oeqa/runtime/cases/smart.py
@@ -23,7 +23,7 @@ class SmartBasicTest(SmartTest):
 
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_FEATURES')
-    @skipIfNotDataVar('PACKAGE_CLASSES', 'package_rpm',
+    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
                       'RPM is not the primary package manager')
     @OEHasPackage(['smartpm'])
     @OETestID(716)
-- 
2.6.6


