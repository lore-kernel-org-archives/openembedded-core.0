Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZV-0001h1-56
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344515"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:11 -0700
Message-Id: <a079db25ba4520ce20ecfd725887a0800a09b889.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/20] kern-tools: add buildall and robustness fixes
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:26 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the kern-tools SRCREV to pickup the following functionality:

 - buildall: provides the ability to build all kernel branches
             without a build system, only a cross compiler and configme
             are required.

 - robustness/cleanups: obselete/unused code removal and general robustness
                        fixes from Paul Gortmaker and Bruce Ashfield

The following kern-tools commits are part of this series:

 b8dfd3d buildall: add whitelist/blacklist support
 0ef039c configme: catch errors found during fragment sanitization
 5b6498c buildall: remove all instances of it using/reading scc files
 2e57550 buildall: support semi seamless restarts
 4b5dd4d kconf_check: simplify cmdline args, dont store data per branch
 58fbb6e configme: relieve it of all knowledge of scc files
 a03e291 configme: strip out alternative meta series logic.
 96d2bcf kgit-init: check for valid branchpoint
 5598db6 buildall: allow a max cap on the number of builds done
 b46abec buildall: add support for randomizing build order
 68a04e9 buildall: dont copy failed build logs into main build dir
 5575d85 buildall: script to independently build all board kernels
 86d6200 configme: delete unused variable
 8d4e29d configme: delete unused KPROFILE setting
 7e15436 configme: ensure we have a valid machine type set
 152b9cb scc: remove depreciated/unused commands
 bb4e96a scc: allow includes within conditional statements
 7da7951 configme: derive path to tools from $0
 152dc45 configme: test for BUILD_DIR != ""
 129f7b0 kgit-scc: add warnings about bad input args.
 e977662 kgit-scc: add text for no arg and invalid arg case.

[YOCTO #843]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 2a3373c..48c8974 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -193,7 +193,7 @@ python do_kernel_configcheck() {
     bb.plain("NOTE: validating kernel configuration")
 
     pathprefix = "export PATH=%s:%s; " % (d.getVar('PATH', True), "${S}/scripts/util/")
-    cmd = d.expand("cd ${B}/..; kconf_check -config- ${B} ${S} ${B} ${KBRANCH}")
+    cmd = d.expand("cd ${S}; kconf_check -config- ${KMETA}/meta-series ${S} ${B}")
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
     bb.plain( "%s" % result )
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 2329ab9..f47262f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "4b1fef0a85db38bad6db7f14d44ea59713a64fdb"
+SRCREV = "b8dfd3d641400a8dfbf16868ee64f524508c80b7"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.7.6



