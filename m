Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05xw-0007b0-U9
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312582"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:45 -0800
Message-Id: <2ce8c1a52068514d9021a30e30ed380fc22accb3.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 02/10] arch-ia32.inc: restructure TUNE_ARCH definition
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

So that multilib code can find out TUNE_ARCH for any tune.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index ced9dbe..aff3b88 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -4,13 +4,12 @@
 
 DEFAULTTUNE ?= "x86"
 TARGET_FPU ?= ""
-X86ARCH32 ?= "i586"
-X86ARCH64 ?= "x86_64"
 
 # ELF32 ABI
 TUNEVALID[x86-m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[x86-m32] = "x86-64-m64 x86-64-mx32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-m32", "${X86ARCH32}", "" ,d)}"
+TUNE_FEATURE_ARCH-x86-m32 = "i586"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-m32", "${TUNE_FEATURE_ARCH-x86-m32}", "" ,d)}"
 TUNE_FEATURE_CCARGS-x86-m32 ?= "-m32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "x86-m32", "${TUNE_FEATURE_CCARGS-x86-m32}", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "x86-m32", ":x86", "" ,d)}"
@@ -18,7 +17,8 @@ MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "x86-m32", ":x86", ""
 # x32 ABI
 TUNEVALID[x86-64-mx32] = "IA32e (x86_64) ELF32 standard ABI"
 TUNECONFLICTS[x86-64-mx32] = "x86-64-m64 x86-m32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-64-mx32", "${X86ARCH64}", "" ,d)}"
+TUNE_FEATURE_ARCH-x86-64-mx32 = "x86_64"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-64-mx32", "${TUNE_FEATURE_ARCH-x86-64-mx32}", "" ,d)}"
 ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "x86-64-mx32", "x32", "" ,d)}"
 TUNE_FEATURE_CCARGS-x86-64-mx32 ?= "-mx32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "x86-64-mx32", "${TUNE_FEATURE_CCARGS-x86-64-mx32}", "", d)}"
@@ -28,7 +28,8 @@ TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "x86-64-mx32", "-x32", "",
 # ELF64 ABI
 TUNEVALID[x86-64-m64] = "IA32e (x86_64) ELF64 standard ABI"
 TUNECONFLICT[x86-64-m64] = "x86-m32 x86-64-mx32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-64-m64", "${X86ARCH64}", "" ,d)}"
+TUNE_FEATURE_ARCH-x86-64-m64 = "x86_64"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "x86-64-m64", "${TUNE_FEATURE_ARCH-x86-64-m64}", "" ,d)}"
 TUNE_FEATURE_CCARGS-x86-64-m64 ?= "-m64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "x86-64-m64", "${TUNE_FEATURE_CCARGS-x86-64-m64}", "", d)}"
 
-- 
1.7.6.4



