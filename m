Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1078A60043
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BGtB4A004657; Mon, 11 May 2015 17:55:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RH1tfnwqxEPZ; Mon, 11 May 2015 17:55:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BGsvAR004647
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 May 2015 17:55:09 +0100
Message-ID: <1431363297.30971.76.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 17:54:57 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc5: Add PR65779 patch to fix powerpc compile issues
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
X-List-Received-Date: Mon, 11 May 2015 16:55:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes compile issues on powerpc with gcc 5 which show up with
errors like:

| make[2]: Entering directory '/media/build1/poky/build/tmp/work/ppc7400-poky-linux/xprop/1_1.2.2-r0/build'
| powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 --sysroot=/media/build1/poky/build/tmp/sysroots/qemuppc -Wall -Wpointer-arith -Wmissing-declarations -Wformat=2 -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wbad-function-cast -Wold-style-definition -Wdeclaration-after-statement -Wunused -Wuninitialized -Wshadow -Wmissing-noreturn -Wmissing-format-attribute -Wredundant-decls -Wlogical-op -Werror=implicit -Werror=nonnull -Werror=init-self -Werror=main -Werror=missing-braces -Werror=sequence-point -Werror=return-type -Werror=trigraphs -Werror=array-bounds -Werror=write-strings -Werror=address -Werror=int-to-pointer-cast -Werror=pointer-to-int-cast -fno-strict-aliasing  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o xprop dsimple.o clientwin.o xprop.o -lX11
| /media/build1/poky/build/tmp/sysroots/qemuppc/usr/lib/../lib/libX11.so: undefined reference to `.LCL2'
| collect2: error: ld returned 1 exit status

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index db4c795..305736b 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -68,6 +68,7 @@ SRC_URI = "\
            file://0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
            file://0035-Dont-link-the-plugins-with-libgomp-explicitly.patch \
            file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0037-pr65779.patch \
           "
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0037-pr65779.patch b/meta/recipes-devtools/gcc/gcc-5.1/0037-pr65779.patch
new file mode 100644
index 0000000..1424673
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.1/0037-pr65779.patch
@@ -0,0 +1,173 @@
+List-Id: <gcc-patches.gcc.gnu.org>
+List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
+List-Post: <mailto:gcc-patches at gcc dot gnu dot org>
+List-Help: <mailto:gcc-patches-help at gcc dot gnu dot org>
+Date: Mon, 20 Apr 2015 12:40:49 +0930
+From: Alan Modra <amodra at gmail dot com>
+To: gcc-patches at gcc dot gnu dot org
+Subject: [Patch] pr65779 - [5/6 Regression] undefined local symbol on powerpc
+
+This patch removes bogus debug info left around by shrink-wrapping,
+which on some powerpc targets with just the right register allocation
+led to assembly errors.
+
+Bootstrapped and regression tested powerpc64-linux and x86_64-linux.
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65779
+
+gcc/
+	PR debug/65779
+	* shrink-wrap.c (insn_uses_reg): New function.
+	(move_insn_for_shrink_wrap): Remove debug insns using regs set
+	by the moved insn.
+gcc/testsuite/
+	* gcc.dg/pr65779.c: New.
+	
+Upstream-Status: Pending (from mailing list, not merged yet)
+
+Index: a/gcc/shrink-wrap.c
+===================================================================
+--- a/gcc/shrink-wrap.c.orig
++++ b/gcc/shrink-wrap.c
+@@ -182,6 +182,21 @@ live_edge_for_reg (basic_block bb, int r
+   return live_edge;
+ }
+ 
++static bool
++insn_uses_reg (rtx_insn *insn, unsigned int regno, unsigned int end_regno)
++{
++  df_ref use;
++
++  FOR_EACH_INSN_USE (use, insn)
++    {
++      rtx reg = DF_REF_REG (use);
++
++      if (REG_P (reg) && REGNO (reg) >= regno && REGNO (reg) < end_regno)
++	return true;
++    }
++  return false;
++}
++
+ /* Try to move INSN from BB to a successor.  Return true on success.
+    USES and DEFS are the set of registers that are used and defined
+    after INSN in BB.  SPLIT_P indicates whether a live edge from BB
+@@ -340,10 +355,15 @@ move_insn_for_shrink_wrap (basic_block b
+       *split_p = true;
+     }
+ 
++  vec<basic_block> live_bbs;
++  if (MAY_HAVE_DEBUG_INSNS)
++    live_bbs.create (5);
+   /* At this point we are committed to moving INSN, but let's try to
+      move it as far as we can.  */
+   do
+     {
++      if (MAY_HAVE_DEBUG_INSNS)
++	live_bbs.safe_push (bb);
+       live_out = df_get_live_out (bb);
+       live_in = df_get_live_in (next_block);
+       bb = next_block;
+@@ -426,6 +446,34 @@ move_insn_for_shrink_wrap (basic_block b
+ 	SET_REGNO_REG_SET (bb_uses, i);
+     }
+ 
++  /* Remove debug insns using regs set by the insn we are moving.  */
++  if (MAY_HAVE_DEBUG_INSNS)
++    {
++      while (!live_bbs.is_empty ())
++	{
++	  rtx_insn *dinsn;
++	  basic_block tmp_bb = live_bbs.pop ();
++
++	  FOR_BB_INSNS_REVERSE (tmp_bb, dinsn)
++	    {
++	      if (dinsn == insn)
++		break;
++	      if (DEBUG_INSN_P (dinsn)
++		  && insn_uses_reg (dinsn, dregno, end_dregno))
++		{
++		  if (*split_p)
++		    /* If split, then we will be moving insn into a
++		       newly created block immediately after the entry
++		       block.  Move the debug info there too.  */
++		    emit_debug_insn_after (PATTERN (dinsn), bb_note (bb));
++		  delete_insn (dinsn);
++		  break;
++		}
++	    }
++	}
++      live_bbs.release ();
++    }
++
+   emit_insn_after (PATTERN (insn), bb_note (bb));
+   delete_insn (insn);
+   return true;
+Index: b/gcc/testsuite/gcc.dg/pr65779.c
+===================================================================
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr65779.c
+@@ -0,0 +1,64 @@
++/* { dg-do run } */
++/* { dg-options "-O2 -g" } */
++/* { dg-additional-options "-mrelocatable" { target powerpc-*-rtems* } } */
++
++unsigned long __attribute__ ((noinline))
++adler32 (unsigned long adler, unsigned char *buf, unsigned int len)
++{
++  unsigned long s1 = adler & 0xffff;
++  unsigned long s2 = (adler >> 16) & 0xffff;
++  int k;
++
++  if (buf == 0)
++    return 1L;
++
++  while (len > 0)
++    {
++      k = len < 5552 ? len : 5552;
++      len -= k;
++      while (k >= 16)
++	{
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  s1 += *buf++; s2 += s1;
++	  k -= 16;
++	}
++      if (k != 0)
++	do
++	  {
++	    s1 += *buf++; s2 += s1;
++	  } while (--k);
++      s1 &= 0xffffffffUL;
++      s2 &= 0xffffffffUL;
++      s1 %= 65521L;
++      s2 %= 65521L;
++    }
++  return (s2 << 16) | s1;
++}
++
++unsigned char buf[] = { 0, 1, 2, 3, 4, 5, 6, 7,
++			8, 9, 10, 11, 12, 13, 14, 15,
++			0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
++			0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
++			0x55, 0xaa };
++int
++main ()
++{
++  unsigned long x = adler32 (0, buf, sizeof buf);
++  if (x != 0x640409efUL)
++    __builtin_abort ();
++  return 0;
++}



