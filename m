Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTn-0003GR-Af
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 May 2011 00:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="430915816"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 05 May 2011 00:57:32 -0700
Message-Id: <73317446c722abae9aeb70c4453fb7d6598e4b48.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 00:01:35 -0400
Date: Thu, 05 May 2011  0:57:32 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 24/26] linux-yocto: safely process unbranched repositories
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
X-List-Received-Date: Thu, 05 May 2011 08:00:13 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
1.7.1.1



