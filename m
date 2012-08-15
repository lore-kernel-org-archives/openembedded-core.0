Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T1k3M-0007pr-9d
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:18:56 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FK6sWe011691;
	Wed, 15 Aug 2012 13:06:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Aug 2012 16:06:22 -0400
Message-Id: <9078a41253493093a432343648aa8fa9b4efd70a.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/4] linux-yocto: explicitly export KMETA to scripts
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
X-List-Received-Date: Wed, 15 Aug 2012 20:18:57 -0000

The kern-tools scripts can support a meta branch and directory of a name that
isn't "meta", but they need the name passed through the environment variable
KMETA. ensuring that KMETA is exported in the shell environment sets the stage
to support flexible meta branch name.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    5 ++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 10a8d40..1b37dc7 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -45,6 +45,7 @@ def find_urls(d):
 
 do_patch() {
 	cd ${S}
+	export KMETA=${KMETA}
 
 	# if kernel tools are available in-tree, they are preferred
 	# and are placed on the path before any external tools. Unless
@@ -62,7 +63,7 @@ do_patch() {
 	if [ -n "${KMETA}" ]; then
 		createme_flags="--disable-meta-gen"
 	fi
-	createme ${createme_flags} ${ARCH} ${kbranch}
+	createme ${createme_flags} --meta ${KMETA} ${ARCH} ${kbranch}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not create ${kbranch}"
 		exit 1
@@ -180,6 +181,7 @@ addtask kernel_checkout before do_patch after do_unpack
 do_kernel_configme[dirs] = "${S} ${B}"
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
+	export KMETA=${KMETA}
 
 	if [ -n ${KCONFIG_MODE} ]; then
 		configmeflags=${KCONFIG_MODE}
@@ -220,6 +222,7 @@ python do_kernel_configcheck() {
 # are corrected to the proper commit.
 do_validate_branches() {
 	cd ${S}
+	export KMETA=${KMETA}
 
 	set +e
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 0cb111c..c176aed 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "12c39b76eca4ed993b5ffb38cbe89e0608b216c3"
+SRCREV = "579b1ba2169d053c1330854f54f605bb6929d6d8"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



