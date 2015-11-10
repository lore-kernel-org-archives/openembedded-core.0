Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18477770D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:31:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 10 Nov 2015 07:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="597610046"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.0.72])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2015 07:31:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Nov 2015 15:30:55 +0000
Message-Id: <2533e4f39428988e23427cf44d64daa7dcb19180.1447169394.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1447169394.git.paul.eggleton@linux.intel.com>
References: <cover.1447169394.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1447169394.git.paul.eggleton@linux.intel.com>
References: <cover.1447169394.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/license: fix intermittent license collection warning
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
X-List-Received-Date: Tue, 10 Nov 2015 15:31:09 -0000

Fixes the following warning sometimes appearing during image builds:

WARNING: The license listed ABC was not in the licenses collected for recipe xyz

The files being looked for here, which runs during do_rootfs,
are written out by the do_populate_lic task for each recipe. However,
there was no explicit dependency between do_rootfs and all of the
do_populate_lic tasks to ensure they had run - only an implicit link via
do_build, so it is possible that sometimes they had not depending on how
the tasks were scheduled. Add an explicit set of dependencies to fix
this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c616a20..8ad4614 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -474,6 +474,7 @@ do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
+do_rootfs[recrdeptask] += "do_populate_lic"
 
 do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
-- 
2.1.0


