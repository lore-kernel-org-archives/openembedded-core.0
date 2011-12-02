Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8r-0002ay-Cj
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189777"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:43 -0800
Message-Id: <4cdc2f6d690b9f86d220c7e13a54475595c99aa6.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/18] kernel-yocto: support allnoconfig base configuration
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:42 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

When creating a minimal config or creating a hard baseline for
incremental changes, it is often desired to disable all kernel
options and then begin building and enabling only what is required.

To support this workflow, a new variable KCONFIG_MODE is introduced
to contain a hint to the kernel configuration about how the kernel
config should be produced. This variable is passed directly to lkc
when it is invoked during configuration, so the contents of the
variable must be a valid option for the kernel config build.

Additionally, when a defconfig is detected, allnoconfig is enabled
as the default operation, unless otherwise specified by KCONFIG_MODE.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d555fc0..04a2f88 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -44,7 +44,8 @@ do_patch() {
 }
 
 do_kernel_checkout() {
-	if [ -d ${WORKDIR}/git/.git/refs/remotes/origin ]; then
+	if [ -d $
+{WORKDIR}/git/.git/refs/remotes/origin ]; then
 		echo "Fixing up git directory for ${LINUX_KERNEL_TYPE}/${KMACHINE}"
 		rm -rf ${S}
 		mkdir ${S}
@@ -88,8 +89,18 @@ do_kernel_configme[dirs] = "${CCACHE_DIR} ${S} ${B}"
 do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 
+	if [ -n ${KCONFIG_MODE} ]; then
+		configmeflags=${KCONFIG_MODE}
+	else
+		# If a defconfig was passed, use =n as the baseline, which is achieved
+		# via --allnoconfig
+		if [ -f ${WORKDIR}/defconfig ]; then
+			configmeflags="--allnoconfig"
+		fi
+	fi
+
 	cd ${S}
-	configme --reconfig --output ${B} ${KBRANCH} ${KMACHINE}
+	configme ${configmeflags} --reconfig --output ${B} ${KBRANCH} ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 		exit 1
-- 
1.7.6.4



