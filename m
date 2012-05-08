Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRlr7-0001Mp-B0
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:57:44 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-l1.corp.ad.wrs.com [128.224.145.171])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48ElenN017426;
	Tue, 8 May 2012 07:47:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 10:47:36 -0400
Message-Id: <8cd5713c092f20bcffa4ea11c799a5a147772959.1336487836.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336487836.git.bruce.ashfield@windriver.com>
References: <cover.1336487836.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1336487836.git.bruce.ashfield@windriver.com>
References: <cover.1336487836.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto: streamline support for multiple upstream repo types
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
X-List-Received-Date: Tue, 08 May 2012 14:58:08 -0000

In order to support repositories of various types (with or without
meta data, branched, pristine, custom, etc) information about the
type of processing that is required was passed to the processing
phases via variables.

The combination of variables involved in coordinating the processing
creates a learning curve and overly complicates recipe extensions.

With minor tweaks to the kern-tools, adding flexibility and keying
off the existence of the meta branch it is possible to remove all
of the variables that were added to support different repository
types.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |  115 ++++++++++----------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +
 meta/recipes-kernel/linux/linux-yocto.inc          |    7 +-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |    2 +
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   23 +++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +
 8 files changed, 86 insertions(+), 68 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c995a2e..c6425b2 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -45,9 +45,6 @@ def find_urls(d):
 
 do_patch() {
 	cd ${S}
-	if [ -f ${WORKDIR}/defconfig ]; then
-	    defconfig=${WORKDIR}/defconfig
-	fi
 
 	# if kernel tools are available in-tree, they are preferred
 	# and are placed on the path before any external tools. Unless
@@ -59,16 +56,13 @@ do_patch() {
 	fi
 
 	kbranch=${KBRANCH}
-	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
-           # switch from a generic to a specific branch
-           kbranch=${YOCTO_KERNEL_EXTERNAL_BRANCH}
-	fi
 
-	# simply ensures that a branch of the right name has been created
-	if [ -n "${YOCTO_KERNEL_META_DATA}" ]; then
+	# if we have a defined/set meta branch we should not be generating
+	# any meta data. The passed branch has what we need.
+	if [ -n "${KMETA}" ]; then
 		createme_flags="--disable-meta-gen"
 	fi
-	createme ${createme_flags} ${ARCH} ${kbranch} ${defconfig}
+	createme ${createme_flags} ${ARCH} ${kbranch}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not create ${kbranch}"
 		exit 1
@@ -95,7 +89,7 @@ do_patch() {
 	fi
 
 	# executes and modifies the source tree as required
-	patchme ${kbranch}
+	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not modify ${kbranch}"
 		exit 1
@@ -122,7 +116,7 @@ do_kernel_checkout() {
 		mv ${WORKDIR}/git/.git ${S}
 		rm -rf ${WORKDIR}/git/
 		cd ${S}
-		if [ -n "${YOCTO_KERNEL_META_DATA}" ] && [ -n "${KMETA}" ]; then
+		if [ -n "${KMETA}" ]; then
 			git branch -a | grep -q ${KMETA}
 			if [ $? -ne 0 ]; then
 				echo "ERROR. The branch '${KMETA}' is required and was not"
@@ -131,15 +125,6 @@ do_kernel_checkout() {
 				exit 1
 			fi
 		fi
-	 	if [ -z "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ] && [ -n "${KBRANCH}" ] ; then
-			git branch -a | grep -q ${KBRANCH}
-			if [ $? -ne 0 ]; then
-				echo "ERROR. The branch '${KBRANCH}' is required and was not"
-				echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
-				echo "kernel repository"
-				exit 1
-			fi
-		fi
 	fi
 	if [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
 		# we build out of {S}, so ensure that ${S} is clean and present
@@ -192,7 +177,7 @@ do_kernel_configme() {
 
 	cd ${S}
 	PATH=${PATH}:${S}/scripts/util
-	configme ${configmeflags} --reconfig --output ${B} ${KBRANCH} ${KMACHINE}
+	configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 		exit 1
@@ -221,51 +206,71 @@ python do_kernel_configcheck() {
 do_validate_branches() {
 	cd ${S}
 
-	# nothing to do if bootstrapping
- 	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
- 	 	return
- 	fi
-
-	# nothing to do if SRCREV is AUTOREV
+	set +e
+	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
+	# check and we can exit early
 	if [ "${SRCREV_machine}" = "AUTOINC" ]; then
-		# restore the branch for builds
-		git checkout -f ${KBRANCH}
+		return
+	fi
+
+	# if the branches do not exist, then there's nothing to check either
+	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	if [ $? -eq 1 ]; then
 		return
 	fi
 
  	branch_head=`git show-ref -s --heads ${KBRANCH}`
- 	meta_head=`git show-ref -s --heads ${KMETA}`
- 	target_branch_head="${SRCREV_machine}"
- 	target_meta_head="${SRCREV_meta}"
+	if [ -z "${SRCREV_machine}" ]; then
+		target_branch_head="${SRCREV}"
+	else
+	 	target_branch_head="${SRCREV_machine}"
+	fi
+
+	if [ "${target_branch_head}" = "AUTOINC" ]; then
+		return
+	fi
 
+	# We have SRCREVs and we have branches so validation can continue!
 	current=`git branch |grep \*|sed 's/^\* //'`
-	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ]; then
-		if [ -n "${KERNEL_REVISION_CHECKING}" ]; then
-			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-				echo "ERROR ${target_branch_head} is not a valid commit ID."
-				echo "The kernel source tree may be out of sync"
-				exit 1
-			else
-				echo "Forcing branch $current to ${target_branch_head}"
-				git branch -m $current $current-orig
-				git checkout -b $current ${target_branch_head}
-			fi
+	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ] &&
+           [ "$target_branch_head" != "AUTOINC" ]; then
+		ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
+		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+			echo "ERROR ${target_branch_head} is not a valid commit ID."
+			echo "The kernel source tree may be out of sync"
+			exit 1
+		else
+			echo "Forcing branch $current to ${target_branch_head}"
+			git branch -m $current $current-orig
+			git checkout -b $current ${target_branch_head}
 		fi
 	fi
 
+ 	meta_head=`git show-ref -s --heads ${KMETA}`
+ 	target_meta_head="${SRCREV_meta}"
+	git show-ref --quiet --verify -- "refs/heads/${KMETA}"
+	if [ $? -eq 1 ]; then
+		return
+	fi
+
+	if [ "${target_meta_head}" = "AUTOINC" ]; then
+		return
+	fi
+
 	if [ "$meta_head" != "$target_meta_head" ]; then
-		if [ -n "${KERNEL_REVISION_CHECKING}" ]; then
-			ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
-			if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
-				echo "ERROR ${target_meta_head} is not a valid commit ID"
-				echo "The kernel source tree may be out of sync"
+		ref=`git show ${target_meta_head} 2>&1 | head -n1 || true`
+		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
+			echo "ERROR ${target_meta_head} is not a valid commit ID"
+			echo "The kernel source tree may be out of sync"
+			exit 1
+		else
+			echo "Forcing branch meta to ${target_meta_head}"
+			git branch -m ${KMETA} ${KMETA}-orig
+			git checkout -b ${KMETA} ${target_meta_head}
+			if [ $? -ne 0 ];then
+				echo "ERROR: could not checkout meta branch from known hash ${target_meta_head}"
 				exit 1
-			else
-				echo "Forcing branch meta to ${target_meta_head}"
-				git branch -m ${KMETA} ${KMETA}-orig
-				git checkout -b ${KMETA} ${target_meta_head}
-			fi	   
+			fi
 		fi
 	fi
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 754ebe5..1af22f6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "2bbbaaa00cc70887d6d6f745b9425890d522d240"
+SRCREV = "369e67046a1b72b6447c208babd4d2065265a95e"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 36dcb6e..14af91d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -13,6 +13,7 @@ KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
 LINUX_VERSION ?= "3.0.24"
 LINUX_KERNEL_TYPE = "preempt-rt"
+KMETA = "meta"
 
 SRCREV_machine ?= "cf280f1dc5877d4ca43d21307222326efa68bb27"
 SRCREV_machine_qemuppc ?= "afaa5baa6a9ca9c8a03a9a3eee2ba9fba089f416"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 7e01efb..8ec366c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -14,6 +14,8 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.2.11"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
+KMETA = "meta"
+
 SRCREV_machine ?= "3ebf4d172cf4a41d2abf09e4036f0850e08064e7"
 SRCREV_machine_qemuppc ?= "7cebfe717987f4ffa9ae90558c28f45049847c1c"
 SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 2b61b7e..0912bee 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -9,15 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 # and it can be specific to the machine or shared
 # KMACHINE = "UNDEFINED"
 
-# Set this to 'preempt_rt' in the local.conf if you want a real time kernel
 LINUX_KERNEL_TYPE ?= "standard"
 
-KMETA ?= "meta"
+# KMETA ?= ""
+KBRANCH ?= "master"
+KMACHINE ?= "${MACHINE}"
 SRCREV_FORMAT ?= "meta_machine" 
 
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
-KERNEL_REVISION_CHECKING ?= "t"
-YOCTO_KERNEL_META_DATA ?= "t"
 
 do_patch[depends] = "kern-tools-native:do_populate_sysroot"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index d3da75c..3968c62 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -10,6 +10,8 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = "${KMACHINE}"
 
+KMETA = "meta"
+
 LINUX_VERSION ?= "2.6.37"
 
 SRCREV_machine_qemuarm = "b3e53a090eaa23aa82e64fa0a563a93a2b4dbb5d"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 074b1ed..82a7224 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -1,14 +1,21 @@
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
-KMACHINE = "yocto/standard/base"
-KMACHINE_qemux86  = "yocto/standard/common-pc/base"
-KMACHINE_qemux86-64  = "yocto/standard/common-pc-64/base"
-KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
-KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
-KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
-
-KBRANCH = "${KMACHINE}"
+KBRANCH = "yocto/standard/base"
+KBRANCH_qemux86  = "yocto/standard/common-pc/base"
+KBRANCH_qemux86-64  = "yocto/standard/common-pc-64/base"
+KBRANCH_qemuppc  = "yocto/standard/qemu-ppc32"
+KBRANCH_qemumips = "yocto/standard/mti-malta32-be"
+KBRANCH_qemuarm  = "yocto/standard/arm-versatile-926ejs"
+
+# Temporary until 3.0 kernel tree is updated with machine mappings
+KMACHINE_qemux86 = "common-pc"
+KMACHINE_qemux86-64 = "common-pc-64"
+KMACHINE_qemuppc = "qemu-ppc32"
+KMACHINE_qemumips = "mti-malta32-be"
+KMACHINE_qemuarm = "arm-versatile-926ejs"
+
+KMETA = "meta"
 
 LINUX_VERSION ?= "3.0.24"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 51119bb..71290bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -28,6 +28,8 @@ SRCREV_meta ?= "6b3d4e09aa2531e9649f3f03827b7efbccfcec03"
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
+KMETA = "meta"
+
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
-- 
1.7.5.4



