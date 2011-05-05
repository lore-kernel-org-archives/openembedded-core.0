Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QHqaW-0008Pw-2i
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 06:54:56 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p454q5rK013993;
	Wed, 4 May 2011 21:52:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  5 May 2011 00:53:23 -0400
Message-Id: <86b90b0142aebf97b4d1fdaa2ac07463bee497ac.1304570401.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: safely process unbranched repositories
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
X-List-Received-Date: Thu, 05 May 2011 04:54:56 -0000

The BSP bootstrap and -dev use cases can be applied against
unbranched or repos without meta data. To allow the proper
and safe processing of those repositories, slight modifications
to the tools are required to pass the branch on the command
line (rather than detecting it always) and to only checkout
branches that exist.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    7 +++++--
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 78a1309..ffc0b4c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -25,7 +25,7 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
-	updateme ${addon_features} ${ARCH} ${MACHINE} ${WORKDIR}
+	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${MACHINE} ${WORKDIR}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
@@ -87,9 +87,12 @@ do_kernel_configme() {
 	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
            # switch from a generic to a specific branch
            kbranch=${YOCTO_KERNEL_EXTERNAL_BRANCH}
+           cd ${S}
+           git checkout ${kbranch}
+	else
+	   cd ${S}
 	fi
 
-	cd ${S}
 	configme --reconfig --output ${B} ${kbranch} ${MACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index cc71179..820765e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "92b965b02e3ac32badde3ee71a1e7d3a85cedeb8"
+SRCREV = "c5896a60acc61f8966cfee3bb241ff564610cea4"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.0.4



