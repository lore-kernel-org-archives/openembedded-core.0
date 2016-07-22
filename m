Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C63376067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491754"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:08 +1200
Message-Id: <498995d19e9e8ec566d59c7d9692f3c2669dab3a.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] meta-extsdk-toolchain: add meta-recipe to install toolchain into eSDK
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:46 -0000

Add a meta-recipe to bring the toolchain into the extensible SDK. This
was modelled on meta-ide-support but some adjustments were needed to the
dependency validation function in sstate.bbclass to ensure that all of
the toolchain gets installed into the sysroot. With this, after
installing a minimal eSDK you only need to run the following after
sourcing the environment setup script to get the toolchain:

  devtool sdk-install meta-extsdk-toolchain

Addresses [YOCTO #9257].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass                     |  3 +++
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 13 +++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/meta/meta-extsdk-toolchain.bb

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d706d75..2496928 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -927,6 +927,9 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
             # Nothing need depend on libc-initial/gcc-cross-initial
             if "-initial" in taskdependees[task][0]:
                 continue
+            # For meta-extsdk-toolchain we want all sysroot dependencies
+            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
+                return False
             # Native/Cross populate_sysroot need their dependencies
             if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                 return False
diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
new file mode 100644
index 0000000..9bff220
--- /dev/null
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Extensible SDK toolchain meta-recipe"
+DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native"
+
+do_populate_sysroot[deptask] = "do_populate_sysroot"
+
+# NOTE: There is logic specific to this recipe in setscene_depvalid()
+# within sstate.bbclass, so if you copy or rename this and expect the same
+# functionality you'll need to modify that as well.
-- 
2.5.5


