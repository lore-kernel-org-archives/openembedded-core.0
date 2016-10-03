Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC4C719BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 23:33:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 03 Oct 2016 16:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="15927123"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2016 16:33:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 16:32:45 -0700
Message-Id: <20161003233245.100337-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161003233245.100337-1-stephano.cetola@linux.intel.com>
References: <20161003233245.100337-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V3] utils.bbclass: add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 23:33:48 -0000

If attempting to patch a git repo without a proper git config setup,
an error will occur saying user.name/user.email are needed by git
am/apply. After some code was removed from kernel-yocto, it was
simple enough to reproduce this error by creating a kernel patch and
using a container to build.

This patch abstracts out functionality that existed in buildhistory
for use in other classes. It also adds a call to this functionality
to the kernel-yocto class.

Fixes [YOCTO #10346]

introduced in OE-core revision
0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 15 ++++++---------
 meta/classes/kernel-yocto.bbclass |  3 +++
 meta/classes/utils.bbclass        | 10 ++++++++++
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6e5de0e..3a5bc2c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -57,6 +57,9 @@ SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
 # class.
 BUILDHISTORY_PRESERVE = "latest latest_srcrev"
 
+PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
+PATCH_GIT_USER_NAME ?= "OpenEmbedded"
+
 #
 # Write out metadata about this package for comparison when writing future packages
 #
@@ -708,15 +711,9 @@ END
 			git tag -f build-minus-2 build-minus-1 > /dev/null 2>&1 || true
 			git tag -f build-minus-1 > /dev/null 2>&1 || true
 		fi
-		# If the user hasn't set up their name/email, set some defaults
-		# just for this repo (otherwise the commit will fail with older
-		# versions of git)
-		if ! git config user.email > /dev/null ; then
-			git config --local user.email "buildhistory@${DISTRO}"
-		fi
-		if ! git config user.name > /dev/null ; then
-			git config --local user.name "buildhistory"
-		fi
+
+		check_git_config
+
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 53659f2..6160a29 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,7 @@
 # remove tasks that modify the source tree in case externalsrc is inherited
 SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
+PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
+PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
@@ -159,6 +161,7 @@ do_kernel_metadata() {
 do_patch() {
 	cd ${S}
 
+	check_git_config
 	meta_dir=$(kgit --meta)
 	(cd ${meta_dir}; ln -sf patch.queue series)
 	if [ -f "${meta_dir}/series" ]; then
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 800b565..dbb5e4c 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -419,3 +419,13 @@ def all_multilib_tune_list(vars, d):
         values[v].append(localdata.getVar(v, True))
         values['ml'].append(item)
     return values
+
+# If the user hasn't set up their name/email, set some defaults
+check_git_config() {
+	if ! git config user.email > /dev/null ; then
+		git config --local user.email "${PATCH_GIT_USER_EMAIL}"
+	fi
+	if ! git config user.name > /dev/null ; then
+		git config --local user.name "${PATCH_GIT_USER_NAME}"
+	fi
+}
-- 
2.10.0


