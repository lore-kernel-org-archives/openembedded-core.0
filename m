Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EP-0003hm-BO
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:22:09 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282304"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:49 -0800
Message-Id: <79a999f69d58ca98393991d18d0efd274932ff56.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/19] tunearch/arm: Differentiate between thumb code generation and thumb capability
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
X-List-Received-Date: Tue, 31 Jan 2012 04:24:38 -0000

From: Khem Raj <raj.khem@gmail.com>

We have diverged a bit from oe.dev where thumb in OVERRIDES meant
the code was being compiled in thumb mode. With tunearch this got
a different meaning where it meant that if a core is capable of
generating thumb code them we will have this in overrides. With this
patch I am trying to address the problem where 'thumbmode' in TUNE_FEATURES
means that code will be compiled in thumb mode by default and
'thumb' is to denote that core is capable of thumb instruction set.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index da29102..cb6f4e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -4,10 +4,20 @@
 # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
-TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"
-OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
+
+# 'thumbmode' in TUNE_FEATURES means default ISA for code generation is thumb
+# 'thumb' in TUNE_FEATURES means the core supports thumb ISA but code
+# generation can happen in arm or thumb
+# having 'thumbmode' would imply 'thumb' naturally
+
+TUNEVALID[thumbmode] = "Use THUMB instruction set instead of ARM"
+ARM_INSTRUCTION_SET ?= "arm"
+AVAILTUNES += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "thumbmode", "", d)}"
+TUNE_FEATURES_tune-thumbmode += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "thumbmode", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "-mthumb", "-marm", d)}"
+OVERRIDES .= "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", ":thumb", "", d)}"
+
+TUNEVALID[thumb] = "THUMB instruction set capable ARM core"
 
 # Note armv7 will hit on armv7a as well
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
-- 
1.7.6.5



