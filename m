Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RitR1-0000qZ-Ja
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:57:12 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q05Jnf1Z029208;
	Thu, 5 Jan 2012 11:49:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  5 Jan 2012 14:49:28 -0500
Message-Id: <661d1503208af417ea9a46e5d2d8889c0b49bcc1.1325792752.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1325792752.git.bruce.ashfield@windriver.com>
References: <cover.1325792752.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1325792752.git.bruce.ashfield@windriver.com>
References: <cover.1325792752.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: use src_patches for out of tree kernel feature support
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
X-List-Received-Date: Thu, 05 Jan 2012 19:57:12 -0000

To support larger out of tree kernel features and enhanced patching schemes,
this changeset modifies the linux-yocto patching routines to call the
recently factored out 'src_patches' routine. Using the returned list of local
URIs for all valid patches, the logic can then determine whether or not
patches can be used in place, or need to be migrated and have re-usable
kernel features created. The results are then fed to the existing
infrastructure to be applied and commited to the tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   67 +++++++++++++++++++++++++++++++++++-
 1 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f78caaf..1b73e6e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,15 @@
 S = "${WORKDIR}/linux"
 
+
+def find_patches(d):
+	patches=src_patches(d)
+	patch_list=[]
+	for p in patches:
+	    _, _, local, _, _, _ = bb.decodeurl(p)
+ 	    patch_list.append(local)
+
+	return patch_list
+
 do_patch() {
 	cd ${S}
 	if [ -f ${WORKDIR}/defconfig ]; then
@@ -31,14 +41,67 @@ do_patch() {
 		exit 1
 	fi
 
-	# updates or generates the target description
+	patches="${@" ".join(find_patches(d))}"
+
+	# This loops through all patches, and looks for directories that do
+	# not already have feature descriptions. If a directory doesn't have
+	# a feature description, we switch to the ${WORKDIR} variant of the
+	# feature (so we can write to it) and generate a feature for those
+	# patches. The generated feature will respect the patch order.
+	#
+	# By leaving source patch directories that already have .scc files
+	# as-is it means that a SRC_URI can only contain a .scc file, and all
+	# patches that the .scc references will be picked up, without having
+	# to be repeated on the SRC_URI line .. which is more intutive
+	set +e
+	patch_dirs=
+	for p in ${patches}; do
+		pdir=`dirname ${p}`
+		pname=`basename ${p}`
+		scc=`find ${pdir} -maxdepth 1 -name '*.scc'`
+		if [ -z "${scc}" ]; then
+			# there is no scc file. We need to switch to someplace that we know
+		        # we can create content (the workdir)
+			workdir_subdir=`echo ${pdir} | sed "s%^.*/${PN}%%" | sed 's%^/%%'`
+			suggested_dir="${WORKDIR}/${workdir_subdir}"
+			echo ${gen_feature_dirs} | grep -q ${suggested_dir}
+			if [ $? -ne 0 ]; then
+				gen_feature_dirs="${gen_feature_dirs} ${suggested_dir}"
+			fi
+			# we call the file *.scc_tmp, so the test above will continue to find
+			# that patches from a common subdirectory don't have a scc file and 
+			# they'll be placed in order, into this file. We'll rename it later.
+			echo "patch ${pname}" >> ${suggested_dir}/gen_${workdir_subdir}_desc.scc_tmp
+		else
+			suggested_dir="${pdir}"
+		fi
+		echo ${patch_dirs} | grep -q ${suggested_dir}
+		if [ $? -ne 0 ]; then
+			patch_dirs="${patch_dirs} ${suggested_dir}"
+		fi
+	done
+
+	# go through the patch directories and look for any scc feature files
+	# that were constructed above. If one is found, rename it to ".scc" so
+	# the kernel patching can see it.
+	for pdir in ${patch_dirs}; do
+		scc=`find ${pdir} -maxdepth 1 -name '*.scc_tmp'`
+                if [ -n "${scc}" ]; then
+			new_scc=`echo ${scc} | sed 's/_tmp//'`
+			mv -f ${scc} ${new_scc}
+		fi
+	done
+
+	# add any explicitly referenced features onto the end of the feature
+	# list that is passed to the kernel build scripts.
 	if [ -n "${KERNEL_FEATURES}" ]; then
 		for feat in ${KERNEL_FEATURES}; do
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
+	# updates or generates the target description
 	updateme --branch ${kbranch} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
-                         ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
+                           ${addon_features} ${ARCH} ${KMACHINE} ${patch_dirs}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
-- 
1.7.4.1



