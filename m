Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D436C605BA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 08:01:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c74so9986138pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BfVy7Aoyl8O3/upE+XW8oD84ZdpGYO5tjCYn2GgM5rA=;
	b=pnEmml4iUwoc6C2jOMxSsRnscSQSgCl0ozy1sLl+G1l4vkWNGzhGUsoEM7C4b92x9y
	0WOAbZ+0Lj/tnCpOF6XDLskDj/O+KjndUqVQTPJUXOYAs5rAHtQ6Bofq3kdzAvogenXo
	lf4tLfG5fKmaznB0mEQxsHQd3yOxtdCd0qvn+Oxp+mjRcxDPojn8EJz5yuYaXgiUtXcH
	C6TQEVyfyX2Da4jSubfSPEcDPmj6F0T9oK3XyKtLnNqf66+jviM0ygrjIY1210CpkRZP
	HlZf8ZIipl09VMfSH6CAacEcGCT9XGeT9MQpo05wvQydkNCe4bNTQjcp5p3exQoRCTUT
	7ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BfVy7Aoyl8O3/upE+XW8oD84ZdpGYO5tjCYn2GgM5rA=;
	b=m1YZQTBmuaSSOFTekuY1Bew1wYS5CzK0M5P/2TOjJyBoqMa8iE8WhmcbwMW3Vv3NyK
	0h8lzbDvKFAr611/prgY5kxgYsz9NXsARk5pkTNu9cazbjZajFY+jZDhzSOKmgMTj6I+
	kfPb4DBGIO+FDFkqI+fGgPK70Haaajla2kGxzIcQlYxr7LAIi6dfYNZi+YOdt1/f+VpY
	A6TkZH4YnISGtWxbUSC3DmIG8hKPD0/MAM+DJEKY5ZprTGNJpR/04/rL8AYQS4jdSG/d
	tO6I1qXbZXKOqZdxaeiohBHNUwOpzRvSIVEm7z/D1l2oDy5ntnElgN2dC9wZwy0akK7v
	OyQQ==
X-Gm-Message-State: ALyK8tJcmOn8yawpxcXoAw8KYcAOd5AcjcsqgV7S81fSbcLmKy4JaOE7B7zoUnA/3GZuYQ==
X-Received: by 10.98.222.130 with SMTP id h124mr16827748pfg.78.1468051262800; 
	Sat, 09 Jul 2016 01:01:02 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id m78sm785822pfj.66.2016.07.09.01.01.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 01:01:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 01:00:53 -0700
Message-Id: <20160709080054.21811-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160709080054.21811-1-raj.khem@gmail.com>
References: <20160709080054.21811-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] libunwind: Port to ppc/musl
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
X-List-Received-Date: Sat, 09 Jul 2016 08:01:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...der-ucontext-mismatches-between-glibc-and.patch | 248 +++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_git.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch

diff --git a/meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch b/meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
new file mode 100644
index 0000000..ca0641f
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
@@ -0,0 +1,248 @@
+From e0eea53c77fce8537c58a072b684043507987bcc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jul 2016 01:07:53 +0000
+Subject: [PATCH] ppc32: Consider ucontext mismatches between glibc and musl
+
+This helps in porting libunwind onto musl based systems
+ptrace.h change is required again an error that surfaces
+with musl
+
+/mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/asm/ptrace.h:31:8: error: redefinition of 'struct pt_regs'
+ struct pt_regs {
+        ^~~~~~~
+In file included from /mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/sys/user.h:11:0,
+                 from /mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/sys/procfs.h:9,
+                 from ../../git/src/ptrace/_UPT_internal.h:40,
+                 from ../../git/src/ptrace/_UPT_reg_offset.c:27:
+/mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/usr/include/bits/user.h:1:8: note: originally defined here
+ struct pt_regs {
+        ^~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/ppc32/Ginit.c            |   6 +-
+ src/ppc32/ucontext_i.h       | 158 ++++++++++++++++++++++---------------------
+ src/ptrace/_UPT_reg_offset.c |   7 ++
+ 3 files changed, 92 insertions(+), 79 deletions(-)
+
+diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
+index f2e6e82..617aaa1 100644
+--- a/src/ppc32/Ginit.c
++++ b/src/ppc32/Ginit.c
+@@ -48,12 +48,12 @@ uc_addr (ucontext_t *uc, int reg)
+   void *addr;
+ 
+   if ((unsigned) (reg - UNW_PPC32_R0) < 32)
+-    addr = &uc->uc_mcontext.uc_regs->gregs[reg - UNW_PPC32_R0];
++    addr = &uc->GET_UC_REGS->gregs[reg - UNW_PPC32_R0];
+ 
+   else
+   if ( ((unsigned) (reg - UNW_PPC32_F0) < 32) &&
+        ((unsigned) (reg - UNW_PPC32_F0) >= 0) )
+-    addr = &uc->uc_mcontext.uc_regs->fpregs.fpregs[reg - UNW_PPC32_F0];
++    addr = &uc->GET_UC_REGS->fpregs.fpregs[reg - UNW_PPC32_F0];
+ 
+   else
+     {
+@@ -76,7 +76,7 @@ uc_addr (ucontext_t *uc, int reg)
+         default:
+           return NULL;
+         }
+-      addr = &uc->uc_mcontext.uc_regs->gregs[gregs_idx];
++      addr = &uc->GET_UC_REGS->gregs[gregs_idx];
+     }
+   return addr;
+ }
+diff --git a/src/ppc32/ucontext_i.h b/src/ppc32/ucontext_i.h
+index c6ba806..b79f15c 100644
+--- a/src/ppc32/ucontext_i.h
++++ b/src/ppc32/ucontext_i.h
+@@ -46,83 +46,89 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+    various structure members. */
+ static ucontext_t dmy_ctxt UNUSED;
+ 
+-#define UC_MCONTEXT_GREGS_R0 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[0] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R1 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[1] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R2 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[2] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[3] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R4 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[4] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R5 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[5] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R6 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[6] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R7 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[7] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R8 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[8] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R9 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[9] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R10 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[10] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R11 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[11] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R12 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[12] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R13 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[13] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R14 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[14] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R15 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[15] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R16 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[16] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R17 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[17] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R18 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[18] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R19 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[19] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R20 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[20] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R21 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[21] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R22 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[22] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R23 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[23] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R24 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[24] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R25 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[25] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R26 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[26] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R27 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[27] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R28 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[28] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R29 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[29] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R30 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[30] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_R31 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[31] - (void *)&dmy_ctxt)
++#ifdef __GLIBC__
++#define GET_UC_REGS uc_mcontext.uc_regs
++#else
++#define GET_UC_REGS uc_regs
++#endif
++
++#define UC_MCONTEXT_GREGS_R0 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[0] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R1 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[1] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R2 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[2] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R3 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[3] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R4 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[4] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R5 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[5] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R6 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[6] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R7 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[7] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R8 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[8] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R9 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[9] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R10 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[10] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R11 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[11] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R12 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[12] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R13 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[13] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R14 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[14] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R15 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[15] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R16 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[16] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R17 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[17] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R18 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[18] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R19 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[19] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R20 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[20] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R21 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[21] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R22 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[22] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R23 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[23] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R24 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[24] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R25 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[25] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R26 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[26] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R27 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[27] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R28 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[28] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R29 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[29] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R30 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[30] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_R31 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[31] - (void *)&dmy_ctxt)
+ 
+-#define UC_MCONTEXT_GREGS_MSR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[MSR_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_ORIG_GPR3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[ORIG_GPR3_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_CTR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[CTR_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_LINK ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[LINK_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_XER ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[XER_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_CCR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[CCR_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_SOFTE ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[SOFTE_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_TRAP ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[TRAP_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_DAR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[DAR_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_DSISR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[DSISR_IDX] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_GREGS_RESULT ((void *)&dmy_ctxt.uc_mcontext.uc_regs->gregs[RESULT_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_MSR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[MSR_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_ORIG_GPR3 ((void *)&dmy_ctxt.GET_UC_REGS->gregs[ORIG_GPR3_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_CTR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[CTR_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_LINK ((void *)&dmy_ctxt.GET_UC_REGS->gregs[LINK_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_XER ((void *)&dmy_ctxt.GET_UC_REGS->gregs[XER_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_CCR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[CCR_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_SOFTE ((void *)&dmy_ctxt.GET_UC_REGS->gregs[SOFTE_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_TRAP ((void *)&dmy_ctxt.GET_UC_REGS->gregs[TRAP_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_DAR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[DAR_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_DSISR ((void *)&dmy_ctxt.GET_UC_REGS->gregs[DSISR_IDX] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_GREGS_RESULT ((void *)&dmy_ctxt.GET_UC_REGS->gregs[RESULT_IDX] - (void *)&dmy_ctxt)
+ 
+-#define UC_MCONTEXT_FREGS_R0 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[0] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R1 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[1] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R2 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[2] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R3 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[3] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R4 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[4] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R5 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[5] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R6 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[6] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R7 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[7] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R8 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[8] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R9 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[9] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R10 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[10] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R11 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[11] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R12 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[12] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R13 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[13] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R14 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[14] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R15 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[15] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R16 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[16] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R17 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[17] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R18 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[18] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R19 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[19] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R20 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[20] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R21 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[21] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R22 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[22] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R23 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[23] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R24 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[24] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R25 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[25] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R26 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[26] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R27 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[27] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R28 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[28] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R29 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[29] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R30 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[30] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_R31 ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[31] - (void *)&dmy_ctxt)
+-#define UC_MCONTEXT_FREGS_FPSCR ((void *)&dmy_ctxt.uc_mcontext.uc_regs->fpregs.fpregs[32] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R0 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[0] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R1 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[1] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R2 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[2] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R3 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[3] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R4 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[4] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R5 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[5] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R6 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[6] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R7 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[7] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R8 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[8] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R9 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[9] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R10 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[10] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R11 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[11] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R12 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[12] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R13 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[13] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R14 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[14] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R15 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[15] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R16 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[16] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R17 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[17] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R18 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[18] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R19 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[19] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R20 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[20] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R21 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[21] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R22 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[22] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R23 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[23] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R24 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[24] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R25 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[25] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R26 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[26] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R27 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[27] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R28 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[28] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R29 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[29] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R30 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[30] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_R31 ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[31] - (void *)&dmy_ctxt)
++#define UC_MCONTEXT_FREGS_FPSCR ((void *)&dmy_ctxt.GET_UC_REGS->fpregs.fpregs[32] - (void *)&dmy_ctxt)
+ 
+ #endif
+diff --git a/src/ptrace/_UPT_reg_offset.c b/src/ptrace/_UPT_reg_offset.c
+index 68461a2..fcc43f7 100644
+--- a/src/ptrace/_UPT_reg_offset.c
++++ b/src/ptrace/_UPT_reg_offset.c
+@@ -27,6 +27,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
+ #include "_UPT_internal.h"
+ 
+ #include <stddef.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
++#include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #ifdef HAVE_ASM_PTRACE_OFFSETS_H
+ # include <asm/ptrace_offsets.h>
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index cc8c2b5..6d1d9fb 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://0001-x86-Stub-out-x86_local_resume.patch \
            file://0001-Fix-build-on-mips-musl.patch \
            file://0001-add-knobs-to-disable-enable-tests.patch \
+           file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
            "
 
 EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
-- 
2.9.0


