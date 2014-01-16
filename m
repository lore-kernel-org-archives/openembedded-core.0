Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 404A26B8C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 11:17:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2014 03:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,667,1384329600"; d="scan'208";a="466056807"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2014 03:17:01 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:16:56 +0200
Message-Id: <f0bc23d8113efff6037a1e4530ce3992e8abf953.1389870944.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389870944.git.laurentiu.palcu@intel.com>
References: <cover.1389870944.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1389870944.git.laurentiu.palcu@intel.com>
References: <cover.1389870944.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] nativesdk-packagegroup-sdk-host: reverse inherit order
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
X-List-Received-Date: Thu, 16 Jan 2014 11:17:01 -0000

Currently, tow successive toolchain builds for different hosts, will
issue a warning:

WARNING: The recipe nativesdk-packagegroup-sdk-host is trying to install
files into a shared area when those files already exist. Those files and
their manifest location are:
   /ssd/work/yp1/build/tmp/deploy/ipk/all/nativesdk-packagegroup-sdk-host_1.0-r11_all.ipk
   Matched in manifest-x86_64-nativesdk-packagegroup-sdk-host.package_write_ipk
Please verify which package should provide the above files.

That's because packagegroup is manually inherited after nativesdk which
is usually a BBCLASSEXTEND operation, done last.

[YOCTO #5396]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 9581ef3..1065f30 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -6,7 +6,7 @@ SUMMARY = "Host packages for the standalone SDK or external toolchain"
 PR = "r11"
 LICENSE = "MIT"
 
-inherit nativesdk packagegroup
+inherit packagegroup nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-- 
1.7.9.5


