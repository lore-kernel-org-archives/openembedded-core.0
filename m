Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A5F4D6EE5C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:39:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 04:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494441775"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 04:39:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 14:39:41 +0200
Message-Id: <9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/3] buildhistory.bbclass: Fix dependency files creation
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
X-List-Received-Date: Wed, 05 Mar 2014 12:39:49 -0000

Call the new python routines.

[YOCTO #5904]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/buildhistory.bbclass |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ef4135b..01b0082 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -319,6 +319,12 @@ python buildhistory_list_installed() {
 
     with open(pkgs_list_file, 'w') as pkgs_list:
         pkgs_list.write(list_installed_packages(d, 'file'))
+
+    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
+                                  "bh_installed_pkgs_deps.txt")
+
+    with open(pkgs_deps_file, 'w') as pkgs_deps:
+        pkgs_deps.write(list_installed_packages(d, 'deps'))
 }
 
 
@@ -338,7 +344,8 @@ buildhistory_get_installed() {
 
 	# Produce dependency graph
 	# First, quote each name to handle characters that cause issues for dot
-	rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
+	cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
+		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
 	# Change delimiter from pipe to -> and set style for recommend lines
 	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
-- 
1.7.9.5


