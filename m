Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD956B7B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 17:05:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2013 10:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381478992"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 10:04:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 18:04:38 +0100
Message-Id: <aa7ae21653bb4facaccb3100f07f172d98cc1ccd.1376585082.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376585082.git.paul.eggleton@linux.intel.com>
References: <cover.1376585082.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] classes/buildhistory: avoid mangling names in dot graphs for images
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
X-List-Received-Date: Thu, 15 Aug 2013 17:05:26 -0000

We were mangling names here to avoid characters that are invalid for dot
node names, but if you just quote all names that isn't necessary and we
retain the original naming, allowing easy searching of the graph files.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e3f9201..080f2c7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -325,10 +325,10 @@ buildhistory_get_installed() {
 	fi
 
 	# Produce dependency graph
-	# First, filter out characters that cause issues for dot
-	rootfs_list_installed_depends | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' > $1/depends.tmp
+	# First, quote each name to handle characters that cause issues for dot
+	rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
 	# Change delimiter from pipe to -> and set style for recommend lines
-	sed -i -e 's:|: -> :' -e 's:\[REC\]:[style=dotted]:' -e 's:$:;:' $1/depends.tmp
+	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
 	printf "digraph depends {\n    node [shape=plaintext]\n" > $1/depends.dot
 	cat $1/depends.tmp | sort | uniq >> $1/depends.dot
@@ -354,10 +354,10 @@ buildhistory_get_installed() {
 
 	if [ "$2" != "sdk" ] ; then
 		# Produce some cut-down graphs (for readability)
-		grep -v kernel_image $1/depends.dot | grep -v kernel_2 | grep -v kernel_3 > $1/depends-nokernel.dot
+		grep -v kernel_image $1/depends.dot | grep -v kernel-2 | grep -v kernel-3 > $1/depends-nokernel.dot
 		grep -v libc6 $1/depends-nokernel.dot | grep -v libgcc > $1/depends-nokernel-nolibc.dot
-		grep -v update_ $1/depends-nokernel-nolibc.dot > $1/depends-nokernel-nolibc-noupdate.dot
-		grep -v kernel_module $1/depends-nokernel-nolibc-noupdate.dot > $1/depends-nokernel-nolibc-noupdate-nomodules.dot
+		grep -v update- $1/depends-nokernel-nolibc.dot > $1/depends-nokernel-nolibc-noupdate.dot
+		grep -v kernel-module $1/depends-nokernel-nolibc-noupdate.dot > $1/depends-nokernel-nolibc-noupdate-nomodules.dot
 	fi
 
 	# add complementary package information
-- 
1.8.1.2


