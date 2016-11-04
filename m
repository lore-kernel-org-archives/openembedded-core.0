Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B74966E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:16:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 04 Nov 2016 06:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,443,1473145200"; d="scan'208";a="897714723"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 04 Nov 2016 06:16:53 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id F37342C8001;
	Fri,  4 Nov 2016 06:16:15 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 15:16:49 +0200
Message-Id: <e1c9c1d5c21b61868054fdd1ade16f446e33b231.1478258311.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1478258311.git.jussi.kukkonen@intel.com>
References: <cover.1478258311.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] run-postinsts: Use opkg/dpkg to configure when possible
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
X-List-Received-Date: Fri, 04 Nov 2016 13:16:52 -0000

Currently run-postinsts script has code to run postinst scripts
via opkg/dpkg configure but that code is never used. The advantage
of using package managers instead of just executing the scripts is
to keep the package manager DB updated.

Fix the script so that the package managers are used when appropriate.
Also use $localstatedir for the opkg runtime file location.

Fixes [YOCTO #10478].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 04ba394..10f2118 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -16,23 +16,25 @@ pm_installed=false
 for pm in $backend_list; do
 	pi_dir="#SYSCONFDIR#/$pm-postinsts"
 
-	[ -d $pi_dir ] && break
+	if [ ! -d $pi_dir ]; then
+		continue
+	fi
 
+	# found the package manager, it has postinsts
 	case $pm in
 		"deb")
 			if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
 				pm_installed=true
-				break
 			fi
 			;;
 
 		"ipk")
-			if [ -s "/var/lib/opkg/status" ]; then
+			if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ]; then
 				pm_installed=true
-				break
 			fi
 			;;
 	esac
+	break
 done
 
 remove_rcsd_link () {
-- 
2.1.4


