Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SIngI-00064O-7A
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 23:05:23 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3DKtrxG012756;
	Fri, 13 Apr 2012 13:55:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 13 Apr 2012 16:55:44 -0400
Message-Id: <b2abd61f60f96db631b05e15916cd83aae7c1792.1334349764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334349764.git.bruce.ashfield@windriver.com>
References: <cover.1334349764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334349764.git.bruce.ashfield@windriver.com>
References: <cover.1334349764.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto: allow .cfg, .scc, .patch and defconfigs to be processed in order
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
X-List-Received-Date: Fri, 13 Apr 2012 21:05:23 -0000

During testing/extension of the linux-yocto-tiny kernel it was found that
defconfigs were not always properly applied. This was due to two issues:

  - not being able to fully control the order of objects applied to the
    git tree on the SRC_URI
  - defconfigs triggering --allnoconfig before being applied

To fix this, the recipe space code that previously detected and generated
automatic features moves back to the kernel tools (where it was before) and
is updated to also process .cfg and defconfigs. Moving this back to the
tools allow other recipes to automatically benefit from the additional
support.

The second issue is addressed by allowing configme to take --alldefconfig
when a recipe wishes to pass a defconfig and override the default
behaviour.

Fixes [YOCTO: 2250]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   74 ++------------------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 8 insertions(+), 68 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index b7e8b32..0caf6a6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -20,7 +20,9 @@ def find_sccs(d):
 	sources_list=[]
 	for s in sources:
 		base, ext = os.path.splitext(os.path.basename(s))
-		if ext and ext in ('.scc'):
+		if ext and ext in ('.scc' '.cfg' '.patch'):
+			sources_list.append(s)
+		elif base and base in 'defconfig':
 			sources_list.append(s)
 
 	return sources_list
@@ -73,72 +75,9 @@ do_patch() {
 	fi
 
 	sccs="${@" ".join(find_sccs(d))}"
-	patches_and_dirs="${@" ".join(find_urls(d))}"
-
-	# This loops through all patches, and looks for directories that do
-	# not already have feature descriptions. If a directory doesn't have
-	# a feature description, we switch to the ${WORKDIR} variant of the
-	# feature (so we can write to it) and generate a feature for those
-	# patches. The generated feature will respect the patch order.
-	#
-	# By leaving source patch directories that already have .scc files
-	# as-is it means that a SRC_URI can only contain a .scc file, and all
-	# patches that the .scc references will be picked up, without having
-	# to be repeated on the SRC_URI line .. which is more intutive
-	set +e
-	patch_dirs=
-	for pp in ${patches_and_dirs}; do
-	        p=`echo $pp | cut -f1 -d:`
-		wp=`echo $pp | cut -f2 -d:`
-		pdir=`dirname ${p}`
-		pname=`basename ${p}`
-		scc=`find ${pdir} -maxdepth 1 -name '*.scc'`
-		if [ -z "${scc}" ]; then
-			# there is no scc file. We need to switch to someplace that we know
-		        # we can create content (the workdir)
-			workdir_subdir=`dirname ${wp}`
-			suggested_dir="${WORKDIR}/${workdir_subdir}"
-			echo ${gen_feature_dirs} | grep -q ${suggested_dir}
-			if [ $? -ne 0 ]; then
-				gen_feature_dirs="${gen_feature_dirs} ${suggested_dir}"
-			fi
-			# we call the file *.scc_tmp, so the test above will continue to find
-			# that patches from a common subdirectory don't have a scc file and 
-			# they'll be placed in order, into this file. We'll rename it later.
-			gen_feature_name="gen_`echo ${workdir_subdir} | sed 's%/%%g'`_desc.scc_tmp"
-			echo "patch ${pname}" >> ${WORKDIR}/${workdir_subdir}/${gen_feature_name}
-		else
-			suggested_dir="${pdir}"
-		fi
-		echo ${patch_dirs} | grep -q ${suggested_dir}
-		if [ $? -ne 0 ]; then
-			patch_dirs="${patch_dirs} ${suggested_dir}"
-		fi
-	done
-
-	# look for any found scc files, and ensure they are added to the list
-	# of directories passsed to updateme
-	for s in ${sccs}; do
-		sdir=`dirname ${s}`
-		echo ${patch_dirs} | grep -q ${sdir}
-		if [ $? -ne 0 ]; then
-			patch_dirs="${patch_dirs} ${sdir}"
-		fi
-	done
-
-	# go through the patch directories and look for any scc feature files
-	# that were constructed above. If one is found, rename it to ".scc" so
-	# the kernel patching can see it.
-	for pdir in ${patch_dirs}; do
-		scc=`find ${pdir} -maxdepth 1 -name '*.scc_tmp'`
-                if [ -n "${scc}" ]; then
-			new_scc=`echo ${scc} | sed 's/_tmp//'`
-			mv -f ${scc} ${new_scc}
-		fi
-	done
-
-	patch_dirs="${patch_dirs} ${WORKDIR}"
+	patches="${@" ".join(find_patches(d))}"
 
+	set +e
 	# add any explicitly referenced features onto the end of the feature
 	# list that is passed to the kernel build scripts.
 	if [ -n "${KERNEL_FEATURES}" ]; then
@@ -146,9 +85,10 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
+
 	# updates or generates the target description
 	updateme --branch ${kbranch} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
-                           ${addon_features} ${ARCH} ${KMACHINE} ${patch_dirs}
+                           ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index b28402a..d1c2ee4 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "91c2b184be90d6654996887203efdd7f1727a19a"
+SRCREV = "67bcedda582b2b191f26ec47dd1d4eac37f1305c"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



