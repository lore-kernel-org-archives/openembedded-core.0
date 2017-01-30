Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 38CEE77225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:12:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="815056926"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jan 2017 08:12:31 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 08:08:20 +0000
Message-Id: <7043fa6be84bde26e6a5a94c93ee3d302fb4f2ca.1485763510.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485515180.git.mariano.lopez@linux.intel.com>
References: <cover.1485515180.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485763510.git.mariano.lopez@linux.intel.com>
References: <cover.1485763510.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 2/5] runtime/cases/smart.py: Check for IMAGE_PKGTYPE instead of PACKAGE_CLASSES
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
X-List-Received-Date: Mon, 30 Jan 2017 16:12:33 -0000

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


