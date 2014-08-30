Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B61571233
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4ciZg013739
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:13 -0400
Message-ID: <6b253d83083cd36b5585799894fc50cbe0440f7e.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/18] kernel-yocto: allow custom non-meta, SRCREV format builds
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:44 -0000
Content-Type: text/plain

When custom respositories are built (like a pure kernel.org
repo), the machine_meta SRCREV format is not applicable. As
such, we shouldn't check for the meta branch and we shouldn't
only check SRCREV_machine based revisions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 42 ++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 69620f0a4275..4f912bff2fcd 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -72,6 +72,10 @@ do_patch() {
 
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	machine_srcrev="${SRCREV_machine}"
+	if [ -z "${machine_srcrev}" ]; then
+		# fallback to SRCREV if a non machine_meta tree is being built
+		machine_srcrev="${SRCREV}"
+	fi
 
 	# if we have a defined/set meta branch we should not be generating
 	# any meta data. The passed branch has what we need.
@@ -119,17 +123,6 @@ do_patch() {
 		exit 1
 	fi
 
-	# see if the branch we are about to patch has been properly reset to the defined
-	# SRCREV .. if not, we reset it.
-	branch_head=`git rev-parse HEAD`
-	if [ "${machine_srcrev}" != "AUTOINC" ]; then
-	 	if [ "${machine_srcrev}" != "${branch_head}" ]; then
-			current_branch=`git rev-parse --abbrev-ref HEAD`
-			git branch "$current_branch-orig"
-			git reset --hard ${machine_srcrev}
-		fi
-	fi
-
 	# executes and modifies the source tree as required
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
@@ -299,17 +292,16 @@ do_validate_branches() {
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	machine_srcrev="${SRCREV_machine}"
 
-	# if the machine branch doesn't exist, lets build master
-	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -eq 1 ]; then
-		machine_branch = "master"
-	fi
-
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
-	if [ "${machine_srcrev}" = "AUTOINC" ] || [ "${machine_srcrev}" = "INVALID" ] ||
-	   [ "${machine_srcrev}" = "" ]; then
+	if [ "${machine_srcrev}" = "AUTOINC" ]; then
 		bbnote "INFO: SRCREV validation is not required for AUTOREV or empty/invalid settings, returning"
+	elif [ "${machine_srcrev}" = "" ] && [ "${SRCREV}" != "AUTOINC" ]; then
+		# SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
+		# that doesn't use the SRCREV_FORMAT "machine_meta" is being built. In
+		# this case, we need to reset to the give SRCREV before heading to patching
+		bbnote "INFO: custom recipe is being built, forcing SRCREV to ${SRCREV}"
+		force_srcrev="${SRCREV}"
 	else
 		git cat-file -t ${machine_srcrev} > /dev/null
 		if [ if $? -ne 0 ]; then
@@ -317,10 +309,10 @@ do_validate_branches() {
 			echo "The kernel source tree may be out of sync"
 			exit 1
 		fi
+		force_srcrev=${machine_srcrev}
 	fi
 
 	## KMETA branch validation.
-	## We do validation if the meta branch exists, and AUTOREV hasn't been set
 	target_meta_head="${SRCREV_meta}"
 	if [ "${target_meta_head}" = "AUTOINC" ] || [ "${target_meta_head}" = "" ]; then
 		bbnote "INFO: SRCREV validation skipped for AUTOREV or empty meta branch"
@@ -345,6 +337,16 @@ do_validate_branches() {
 	fi
 
 	git checkout -q -f ${machine_branch}
+	if [ -n "${force_srcrev}" ]; then
+		# see if the branch we are about to patch has been properly reset to the defined
+		# SRCREV .. if not, we reset it.
+		branch_head=`git rev-parse HEAD`
+		if [ "${force_srcrev}" != "${branch_head}" ]; then
+			current_branch=`git rev-parse --abbrev-ref HEAD`
+			git branch "$current_branch-orig"
+			git reset --hard ${force_srcrev}
+		fi
+	fi
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
1.8.1.2


