Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C28775F17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:57:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 07:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,472,1432623600"; d="scan'208";a="728662448"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2015 07:57:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:56:55 +0100
Message-Id: <66c3e775c313b0c5e27601f7e8fe9f55cbc024f1.1436884357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] Use die() or bbfatal_log() where the log should definitely be printed
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
X-List-Received-Date: Tue, 14 Jul 2015 14:57:09 -0000

Change calls to bbfatal() to either die() or bbfatal_log() where we know
we want the full log to be printed by the UI (calling bberror or bbfatal
would otherwise suppress it since the change to connect these functions
through to the UI.) bbfatal() is still fine to use where there is enough
context information in the message such that the log isn't needed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/autotools.bbclass              |  4 ++--
 meta/classes/kernel-yocto.bbclass           | 16 ++++++++--------
 meta/classes/scons.bbclass                  |  4 ++--
 meta/recipes-extended/groff/groff_1.22.3.bb |  2 +-
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 454dcb6..6f51429 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -87,7 +87,7 @@ oe_runconf () {
 		if [ "$?" != "0" ]; then
 			echo "Configure failed. The contents of all config.log files follows to aid debugging"
 			find ${S} -ignore_readdir_race -name config.log -print -exec cat {} \;
-			bbfatal "oe_runconf failed"
+			die "oe_runconf failed"
 		fi
 		set -e
 	else
@@ -287,7 +287,7 @@ autotools_do_configure() {
 			intltoolize --copy --force --automake
 		fi
 		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
 		cd $olddir
 	fi
 	if [ -e ${S}/configure ]; then
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6fd025e..878b554 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -120,7 +120,7 @@ do_kernel_metadata() {
 
 	createme -v -v ${createme_flags} ${ARCH} ${machine_branch}
 	if [ $? -ne 0 ]; then
-		bbfatal "Could not create ${machine_branch}"
+		bbfatal_log "Could not create ${machine_branch}"
 	fi
 
 	sccs="$sccs ${@" ".join(find_sccs(d))}"
@@ -152,7 +152,7 @@ do_kernel_metadata() {
 	updateme ${updateme_flags} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
                          ${includes} ${addon_features} ${ARCH} ${KMACHINE} ${sccs} ${patches}
 	if [ $? -ne 0 ]; then
-		bbfatal "Could not update ${machine_branch}"
+		bbfatal_log "Could not update ${machine_branch}"
 	fi
 }
 
@@ -163,7 +163,7 @@ do_patch() {
 	patchme ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		bberror "Could not apply patches for ${KMACHINE}."
-		bbfatal "Patch failures can be resolved in the linux source directory ${S})"
+		bbfatal_log "Patch failures can be resolved in the linux source directory ${S})"
 	fi
 
 	# check to see if the specified SRCREV is reachable from the final branch.
@@ -243,7 +243,7 @@ do_kernel_checkout() {
 		if [ $? -eq 1 ]; then
 			bberror "The branch '${KMETA}' is required and was not found"
 			bberror "Ensure that the SRC_URI points to a valid linux-yocto"
-			bbfatal "kernel repository"
+			bbfatal_log "kernel repository"
 		fi
 	fi
 	
@@ -283,7 +283,7 @@ do_kernel_configme() {
 	PATH=${PATH}:${S}/scripts/util
 	configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
 	if [ $? -ne 0 ]; then
-		bbfatal "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
+		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 	
 	echo "# Global settings from linux recipe" >> ${B}/.config
@@ -362,7 +362,7 @@ do_validate_branches() {
 		git cat-file -t ${machine_srcrev} > /dev/null
 		if [ $? -ne 0 ]; then
 			bberror "${machine_srcrev} is not a valid commit ID."
-			bbfatal "The kernel source tree may be out of sync"
+			bbfatal_log "The kernel source tree may be out of sync"
 		fi
 		force_srcrev=${machine_srcrev}
 	fi
@@ -377,14 +377,14 @@ do_validate_branches() {
 		git cat-file -t ${target_meta_head} > /dev/null
 		if [ $? -ne 0 ]; then
 			bberror "${target_meta_head} is not a valid commit ID"
-			bbfatal "The kernel source tree may be out of sync"
+			bbfatal_log "The kernel source tree may be out of sync"
 		fi
 		if [ "$meta_head" != "$target_meta_head" ]; then
 			bbnote "Setting branch ${KMETA} to ${target_meta_head}"
 			git branch -m ${KMETA} ${KMETA}-orig
 			git checkout -q -b ${KMETA} ${target_meta_head}
 			if [ $? -ne 0 ];then
-				bbfatal "Could not checkout ${KMETA} branch from known hash ${target_meta_head}"
+				bbfatal_log "Could not checkout ${KMETA} branch from known hash ${target_meta_head}"
 			fi
 		fi
 	fi
diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index fc0f26b..b8de822 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -4,12 +4,12 @@ EXTRA_OESCONS ?= ""
 
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
-        bbfatal "scons build execution failed."
+        die "scons build execution failed."
 }
 
 scons_do_install() {
         ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} prefix=${D}${prefix} install ${EXTRA_OESCONS}|| \
-        bbfatal "scons install execution failed."
+        die "scons install execution failed."
 }
 
 EXPORT_FUNCTIONS do_compile do_install
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index e8cf524..4bffa81 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -41,7 +41,7 @@ do_configure_append() {
     # generate gnulib configure script
     olddir=`pwd`
     cd ${S}/src/libs/gnulib/
-    ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
+    ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
     cd ${olddir}
 }
 
-- 
2.1.0


