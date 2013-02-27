Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTt-0000T1-95
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56hYY000724
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:43 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:33 -0500
Message-ID: <3225d6dbd85ced1c5d711c49a12379ffb57e99e4.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] kernel-yocto: respect SRC_URI modified branch selection
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
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
Content-Type: text/plain

Although the setting of KBRANCH is the suggested/primary way to interact with
the yocto kern-tools and the fetcher, some users may be more comfortable
modifying the SRC_URI branch parameter directly.

If they do, the tools will not force their branch and build output will be
different then they expect, in non obvious ways.

It's easy enough to detect this scenario, but checking the SRC_URI in the
same way that the git fetcher checks for the branch (and SRCREV). If we take
the value from the SRC_URI and use it directly in the patch/validate/update
routines, we'll stay consistent with KBRANCH if it is used, and also
automatically adapt to a manually changed branch parameter on the SRC_URI.

For all other users, there are no visible or behavioural changes as a result
of this change

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   70 ++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8494c16..368f91e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -27,21 +27,6 @@ def find_sccs(d):
 
     return sources_list
 
-# this is different from find_patches, in that it returns a colon separated
-# list of <patches>:<subdir> instead of just a list of patches
-def find_urls(d):
-    patches=src_patches(d)
-    fetch = bb.fetch2.Fetch([], d)
-    patch_list=[]
-    for p in patches:
-        _, _, local, _, _, _ = bb.decodeurl(p)
-        for url in fetch.urls:
-            urldata = fetch.ud[url]
-            if urldata.localpath == local:
-                patch_list.append(local+':'+urldata.path)
-
-    return patch_list
-
 # check the SRC_URI for "kmeta" type'd git repositories. Return the name of
 # the repository as it will be found in WORKDIR
 def find_kernel_feature_dirs(d):
@@ -59,6 +44,18 @@ def find_kernel_feature_dirs(d):
 	    
     return feature_dirs
 
+# find the master/machine source branch. In the same way that the fetcher proceses
+# git repositories in the SRC_URI we take the first repo found, first branch.
+def get_machine_branch(d):
+    fetch = bb.fetch2.Fetch([], d)
+    for url in fetch.urls:
+        urldata = fetch.ud[url]
+        parm = urldata.parm
+        if "branch" in parm:
+            branches = urldata.parm.get("branch").split(',')
+            return branches[0]
+	    
+    return "master"
 
 do_patch() {
 	cd ${S}
@@ -73,7 +70,7 @@ do_patch() {
 		fi
 	fi
 
-	kbranch=${KBRANCH}
+	machine_branch="${@ get_machine_branch(d)}"
 
 	# if we have a defined/set meta branch we should not be generating
 	# any meta data. The passed branch has what we need.
@@ -81,9 +78,9 @@ do_patch() {
 		createme_flags="--disable-meta-gen --meta ${KMETA}"
 	fi
 
-	createme ${createme_flags} ${ARCH} ${kbranch}
+	createme ${createme_flags} ${ARCH} ${machine_branch}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not create ${kbranch}"
+		echo "ERROR. Could not create ${machine_branch}"
 		exit 1
 	fi
 
@@ -113,15 +110,15 @@ do_patch() {
 	    done
 	fi
 
-	if [ "${kbranch}" != "${KBRANCH_DEFAULT}" ]; then
-		updateme_flags="--branch ${kbranch}"
+	if [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ]; then
+		updateme_flags="--branch ${machine_branch}"
 	fi
 
 	# updates or generates the target description
 	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
                          ${includes} ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
-		echo "ERROR. Could not update ${kbranch}"
+		echo "ERROR. Could not update ${machine_branch}"
 		exit 1
 	fi
 
@@ -138,9 +135,9 @@ do_patch() {
 	# should thrown an error, since we aren't building what was expected
 	final_branch="$(git symbolic-ref HEAD 2>/dev/null)"
 	final_branch=${final_branch##refs/heads/}
-	if [ "${kbranch}" != "${KBRANCH_DEFAULT}" ] &&
-	   [ "${final_branch}" != "${kbranch}" ]; then
-		echo "ERROR: branch ${kbranch} was requested, but was not properly"
+	if [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ] &&
+	   [ "${final_branch}" != "${machine_branch}" ]; then
+		echo "ERROR: branch ${machine_branch} was requested, but was not properly"
 		echo "       configured to be built. The current branch is ${final_branch}"
 		exit 1
 	fi
@@ -192,6 +189,13 @@ do_kernel_checkout() {
 			exit 1
 		fi
 	fi
+	
+	machine_branch="${@ get_machine_branch(d)}"
+	if [ "${KBRANCH}" != "${machine_branch}" ]; then
+		echo "WARNING: The SRC_URI machine branch and KBRANCH are not the same."
+		echo "	       KBRANCH will be adjusted to match, but this typically is a"
+		echo "	       misconfiguration and should be checked."
+	fi
 
 	# convert any remote branches to local tracking ones
 	for i in `git branch -a | grep remotes | grep -v HEAD`; do
@@ -203,12 +207,12 @@ do_kernel_checkout() {
 	done
 
 	# Create a working tree copy of the kernel by checking out a branch
-	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 0 ]; then
 		# checkout and clobber any unimportant files
-		git checkout -f ${KBRANCH}
+		git checkout -f ${machine_branch}
 	else
-		echo "Not checking out ${KBRANCH}, it will be created later"
+		echo "Not checking out ${machine_branch}, it will be created later"
 		git checkout -f master
 	fi
 }
@@ -271,6 +275,8 @@ do_validate_branches() {
 	cd ${S}
 	export KMETA=${KMETA}
 
+	machine_branch="${@ get_machine_branch(d)}"
+
 	set +e
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
@@ -280,11 +286,11 @@ do_validate_branches() {
 
 	# If something other than the default branch was requested, it must
 	# exist in the tree, and it's a hard error if it wasn't
-	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 1 ]; then
 		if [ -n "${KBRANCH_DEFAULT}" ] && 
-                      [ "${KBRANCH}" != "${KBRANCH_DEFAULT}" ]; then
-			echo "ERROR: branch ${KBRANCH} was set for kernel compilation, "
+                      [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ]; then
+			echo "ERROR: branch ${machine_branch} was set for kernel compilation, "
 			echo "       but it does not exist in the kernel repository."
 			echo "       Check the value of KBRANCH and ensure that it describes"
 			echo "       a valid banch in the source kernel repository"
@@ -362,10 +368,10 @@ do_validate_branches() {
 		fi
 	fi
 
-	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 0 ]; then
 		# restore the branch for builds
-		git checkout -q -f ${KBRANCH}
+		git checkout -q -f ${machine_branch}
         else
 	        git checkout -q master
 	fi
-- 
1.7.10.4



