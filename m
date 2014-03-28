Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 97C3F6B200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:27:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 03:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,750,1389772800"; d="scan'208";a="509579829"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2014 03:27:09 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 12:27:00 +0200
Message-Id: <0dd4dd0271b5db6e01e2b418c4b2ba116759fbbf.1396002362.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396002362.git.laurentiu.palcu@intel.com>
References: <cover.1396002362.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1396002362.git.laurentiu.palcu@intel.com>
References: <cover.1396002362.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] populate_sdk_base: add dependency of do_package_write_* tasks
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
X-List-Received-Date: Fri, 28 Mar 2014 10:27:10 -0000

nativesdk packages were created only for the first backend listed in
PACKAGE_CLASSES. Hence, if one had it set to "package_rpm package_ipk"
and did a 'bitbake -c populate_sdk core-image-something', the nativesdk
packages were created only for rpm.

This is particularily bad for adt-installer which is based on opkg
repos.

Credits go to richard.purdie@linuxfoundation.org who suggested me this
fix.

[YOCTO #5900]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 235d672..81da206 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -333,5 +333,5 @@ populate_sdk_log_check() {
 do_populate_sdk[dirs] = "${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
-do_populate_sdk[recrdeptask] += "do_packagedata"
+do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
 addtask populate_sdk
-- 
1.7.9.5


