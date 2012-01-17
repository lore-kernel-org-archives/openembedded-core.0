Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEqt-0002Lx-G0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:37:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 11:30:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97530467"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 11:30:11 -0800
Message-ID: <4F15CC43.7090409@linux.intel.com>
Date: Tue, 17 Jan 2012 11:30:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326713895-6307-1-git-send-email-b39320@freescale.com>
In-Reply-To: <1326713895-6307-1-git-send-email-b39320@freescale.com>
Cc: Aneesh Bansal <aneesh.bansal@freescale.com>
Subject: Re: [PATCH] add mfatbu/mfatbl instructions support in Valgrind
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
X-List-Received-Date: Tue, 17 Jan 2012 19:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2012 03:38 AM, b39320@freescale.com wrote:
> From: Aneesh Bansal<aneesh.bansal@freescale.com>
>
> Upstream Status : Pending
>
Merged into OE-Core, as was noted the commit message was modified
and the Upstream-Status: should be in the patch file itself not in the 
git commit message

Thanks
	Sau!

> ---
>   ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |   94 ++++++++++++++++++++
>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    3 +-
>   2 files changed, 96 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
> new file mode 100644
> index 0000000..ca66bc7
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind-3.7.0/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
> @@ -0,0 +1,94 @@
> +From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
> +From: Aneesh Bansal<aneesh.bansal@freescale.com>
> +Date: Mon, 21 Nov 2011 17:31:39 +0530
> +Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
> +
> +Signed-off-by: Aneesh Bansal<aneesh.bansal@freescale.com>
> +---
> +Currently Valgrind 3.7.0 does not have support for PPC instructions mfatbu and mfatbl. When we run a USDPAA application with VALGRIND, the following error is given by valgrind :
> +dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
> +disInstr(ppc): unhandled instruction: 0x7C0F82A6
> +
> +
> + VEX/priv/guest_ppc_defs.h    |    2 ++
> + VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
> + VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
> + 3 files changed, 42 insertions(+), 0 deletions(-)
> +
> +diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
> +index dd3c62e..11a34aa 100644
> +--- a/VEX/priv/guest_ppc_defs.h
> ++++ b/VEX/priv/guest_ppc_defs.h
> +@@ -146,6 +146,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
> +
> + extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
> +
> ++extern UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt );
> ++
> + extern void ppc32g_dirtyhelper_LVS ( VexGuestPPC32State* gst,
> +                                      UInt vD_idx, UInt sh,
> +                                      UInt shift_right );
> +diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
> +index 11aa428..b49ea3f 100644
> +--- a/VEX/priv/guest_ppc_helpers.c
> ++++ b/VEX/priv/guest_ppc_helpers.c
> +@@ -119,6 +119,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
> + #  endif
> + }
> +
> ++/* CALLED FROM GENERATED CODE */
> ++/* DIRTY HELPER (non-referentially transparent) */
> ++UInt ppc32g_dirtyhelper_MFSPR_526_527 ( UInt r527 )
> ++{
> ++#  if defined(__powerpc__) || defined(_AIX)
> ++   UInt spr;
> ++   if (r527) {
> ++      __asm__ __volatile__("mfspr %0,527" : "=b"(spr));
> ++   } else {
> ++      __asm__ __volatile__("mfspr %0,526" : "=b"(spr));
> ++   }
> ++   return spr;
> ++#  else
> ++   return 0;
> ++#  endif
> ++}
> ++
> ++
> +
> + /* CALLED FROM GENERATED CODE */
> + /* DIRTY HELPER (reads guest state, writes guest mem) */
> +diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
> +index f8d220d..37c8974 100644
> +--- a/VEX/priv/guest_ppc_toIR.c
> ++++ b/VEX/priv/guest_ppc_toIR.c
> +@@ -5657,6 +5657,28 @@ static Bool dis_proc_ctl ( VexAbiInfo* vbi, UInt theInstr )
> +          break;
> +       }
> +
> ++
> ++      case 526 /* 0x20E */:
> ++      case 527 /* 0x20F */: {
> ++         UInt     arg  = SPR==526 ? 0 : 1;
> ++         IRTemp   val  = newTemp(Ity_I32);
> ++         IRExpr** args = mkIRExprVec_1( mkU32(arg) );
> ++         IRDirty* d    = unsafeIRDirty_1_N(
> ++                            val,
> ++                            0/*regparms*/,
> ++                            "ppc32g_dirtyhelper_MFSPR_526_527",
> ++                            fnptr_to_fnentry
> ++                               (vbi,&ppc32g_dirtyhelper_MFSPR_526_527),
> ++                            args
> ++                         );
> ++         /* execute the dirty call, dumping the result in val. */
> ++         stmt( IRStmt_Dirty(d) );
> ++         putIReg( rD_addr,
> ++                  mkWidenFrom32(ty, mkexpr(val), False/*unsigned*/) );
> ++         DIP("mfspr r%u,%u", rD_addr, (UInt)SPR);
> ++         break;
> ++      }
> ++
> +       default:
> +          vex_printf("dis_proc_ctl(ppc)(mfspr,SPR)(0x%x)\n", SPR);
> +          return False;
> +--
> +1.7.0.4
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index d2c4467..858bf3d 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -14,7 +14,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>              file://fix_unsupporting_kernel_3.patch \
>              file://fixed-perl-path.patch \
>              file://fix_for_automake_1.11.2.patch \
> -           file://configure-fix.patch"
> +           file://configure-fix.patch \
> +           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch"
>
>   SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
>   SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"


