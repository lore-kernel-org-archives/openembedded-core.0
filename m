Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qlbvt-0000ue-AW
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:20:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2011 00:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="31467649"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 00:15:35 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	nitin.a.kamble@intel.com
Date: Mon, 25 Jul 2011 17:48:29 -0700
Message-Id: <a235513910996715e6f74ce78d6a0e4bf354329a.1311641177.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311641177.git.nitin.a.kamble@intel.com>
References: <cover.1311641177.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311641177.git.nitin.a.kamble@intel.com>
References: <cover.1311641177.git.nitin.a.kamble@intel.com>
Subject: [RFC x32 3/3] siteinfo: select right siteinfo as per x86_64 ABIs
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
X-List-Received-Date: Tue, 26 Jul 2011 07:20:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Setting ABIEXTENSION for various x86_abis, It changes TARGET_OS to abi
specific like "linux-gnux32" and TARGET to "x86_64-linux-gnux32"

Correspondingly changed siteinfo.bbclass to use new names of TARGET_OS &
TARGET, and use correct siteinfo for various ABIs of x86_64.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/siteinfo.bbclass                |   14 +++++++++++++-
 meta/conf/machine/include/ia32/arch-ia32.inc |    3 +++
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index c5308b3..854120f 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -42,12 +42,15 @@ def siteinfo_data(d):
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
         "viac3": "endian-little bit-32 ix86-common",
-        "x86_64": "endian-little bit-64",
+        "x86_64": "endian-little", # bitinfo specified in targetinfo
     }
     osinfo = {
         "darwin": "common-darwin",
         "darwin9": "common-darwin",
         "linux": "common-linux common-glibc",
+        "linux-gnu32": "common-linux common-glibc",
+        "linux-gnux32": "common-linux common-glibc",
+        "linux-gnu64": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
         "linux-uclibc": "common-linux common-uclibc",
@@ -64,6 +67,15 @@ def siteinfo_data(d):
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
         "powerpc-linux-gnuspe": "powerpc-linux",
         "powerpc-linux-uclibcspe": "powerpc-linux-uclibc",
+        "x86_64-cygwin": "bit-64",
+        "x86_64-darvin": "bit-64",
+        "x86_64-darvin9": "bit-64",
+        "x86_64-linux": "bit-64",
+        "x86_64-linux-uclibc": "bit-64",
+        "x86_64-linux-gnu32": "bit-32 ix86-common",
+        "x86_64-linux-gnux32": "bit-32 ix86-common",
+        "x86_64-linux-gnu64": "bit-64 x86_64-linux",
+        "x86_64-mingw32": "bit-64",
     }
 
     hostarch = d.getVar("HOST_ARCH", True)
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 45bf738..ad16332 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -10,12 +10,14 @@ TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "i586", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 
 # x32 ABI
 TUNEVALID[mx32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[mx32] = "m64 m32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x86_64", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
 TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
 TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
@@ -24,6 +26,7 @@ TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
 TUNECONFLICT[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "x86_64", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "64", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
 # Default Tune configurations
-- 
1.7.6



