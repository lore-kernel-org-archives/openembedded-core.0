Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SzrxS-0001V8-G6
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 18:21:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 09:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,745,1336374000"; d="scan'208";a="184530498"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.78])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2012 09:09:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Date: Fri, 10 Aug 2012 17:09:07 +0100
Message-Id: <708346a5928e2962dc3da11fceb02e062729fdd3.1344614803.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344614803.git.paul.eggleton@linux.intel.com>
References: <cover.1344614803.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1344614803.git.paul.eggleton@linux.intel.com>
References: <cover.1344614803.git.paul.eggleton@linux.intel.com>
Subject: [denzil][PATCH 4/4] classes/license: fix manifest to work with deb
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
X-List-Received-Date: Fri, 10 Aug 2012 16:21:06 -0000

Prepend the license manifest creation call to ROOTFS_POSTPROCESS_COMMAND
instead of appending to ROOTFS_POSTINSTALL_COMMAND. The latter is not
implemented for the deb backend (and probably ought to just be removed
completely), and by using _prepend we can still ensure it occurs before
package info is removed (and before buildhistory in case it is needed
there in future).

(From OE-Core rev: 56fafe083fdb63f156a081344fb1d836e3182bf0)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6c4a673..cd4512e 100644
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



