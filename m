Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T0yMI-0007uu-QG
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 19:23:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7DHBMv9027646;
	Mon, 13 Aug 2012 10:11:23 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: scott.a.garman@intel.com
Date: Mon, 13 Aug 2012 13:10:53 -0400
Message-Id: <155ddab2afb23aa01be71cc962d2532ad55cceb5.1344876697.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1344876697.git.bruce.ashfield@windriver.com>
References: <cover.1344876697.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1344876697.git.bruce.ashfield@windriver.com>
References: <cover.1344876697.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto: allow do_validate_branches to handle all branches
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
X-List-Received-Date: Mon, 13 Aug 2012 17:23:19 -0000

Branch validation will not restrict a branch that doesn't exist
in the tree at the time of validation (since you can't reset a
SRCREV on a non-existent branch). This restriction can be removed
by looking for all branches that contain the specified SRCREV
and forcing them to that value.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |  119 +++++++++++++++++++++++++------------
 1 files changed, 80 insertions(+), 39 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c995a2e..d859d76 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -214,63 +214,104 @@ python do_kernel_configcheck() {
     bb.plain( "%s" % result )
 }
 
-
-# Ensure that the branches (BSP and meta) are on the locatios specified by
+# Ensure that the branches (BSP and meta) are on the locations specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
-# are reset to the correct commit.
+# are corrected to the proper commit.
 do_validate_branches() {
 	cd ${S}
+	export KMETA=${KMETA}
 
-	# nothing to do if bootstrapping
- 	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
- 	 	return
- 	fi
-
-	# nothing to do if SRCREV is AUTOREV
+	set +e
+	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
+	# check and we can exit early
 	if [ "${SRCREV_machine}" = "AUTOINC" ]; then
-		# restore the branch for builds
-		git checkout -f ${KBRANCH}
 		return
 	fi
 
- 	branch_head=`git show-ref -s --heads ${KBRANCH}`
+	# If something other than the default branch was requested, it must
+	# exist in the tree, and it's a hard error if it wasn't
+	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	if [ $? -eq 1 ]; then
+		if [ -n "${KBRANCH_DEFAULT}" ] && 
+                      [ "${KBRANCH}" != "${KBRANCH_DEFAULT}" ]; then
+			echo "ERROR: branch ${KBRANCH} was set for kernel compilation, "
+			echo "       but it does not exist in the kernel repository."
+			echo "       Check the value of KBRANCH and ensure that it describes"
+			echo "       a valid banch in the source kernel repository"
+			exit 1
+		fi
+	fi
+
+	if [ -z "${SRCREV_machine}" ]; then
+		target_branch_head="${SRCREV}"
+	else
+	 	target_branch_head="${SRCREV_machine}"
+	fi
+
+	# $SRCREV could have also been AUTOINC, so check again
+	if [ "${target_branch_head}" = "AUTOINC" ]; then
+		return
+	fi
+
+	containing_branches=`git branch --contains $target_branch_head | sed 's/^..//'`
+	if [ -z "$containing_branches" ]; then
+		echo "ERROR: SRCREV was set to \"$target_branch_head\", but no branches"
+		echo "       contain this commit"
+		exit 1
+	fi
+	ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
+	if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+	    echo "ERROR ${target_branch_head} is not a valid commit ID."
+	    echo "The kernel source tree may be out of sync"
+	    exit 1
+	fi
+
+	# force the SRCREV in each branch that contains the specified
+	# SRCREV (if it isn't the current HEAD of that branch)
+	git checkout -q master
+	for b in $containing_branches; do
+		branch_head=`git show-ref -s --heads ${b}`
+		if [ "$branch_head" != "$target_branch_head" ]; then
+			echo "[INFO] Setting branch $b to ${target_branch_head}"	      
+			git branch -D $b > /dev/null
+			git branch $b $target_branch_head > /dev/null
+		fi
+	done
+
+	## KMETA branch validation
  	meta_head=`git show-ref -s --heads ${KMETA}`
- 	target_branch_head="${SRCREV_machine}"
  	target_meta_head="${SRCREV_meta}"
+	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
+	if [ $? -eq 1 ]; then
+		return
+	fi
 
-	current=`git branch |grep \*|sed 's/^\* //'`
-	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ]; then
-		if [ -n "${KERNEL_REVISION_CHECKING}" ]; then
-			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-				echo "ERROR ${target_branch_head} is not a valid commit ID."
-				echo "The kernel source tree may be out of sync"
-				exit 1
-			else
-				echo "Forcing branch $current to ${target_branch_head}"
-				git branch -m $current $current-orig
-				git checkout -b $current ${target_branch_head}
-			fi
-		fi
+	if [ "${target_meta_head}" = "AUTOINC" ]; then
+		return
 	fi
 
 	if [ "$meta_head" != "$target_meta_head" ]; then
-		if [ -n "${KERNEL_REVISION_CHECKING}" ]; then
-			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-				echo "ERROR ${target_meta_head} is not a valid commit ID"
-				echo "The kernel source tree may be out of sync"
+		ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
+		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+			echo "ERROR ${target_meta_head} is not a valid commit ID"
+			echo "The kernel source tree may be out of sync"
+			exit 1
+		else
+			echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
+			git branch -m ${KMETA} ${KMETA}-orig
+			git checkout -q -b ${KMETA} ${target_meta_head}
+			if [ $? -ne 0 ];then
+				echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
 				exit 1
-			else
-				echo "Forcing branch meta to ${target_meta_head}"
-				git branch -m ${KMETA} ${KMETA}-orig
-				git checkout -b ${KMETA} ${target_meta_head}
-			fi	   
+			fi
 		fi
 	fi
 
-	# restore the branch for builds
-	git checkout -f ${KBRANCH}
+	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	if [ $? -eq 0 ]; then
+		# restore the branch for builds
+		git checkout -q -f ${KBRANCH}
+	fi
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
1.7.5.4



