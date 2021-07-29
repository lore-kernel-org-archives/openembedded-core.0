Received: from mail.lindev.ch (mail.lindev.ch [5.39.83.55])
 by mx.groups.io with SMTP id smtpd.web10.17382.1627602768513294613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@lindev.ch header.s=dkim header.b=KYbJ1B0h;
 spf=pass (domain: lindev.ch, ip: 5.39.83.55, mailfrom: bero@lindev.ch)
Received: from lindev.ch (unknown [87.122.204.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bero@lindev.ch)
	by mail.lindev.ch (Postfix) with ESMTPSA id 6CB5341002AB;
	Fri, 30 Jul 2021 01:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindev.ch; s=dkim;
	t=1627602764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aKneR5wrzbcXKShe5Ig6cv+WRLBCZWX6ERSJk7hGw+M=;
	b=KYbJ1B0h1C2/GH03kfgYniu7siTi8Xu6cljYE7FJEQgCUS4AQ/HgVSLiYGHeMAw16sGEZY
	nI2cmh00om3Bz25luRD2w+n5lgd1LJ7CnNUaFjaedkcH0nyZVycwZCeRbts0N9/gMiSNvP
	FftmmWpGyYi+t5ezF3+nMSsSPc63o2w=
From: bero@lindev.ch
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>
Subject: [PATCH] gcc: update 11.1 -> 11.2
Date: Fri, 30 Jul 2021 01:52:42 +0200
Message-Id: <20210729235242.1230800-1-bero@lindev.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update gcc, drop patches that have been merged upstream

Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
---
 .../gcc/{gcc-11.1.inc =3D> gcc-11.2.inc}        |  12 +-
 ...ian_11.1.bb =3D> gcc-cross-canadian_11.2.bb} |   0
 .../{gcc-cross_11.1.bb =3D> gcc-cross_11.2.bb}  |   0
 ...-crosssdk_11.1.bb =3D> gcc-crosssdk_11.2.bb} |   0
 ...cc-runtime_11.1.bb =3D> gcc-runtime_11.2.bb} |   0
 ...itizers_11.1.bb =3D> gcc-sanitizers_11.2.bb} |   0
 ...{gcc-source_11.1.bb =3D> gcc-source_11.2.bb} |   0
 ...nstallation-of-python-hooks-PR-99453.patch |  57 ----
 ...arc-Update-64bit-move-split-patterns.patch | 290 ------------------
 .../0039-arc-Fix-u-maddhisi-patterns.patch    | 127 --------
 .../0040-arc-Update-doloop_end-patterns.patch | 105 -------
 .../gcc/{gcc_11.1.bb =3D> gcc_11.2.bb}          |   0
 ...initial_11.1.bb =3D> libgcc-initial_11.2.bb} |   0
 .../gcc/{libgcc_11.1.bb =3D> libgcc_11.2.bb}    |   0
 ...ibgfortran_11.1.bb =3D> libgfortran_11.2.bb} |   0
 15 files changed, 3 insertions(+), 588 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.1.inc =3D> gcc-11.2.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.1.bb =3D> gcc-cr=
oss-canadian_11.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.1.bb =3D> gcc-cross_11.2.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.1.bb =3D> gcc-crosssdk=
_11.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.1.bb =3D> gcc-runtime_1=
1.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.1.bb =3D> gcc-saniti=
zers_11.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.1.bb =3D> gcc-source_11.=
2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-instal=
lation-of-python-hooks-PR-99453.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-m=
ove-split-patterns.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi=
-patterns.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_=
end-patterns.patch
 rename meta/recipes-devtools/gcc/{gcc_11.1.bb =3D> gcc_11.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.1.bb =3D> libgcc-ini=
tial_11.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.1.bb =3D> libgcc_11.2.bb} (1=
00%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.1.bb =3D> libgfortran_1=
1.2.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.2.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-11.1.inc
rename to meta/recipes-devtools/gcc/gcc-11.2.inc
index c21242af58..31dbc072b8 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "11.1.0"
+PV =3D "11.2.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "11.1.1"
+BINV =3D "11.2.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -27,7 +27,6 @@ LIC_FILES_CHKSUM =3D "\
 #BASEURI ?=3D "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;=
downloadfilename=3Dgcc-${PV}-${RELEASE}.zip"
=20
 BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
-            http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-=
9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=3Dyes;name=3Dbackpor=
ts \
            "
 SRC_URI =3D "\
            ${BASEURI} \
@@ -68,13 +67,8 @@ SRC_URI =3D "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-libstdc-Fix-installation-of-python-hooks-PR-99453=
.patch \
-           file://0038-arc-Update-64bit-move-split-patterns.patch \
-           file://0039-arc-Fix-u-maddhisi-patterns.patch \
-           file://0040-arc-Update-doloop_end-patterns.patch \
 "
-SRC_URI[sha256sum] =3D "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f=
076957afa1cc9ddf"
-SRC_URI[backports.sha256sum] =3D "69274bebd6c069a13443d4af61070e854740a6=
39ec4d66eedf3e80070363587b"
+SRC_URI[sha256sum] =3D "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba=
20f7aa2cda36fa8b"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
=20
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb b/meta/=
recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.1.bb b/meta/recipes-d=
evtools/gcc/gcc-cross_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb b/meta/recipe=
s-devtools/gcc/gcc-crosssdk_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb b/meta/reci=
pes-devtools/gcc/gcc-sanitizers_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.1.bb b/meta/recipes-=
devtools/gcc/gcc-source_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-=
of-python-hooks-PR-99453.patch b/meta/recipes-devtools/gcc/gcc/0001-libst=
dc-Fix-installation-of-python-hooks-PR-99453.patch
deleted file mode 100644
index d82f533cb4..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-libstdc-Fix-installation-of-pyth=
on-hooks-PR-99453.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ad4c21f0f59b52357019148ec94d767aa2acd8f2 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Tue, 1 Jun 2021 11:00:16 +0100
-Subject: [PATCH] libstdc++: Fix installation of python hooks [PR 99453]
-
-When no shared library is installed, the new code to determine the name
-of the -gdb.py file yields an empty string. Use the name of the static
-library in that case.
-
-libstdc++-v3/ChangeLog:
-
-	PR libstdc++/99453
-	* python/Makefile.am: Use archive name for printer hook if no
-	dynamic library name is available.
-	* python/Makefile.in: Regenerate.
-
-(cherry picked from commit 9f7bc160b4a0f27dce248d1226e3ae7104b0e67b)
----
- libstdc++-v3/python/Makefile.am | 4 ++++
- libstdc++-v3/python/Makefile.in | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makef=
ile.am
-index 0c2b207b86e..8efefa5725c 100644
---- a/libstdc++-v3/python/Makefile.am
-+++ b/libstdc++-v3/python/Makefile.am
-@@ -48,5 +48,9 @@ install-data-local: gdb.py
- ## the correct name.
- 	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
- 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+	if [ -z "$$libname" ]; then \
-+	  libname=3D`sed -ne "/^old_library=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;}=
" \
-+		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+	fi; \
- 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
- 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
-diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makef=
ile.in
-index 2efe0b96a19..9904a9197de 100644
---- a/libstdc++-v3/python/Makefile.in
-+++ b/libstdc++-v3/python/Makefile.in
-@@ -609,6 +609,10 @@ install-data-local: gdb.py
- 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
- 	@libname=3D`sed -ne "/^library_names=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;=
}" \
- 	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+	if [ -z "$$libname" ]; then \
-+	  libname=3D`sed -ne "/^old_library=3D/{s/.*=3D'//;s/'$$//;s/ .*//;p;}=
" \
-+		  $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
-+	fi; \
- 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gd=
b.py"; \
- 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
-=20
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-spl=
it-patterns.patch b/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-m=
ove-split-patterns.patch
deleted file mode 100644
index 37fe95d711..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0038-arc-Update-64bit-move-split-patt=
erns.patch
+++ /dev/null
@@ -1,290 +0,0 @@
-From 0061fabeb9393c362601486105202cfe837a5a68 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 9 Jun 2021 12:12:57 +0300
-Subject: [PATCH] arc: Update 64bit move split patterns.
-
-ARCv2HS can use a limited number of instructions to implement 64bit
-moves. The VADD2 is used as a 64bit move, the LDD/STD are 64 bit loads
-and stores. All those instructions are not baseline, hence we need to
-provide alternatives when they are not available or cannot be generate
-due to instruction restriction.
-
-This patch is cleaning up those move patterns, and updates splits
-instruction lengths.
-
-This is a backport from mainline gcc.
-
-gcc/
-2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc-protos.h (arc_split_move_p): New prototype.
-	* config/arc/arc.c (arc_split_move_p): New function.
-	(arc_split_move): Clean up.
-	* config/arc/arc.md (movdi_insn): Clean up, use arc_split_move_p.
-	(movdf_insn): Likewise.
-	* config/arc/simdext.md (mov<VWH>_insn): Likewise.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D0061fabeb9393c362601486105202cfe837a5a68]
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-(cherry picked from commit c0ba7a8af5366c37241f20e8be41e362f7260389)
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gcc/config/arc/arc-protos.h |  1 +
- gcc/config/arc/arc.c        | 44 ++++++++++++----------
- gcc/config/arc/arc.md       | 91 +++++++++-----------------------------=
-------
- gcc/config/arc/simdext.md   | 38 ++++---------------
- 4 files changed, 52 insertions(+), 122 deletions(-)
-
-diff --git a/gcc/config/arc/arc-protos.h b/gcc/config/arc/arc-protos.h
-index 1f56a0d82e4..62d7e45d29d 100644
---- a/gcc/config/arc/arc-protos.h
-+++ b/gcc/config/arc/arc-protos.h
-@@ -50,6 +50,7 @@ extern void arc_split_ior (rtx *);
- extern bool arc_check_mov_const (HOST_WIDE_INT );
- extern bool arc_split_mov_const (rtx *);
- extern bool arc_can_use_return_insn (void);
-+extern bool arc_split_move_p (rtx *);
- #endif /* RTX_CODE */
-=20
- extern bool arc_ccfsm_branch_deleted_p (void);
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 3201c3fefd7..db541bc11f5 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -10129,6 +10129,31 @@ arc_process_double_reg_moves (rtx *operands)
-   return true;
- }
-=20
-+
-+/* Check if we need to split a 64bit move.  We do not need to split it =
if we can
-+   use vadd2 or ldd/std instructions.  */
-+
-+bool
-+arc_split_move_p (rtx *operands)
-+{
-+  machine_mode mode =3D GET_MODE (operands[0]);
-+
-+  if (TARGET_LL64
-+      && ((memory_operand (operands[0], mode)
-+	   && (even_register_operand (operands[1], mode)
-+	       || satisfies_constraint_Cm3 (operands[1])))
-+	  || (memory_operand (operands[1], mode)
-+	      && even_register_operand (operands[0], mode))))
-+    return false;
-+
-+  if (TARGET_PLUS_QMACW
-+      && even_register_operand (operands[0], mode)
-+      && even_register_operand (operands[1], mode))
-+    return false;
-+
-+  return true;
-+}
-+
- /* operands 0..1 are the operands of a 64 bit move instruction.
-    split it into two moves with operands 2/3 and 4/5.  */
-=20
-@@ -10146,25 +10171,6 @@ arc_split_move (rtx *operands)
-       return;
-   }
-=20
--  if (TARGET_LL64
--      && ((memory_operand (operands[0], mode)
--	   && (even_register_operand (operands[1], mode)
--	       || satisfies_constraint_Cm3 (operands[1])))
--	  || (memory_operand (operands[1], mode)
--	      && even_register_operand (operands[0], mode))))
--    {
--      emit_move_insn (operands[0], operands[1]);
--      return;
--    }
--
--  if (TARGET_PLUS_QMACW
--      && even_register_operand (operands[0], mode)
--      && even_register_operand (operands[1], mode))
--    {
--      emit_move_insn (operands[0], operands[1]);
--      return;
--    }
--
-   if (TARGET_PLUS_QMACW
-       && GET_CODE (operands[1]) =3D=3D CONST_VECTOR)
-     {
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index 7a52551eef5..91a838a38e4 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -1329,47 +1329,20 @@ core_3, archs4x, archs4xd, archs4xd_slow"
-   "register_operand (operands[0], DImode)
-    || register_operand (operands[1], DImode)
-    || (satisfies_constraint_Cm3 (operands[1])
--      && memory_operand (operands[0], DImode))"
--  "*
--{
--  switch (which_alternative)
--    {
--    default:
--      return \"#\";
--
--    case 0:
--    if (TARGET_PLUS_QMACW
--	&& even_register_operand (operands[0], DImode)
--	&& even_register_operand (operands[1], DImode))
--      return \"vadd2%?\\t%0,%1,0\";
--    return \"#\";
--
--    case 2:
--    if (TARGET_LL64
--        && memory_operand (operands[1], DImode)
--	&& even_register_operand (operands[0], DImode))
--      return \"ldd%U1%V1 %0,%1%&\";
--    return \"#\";
--
--    case 3:
--    if (TARGET_LL64
--	&& memory_operand (operands[0], DImode)
--	&& (even_register_operand (operands[1], DImode)
--	    || satisfies_constraint_Cm3 (operands[1])))
--     return \"std%U0%V0 %1,%0\";
--    return \"#\";
--    }
--}"
--  "&& reload_completed"
-+       && memory_operand (operands[0], DImode))"
-+  "@
-+   vadd2\\t%0,%1,0
-+   #
-+   ldd%U1%V1\\t%0,%1
-+   std%U0%V0\\t%1,%0"
-+  "&& reload_completed && arc_split_move_p (operands)"
-   [(const_int 0)]
-   {
-    arc_split_move (operands);
-    DONE;
-   }
-   [(set_attr "type" "move,move,load,store")
--   ;; ??? The ld/st values could be 4 if it's [reg,bignum].
--   (set_attr "length" "8,16,*,*")])
--
-+   (set_attr "length" "8,16,16,16")])
-=20
- ;; Floating point move insns.
-=20
-@@ -1408,50 +1381,22 @@ core_3, archs4x, archs4xd, archs4xd_slow"
- (define_insn_and_split "*movdf_insn"
-   [(set (match_operand:DF 0 "move_dest_operand"      "=3DD,r,r,r,r,m")
- 	(match_operand:DF 1 "move_double_src_operand" "r,D,r,E,m,r"))]
--  "register_operand (operands[0], DFmode)
--   || register_operand (operands[1], DFmode)"
--  "*
--{
-- switch (which_alternative)
--   {
--    default:
--      return \"#\";
--
--    case 2:
--    if (TARGET_PLUS_QMACW
--	&& even_register_operand (operands[0], DFmode)
--	&& even_register_operand (operands[1], DFmode))
--      return \"vadd2%?\\t%0,%1,0\";
--    return \"#\";
--
--    case 4:
--    if (TARGET_LL64
--	&& ((even_register_operand (operands[0], DFmode)
--	     && memory_operand (operands[1], DFmode))
--	    || (memory_operand (operands[0], DFmode)
--	        && even_register_operand (operands[1], DFmode))))
--      return \"ldd%U1%V1 %0,%1%&\";
--    return \"#\";
--
--    case 5:
--    if (TARGET_LL64
--	&& ((even_register_operand (operands[0], DFmode)
--	     && memory_operand (operands[1], DFmode))
--	    || (memory_operand (operands[0], DFmode)
--		&& even_register_operand (operands[1], DFmode))))
--     return \"std%U0%V0 %1,%0\";
--    return \"#\";
--   }
--}"
--  "reload_completed"
-+  "(register_operand (operands[0], DFmode)
-+    || register_operand (operands[1], DFmode))"
-+  "@
-+   #
-+   #
-+   vadd2\\t%0,%1,0
-+   #
-+   ldd%U1%V1\\t%0,%1
-+   std%U0%V0\\t%1,%0"
-+  "&& reload_completed && arc_split_move_p (operands)"
-   [(const_int 0)]
-   {
-    arc_split_move (operands);
-    DONE;
-   }
-   [(set_attr "type" "move,move,move,move,load,store")
--   (set_attr "predicable" "no,no,no,yes,no,no")
--   ;; ??? The ld/st values could be 16 if it's [reg,bignum].
-    (set_attr "length" "4,16,8,16,16,16")])
-=20
- (define_insn_and_split "*movdf_insn_nolrsr"
-diff --git a/gcc/config/arc/simdext.md b/gcc/config/arc/simdext.md
-index f0900757452..36f41a5c3d0 100644
---- a/gcc/config/arc/simdext.md
-+++ b/gcc/config/arc/simdext.md
-@@ -1402,41 +1402,19 @@
- 	(match_operand:VWH 1 "general_operand"    "i,r,m,r"))]
-   "(register_operand (operands[0], <MODE>mode)
-        || register_operand (operands[1], <MODE>mode))"
--  "*
--{
--  switch (which_alternative)
--    {
--     default:
--       return \"#\";
--
--     case 1:
--       if (TARGET_PLUS_QMACW
--           && even_register_operand (operands[0], <MODE>mode)
--	   && even_register_operand (operands[1], <MODE>mode))
--         return \"vadd2%?\\t%0,%1,0\";
--       return \"#\";
--
--     case 2:
--       if (TARGET_LL64)
--         return \"ldd%U1%V1 %0,%1\";
--       return \"#\";
--
--     case 3:
--       if (TARGET_LL64)
--	   return \"std%U0%V0 %1,%0\";
--	 return \"#\";
--    }
--}"
--  "reload_completed"
-+  "@
-+   #
-+   vadd2\\t%0,%1,0
-+   ldd%U1%V1\\t%0,%1
-+   std%U0%V0\\t%1,%0"
-+  "&& reload_completed && arc_split_move_p (operands)"
-   [(const_int 0)]
-   {
-    arc_split_move (operands);
-    DONE;
-   }
--  [(set_attr "type" "move,multi,load,store")
--   (set_attr "predicable" "no,no,no,no")
--   (set_attr "iscompact"  "false,false,false,false")
--   ])
-+  [(set_attr "type" "move,move,load,store")
-+   (set_attr "length" "16,8,16,16")])
-=20
- (define_expand "movmisalign<mode>"
-  [(set (match_operand:VWH 0 "general_operand" "")
---=20
-2.16.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patter=
ns.patch b/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns=
.patch
deleted file mode 100644
index 9c5a2b8b33..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0039-arc-Fix-u-maddhisi-patterns.patc=
h
+++ /dev/null
@@ -1,127 +0,0 @@
-From 4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 9 Jun 2021 12:12:57 +0300
-Subject: [PATCH] arc: Fix (u)maddhisi patterns
-
-Rework the (u)maddhisi4 patterns and use VMAC2H(U) instruction instead
-of the 64bit MAC(U) instruction.
-This fixes the next execute.exp failures:
-     arith-rand-ll.c   -O2  execution test
-     arith-rand-ll.c   -O3  execution test
-     pr78726.c   -O2  execution test
-     pr78726.c   -O3  execution test
-
-gcc/
-2021-06-09  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.md (maddhisi4): Use VMAC2H instruction.
-	(machi): New pattern.
-	(umaddhisi4): Use VMAC2HU instruction.
-	(umachi): New pattern.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D4186b7e93be73f8d68dc0fcc00a4cc8cc83e99a8]
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-(cherry picked from commit dd4778a59b4693777c732075021375e19eee6a76)
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gcc/config/arc/arc.md | 66 ++++++++++++++++++++++++++++++++------------=
-------
- 1 file changed, 41 insertions(+), 25 deletions(-)
-
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index 91a838a38e4..2a7e087ff72 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -6053,48 +6053,64 @@ core_3, archs4x, archs4xd, archs4xd_slow"
-=20
- ;; MAC and DMPY instructions
-=20
--; Use MAC instruction to emulate 16bit mac.
-+; Use VMAC2H(U) instruction to emulate scalar 16bit mac.
- (define_expand "maddhisi4"
-   [(match_operand:SI 0 "register_operand" "")
-    (match_operand:HI 1 "register_operand" "")
-    (match_operand:HI 2 "extend_operand"   "")
-    (match_operand:SI 3 "register_operand" "")]
--  "TARGET_PLUS_DMPY"
-+  "TARGET_PLUS_MACD"
-   "{
--   rtx acc_reg =3D gen_rtx_REG (DImode, ACC_REG_FIRST);
--   rtx tmp1 =3D gen_reg_rtx (SImode);
--   rtx tmp2 =3D gen_reg_rtx (SImode);
--   rtx accl =3D gen_lowpart (SImode, acc_reg);
--
--   emit_move_insn (accl, operands[3]);
--   emit_insn (gen_rtx_SET (tmp1, gen_rtx_SIGN_EXTEND (SImode, operands[=
1])));
--   emit_insn (gen_rtx_SET (tmp2, gen_rtx_SIGN_EXTEND (SImode, operands[=
2])));
--   emit_insn (gen_mac (tmp1, tmp2));
--   emit_move_insn (operands[0], accl);
-+   rtx acc_reg =3D gen_rtx_REG (SImode, ACC_REG_FIRST);
-+
-+   emit_move_insn (acc_reg, operands[3]);
-+   emit_insn (gen_machi (operands[1], operands[2]));
-+   emit_move_insn (operands[0], acc_reg);
-    DONE;
-   }")
-=20
--; The same for the unsigned variant, but using MACU instruction.
-+(define_insn "machi"
-+  [(set (reg:SI ARCV2_ACC)
-+	(plus:SI
-+	 (mult:SI (sign_extend:SI (match_operand:HI 0 "register_operand" "%r")=
)
-+		  (sign_extend:SI (match_operand:HI 1 "register_operand" "r")))
-+	 (reg:SI ARCV2_ACC)))]
-+  "TARGET_PLUS_MACD"
-+  "vmac2h\\t0,%0,%1"
-+  [(set_attr "length" "4")
-+   (set_attr "type" "multi")
-+   (set_attr "predicable" "no")
-+   (set_attr "cond" "nocond")])
-+
-+; The same for the unsigned variant, but using VMAC2HU instruction.
- (define_expand "umaddhisi4"
-   [(match_operand:SI 0 "register_operand" "")
-    (match_operand:HI 1 "register_operand" "")
--   (match_operand:HI 2 "extend_operand"   "")
-+   (match_operand:HI 2 "register_operand" "")
-    (match_operand:SI 3 "register_operand" "")]
--  "TARGET_PLUS_DMPY"
-+  "TARGET_PLUS_MACD"
-   "{
--   rtx acc_reg =3D gen_rtx_REG (DImode, ACC_REG_FIRST);
--   rtx tmp1 =3D gen_reg_rtx (SImode);
--   rtx tmp2 =3D gen_reg_rtx (SImode);
--   rtx accl =3D gen_lowpart (SImode, acc_reg);
--
--   emit_move_insn (accl, operands[3]);
--   emit_insn (gen_rtx_SET (tmp1, gen_rtx_ZERO_EXTEND (SImode, operands[=
1])));
--   emit_insn (gen_rtx_SET (tmp2, gen_rtx_ZERO_EXTEND (SImode, operands[=
2])));
--   emit_insn (gen_macu (tmp1, tmp2));
--   emit_move_insn (operands[0], accl);
-+   rtx acc_reg =3D gen_rtx_REG (SImode, ACC_REG_FIRST);
-+
-+   emit_move_insn (acc_reg, operands[3]);
-+   emit_insn (gen_umachi (operands[1], operands[2]));
-+   emit_move_insn (operands[0], acc_reg);
-    DONE;
-   }")
-=20
-+(define_insn "umachi"
-+  [(set (reg:SI ARCV2_ACC)
-+	(plus:SI
-+	 (mult:SI (zero_extend:SI (match_operand:HI 0 "register_operand" "%r")=
)
-+		  (zero_extend:SI (match_operand:HI 1 "register_operand" "r")))
-+	 (reg:SI ARCV2_ACC)))]
-+  "TARGET_PLUS_MACD"
-+  "vmac2hu\\t0,%0,%1"
-+  [(set_attr "length" "4")
-+   (set_attr "type" "multi")
-+   (set_attr "predicable" "no")
-+   (set_attr "cond" "nocond")])
-+
- (define_expand "maddsidi4"
-   [(match_operand:DI 0 "register_operand" "")
-    (match_operand:SI 1 "register_operand" "")
---=20
-2.16.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-pat=
terns.patch b/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-pa=
tterns.patch
deleted file mode 100644
index 5f0bf8df8f..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0040-arc-Update-doloop_end-patterns.p=
atch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 5a9b6a004f89fdd95b0470e1324dc4dee8c41d24 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Wed, 9 Jun 2021 12:12:57 +0300
-Subject: [PATCH] arc: Update doloop_end patterns
-
-ARC processor can use LP instruction to implement zero overlay loops.
-The current inplementation doesn't handle the unlikely situation when
-the loop iterator is located in memory.  Refurbish the loop_end insn
-pattern into a define_insn_and_split pattern.
-
-gcc/
-2021-07-09  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.md (loop_end): Change it to
-	define_insn_and_split.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D5a9b6a004f89fdd95b0470e1324dc4dee8c41d24]
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-(cherry picked from commit 174e75a210753b68de0f2c398a13ace0f512e35b)
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gcc/config/arc/arc.md | 46 ++++++++++++++++++++------------------------=
--
- 1 file changed, 20 insertions(+), 26 deletions(-)
-
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index 2a7e087ff72..d704044c13f 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -4986,7 +4986,7 @@ core_3, archs4x, archs4xd, archs4xd_slow"
- (define_expand "doloop_end"
-   [(parallel [(set (pc)
- 		   (if_then_else
--		    (ne (match_operand 0 "" "")
-+		    (ne (match_operand 0 "nonimmediate_operand")
- 			(const_int 1))
- 		    (label_ref (match_operand 1 "" ""))
- 		    (pc)))
-@@ -5012,44 +5012,38 @@ core_3, archs4x, archs4xd, archs4xd_slow"
-=20
- ;; if by any chance the lp_count is not used, then use an 'r'
- ;; register, instead of going to memory.
--(define_insn "loop_end"
--  [(set (pc)
--	(if_then_else (ne (match_operand:SI 2 "nonimmediate_operand" "0,m")
--			  (const_int 1))
--		      (label_ref (match_operand 1 "" ""))
--		      (pc)))
--   (set (match_operand:SI 0 "nonimmediate_operand" "=3Dr,m")
--	(plus (match_dup 2) (const_int -1)))
--   (unspec [(const_int 0)] UNSPEC_ARC_LP)
--   (clobber (match_scratch:SI 3 "=3DX,&r"))]
--  ""
--  "; ZOL_END, begins @%l1"
--  [(set_attr "length" "0")
--   (set_attr "predicable" "no")
--   (set_attr "type" "loop_end")])
--
- ;; split pattern for the very slim chance when the loop register is
- ;; memory.
--(define_split
-+(define_insn_and_split "loop_end"
-   [(set (pc)
--	(if_then_else (ne (match_operand:SI 0 "memory_operand")
-+	(if_then_else (ne (match_operand:SI 0 "nonimmediate_operand" "+r,!m")
- 			  (const_int 1))
--		      (label_ref (match_operand 1 ""))
-+		      (label_ref (match_operand 1 "" ""))
- 		      (pc)))
-    (set (match_dup 0) (plus (match_dup 0) (const_int -1)))
-    (unspec [(const_int 0)] UNSPEC_ARC_LP)
--   (clobber (match_scratch:SI 2))]
--  "memory_operand (operands[0], SImode)"
-+   (clobber (match_scratch:SI 2 "=3DX,&r"))]
-+  ""
-+  "@
-+   ; ZOL_END, begins @%l1
-+   #"
-+  "reload_completed && memory_operand (operands[0], Pmode)"
-   [(set (match_dup 2) (match_dup 0))
--   (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))
-+   (parallel
-+    [(set (reg:CC_ZN CC_REG)
-+	  (compare:CC_ZN (plus:SI (match_dup 2) (const_int -1))
-+			 (const_int 0)))
-+     (set (match_dup 2) (plus:SI (match_dup 2) (const_int -1)))])
-    (set (match_dup 0) (match_dup 2))
--   (set (reg:CC CC_REG) (compare:CC (match_dup 2) (const_int 0)))
-    (set (pc)
--	(if_then_else (ne (reg:CC CC_REG)
-+	(if_then_else (ne (reg:CC_ZN CC_REG)
- 			  (const_int 0))
- 		      (label_ref (match_dup 1))
- 		      (pc)))]
--  "")
-+  ""
-+  [(set_attr "length" "0,24")
-+   (set_attr "predicable" "no")
-+   (set_attr "type" "loop_end")])
-=20
- (define_insn "loop_fail"
-   [(set (reg:SI LP_COUNT)
---=20
-2.16.2
-
diff --git a/meta/recipes-devtools/gcc/gcc_11.1.bb b/meta/recipes-devtool=
s/gcc/gcc_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.1.bb
rename to meta/recipes-devtools/gcc/gcc_11.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.1.bb b/meta/reci=
pes-devtools/gcc/libgcc-initial_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.1.bb b/meta/recipes-devt=
ools/gcc/libgcc_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.1.bb
rename to meta/recipes-devtools/gcc/libgcc_11.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.1.bb b/meta/recipes=
-devtools/gcc/libgfortran_11.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.2.bb
--=20
2.32.0

