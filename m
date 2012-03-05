Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S4PFs-0007SM-14
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 05:10:36 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2541bne002549;
	Sun, 4 Mar 2012 20:01:38 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  4 Mar 2012 23:01:19 -0500
Message-Id: <1294ffe02698accc4f4b131ee0aaff01d2abd133.1330919584.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: respect FILESPATH directories
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
X-List-Received-Date: Mon, 05 Mar 2012 04:10:36 -0000

During the work to enhance the ability to specify out of tree kernel
features, an assumption was made about PN being part of a patch
path. This assumption is incorrect, since patches can be anywhere in
the valid FILESPATH.

To make locating the patches in WORKDIR simple, we can just query
patch.bbclass and return both the absolute directory of the patch
and the subdirectory as it was specified on the src_uri.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   30 ++++++++++++++++++++++++++----
 1 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 187e3cc..6bee84d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,6 +1,8 @@
 S = "${WORKDIR}/linux"
 
 
+# returns local (absolute) path names for all valid patches in the
+# src_uri
 def find_patches(d):
 	patches=src_patches(d)
 	patch_list=[]
@@ -10,6 +12,7 @@ def find_patches(d):
 
 	return patch_list
 
+# returns all the elements from the src uri that are .scc files
 def find_sccs(d):
 	sources=src_patches(d, True)
 	sources_list=[]
@@ -20,6 +23,22 @@ def find_sccs(d):
 
 	return sources_list
 
+# this is different from find_patches, in that it returns a colon separated
+# list of <patches>:<subdir> instead of just a list of patches
+def find_urls(d):
+	patches=src_patches(d)
+	fetch = bb.fetch2.Fetch([], d)
+	patch_list=[]
+	for p in patches:
+		_, _, local, _, _, _ = bb.decodeurl(p)
+		for url in fetch.urls:
+			urldata = fetch.ud[url]
+			if urldata.localpath == local:
+				patch_list.append(local+':'+urldata.path)
+
+        return patch_list
+
+
 do_patch() {
 	cd ${S}
 	if [ -f ${WORKDIR}/defconfig ]; then
@@ -51,8 +70,8 @@ do_patch() {
 		exit 1
 	fi
 
-	patches="${@" ".join(find_patches(d))}"
 	sccs="${@" ".join(find_sccs(d))}"
+	patches_and_dirs="${@" ".join(find_urls(d))}"
 
 	# This loops through all patches, and looks for directories that do
 	# not already have feature descriptions. If a directory doesn't have
@@ -66,14 +85,16 @@ do_patch() {
 	# to be repeated on the SRC_URI line .. which is more intutive
 	set +e
 	patch_dirs=
-	for p in ${patches}; do
+	for pp in ${patches_and_dirs}; do
+	        p=`echo $pp | cut -f1 -d:`
+		wp=`echo $pp | cut -f2 -d:`
 		pdir=`dirname ${p}`
 		pname=`basename ${p}`
 		scc=`find ${pdir} -maxdepth 1 -name '*.scc'`
 		if [ -z "${scc}" ]; then
 			# there is no scc file. We need to switch to someplace that we know
 		        # we can create content (the workdir)
-			workdir_subdir=`echo ${pdir} | sed "s%^.*/${PN}%%" | sed 's%^/%%'`
+			workdir_subdir=`dirname ${wp}`
 			suggested_dir="${WORKDIR}/${workdir_subdir}"
 			echo ${gen_feature_dirs} | grep -q ${suggested_dir}
 			if [ $? -ne 0 ]; then
@@ -82,7 +103,8 @@ do_patch() {
 			# we call the file *.scc_tmp, so the test above will continue to find
 			# that patches from a common subdirectory don't have a scc file and 
 			# they'll be placed in order, into this file. We'll rename it later.
-			echo "patch ${pname}" >> ${suggested_dir}/gen_${workdir_subdir}_desc.scc_tmp
+			gen_feature_name="gen_`echo ${workdir_subdir} | sed 's%/%%g'`_desc.scc_tmp"
+			echo "patch ${pname}" >> ${WORKDIR}/${workdir_subdir}/${gen_feature_name}
 		else
 			suggested_dir="${pdir}"
 		fi
-- 
1.7.4.1



