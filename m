Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRl-0004lf-EN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTR000226;
	Fri, 1 Feb 2013 06:02:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:37 -0500
Message-Id: <1d58685a36881b27b5b36760e4f7f5fe74d31c79.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] kernel-yocto: allow multiple / shared kernel feature directories
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
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

To promote the reuse and sharing of configuration fragments this change
allows any kernel-yocto based recipe to have multiple alternate git repositories
which provide kernel feature directory trees listed on the SRC_URI.

These feature directories are in addition to any in-tree kernel meta data branches
that may be available (described via the KMETA variable in linux-yocto recipes).

Features found within these directories can be used from recipes via the
KERNEL_FEATURES variable. Features found within a feature directory are free
to include any other features that are available in any directories. In both
cases the path to a feature description (a .scc file) is relative to the
root of a given feature directory (which is how existing .scc files work)

The search order for features is determined by the order that repositories
appear on the SRC_URI.

Normal SRC_URI rules apply to any repository that is added as a kernel
feature container. A SRCREV must be supplied and it must be unpacked to
a unique directory, which is controlled via the "destsuffic" url parameter.

In addition to these standard requirements, any kernel feature repository
reference should identify itself via the "type=kmeta" url parameter. If
type=kmeta is not supplied, the repository will not be processed for
kernel features.

As an example, the following in a linux-yocto bbappend makes two additional
feature directories available to KERNEL_FEATURES and fragments.

 SRC_URI += "git://git.yoctoproject.org/yocto-kernel-cache;protocol=git;branch=master;type=kmeta;name=feat1;destsuffix=kernel-cache/"
 SRC_URI += "git://${KSRC_linux_yocto_3_4};protocol=file;branch=meta;name=feat2;type=kmeta;destsuffix=kernel-features-experimental/"

 SRCREV_feat1 = "${AUTOREV}"
 SRCREV_feat2 = "${AUTOREV}"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   33 +++++++++++++++++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 962b493..92ede6a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -42,6 +42,23 @@ def find_urls(d):
 
     return patch_list
 
+# check the SRC_URI for "kmeta" type'd git repositories. Return the name of
+# the repository as it will be found in WORKDIR
+def find_kernel_feature_dirs(d):
+    feature_dirs=[]
+    fetch = bb.fetch2.Fetch([], d)
+    for url in fetch.urls:
+        urldata = fetch.ud[url]
+        parm = urldata.parm
+        if "type" in parm:
+            type = parm["type"]
+        if "destsuffix" in parm:
+            destdir = parm["destsuffix"]
+            if type == "kmeta":
+                feature_dirs.append(destdir)
+	    
+    return feature_dirs
+
 
 do_patch() {
 	cd ${S}
@@ -72,6 +89,7 @@ do_patch() {
 
 	sccs="${@" ".join(find_sccs(d))}"
 	patches="${@" ".join(find_patches(d))}"
+	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
 
 	set +e
 	# add any explicitly referenced features onto the end of the feature
@@ -82,13 +100,26 @@ do_patch() {
 		done
 	fi
 
+	# check for feature directories/repos/branches that were part of the
+	# SRC_URI. If they were supplied, we convert them into include directives
+	# for the update part of the process
+	if [ -n "${feat_dirs}" ]; then
+	    for f in ${feat_dirs}; do
+		if [ -d "${WORKDIR}/$f/meta" ]; then
+		    includes="$includes -I${WORKDIR}/$f/meta"
+		elif [ -d "${WORKDIR}/$f" ]; then
+		    includes="$includes -I${WORKDIR}/$f"
+		fi
+	    done
+	fi
+
 	if [ "${kbranch}" != "${KBRANCH_DEFAULT}" ]; then
 		updateme_flags="--branch ${kbranch}"
 	fi
 
 	# updates or generates the target description
 	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
-                           ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
+                         ${includes} ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 635dfe6..98cd8b9 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "62c8807825ea923a18b1519375b0df67ad9daf2b"
+SRCREV = "9284af9b968d40e441b10f5c09961cbe329ccb9b"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



