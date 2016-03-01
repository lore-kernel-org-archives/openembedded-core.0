Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 987B27017D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 18:08:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 01 Mar 2016 10:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,524,1449561600"; d="scan'208";a="924496656"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2016 10:08:24 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 10:08:21 -0800
Message-Id: <1456855701-8942-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] populate_sdk_ext: Make populate_sdk_ext nostamp
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
X-List-Received-Date: Tue, 01 Mar 2016 18:08:26 -0000

Since the metadata for multiple layers will be put into the sdk, anytime
those layers change the sdk needs to be rebuilt. Ideally, this would use
checksums to only rebuild when necessary.

However, since this feature needs to be in the release, opt for a less
intrusive change by setting the task to nostamp. Unnecessary rebuilds
may occur, but it's better than a user wondering why their changes
didn't get added.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 77de969..e93be29 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -414,8 +414,9 @@ do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar
 do_populate_sdk_ext[vardeps] += "copy_buildsystem \
                                  sdk_ext_postinst"
 
-do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
-                                        ${COREBASE}/meta/files/toolchain-shar-extract.sh:True \
-                                        ${COREBASE}/scripts/gen-lockedsig-cache:True"
+# Since any change in the metadata of any layer should cause a rebuild of the
+# sdk(since the layers are put in the sdk) set the task to nostamp so it
+# always runs.
+do_populate_sdk_ext[nostamp] = "1"
 
 addtask populate_sdk_ext after do_sdk_depends
-- 
2.5.0


