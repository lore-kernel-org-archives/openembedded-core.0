Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EQ-0003hm-0c
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:22:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282306"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:50 -0800
Message-Id: <54fcab8c9778bcb4dea7c35e0f64af49a757cc29.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/19] tune-thumb.inc: Delete
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
X-List-Received-Date: Tue, 31 Jan 2012 04:24:47 -0000

From: Khem Raj <raj.khem@gmail.com>

The same functionality is provided by
machine/include/arm/feature-arm-thumb.inc
Setting ARM_INSTRUCTION_SET = "thumb"
in distro configs should be enough

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-thumb.inc |   32 ------------------------------
 1 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc

diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
deleted file mode 100644
index 214e3b6..0000000
--- a/meta/conf/machine/include/tune-thumb.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-#tune file for thumb instructions
-
-ARM_INSTRUCTION_SET ?= "arm"
-# "arm" "thumb"
-#    The instruction set the compiler should use when generating application
-#    code.  The kernel is always compiled with arm code at present.  arm code
-#    is the original 32 bit ARM instruction set, thumb code is the 16 bit
-#    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
-#    but requires more instructions (140% for 70% smaller code) so may be
-#    slower.
-
-THUMB_INTERWORK ?= "yes"
-# "yes" "no"
-#    Whether to compile with code to allow interworking between the two
-#    instruction sets.  This allows thumb code to be executed on a primarily
-#    arm system and vice versa.  It is strongly recommended that DISTROs not
-#    turn this off - the actual cost is very small.
-
-OVERRIDE_THUMB = "${@['', ':thumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-
-#
-TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -marm"
-
-- 
1.7.6.5



