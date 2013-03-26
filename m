Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKYEc-0001mr-5V
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:04:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2013 10:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="307706550"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.152])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2013 10:47:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 17:47:26 +0000
Message-Id: <1364320046-32152-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] classes/rm_work: rename RM_WORK_WHITELIST to RM_WORK_EXCLUDE
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
X-List-Received-Date: Tue, 26 Mar 2013 18:04:59 -0000

This really functions as a blacklist, not a whitelist, since we are
listing recipes to exclude. To avoid any possibility of confusion, since
this was a recent addition, rename the variable.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rm_work.bbclass |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 54287bf..1642af7 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -5,10 +5,10 @@
 #
 # INHERIT += "rm_work"
 #
-# To inhibit rm_work for some recipes, specify them in RM_WORK_WHITELIST.
+# To inhibit rm_work for some recipes, specify them in RM_WORK_EXCLUDE.
 # For example, in conf/local.conf:
 #
-# RM_WORK_WHITELIST += "icu-native icu busybox"
+# RM_WORK_EXCLUDE += "icu-native icu busybox"
 #
 
 # Use the completion scheduler by default when rm_work is active
@@ -19,10 +19,10 @@ RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
 BB_DEFAULT_TASK = "rm_work_all"
 
 do_rm_work () {
-    # If the recipe name is in the RM_WORK_WHITELIST, skip the recipe.
-    for p in ${RM_WORK_WHITELIST}; do
+    # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
+    for p in ${RM_WORK_EXCLUDE}; do
         if [ "$p" = "${PN}" ]; then
-            bbnote "rm_work: Skipping ${PN} since it is in RM_WORK_WHITELIST"
+            bbnote "rm_work: Skipping ${PN} since it is in RM_WORK_EXCLUDE"
             exit 0
         fi
     done
-- 
1.7.10.4



