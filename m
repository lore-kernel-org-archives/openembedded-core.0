Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TjO1p-0004HB-BD
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 06:41:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2012 21:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,277,1355126400"; d="scan'208";a="263849122"
Received: from unknown (HELO localhost) ([10.255.13.223])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2012 21:27:08 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@windriver.com
Date: Thu, 13 Dec 2012 23:27:09 -0600
Message-Id: <e7a95fde7267ebf9a1567d3f3aa1e459e12a5fea.1355462107.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1355462107.git.tom.zanussi@intel.com>
References: <cover.1355462107.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] module.bbclass: make sure do_make_scripts() executes after do_patch()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 05:41:48 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

If do_make_scripts() executes before do_unpack()/do_patch(), the build
fails because it can't cd into the workdir of a recipe using this
class, so make sure do_make_scripts() doesn't run before the package
has been unpacked and patched.

Fixes [YOCTO #3589].

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/module.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index e8d32eb..ebb0880 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -3,7 +3,7 @@ DEPENDS += "virtual/kernel"
 
 inherit module-base
 
-addtask make_scripts before do_compile
+addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
 
-- 
1.7.4.1



