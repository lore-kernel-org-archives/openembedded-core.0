Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T1k3K-0007pp-Sz
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:18:55 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FK6sWc011691;
	Wed, 15 Aug 2012 13:06:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Aug 2012 16:06:20 -0400
Message-Id: <9adc11ebd961b769e39d0ac664998a2de014b058.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/4] linux-yocto: make KBRANCH the exception and not the rule
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
X-List-Received-Date: Wed, 15 Aug 2012 20:18:55 -0000

The kernel branch is no longer required by the yocto-kern-tools
to locate BSP feature descriptions (it is the MACHINE:KTYPE
descriptor), so we no longer require that the BSP branch be
explicitly set.

If a kernel branch is explicitly set, it is now used to trigger
a checks to ensure that the branch really is being built.
Otherwise the branch that the machine description creates will
be built (just as it always was).

This further simplies the use and configuration of a linux-yocto
based kernel recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   88 ++++++++++++++------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 63 insertions(+), 27 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f09d503..10a8d40 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -80,8 +80,12 @@ do_patch() {
 		done
 	fi
 
+	if [ "${kbranch}" != "${KBRANCH_DEFAULT}" ]; then
+		updateme_flags="--branch ${kbranch}"
+	fi
+
 	# updates or generates the target description
-	updateme --branch ${kbranch} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
+	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
                            ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
@@ -91,7 +95,19 @@ do_patch() {
 	# executes and modifies the source tree as required
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not modify ${kbranch}"
+		echo "ERROR. Could not apply updates for ${KMACHINE}"
+		exit 1
+	fi
+
+	# Perform a final check. If something other than the default kernel
+	# branch was requested, and that's not where we ended up, then we 
+	# should thrown an error, since we aren't building what was expected
+	final_branch="$(git symbolic-ref HEAD 2>/dev/null)"
+	final_branch=${final_branch##refs/heads/}
+	if [ "${kbranch}" != "${KBRANCH_DEFAULT}" ] &&
+	   [ "${final_branch}" != "${kbranch}" ]; then
+		echo "ERROR: branch ${kbranch} was requested, but was not properly"
+		echo "       configured to be built. The current branch is ${final_branch}"
 		exit 1
 	fi
 }
@@ -199,10 +215,9 @@ python do_kernel_configcheck() {
     bb.plain( "%s" % result )
 }
 
-
 # Ensure that the branches (BSP and meta) are on the locations specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
-# are reset to the correct commit.
+# are corrected to the proper commit.
 do_validate_branches() {
 	cd ${S}
 
@@ -213,39 +228,57 @@ do_validate_branches() {
 		return
 	fi
 
-	# if the branches do not exist, then there's nothing to check either
+	# If something other than the default branch was requested, it must
+	# exist in the tree, and it's a hard error if it wasn't
 	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
 	if [ $? -eq 1 ]; then
-		return
+		if [ -n "${KBRANCH_DEFAULT}" ] && 
+                      [ "${KBRANCH}" != "${KBRANCH_DEFAULT}" ]; then
+			echo "ERROR: branch ${KBRANCH} was set for kernel compilation, "
+			echo "       but it does not exist in the kernel repository."
+			echo "       Check the value of KBRANCH and ensure that it describes"
+			echo "       a valid banch in the source kernel repository"
+			exit 1
+		fi
 	fi
 
- 	branch_head=`git show-ref -s --heads ${KBRANCH}`
 	if [ -z "${SRCREV_machine}" ]; then
 		target_branch_head="${SRCREV}"
 	else
 	 	target_branch_head="${SRCREV_machine}"
 	fi
 
+	# $SRCREV could have also been AUTOINC, so check again
 	if [ "${target_branch_head}" = "AUTOINC" ]; then
 		return
 	fi
 
-	# We have SRCREVs and we have branches so validation can continue!
-	current=`git branch |grep \*|sed 's/^\* //'`
-	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ] &&
-           [ "$target_branch_head" != "AUTOINC" ]; then
-		ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
-		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-			echo "ERROR ${target_branch_head} is not a valid commit ID."
-			echo "The kernel source tree may be out of sync"
-			exit 1
-		else
-			echo "Forcing branch $current to ${target_branch_head}"
-			git branch -m $current $current-orig
-			git checkout -b $current ${target_branch_head}
-		fi
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
 	fi
 
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
  	target_meta_head="${SRCREV_meta}"
 	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
@@ -264,18 +297,21 @@ do_validate_branches() {
 			echo "The kernel source tree may be out of sync"
 			exit 1
 		else
-			echo "Forcing branch meta to ${target_meta_head}"
+			echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
 			git branch -m ${KMETA} ${KMETA}-orig
-			git checkout -b ${KMETA} ${target_meta_head}
+			git checkout -q -b ${KMETA} ${target_meta_head}
 			if [ $? -ne 0 ];then
-				echo "ERROR: could not checkout meta branch from known hash ${target_meta_head}"
+				echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
 				exit 1
 			fi
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
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index f47262f..0cb111c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "b8dfd3d641400a8dfbf16868ee64f524508c80b7"
+SRCREV = "12c39b76eca4ed993b5ffb38cbe89e0608b216c3"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



