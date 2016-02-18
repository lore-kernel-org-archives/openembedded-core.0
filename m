Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3B275731DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:18:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 09:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,466,1449561600"; d="scan'208";a="915924527"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2016 09:18:02 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 09:17:55 -0800
Message-Id: <941d876fe835bc1aa26039d0edec9573d482bca3.1455815778.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1455815778.git.randy.e.witt@linux.intel.com>
References: <cover.1455815778.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 3/3] populate_sdk_ext.bbclass: Add SDK_RECRDEP_TASKS variable
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
X-List-Received-Date: Thu, 18 Feb 2016 17:18:27 -0000

Currently there isn't a way for the extensible sdk to know all the tasks
that will need sstate for an image. This is because a layer can add it's
on custom tasks that are required for an image to be generated.

The extensible sdk solved this for poky by using recrdeptask and
specifying the tasks known to be required for the image as well as for
building new recipes.

So the SDK_RECRDEP_TASKS variable allows a user to specify additional
tasks that need to be pulled in.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 7c95301..5f90aea 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -359,7 +359,7 @@ addtask sdk_depends
 do_sdk_depends[dirs] = "${WORKDIR}"
 do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)}"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
-do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy"
+do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
 do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
 
 def get_sdk_ext_rdepends(d):
-- 
2.5.0


