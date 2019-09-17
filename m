Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 07B317FD87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 23:04:33 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id h195so3045352pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 16:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=crOGw135eN6hXPLHQ/wNosq2OxaIZYhKPJuZ6RDFmEk=;
	b=JcH90JHpJHtvbV/0hZ1amu4YEkO+Rsm2w1TPfXyuoR71TeGMcnVU1sLDp1RNGQlwy5
	2gZl9zdyJXyHdNMo0xNkSOVL6djCRXVUGsZwZ6hDR7XFt9NL/zXLVKFpfkxeLoqO5uN6
	/DSv8wao6fexm0mRpIkSFFXa0B10PIrOyOkXg5GdyLTSlVPJubqAU69HQaB90UppceUg
	DOdeKErMd3mbO0rLHsES/xeL2yK/QhRnT+KD+79iZMTvz3qKIAOP1YIC+TM4oKT/wsCL
	aCP51f22X4R5ccYiB3u5F5MOlcFGghqJdxaW+39rTfh9uxEn0DLtjqj5H/bAAGL8kUtH
	raiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=crOGw135eN6hXPLHQ/wNosq2OxaIZYhKPJuZ6RDFmEk=;
	b=NZGZcEw3V3NbP7q6nLhZiL8zmZ8vmioL/rtHKeNXdF/3IiUSv5uhltMGW+Vu9XsbsM
	Cq0GEXJfTldbY0/C4iSiBJe8U3b8um++P9LbgIWg2WQUhKciRZUyRggVAVXm4vBaThnX
	/beWwgPA9SxExpgcR/B6wcICN8MN1z3qOhKmBftWZGk8ekR8KfYajVICHyF6M66id0yi
	kR0Yu6t2BoYaAte/AF4ksNloZb6LRLS9M7DR5m+Rp9fjZgbDJEGYD6UaSdvbO/oOLQ3+
	Dk89wxbWeQRQEUVGLxY+Z9W8zWtBaZUbJbJQtoMRG2hST6wASga4rs1CY/oHEPkyFVfH
	aXAw==
X-Gm-Message-State: APjAAAV54hDEOU3an5znbGa7FSAONZGEd93sWAhOdSDmIazOwebh1nha
	lgU+bFEegDggdbfnj42U14TzhKOuGYY=
X-Google-Smtp-Source: APXvYqxWWzQMY3pPq2msEqaFdKtjIb6QTBJORUkgSzHJvTibeAU4/WIXoYbOB3ljNl05WGeX3/fKlw==
X-Received: by 2002:a17:90a:d356:: with SMTP id
	i22mr577572pjx.24.1568761474332; 
	Tue, 17 Sep 2019 16:04:34 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136])
	by smtp.gmail.com with ESMTPSA id n1sm1732252pfa.12.2019.09.17.16.04.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 16:04:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:04:32 -0700
Message-Id: <20190917230432.11385-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] gcc: Security fix for CVE-2019-15847
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
X-List-Received-Date: Tue, 17 Sep 2019 23:04:34 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 9.2.0

Dropped Changelog changes.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-9.2.inc         |   3 +
 .../gcc/gcc-9.2/CVE-2019-15847_1.patch        | 521 ++++++++++++++++++
 .../gcc/gcc-9.2/CVE-2019-15847_2.patch        |  77 +++
 .../gcc/gcc-9.2/CVE-2019-15847_3.patch        |  62 +++
 4 files changed, 663 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.2.inc b/meta/recipes-devtools/gcc/gcc-9.2.inc
index 01d3bf0f32..c6395998d5 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.2.inc
@@ -65,6 +65,9 @@ SRC_URI = "\
            file://0035-Fix-for-testsuite-failure.patch \
            file://0036-Re-introduce-spe-commandline-options.patch \
            file://CVE-2019-14250.patch \
+	   file://CVE-2019-15847_1.patch \
+	   file://CVE-2019-15847_2.patch \
+	   file://CVE-2019-15847_3.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[md5sum] = "3818ad8600447f05349098232c2ddc78"
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
new file mode 100644
index 0000000000..227fd47c95
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_1.patch
@@ -0,0 +1,521 @@
+From 8c61566116d23063ff597271884f8e00d94ab1a1 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 13:48:48 +0000
+Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
+  <segher@kernel.crashing.org>
+
+	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
+	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to...
+	* config/rs6000/rs6000.md (unspec): ... here.
+	* config/rs6000/altivec.md (darn_32, darn_raw, darn, cmprb,
+	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
+	cmpeqb, *cmpeqb_internal): Delete, move to...
+	* config/rs6000/rs6000.md (darn_32, darn_raw, darn, cmprb,
+	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
+	cmpeqb, *cmpeqb_internal): ... here.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275170 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-15847 p1
+Affects <= 9.2.0
+Dropped Changelog changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/config/rs6000/altivec.md | 223 ----------------------------------
+ gcc/config/rs6000/rs6000.md  | 224 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 239 insertions(+), 223 deletions(-)
+
+Index: gcc-9.2.0/gcc/config/rs6000/altivec.md
+===================================================================
+--- gcc-9.2.0.orig/gcc/config/rs6000/altivec.md
++++ gcc-9.2.0/gcc/config/rs6000/altivec.md
+@@ -80,9 +80,6 @@
+    UNSPEC_VUPKHPX
+    UNSPEC_VUPKLPX
+    UNSPEC_CONVERT_4F32_8I16
+-   UNSPEC_DARN
+-   UNSPEC_DARN_32
+-   UNSPEC_DARN_RAW
+    UNSPEC_DST
+    UNSPEC_DSTT
+    UNSPEC_DSTST
+@@ -161,9 +158,6 @@
+    UNSPEC_BCDADD
+    UNSPEC_BCDSUB
+    UNSPEC_BCD_OVERFLOW
+-   UNSPEC_CMPRB
+-   UNSPEC_CMPRB2
+-   UNSPEC_CMPEQB
+    UNSPEC_VRLMI
+    UNSPEC_VRLNM
+ ])
+@@ -4101,223 +4095,6 @@
+   "bcd<bcd_add_sub>. %0,%1,%2,%3"
+   [(set_attr "type" "vecsimple")])
+ 
+-(define_insn "darn_32"
+-  [(set (match_operand:SI 0 "register_operand" "=r")
+-        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
+-  "TARGET_P9_MISC"
+-  "darn %0,0"
+-  [(set_attr "type" "integer")])
+-
+-(define_insn "darn_raw"
+-  [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "darn %0,2"
+-  [(set_attr "type" "integer")])
+-
+-(define_insn "darn"
+-  [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "darn %0,1"
+-  [(set_attr "type" "integer")])
+-
+-;; Test byte within range.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as xx:xx:hi:lo.
+-;;
+-;; Return in target register operand 0 a value of 1 if lo <= vv and
+-;; vv <= hi.  Otherwise, set register operand 0 to 0.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation only operates on
+-;; SI-mode operands as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmprb"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as xx:xx:hi:lo.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
+-;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
+-;; 3 bits of the target CR register are all set to 0.
+-(define_insn "*cmprb_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB))]
+-  "TARGET_P9_MISC"
+-  "cmprb %0,0,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+-;; Set operand 0 register to -1 if the LT bit (0x8) of condition
+-;; register operand 1 is on.  Otherwise, set operand 0 register to 1
+-;; if the GT bit (0x4) of condition register operand 1 is on.
+-;; Otherwise, set operand 0 to 0.  Note that the result stored into
+-;; register operand 0 is non-zero iff either the LT or GT bits are on
+-;; within condition register operand 1.
+-(define_insn "setb_signed"
+-   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
+-			      (const_int 0))
+-			  (const_int -1)
+-			  (if_then_else (gt (match_dup 1)
+-					    (const_int 0))
+-					(const_int 1)
+-					(const_int 0))))]
+-  "TARGET_P9_MISC"
+-  "setb %0,%1"
+-  [(set_attr "type" "logical")])
+-
+-(define_insn "setb_unsigned"
+-   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
+-			      (const_int 0))
+-			  (const_int -1)
+-			  (if_then_else (gtu (match_dup 1)
+-					    (const_int 0))
+-					(const_int 1)
+-					(const_int 0))))]
+-  "TARGET_P9_MISC"
+-  "setb %0,%1"
+-  [(set_attr "type" "logical")])
+-
+-;; Test byte within two ranges.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
+-;;
+-;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
+-;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
+-;; operand 0 to 0.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation only operates on
+-;; SI-mode operands as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmprb2"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB2))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the ranges specified by operand 2.
+-;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
+-;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
+-;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
+-;; CR register are all set to 0.
+-(define_insn "*cmprb2_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB2))]
+-  "TARGET_P9_MISC"
+-  "cmprb %0,1,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+-;; Test byte membership within set of 8 bytes.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the set specified by operand 2.
+-;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
+-;;
+-;; Return in target register operand 0 a value of 1 if vv equals one
+-;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
+-;; register operand 0 to 0.  Note that the 8 byte values held within
+-;; operand 2 need not be unique.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation requires that operands
+-;; 0 and 1 have mode SI as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmpeqb"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:DI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPEQB))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the set specified by operand 2.
+-;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
+-;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
+-;; set the GT bit to zero.  The other 3 bits of the target CR register
+-;; are all set to 0.
+-(define_insn "*cmpeqb_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		     (match_operand:DI 2 "gpc_reg_operand" "r")]
+-	  UNSPEC_CMPEQB))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "cmpeqb %0,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+ (define_expand "bcd<bcd_add_sub>_<code>"
+   [(parallel [(set (reg:CCFP CR6_REGNO)
+ 		   (compare:CCFP
+Index: gcc-9.2.0/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-9.2.0.orig/gcc/config/rs6000/rs6000.md
++++ gcc-9.2.0/gcc/config/rs6000/rs6000.md
+@@ -137,6 +137,12 @@
+    UNSPEC_LSQ
+    UNSPEC_FUSION_GPR
+    UNSPEC_STACK_CHECK
++   UNSPEC_DARN
++   UNSPEC_DARN_32
++   UNSPEC_DARN_RAW
++   UNSPEC_CMPRB
++   UNSPEC_CMPRB2
++   UNSPEC_CMPEQB
+    UNSPEC_ADD_ROUND_TO_ODD
+    UNSPEC_SUB_ROUND_TO_ODD
+    UNSPEC_MUL_ROUND_TO_ODD
+@@ -14322,7 +14328,225 @@
+    "xscmpuqp %0,%1,%2"
+   [(set_attr "type" "veccmp")
+    (set_attr "size" "128")])
++
++;; Miscellaneous ISA 3.0 (power9) instructions
++
++(define_insn "darn_32"
++  [(set (match_operand:SI 0 "register_operand" "=r")
++        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
++  "TARGET_P9_MISC"
++  "darn %0,0"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn_raw"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,2"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,1"
++  [(set_attr "type" "integer")])
++
++;; Test byte within range.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
++;;
++;; Return in target register operand 0 a value of 1 if lo <= vv and
++;; vv <= hi.  Otherwise, set register operand 0 to 0.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation only operates on
++;; SI-mode operands as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmprb"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
++;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
++;; 3 bits of the target CR register are all set to 0.
++(define_insn "*cmprb_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB))]
++  "TARGET_P9_MISC"
++  "cmprb %0,0,%1,%2"
++  [(set_attr "type" "logical")])
++
++;; Set operand 0 register to -1 if the LT bit (0x8) of condition
++;; register operand 1 is on.  Otherwise, set operand 0 register to 1
++;; if the GT bit (0x4) of condition register operand 1 is on.
++;; Otherwise, set operand 0 to 0.  Note that the result stored into
++;; register operand 0 is non-zero iff either the LT or GT bits are on
++;; within condition register operand 1.
++(define_insn "setb_signed"
++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
++			      (const_int 0))
++			  (const_int -1)
++			  (if_then_else (gt (match_dup 1)
++					    (const_int 0))
++					(const_int 1)
++					(const_int 0))))]
++  "TARGET_P9_MISC"
++  "setb %0,%1"
++  [(set_attr "type" "logical")])
+ 
++(define_insn "setb_unsigned"
++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
++			      (const_int 0))
++			  (const_int -1)
++			  (if_then_else (gtu (match_dup 1)
++					    (const_int 0))
++					(const_int 1)
++					(const_int 0))))]
++  "TARGET_P9_MISC"
++  "setb %0,%1"
++  [(set_attr "type" "logical")])
++
++;; Test byte within two ranges.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
++;;
++;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
++;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
++;; operand 0 to 0.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation only operates on
++;; SI-mode operands as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmprb2"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB2))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the ranges specified by operand 2.
++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
++;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
++;; CR register are all set to 0.
++(define_insn "*cmprb2_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB2))]
++  "TARGET_P9_MISC"
++  "cmprb %0,1,%1,%2"
++  [(set_attr "type" "logical")])
++
++;; Test byte membership within set of 8 bytes.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the set specified by operand 2.
++;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
++;;
++;; Return in target register operand 0 a value of 1 if vv equals one
++;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
++;; register operand 0 to 0.  Note that the 8 byte values held within
++;; operand 2 need not be unique.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation requires that operands
++;; 0 and 1 have mode SI as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmpeqb"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:DI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPEQB))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the set specified by operand 2.
++;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
++;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
++;; set the GT bit to zero.  The other 3 bits of the target CR register
++;; are all set to 0.
++(define_insn "*cmpeqb_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		     (match_operand:DI 2 "gpc_reg_operand" "r")]
++	  UNSPEC_CMPEQB))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "cmpeqb %0,%1,%2"
++  [(set_attr "type" "logical")])
+ 
+ 
+ (include "sync.md")
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
new file mode 100644
index 0000000000..de7a83c23f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_2.patch
@@ -0,0 +1,77 @@
+From 87bc784a7ca3a43182f7272241597a50d7491342 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 13:51:26 +0000
+Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
+  <segher@kernel.crashing.org>
+
+	PR target/91481
+	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
+	and UNSPEC_DARN_RAW.
+	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
+	UNSPECV_DARN_RAW.
+	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
+	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
+	(darn): Use an unspec_volatile, and UNSPECV_DARN.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275175 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-15847 p2
+Affects <= 9.2.0
+Dropped Changelog changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/config/rs6000/rs6000.md | 12 ++++++------
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+Index: gcc-9.2.0/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-9.2.0.orig/gcc/config/rs6000/rs6000.md
++++ gcc-9.2.0/gcc/config/rs6000/rs6000.md
+@@ -137,9 +137,6 @@
+    UNSPEC_LSQ
+    UNSPEC_FUSION_GPR
+    UNSPEC_STACK_CHECK
+-   UNSPEC_DARN
+-   UNSPEC_DARN_32
+-   UNSPEC_DARN_RAW
+    UNSPEC_CMPRB
+    UNSPEC_CMPRB2
+    UNSPEC_CMPEQB
+@@ -170,6 +167,9 @@
+    UNSPECV_EH_RR		; eh_reg_restore
+    UNSPECV_ISYNC		; isync instruction
+    UNSPECV_MFTB			; move from time base
++   UNSPECV_DARN			; darn 1 (deliver a random number)
++   UNSPECV_DARN_32		; darn 2
++   UNSPECV_DARN_RAW		; darn 0
+    UNSPECV_NLGR			; non-local goto receiver
+    UNSPECV_MFFS			; Move from FPSCR
+    UNSPECV_MFFSL		; Move from FPSCR light instruction version
+@@ -14333,21 +14333,21 @@
+ 
+ (define_insn "darn_32"
+   [(set (match_operand:SI 0 "register_operand" "=r")
+-        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
+   "TARGET_P9_MISC"
+   "darn %0,0"
+   [(set_attr "type" "integer")])
+ 
+ (define_insn "darn_raw"
+   [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
+   "TARGET_P9_MISC && TARGET_64BIT"
+   "darn %0,2"
+   [(set_attr "type" "integer")])
+ 
+ (define_insn "darn"
+   [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
+   "TARGET_P9_MISC && TARGET_64BIT"
+   "darn %0,1"
+   [(set_attr "type" "integer")])
diff --git a/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch
new file mode 100644
index 0000000000..ba7130ca7d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.2/CVE-2019-15847_3.patch
@@ -0,0 +1,62 @@
+From dc4c8dd9dbe70740ec7a684b0f35620249fb036a Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 13:53:11 +0000
+Subject: [PATCH] 	Backport from trunk 	2019-08-23  Segher Boessenkool
+  <segher@kernel.crashing.org>
+
+gcc/testsuite/
+	PR target/91481
+	* gcc.target/powerpc/darn-3.c: New testcase.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-9-branch@275176 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-15847 p3
+Affects <= 9.2.0
+Dropped Changelog changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/testsuite/ChangeLog                   |  6 ++++++
+ gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
+ 2 files changed, 22 insertions(+)
+ create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
+
+Index: gcc-9.2.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
+===================================================================
+--- /dev/null
++++ gcc-9.2.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
+@@ -0,0 +1,16 @@
++/* { dg-do compile { target { powerpc*-*-* } } } */
++/* { dg-skip-if "" { powerpc*-*-aix* } } */
++/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
++
++static int darn32(void) { return __builtin_darn_32(); }
++
++int four(void)
++{
++	int sum = 0;
++	int i;
++	for (i = 0; i < 4; i++)
++		sum += darn32();
++	return sum;
++}
++
++/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
+Index: gcc-9.2.0/gcc/testsuite/ChangeLog
+===================================================================
+--- gcc-9.2.0.orig/gcc/testsuite/ChangeLog
++++ gcc-9.2.0/gcc/testsuite/ChangeLog
+@@ -1,3 +1,11 @@
++2019-08-30  Segher Boessenkool  <segher@kernel.crashing.org>
++
++	Backport from trunk
++	2019-08-23  Segher Boessenkool  <segher@kernel.crashing.org>
++
++	PR target/91481
++	* gcc.target/powerpc/darn-3.c: New testcase.
++
+ 2019-08-12  Release Manager
+ 
+ 	* GCC 9.2.0 released.
-- 
2.17.1


