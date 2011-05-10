Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVL-0001Xi-0d
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="640479337"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:26:23 -0700
Message-Id: <0ab8bb27ba18a5f3a7855a75e199385f5e2a9cbe.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Sat, 7 May 2011 00:08:30 -0400
Date: Mon, 09 May 2011 22:26:23 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 20/30] linux-yocto: error if meta data not present
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
X-List-Received-Date: Tue, 10 May 2011 05:29:10 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

There are valid reasons to build repositories without meta
data present and there are times when this is an error. This
change adds sanity tests to the build process to detect missing
meta data and throw an informative error message.

Sanity checking is only triggered from recipes (linux-yocto)
that always require meta data to be present. Other recipes
are not impacted and can auto-generate meta data as required.

Without this change the build process suceeds, but incorrect
meta data will be used (with no user knowledge), which is not
the desired behaviour.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    5 ++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_git.bb       |    4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ffc0b4c..818a07e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -13,7 +13,10 @@ do_patch() {
 	fi
 
 	# simply ensures that a branch of the right name has been created
-	createme ${ARCH} ${kbranch} ${defconfig}
+	if [ -n "${YOCTO_KERNEL_META_DATA}" ]; then
+		createme_flags="--disable-meta-gen"
+	fi
+	createme ${createme_flags} ${ARCH} ${kbranch} ${defconfig}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not create ${kbranch}"
 		exit 1
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 820765e..c808e17 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "c5896a60acc61f8966cfee3bb241ff564610cea4"
+SRCREV = "ab49d8e48b7e66d1b4f924385d65d062d25e44f7"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index d4f2ece..f54033d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -22,7 +22,7 @@ SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
 SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
 
-PR = "r17"
+PR = "r18"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
@@ -36,6 +36,8 @@ KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
+YOCTO_KERNEL_META_DATA=t
+
 # extra tasks
 addtask kernel_link_vmlinux after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
-- 
1.7.1.1



