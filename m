Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA9E731CF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 23:27:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Jan 2016 15:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,309,1449561600"; d="scan'208";a="892646842"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.180.176])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2016 15:27:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 12:26:33 +1300
Message-Id: <187d00ddb9f5619a4154391992950fccc92402ba.1453073170.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453073170.git.paul.eggleton@linux.intel.com>
References: <cover.1453073170.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453073170.git.paul.eggleton@linux.intel.com>
References: <cover.1453073170.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: fix task dependency regression
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
X-List-Received-Date: Sun, 17 Jan 2016 23:27:02 -0000

Fix a regression caused by OE-Core revision
eabeb26335b1a4eb1e68218160dbdbe8fdf36272 where we lost the task
dependency on packages in TOOLCHAIN_HOST_TASK (such as
meta-environment-extsdk-${MACHINE}) which led to errors about missing
packages when building the extensible SDK. This happened because I only
moved half of the dependencies coming from the standard SDK task to
do_sdk_depends.

While I'm at it, tidy up the do_populate_sdk_ext[depends] line.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 2f788ee..e5e55b3 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -303,6 +303,7 @@ do_sdk_depends[dirs] = "${WORKDIR}"
 do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
 do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
+do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
 
 def get_sdk_ext_rdepends(d):
     localdata = d.createCopy()
@@ -311,10 +312,9 @@ def get_sdk_ext_rdepends(d):
     return localdata.getVarFlag('do_populate_sdk', 'rdepends', True)
 
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
-do_populate_sdk_ext[depends] += "${@d.getVarFlag('do_populate_sdk', 'depends', False)}"
-do_populate_sdk_ext[rdepends] = "${@get_sdk_ext_rdepends(d)}"
 
-do_populate_sdk_ext[depends] += "buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
+do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', False)} \
+                                buildtools-tarball:do_populate_sdk uninative-tarball:do_populate_sdk"
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
 
-- 
2.5.0


