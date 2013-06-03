Return-Path: <B19537@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id E15D160889
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 04:17:07 +0000 (UTC)
Received: from mail166-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.23; Mon, 3 Jun 2013 04:17:07 +0000
Received: from mail166-va3 (localhost [127.0.0.1])	by
	mail166-va3-R.bigfish.com (Postfix) with ESMTP id CC13826012C	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 04:17:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(z5687kz936eIzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1155h)
Received: from mail166-va3 (localhost.localdomain [127.0.0.1]) by mail166-va3
	(MessageSwitch) id 1370233024178646_8479;
	Mon,  3 Jun 2013 04:17:04 +0000 (UTC)
Received: from VA3EHSMHS040.bigfish.com (unknown [10.7.14.234])	by
	mail166-va3.bigfish.com (Postfix) with ESMTP id 1E47236004B	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 04:17:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS040.bigfish.com
	(10.7.99.50) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 3 Jun 2013 04:17:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 3 Jun 2013 04:18:11 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r534Gxho012162;
	Sun, 2 Jun 2013 21:17:00 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jun 2013 12:23:03 +0800
Message-ID: <1370233383-18128-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [PATCH] binutils: fix compile error of complex expressions before @l/@h
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
X-List-Received-Date: Mon, 03 Jun 2013 04:17:08 -0000
Content-Type: text/plain

Back port two patches to fix the error of complex expressions before @l/@h.

Error sample:
test.s: Assembler messages:
test.s:1: Error: operand out of range (0xffffffffffff8000 is not between 0x0000000000000000 and 0x000000000000ffff)

Fix Bug 4524.

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |    4 +-
 ...pc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch |  122 ++++++++++++++++++++
 ...pc.c-md_apply_fix-Sign-extend-fieldval-un.patch |   85 ++++++++++++++
 3 files changed, 210 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2.inc b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
index abec597..f5b5a99 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
@@ -1,4 +1,4 @@
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -41,6 +41,8 @@ BACKPORT = "\
      file://backport/binutils-fix-skip-whitespace-pr14887.patch \
      file://backport/aarch64-crn.patch \
      file://backport/aarch64-movi.patch \
+     file://backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch \
+     file://backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch \
 "
 SRC_URI[md5sum] = "4f8fa651e35ef262edc01d60fb45702e"
 SRC_URI[sha256sum] = "fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
new file mode 100644
index 0000000..6057ad5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
@@ -0,0 +1,122 @@
+config/tc-ppc.c (PPC_VLE_SPLIT16A): Delete unused macro.
+ (PPC_VLE_SPLIT16D, PPC_VLE_LO16A, PPC_VLE_LO16D): 
+ Likewise.      (PPC_VLE_HI16A, PPC_VLE_HI16D): 
+ Likewise.      (PPC_VLE_HA16A, PPC_VLE_HA16D): 
+ Likewise.      (md_apply_fix): 
+ Set fx_no_overflow for assorted relocations.
+ Shift and sign-extend fieldval for use by some VLE reloc
+ operand->insert functions.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+commit ee75ce72fd7a4b2dc47db46acc36905da8904be4
+Author: Alan Modra <amodra@bigpond.net.au>
+Date:   Mon May 6 23:36:48 2013 +0000
+
+--- binutils-2.23.2/gas/config/tc-ppc.c.orig	2013-06-02 21:44:34.000000000 -0500
++++ binutils-2.23.2/gas/config/tc-ppc.c	2013-06-02 21:51:37.000000000 -0500
+@@ -64,40 +64,14 @@
+ /* #lo(value) denotes the least significant 16 bits of the indicated.  */
+ #define PPC_LO(v) ((v) & 0xffff)
+ 
+-/* Split the indicated value with the msbs in bits 11-15
+-   and the lsbs in bits 21-31.  */
+-#define PPC_VLE_SPLIT16A(v) ((v & 0xf800) << 11) | (v & 0x7ff)
+-
+-/* Split the indicated value with the msbs in bits 6-10
+-   and the lsbs in bits 21-31.  */
+-#define PPC_VLE_SPLIT16D(v) ((v & 0xf800) << 5) | (v & 0x7ff)
+-
+-/* #lo(value) denotes the lsb 16 bits in split16a format.  */
+-#define PPC_VLE_LO16A(v) PPC_VLE_SPLIT16A(PPC_LO(v))
+-
+-/* #lo(value) denotes the lsb 16 bits in split16d format.  */
+-#define PPC_VLE_LO16D(v) PPC_VLE_SPLIT16D(PPC_LO(v))
+-
+ /* #hi(value) denotes bits 16 through 31 of the indicated value.  */
+ #define PPC_HI(v) (((v) >> 16) & 0xffff)
+ 
+-/* #lo(value) denotes the msb 16 bits in split16a format.  */
+-#define PPC_VLE_HI16A(v) PPC_VLE_SPLIT16A(PPC_HI(v))
+-
+-/* #lo(value) denotes the msb 16 bits in split16d format.  */
+-#define PPC_VLE_HI16D(v) PPC_VLE_SPLIT16D(PPC_HI(v))
+-
+ /* #ha(value) denotes the high adjusted value: bits 16 through 31 of
+   the indicated value, compensating for #lo() being treated as a
+   signed number.  */
+ #define PPC_HA(v) PPC_HI ((v) + 0x8000)
+ 
+-/* #ha(value) denotes the high adjusted value in split16a format.  */
+-#define PPC_VLE_HA16A(v) PPC_VLE_SPLIT16A(PPC_HA(v))
+-
+-/* #ha(value) denotes the high adjusted value in split16d format.  */
+-#define PPC_VLE_HA16D(v) PPC_VLE_SPLIT16D(PPC_HA(v))
+-
+ /* #higher(value) denotes bits 32 through 47 of the indicated value.  */
+ #define PPC_HIGHER(v) (((v) >> 16 >> 16) & 0xffff)
+ 
+@@ -6379,7 +6353,10 @@
+ 	    fixP->fx_r_type = BFD_RELOC_LO16_PCREL;
+ 	  /* fall through */
+ 	case BFD_RELOC_LO16_PCREL:
++	case BFD_RELOC_PPC_VLE_LO16A:
++	case BFD_RELOC_PPC_VLE_LO16D:
+ 	  fieldval = SEX16 (value);
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	case BFD_RELOC_HI16:
+@@ -6387,7 +6364,10 @@
+ 	    fixP->fx_r_type = BFD_RELOC_HI16_PCREL;
+ 	  /* fall through */
+ 	case BFD_RELOC_HI16_PCREL:
++	case BFD_RELOC_PPC_VLE_HI16A:
++	case BFD_RELOC_PPC_VLE_HI16D:
+ 	  fieldval = SEX16 (PPC_HI (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	case BFD_RELOC_HI16_S:
+@@ -6395,7 +6375,10 @@
+ 	    fixP->fx_r_type = BFD_RELOC_HI16_S_PCREL;
+ 	  /* fall through */
+ 	case BFD_RELOC_HI16_S_PCREL:
++	case BFD_RELOC_PPC_VLE_HA16A:
++	case BFD_RELOC_PPC_VLE_HA16D:
+ 	  fieldval = SEX16 (PPC_HA (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ #ifdef OBJ_ELF
+@@ -6403,24 +6386,28 @@
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+ 	  fieldval = SEX16 (PPC_HIGHER (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	case BFD_RELOC_PPC64_HIGHER_S:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+ 	  fieldval = SEX16 (PPC_HIGHERA (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	case BFD_RELOC_PPC64_HIGHEST:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+ 	  fieldval = SEX16 (PPC_HIGHEST (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	case BFD_RELOC_PPC64_HIGHEST_S:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+ 	  fieldval = SEX16 (PPC_HIGHESTA (value));
++	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+ 	  /* The following relocs can't be calculated by the assembler.
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
new file mode 100644
index 0000000..a62ca47
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
@@ -0,0 +1,85 @@
+config/tc-ppc.c (md_apply_fix): Sign extend fieldval under control of operand flag bits.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+commit cf5434698882f41ddfcc469488e8a68c674aae03
+Author: Alan Modra <amodra@bigpond.net.au>
+Date:   Thu May 9 04:01:53 2013 +0000
+
+--- binutils-2.23.2/gas/config/tc-ppc.c.orig	2013-06-02 21:53:24.000000000 -0500
++++ binutils-2.23.2/gas/config/tc-ppc.c	2013-06-02 22:03:00.000000000 -0500
+@@ -6355,7 +6355,10 @@
+ 	case BFD_RELOC_LO16_PCREL:
+ 	case BFD_RELOC_PPC_VLE_LO16A:
+ 	case BFD_RELOC_PPC_VLE_LO16D:
+-	  fieldval = SEX16 (value);
++	  fieldval = value & 0xffff;
++	sign_extend_16:
++	  if ((operand->flags & PPC_OPERAND_SIGNED) != 0)
++	    fieldval = (fieldval ^ 0x8000) - 0x8000;
+ 	  fixP->fx_no_overflow = 1;
+ 	  break;
+ 
+@@ -6366,9 +6369,8 @@
+ 	case BFD_RELOC_HI16_PCREL:
+ 	case BFD_RELOC_PPC_VLE_HI16A:
+ 	case BFD_RELOC_PPC_VLE_HI16D:
+-	  fieldval = SEX16 (PPC_HI (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HI (value);
++	  goto sign_extend_16;
+ 
+ 	case BFD_RELOC_HI16_S:
+ 	  if (fixP->fx_pcrel)
+@@ -6377,38 +6379,33 @@
+ 	case BFD_RELOC_HI16_S_PCREL:
+ 	case BFD_RELOC_PPC_VLE_HA16A:
+ 	case BFD_RELOC_PPC_VLE_HA16D:
+-	  fieldval = SEX16 (PPC_HA (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HA (value);
++	  goto sign_extend_16;
+ 
+ #ifdef OBJ_ELF
+ 	case BFD_RELOC_PPC64_HIGHER:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+-	  fieldval = SEX16 (PPC_HIGHER (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HIGHER (value);
++	  goto sign_extend_16;
+ 
+ 	case BFD_RELOC_PPC64_HIGHER_S:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+-	  fieldval = SEX16 (PPC_HIGHERA (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HIGHERA (value);
++	  goto sign_extend_16;
+ 
+ 	case BFD_RELOC_PPC64_HIGHEST:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+-	  fieldval = SEX16 (PPC_HIGHEST (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HIGHEST (value);
++	  goto sign_extend_16;
+ 
+ 	case BFD_RELOC_PPC64_HIGHEST_S:
+ 	  if (fixP->fx_pcrel)
+ 	    goto bad_pcrel;
+-	  fieldval = SEX16 (PPC_HIGHESTA (value));
+-	  fixP->fx_no_overflow = 1;
+-	  break;
++	  fieldval = PPC_HIGHESTA (value);
++	  goto sign_extend_16;
+ 
+ 	  /* The following relocs can't be calculated by the assembler.
+ 	     Leave the field zero.  */
-- 
1.7.5.4



