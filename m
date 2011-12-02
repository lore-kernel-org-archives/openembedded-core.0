Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8t-0002b4-4m
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189782"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:47 -0800
Message-Id: <e4aed79d07c3df37ac6a8950a490ba9b812b4612.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/18] linux-yocto: prefer in-tree tools to external ones
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:49 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 04a2f88..ad14aac 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -6,6 +6,15 @@ do_patch() {
 	    defconfig=${WORKDIR}/defconfig
 	fi
 
+	# if kernel tools are available in-tree, they are preferred
+	# and are placed on the path before any external tools. Unless
+	# the external tools flag is set, in that case we do nothing.
+	if [ -f "${S}/scripts/util/configme" ]; then
+		if [ -z "${EXTERNAL_KERNEL_TOOLS}" ]; then
+			PATH=${S}/scripts/util:${PATH}
+		fi
+	fi
+
 	kbranch=${KBRANCH}
 	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
            # switch from a generic to a specific branch
@@ -100,6 +109,7 @@ do_kernel_configme() {
 	fi
 
 	cd ${S}
+	PATH=${PATH}:${S}/scripts/util
 	configme ${configmeflags} --reconfig --output ${B} ${KBRANCH} ${KMACHINE}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
@@ -116,7 +126,7 @@ python do_kernel_configcheck() {
     bb.plain("NOTE: validating kernel configuration")
 
     pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
-    cmd = bb.data.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
+    cmd = bb.data.expand("cd ${B}/..; ${S}/scripts/util/kconf_check -config- ${B} ${S} ${B} ${KBRANCH}",d )
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
-- 
1.7.6.4



