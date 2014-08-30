Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8CA710C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cj0u013742
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:45 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:15 -0400
Message-ID: <ea5e22a9a5c0e75b7568c75cc4f94704179811a3.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/18] kernel-yocto: convert echo statements to bb* equivalents
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:45 -0000
Content-Type: text/plain

Use the bbinfo, bberror, bbfatal equivalents to the existing echo statements
within the kernel-yocto processing. This makes us consistent with the other
messages from the build system.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 54 ++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 4f912bff2fcd..ee09769d4616 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -85,8 +85,7 @@ do_patch() {
 
 	createme ${createme_flags} ${ARCH} ${machine_branch}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not create ${machine_branch}"
-		exit 1
+		bbfatal "Could not create ${machine_branch}"
 	fi
 
 	sccs="${@" ".join(find_sccs(d))}"
@@ -119,16 +118,14 @@ do_patch() {
 	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
                          ${includes} ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not update ${machine_branch}"
-		exit 1
+		bbfatal "Could not update ${machine_branch}"
 	fi
 
 	# executes and modifies the source tree as required
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not apply patches for ${KMACHINE}."
-		echo "       Patch failures can be resolved in the devshell (bitbake -c devshell ${PN})"
-		exit 1
+		bberror "Could not apply patches for ${KMACHINE}."
+		bbfatal "Patch failures can be resolved in the devshell (bitbake -c devshell ${PN})"
 	fi
 
 	# check to see if the specified SRCREV is reachable from the final branch.
@@ -136,9 +133,8 @@ do_patch() {
 	if [ "${machine_srcrev}" != "AUTOINC" ]; then
 		git merge-base --is-ancestor ${machine_srcrev} HEAD
 	 	if [ $? -ne 0 ]; then
-			bbnote "ERROR: SRCREV ${machine_srcrev} was specified, but is not reachable"
-			bbnote "       Check the BSP description for incorrect branch selection, or other errors."
-			exit 1
+			bberror "SRCREV ${machine_srcrev} was specified, but is not reachable"
+			bbfatal "Check the BSP description for incorrect branch selection, or other errors."
 		fi
 	fi
 }
@@ -183,9 +179,8 @@ do_kernel_checkout() {
 
 	        cd ${S}
 		if [ ! -f "Makefile" ]; then
-			echo "[ERROR]: S is not set to the linux source directory. Check "
-			echo "         the recipe and set S to the proper extracted subdirectory"
-			exit 1
+			bberror "S is not set to the linux source directory. Check "
+			bbfatal "the recipe and set S to the proper extracted subdirectory"
 		fi
 		git init
 		git add .
@@ -207,10 +202,9 @@ do_kernel_checkout() {
 	if [ -n "${KMETA}" ]; then
 		git show-ref --quiet --verify -- "refs/heads/${KMETA}"
 		if [ $? -eq 1 ]; then
-			echo "ERROR. The branch '${KMETA}' is required and was not"
-			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
-			echo "kernel repository"
-			exit 1
+			bberror "The branch '${KMETA}' is required and was not found"
+			bberror "Ensure that the SRC_URI points to a valid linux-yocto"
+			bbfatal "kernel repository"
 		fi
 	fi
 	
@@ -231,7 +225,7 @@ addtask kernel_checkout before do_patch after do_unpack
 
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
-	echo "[INFO] doing kernel configme"
+	bbnote "kernel configme"
 	export KMETA=${KMETA}
 
 	if [ -n "${KCONFIG_MODE}" ]; then
@@ -248,8 +242,7 @@ do_kernel_configme() {
 	PATH=${PATH}:${S}/scripts/util
 	configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
-		exit 1
+		bbfatal "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 	
 	echo "# Global settings from linux recipe" >> ${B}/.config
@@ -295,19 +288,18 @@ do_validate_branches() {
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
 	if [ "${machine_srcrev}" = "AUTOINC" ]; then
-		bbnote "INFO: SRCREV validation is not required for AUTOREV or empty/invalid settings, returning"
+		bbnote "SRCREV validation is not required for AUTOREV"
 	elif [ "${machine_srcrev}" = "" ] && [ "${SRCREV}" != "AUTOINC" ]; then
 		# SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
 		# that doesn't use the SRCREV_FORMAT "machine_meta" is being built. In
 		# this case, we need to reset to the give SRCREV before heading to patching
-		bbnote "INFO: custom recipe is being built, forcing SRCREV to ${SRCREV}"
+		bbnote "custom recipe is being built, forcing SRCREV to ${SRCREV}"
 		force_srcrev="${SRCREV}"
 	else
 		git cat-file -t ${machine_srcrev} > /dev/null
 		if [ if $? -ne 0 ]; then
-			echo "ERROR ${machine_srcrev} is not a valid commit ID."
-			echo "The kernel source tree may be out of sync"
-			exit 1
+			bberror "${machine_srcrev} is not a valid commit ID."
+			bbfatal "The kernel source tree may be out of sync"
 		fi
 		force_srcrev=${machine_srcrev}
 	fi
@@ -315,23 +307,21 @@ do_validate_branches() {
 	## KMETA branch validation.
 	target_meta_head="${SRCREV_meta}"
 	if [ "${target_meta_head}" = "AUTOINC" ] || [ "${target_meta_head}" = "" ]; then
-		bbnote "INFO: SRCREV validation skipped for AUTOREV or empty meta branch"
+		bbnote "SRCREV validation skipped for AUTOREV or empty meta branch"
 	else
 	 	meta_head=`git show-ref -s --heads ${KMETA}`
 
 		git cat-file -t ${target_meta_head} > /dev/null
 		if [ $? -ne 0 ]; then
-			echo "ERROR ${target_meta_head} is not a valid commit ID"
-			echo "The kernel source tree may be out of sync"
-			exit 1
+			bberror "${target_meta_head} is not a valid commit ID"
+			bbfatal "The kernel source tree may be out of sync"
 		fi
 		if [ "$meta_head" != "$target_meta_head" ]; then
-			echo "[INFO] Setting branch ${KMETA} to ${target_meta_head}"
+			bbnote "Setting branch ${KMETA} to ${target_meta_head}"
 			git branch -m ${KMETA} ${KMETA}-orig
 			git checkout -q -b ${KMETA} ${target_meta_head}
 			if [ $? -ne 0 ];then
-				echo "ERROR: could not checkout ${KMETA} branch from known hash ${target_meta_head}"
-				exit 1
+				bbfatal "Could not checkout ${KMETA} branch from known hash ${target_meta_head}"
 			fi
 		fi
 	fi
-- 
1.8.1.2


