Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b7-0006ye-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633117"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:42 -0800
Message-Id: <35edc33b4c89e312838eec7d6a5e5d9632a1afa8.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 57/62] add mfatbu/mfatbl instructions support in Valgrind
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:57 -0000

From: Aneesh Bansal <aneesh.bansal@freescale.com>

Upstream Status : Pending
---
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |   94 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    3 +-
 2 files changed, 96 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
new file mode 100644
index 0000000..ca66bc7
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -0,0 +1,94 @@
+From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
+From: Aneesh Bansal <aneesh.bansal@freescale.com>
+Date: Mon, 21 Nov 2011 17:31:39 +0530
+Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
+
+Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
+---
+Currently Valgrind 3.7.0 does not have support for PPC instructions mfatbu and mfatbl. When we run a USDPAA application with VALGRIND, the following error is given by valgrind :
+dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
+disInstr(ppc): unhandled instruction: 0x7C0F82A6
+
+
+ VEX/priv/guest_ppc_defs.h    |    2 ++
+ VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
+ VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
+ 3 files changed, 42 insertions(+), 0 deletions(-)
+
+diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
+index dd3c62e..11a34aa 100644
+--- a/VEX/priv/guest_ppc_defs.h
++++ b/VEX/priv/guest_ppc_defs.h
+@@ -146,6 +146,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
+ 
+ extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
+ 
++extern UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt );
++
+ extern void ppc32g_dirtyhelper_LVS ( VexGuestPPC32State* gst,
+                                      UInt vD_idx, UInt sh,
+                                      UInt shift_right );
+diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
+index 11aa428..b49ea3f 100644
+--- a/VEX/priv/guest_ppc_helpers.c
++++ b/VEX/priv/guest_ppc_helpers.c
+@@ -119,6 +119,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
+ #  endif
+ }
+ 
++/* CALLED FROM GENERATED CODE */
++/* DIRTY HELPER (non-referentially transparent) */
++UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt r527 )
++{
++#  if defined(__powerpc__) || defined(_AIX)
++   UInt spr;
++   if (r527) {
++      __asm__ __volatile__("mfspr %0,527" : "=b"(spr));
++   } else {
++      __asm__ __volatile__("mfspr %0,526" : "=b"(spr));
++   }
++   return spr;
++#  else
++   return 0;
++#  endif
++}
++
++
+ 
+ /* CALLED FROM GENERATED CODE */
+ /* DIRTY HELPER (reads guest state, writes guest mem) */
+diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
+index f8d220d..37c8974 100644
+--- a/VEX/priv/guest_ppc_toIR.c
++++ b/VEX/priv/guest_ppc_toIR.c
+@@ -5657,6 +5657,28 @@ static Bool dis_proc_ctl ( VexAbiInfo* vbi, UInt theInstr )
+          break;
+       }
+ 
++
++      case 526 /* 0x20E */:
++      case 527 /* 0x20F */: {
++         UInt     arg  = SPR==526 ? 0 : 1;
++         IRTemp   val  = newTemp(Ity_I32);
++         IRExpr** args = mkIRExprVec_1( mkU32(arg) );
++         IRDirty* d    = unsafeIRDirty_1_N(
++                            val,
++                            0/*regparms*/,
++                            "ppc32g_dirtyhelper_MFSPR_526_527",
++                            fnptr_to_fnentry
++                               (vbi, &ppc32g_dirtyhelper_MFSPR_526_527),
++                            args
++                         );
++         /* execute the dirty call, dumping the result in val. */
++         stmt( IRStmt_Dirty(d) );
++         putIReg( rD_addr,
++                  mkWidenFrom32(ty, mkexpr(val), False/*unsigned*/) );
++         DIP("mfspr r%u,%u", rD_addr, (UInt)SPR);
++         break;
++      }
++
+       default:
+          vex_printf("dis_proc_ctl(ppc)(mfspr,SPR)(0x%x)\n", SPR);
+          return False;
+-- 
+1.7.0.4
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index d2c4467..858bf3d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -14,7 +14,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fix_unsupporting_kernel_3.patch \
            file://fixed-perl-path.patch \
            file://fix_for_automake_1.11.2.patch \
-           file://configure-fix.patch"
+           file://configure-fix.patch \
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch"
 
 SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
 SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
-- 
1.7.6.5



