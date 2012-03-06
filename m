Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvm-0003cc-Ks
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714844"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:08 -0800
Message-Id: <8718a9bcf466bd74339c8b96ea3ef0f5d9c83a30.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/20] linux-yocto: respect FILESPATH directories
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:10 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
index aabca78..ce125b4 100644
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
1.7.7.6



