Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A53673694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:21:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6LFL9mF000793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jul 2015 08:21:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 21 Jul 2015 08:21:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jul 2015 11:21:04 -0400
Message-ID: <1f0181fdb0a8ec6c2eb2ed56af7bd0589a753563.1437491325.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1437491325.git.bruce.ashfield@windriver.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: split meta data from kernel repository
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
X-List-Received-Date: Tue, 21 Jul 2015 15:21:12 -0000
Content-Type: text/plain

The linux-yocto tree has always been a combined set of kernel changes
and configuration (meta) data carried in a single tree. While this
format is effective at keeping kernel configuration and source
modifications synchronized, it isn't always obvious to developers on
how to manipulate the meta data versus the source.

With this change, we remove the meta data processing from the
kernel-yocto class and use the external meta-data repository that
has always been used to seed the linux-yocto meta branch.

After this change, linux-yocto can no longer process combined trees,
and is simplified as a result.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  | 76 ++--------------------
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  5 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  7 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  7 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  7 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  7 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |  7 +-
 7 files changed, 28 insertions(+), 88 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 2f9a41f34d0f..231e08deba68 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -33,6 +33,7 @@ def find_kernel_feature_dirs(d):
     for url in fetch.urls:
         urldata = fetch.ud[url]
         parm = urldata.parm
+        type=""
         if "type" in parm:
             type = parm["type"]
         if "destsuffix" in parm:
@@ -112,17 +113,6 @@ do_kernel_metadata() {
 		fi
 	fi
 
-	# if we have a defined/set meta branch we should not be generating
-	# any meta data. The passed branch has what we need.
-	if [ -n "${KMETA}" ]; then
-		createme_flags="--disable-meta-gen --meta ${KMETA}"
-	fi
-
-	createme -v -v ${createme_flags} ${ARCH} ${machine_branch}
-	if [ $? -ne 0 ]; then
-		bbfatal_log "Could not create ${machine_branch}"
-	fi
-
 	sccs="$sccs ${@" ".join(find_sccs(d))}"
 	patches="${@" ".join(find_patches(d))}"
 	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
@@ -189,34 +179,18 @@ do_patch() {
 do_kernel_checkout() {
 	set +e
 
-	# A linux yocto SRC_URI should use the bareclone option. That
-	# ensures that all the branches are available in the WORKDIR version
-	# of the repository.
 	source_dir=`echo ${S} | sed 's%/$%%'`
 	source_workdir="${WORKDIR}/git"
-	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
-		# case2: the repository is a non-bare clone
-
+	if [ -d "${WORKDIR}/git/" ]; then
+		# case: git repository (bare or non-bare)
 		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
 		if [ "${source_dir}" != "${source_workdir}" ]; then
 			rm -rf ${S}
 			mv ${WORKDIR}/git ${S}
 		fi
 		cd ${S}
-	elif [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
-		# case2: the repository is a bare clone
-
-		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
-		if [ "${source_dir}" != "${source_workdir}" ]; then
-			rm -rf ${S}
-			mkdir -p ${S}/.git
-			mv ${WORKDIR}/git/* ${S}/.git
-			rm -rf ${WORKDIR}/git/
-		fi
-		cd ${S}	
-		git config core.bare false
 	else
-		# case 3: we have no git repository at all. 
+		# case: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
 		# convert the tree to a git repo and let the rest of the process work unchanged
 		
@@ -235,7 +209,6 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
-	# end debare
 
 	# convert any remote branches to local tracking ones
 	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
@@ -246,24 +219,8 @@ do_kernel_checkout() {
 		fi
 	done
 
-       	# If KMETA is defined, the branch must exist, but a machine branch
-	# can be missing since it may be created later by the tools.
-	if [ -n "${KMETA}" ]; then
-		git show-ref --quiet --verify -- "refs/heads/${KMETA}"
-		if [ $? -eq 1 ]; then
-			bberror "The branch '${KMETA}' is required and was not found"
-			bberror "Ensure that the SRC_URI points to a valid linux-yocto"
-			bbfatal_log "kernel repository"
-		fi
-	fi
-	
-
 	# Create a working tree copy of the kernel by checking out a branch
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -ne 0 ]; then
-		machine_branch="master"
-	fi
 
 	# checkout and clobber any unimportant files
 	git checkout -f ${machine_branch}
@@ -313,7 +270,7 @@ python do_kernel_configcheck() {
         kmeta = "." + kmeta
 
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
-    cmd = d.expand("cd ${S}; kconf_check -config- %s/meta-series ${S} ${B}" % kmeta)
+    cmd = d.expand("cd ${S}; kconf_check -config %s/meta-series ${S} ${B}" % kmeta)
     ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
@@ -351,7 +308,6 @@ python do_kernel_configcheck() {
 do_validate_branches() {
 	set +e
 	cd ${S}
-	export KMETA=${KMETA}
 
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	machine_srcrev="${SRCREV_machine}"
@@ -377,28 +333,6 @@ do_validate_branches() {
 		force_srcrev=${machine_srcrev}
 	fi
 
-	## KMETA branch validation.
-	target_meta_head="${SRCREV_meta}"
-	if [ "${target_meta_head}" = "AUTOINC" ] || [ "${target_meta_head}" = "" ]; then
-		bbnote "SRCREV validation skipped for AUTOREV or empty meta branch"
-	else
-	 	meta_head=`git show-ref -s --heads ${KMETA}`
-
-		git cat-file -t ${target_meta_head} > /dev/null
-		if [ $? -ne 0 ]; then
-			bberror "${target_meta_head} is not a valid commit ID"
-			bbfatal_log "The kernel source tree may be out of sync"
-		fi
-		if [ "$meta_head" != "$target_meta_head" ]; then
-			bbnote "Setting branch ${KMETA} to ${target_meta_head}"
-			git branch -m ${KMETA} ${KMETA}-orig
-			git checkout -q -b ${KMETA} ${target_meta_head}
-			if [ $? -ne 0 ];then
-				bbfatal_log "Could not checkout ${KMETA} branch from known hash ${target_meta_head}"
-			fi
-		fi
-	fi
-
 	git checkout -q -f ${machine_branch}
 	if [ -n "${force_srcrev}" ]; then
 		# see if the branch we are about to patch has been properly reset to the defined
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 588a89f6411b..0be30893acec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -23,9 +23,10 @@ python () {
 }
 
 KBRANCH = "standard/base"
-KMETA = "meta"
+KMETA = "kernel-meta"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 9bdbc49ffeb2..0bd94f0c600d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -5,15 +5,16 @@ require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
 SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
-SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
+SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "3.14.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-KMETA = "meta"
+KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index bd7b6da28c2c..f486d41efad9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -6,15 +6,16 @@ require recipes-kernel/linux/linux-yocto.inc
 
 LINUX_VERSION ?= "3.14.36"
 
-KMETA = "meta"
+KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
+SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 172d3b480009..c82da372681d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -6,15 +6,16 @@ require recipes-kernel/linux/linux-yocto.inc
 
 LINUX_VERSION ?= "3.19.5"
 
-KMETA = "meta"
+KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_meta ?= "a70b2eb273ef6349d344920474a494697474b98e"
+SRCREV_meta ?= "361c186effc0b0038dfbfd3fe71ecf3df5edb43d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.19;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 7f32c7a1b52c..9bbcecc76f33 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -19,15 +19,16 @@ SRCREV_machine_qemux86 ?= "48833301518748d82cbc2412fea3617eeee6d01b"
 SRCREV_machine_qemux86-64 ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
 SRCREV_machine_qemumips64 ?= "c910c6d8338ab7291f066edc06de83de5b645d8f"
 SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_meta ?= "94fa1d7e980c97fcd59b37daedcd863bd6daaee4"
+SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "3.14.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-KMETA = "meta"
+KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index cab06266f931..364f1f60ddcd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -19,15 +19,16 @@ SRCREV_machine_qemux86 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemux86-64 ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
 SRCREV_machine_qemumips64 ?= "3eb70cea3532e22ab1b6da9864446621229e6616"
 SRCREV_machine ?= "e152349de59b43b2a75f2c332b44171df461d5a0"
-SRCREV_meta ?= "a70b2eb273ef6349d344920474a494697474b98e"
+SRCREV_meta ?= "361c186effc0b0038dfbfd3fe71ecf3df5edb43d"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.19;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "3.19.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-KMETA = "meta"
+KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-- 
2.1.0


