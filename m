Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8t-0002b8-AR
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189784"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:48 -0800
Message-Id: <9d28b96c9ae623bd913ed506c5ec7b1349d2dcea.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/18] kern-tools: use Makefile provided install rules
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

Previously the install of the kern-tools was manual and fully controlled by
whatever build system was integrating/using the utilities. To make this more
generic a Makefile is now provided to take care of installing and removing to
DESTDIR.

Updating the kern-tools recipe to take advantage of this new facility.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ef078ce..fb66211 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "364437739c45a5e771d1f7b3ac73c35f1328fd97"
-PR = r11
+SRCREV = "eb3ed64cea80d23ffb28dfeaeb02cdfe3fb29340"
+PR = r12
 PV = "0.1+git${SRCPV}"
 
 inherit native
@@ -13,19 +13,11 @@ inherit native
 SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;protocol=git"
 S = "${WORKDIR}"
 
-kern_tools_LIST = kgit kgit-init kgit-meta \
-                  kgit-checkpoint kgit-clean \
-                  generate_cfg kconf_check configme \
-		  createme updateme patchme get_defconfig scc \
-                  pre_config merge_config.sh
-
 do_compile() { 
 	:
 }
 
 do_install() {
-	install -d ${D}${bindir}
-	for s in ${kern_tools_LIST}; do
-	    install -m 0755 ${S}/git/tools/$s ${D}${bindir}
-	done
+	cd ${S}/git
+	make DESTDIR=${D}${bindir} install
 }
-- 
1.7.6.4



