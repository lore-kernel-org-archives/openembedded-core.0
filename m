Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SmnWu-0008NQ-Ke
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:59:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2012 07:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188760171"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2012 07:48:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 15:48:23 +0100
Message-Id: <1341499703-6867-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/license: fix manifest to work with deb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 14:59:40 -0000

Prepend the license manifest creation call to ROOTFS_POSTPROCESS_COMMAND
instead of appending to ROOTFS_POSTINSTALL_COMMAND. The latter is not
implemented for the deb backend (and probably ought to just be removed
completely), and by using _prepend we can still ensure it occurs before
package info is removed (and before buildhistory in case it is needed
there in future).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index e6096a6..4e25cf8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -382,7 +382,7 @@ do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-ROOTFS_POSTINSTALL_COMMAND += "license_create_manifest; "
+ROOTFS_POSTPROCESS_COMMAND_prepend = "license_create_manifest; "
 
 python do_populate_lic_setscene () {
 	sstate_setscene(d)
-- 
1.7.9.5



