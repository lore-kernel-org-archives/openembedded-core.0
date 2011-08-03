Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QojjZ-0004Tu-5A
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912928"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:52 -0700
Message-Id: <20c6953ff98540fa573538d3785433d781d27aac.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 08/33] binutils: Add support for powerpc e5500 core
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:13 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Add powerpc e5500 core support to binutils so its recognized by
assember, etc.  The e5500 is a 64-bit core from Freescale utilized in
the P5020 SoC.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../binutils/binutils/binutils-powerpc-e5500.patch |  112 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
 2 files changed, 114 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch

diff --git a/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch b/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
new file mode 100644
index 0000000..1de164d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
@@ -0,0 +1,112 @@
+Upstream-Status: Pending
+
+Add support for FSL PowerPC e5500 core.
+
+Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Index: binutils-2.21.1/bfd/archures.c
+===================================================================
+--- binutils-2.21.1.orig/bfd/archures.c
++++ binutils-2.21.1/bfd/archures.c
+@@ -231,6 +231,7 @@ DESCRIPTION
+ .#define bfd_mach_ppc_e500      500
+ .#define bfd_mach_ppc_e500mc    5001
+ .#define bfd_mach_ppc_e500mc64  5005
++.#define bfd_mach_ppc_e5500     5006
+ .#define bfd_mach_ppc_titan     83
+ .  bfd_arch_rs6000,    {* IBM RS/6000 *}
+ .#define bfd_mach_rs6k		6000
+Index: binutils-2.21.1/bfd/bfd-in2.h
+===================================================================
+--- binutils-2.21.1.orig/bfd/bfd-in2.h
++++ binutils-2.21.1/bfd/bfd-in2.h
+@@ -1918,6 +1918,7 @@ enum bfd_architecture
+ #define bfd_mach_ppc_e500      500
+ #define bfd_mach_ppc_e500mc    5001
+ #define bfd_mach_ppc_e500mc64  5005
++#define bfd_mach_ppc_e5500     5006
+ #define bfd_mach_ppc_titan     83
+   bfd_arch_rs6000,    /* IBM RS/6000 */
+ #define bfd_mach_rs6k          6000
+Index: binutils-2.21.1/bfd/cpu-powerpc.c
+===================================================================
+--- binutils-2.21.1.orig/bfd/cpu-powerpc.c
++++ binutils-2.21.1/bfd/cpu-powerpc.c
+@@ -352,6 +352,20 @@ const bfd_arch_info_type bfd_powerpc_arc
+     FALSE, /* not the default */
+     powerpc_compatible,
+     bfd_default_scan,
++    &bfd_powerpc_archs[19]
++  },
++  {
++    64, /* 64 bits in a word */
++    64, /* 64 bits in an address */
++    8,  /* 8 bits in a byte */
++    bfd_arch_powerpc,
++    bfd_mach_ppc_e5500,
++    "powerpc",
++    "powerpc:e5500",
++    3,
++    FALSE, /* not the default */
++    powerpc_compatible,
++    bfd_default_scan,
+     0
+   }
+ };
+Index: binutils-2.21.1/gas/config/tc-ppc.c
+===================================================================
+--- binutils-2.21.1.orig/gas/config/tc-ppc.c
++++ binutils-2.21.1/gas/config/tc-ppc.c
+@@ -1236,6 +1236,7 @@ PowerPC options:\n\
+ -me500, -me500x2        generate code for Motorola e500 core complex\n\
+ -me500mc,               generate code for Freescale e500mc core complex\n\
+ -me500mc64,             generate code for Freescale e500mc64 core complex\n\
++-me5500,                generate code for Freescale e5500 core complex\n\
+ -mspe                   generate code for Motorola SPE instructions\n\
+ -mtitan                 generate code for AppliedMicro Titan core complex\n\
+ -mregnames              Allow symbolic names for registers\n\
+Index: binutils-2.21.1/gas/doc/as.texinfo
+===================================================================
+--- binutils-2.21.1.orig/gas/doc/as.texinfo
++++ binutils-2.21.1/gas/doc/as.texinfo
+@@ -432,7 +432,7 @@ gcc(1), ld(1), and the Info entries for 
+    [@b{-a32}|@b{-a64}]
+    [@b{-mpwrx}|@b{-mpwr2}|@b{-mpwr}|@b{-m601}|@b{-mppc}|@b{-mppc32}|@b{-m603}|@b{-m604}|@b{-m403}|@b{-m405}|
+     @b{-m440}|@b{-m464}|@b{-m476}|@b{-m7400}|@b{-m7410}|@b{-m7450}|@b{-m7455}|@b{-m750cl}|@b{-mppc64}|
+-    @b{-m620}|@b{-me500}|@b{-e500x2}|@b{-me500mc}|@b{-me500mc64}|@b{-mppc64bridge}|@b{-mbooke}|
++    @b{-m620}|@b{-me500}|@b{-e500x2}|@b{-me500mc}|@b{-me500mc64}|@b{-me5500}|@b{-mppc64bridge}|@b{-mbooke}|
+     @b{-mpower4}|@b{-mpr4}|@b{-mpower5}|@b{-mpwr5}|@b{-mpwr5x}|@b{-mpower6}|@b{-mpwr6}|
+     @b{-mpower7}|@b{-mpw7}|@b{-ma2}|@b{-mcell}|@b{-mspe}|@b{-mtitan}|@b{-me300}|@b{-mcom}]
+    [@b{-many}] [@b{-maltivec}|@b{-mvsx}]
+Index: binutils-2.21.1/gas/doc/c-ppc.texi
+===================================================================
+--- binutils-2.21.1.orig/gas/doc/c-ppc.texi
++++ binutils-2.21.1/gas/doc/c-ppc.texi
+@@ -85,6 +85,9 @@ Generate code for Freescale e500mc core 
+ @item -me500mc64
+ Generate code for Freescale e500mc64 core complex.
+ 
++@item -me5500
++Generate code for Freescale e5500 core complex.
++
+ @item -mspe
+ Generate code for Motorola SPE instructions.
+ 
+Index: binutils-2.21.1/opcodes/ppc-dis.c
+===================================================================
+--- binutils-2.21.1.orig/opcodes/ppc-dis.c
++++ binutils-2.21.1/opcodes/ppc-dis.c
+@@ -114,6 +114,12 @@ struct ppc_mopt ppc_opts[] = {
+ 		| PPC_OPCODE_E500MC | PPC_OPCODE_64 | PPC_OPCODE_POWER5
+ 		| PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7),
+     0 },
++  { "e5500",    (PPC_OPCODE_PPC | PPC_OPCODE_BOOKE | PPC_OPCODE_ISEL
++		| PPC_OPCODE_PMR | PPC_OPCODE_CACHELCK | PPC_OPCODE_RFMCI
++		| PPC_OPCODE_E500MC | PPC_OPCODE_64 | PPC_OPCODE_POWER4
++		| PPC_OPCODE_POWER5 | PPC_OPCODE_POWER6
++		| PPC_OPCODE_POWER7),
++    0 },
+   { "e500x2",  (PPC_OPCODE_PPC | PPC_OPCODE_BOOKE | PPC_OPCODE_SPE
+ 		| PPC_OPCODE_ISEL | PPC_OPCODE_EFS | PPC_OPCODE_BRLOCK
+ 		| PPC_OPCODE_PMR | PPC_OPCODE_CACHELCK | PPC_OPCODE_RFMCI
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
index 1f36117..96f9d5f 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -30,6 +30,7 @@ SRC_URI = "\
      file://binutils-poison.patch \
      file://libtool-rpath-fix.patch \
      file://clone-shadow.patch \
+     file://binutils-powerpc-e5500.patch \
      "
 
 SRC_URI[md5sum] = "a22801a9cad45c85e9ff6afc10537d72"
-- 
1.7.3.4



