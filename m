Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08FA476DC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041405"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:17 +0100
Message-Id: <9409876183081543e984ac2d9435a1d86a901098.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/8] classes/buildhistory: fix permissions in package file listing
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:46 -0000

If we want the correct file permissions to show up here as they would on
the target, we need to run the command under pseudo. Normally we'd set
the fakeroot varflag on the function and that would be enough, but it
turns out that setting fakeroot on a non-task function that you execute
using bb.build.exec_func() isn't working at the moment. Work around this
by simply using FAKEROOTENV and FAKEROOTCMD. Unfortunately that means we
have to duplicate the command for the two cases but I couldn't find a
better means of doing that that actually works.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3d459c7..190c38e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -435,7 +435,11 @@ buildhistory_get_sdk_installed_target() {
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
-	( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+	if [ "$3" = "fakeroot" ] ; then
+		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+	else
+		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
+	fi
 }
 
 buildhistory_list_pkg_files() {
@@ -449,7 +453,7 @@ buildhistory_list_pkg_files() {
 			bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
 			continue
 		fi
-		buildhistory_list_files ${pkgdir} ${outfile}
+		buildhistory_list_files $pkgdir $outfile fakeroot
 	done
 }
 
-- 
2.1.0


