Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCE26FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:17:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2016 04:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,506,1455004800"; d="scan'208";a="787849520"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 19 Apr 2016 04:17:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:17:04 +0300
Message-Id: <1461064624-7804-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1461064624-7804-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1461064624-7804-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH] license.bbclass: do write_deploy_manifest in image postprocessing
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
X-List-Received-Date: Tue, 19 Apr 2016 11:17:07 -0000

Call write_deploy_manifest() in image postprocessing phase, instead of
rootfs postprocessing. The reason being that not necessarily all
do_deploy tasks are dependencies of the do_rootfs and we might miss
something.

[YOCTO #9446]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/license.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 94be559..43944e6 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -650,9 +650,12 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; write_deploy_manifest; license_create_manifest; "
+ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
 do_rootfs[recrdeptask] += "do_populate_lic"
 
+IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
+do_image[recrdeptask] += "do_populate_lic"
+
 do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
 python do_populate_lic_setscene () {
-- 
2.6.6


