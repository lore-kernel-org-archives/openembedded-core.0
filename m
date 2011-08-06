Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QpYRF-0001xe-HP
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:24:41 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p764K9SH002298;
	Fri, 5 Aug 2011 21:20:12 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Aug 2011 00:19:50 -0400
Message-Id: <f99f8833804549643aacc79e0292fd9857449b0b.1312604261.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/4] linux-yocto: allow configuration of arbitrary branches
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
X-List-Received-Date: Sat, 06 Aug 2011 04:24:42 -0000

When building an external tree or bootstrapping a BSP the
external branch may not have been checked out. The tools now ensure
that the tree is ready for configuration, so we no longer need to
force the checkout of the external branch.

This change is coupled with some kern tools tweaks as follows:

  40d9bab updateme: allow the location of board descriptions based on defines
  59859ca createme: use branch name when creating meta data
  91b4275 configme: determine meta branch based on directories, not branch naming
  f5a915c kgit-meta: make branch creation and renaming more robust

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   16 ++++------------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5e7003b..f31ff61 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -28,7 +28,8 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
-	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
+	updateme --branch ${kbranch} -DKDESC=${KMACHINE}:${LINUX_KERNEL_TYPE} \
+                         ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
@@ -86,17 +87,8 @@ addtask kernel_checkout before do_patch after do_unpack
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 
-	kbranch=${KBRANCH}
-	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
-           # switch from a generic to a specific branch
-           kbranch=${YOCTO_KERNEL_EXTERNAL_BRANCH}
-           cd ${S}
-           git checkout ${kbranch}
-	else
-	   cd ${S}
-	fi
-
-	configme --reconfig --output ${B} ${kbranch} ${MACHINE}
+	cd ${S}
+	configme --reconfig --output ${B} ${KBRANCH} ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 		exit 1
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 1fbb1f7..5659252 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "f5a915c277a37ba5949b4c0778356189e7dd9ec0"
+SRCREV = "40d9bab24bde4c2f94a0cece153663aa93e0f9a4"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



