Return-Path: <holger@moiji-mobile.com>
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id D3DED6E98A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:45:57 +0000 (UTC)
Received: from sangmingze-mail.local (p5099b351.dip0.t-ipconnect.de
	[80.153.179.81])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 2F459410CD;
	Fri, 31 Jan 2014 09:45:54 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.82)
	(envelope-from <holger@moiji-mobile.com>)
	id 1W9AfT-0006gr-A9; Fri, 31 Jan 2014 10:45:47 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:45:17 +0100
Message-Id: <1391161517-25628-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.8.5.2
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [PATCH] gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM
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
X-List-Received-Date: Fri, 31 Jan 2014 09:45:58 -0000

GCC 4.8.0, 4.8.1 and 4.8.2 can generate broken epilogues for the
ABI used by the kernel. Apply the patch that is included for GCC
4.8.3 from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854.

The issue was found on Yocto/Dora and the patch should be backported
to this branch. A kernel built with Dora's GCC 4.8.1 misbehaved on:

 while true;
 do
    (for i in `seq 1 100`;
        do
            echo "Log message... $RANDOM";
        done) | logger;
 done

busybox's syslogd would from time to read a huge negative value and
then exit, strace would get stuck waiting on a syscall. After this
patch it appears to work better.

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../0048-PR58854_fix_arm_apcs_epilogue.patch       | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index a140573..fdd0c12 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -68,6 +68,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
+	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
 	  "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
new file mode 100644
index 0000000..0ef245a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
@@ -0,0 +1,23 @@
+Backport fix for PR target/58854
+
+2013-11-11  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+       Backported from mainline
+        2013-10-30  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+       PR target/58854
+       * config/arm/arm.c (arm_expand_epilogue_apcs_frame): Emit blockage
+
+
+Upstream-Status: Backport
+
+--- gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 08:00:45	204664
++++ gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 09:38:14	204665
+@@ -23555,6 +23555,7 @@
+   num_regs = bit_count (saved_regs_mask);
+   if ((offsets->outgoing_args != (1 + num_regs)) || cfun->calls_alloca)
+     {
++      emit_insn (gen_blockage ());
+       /* Unwind the stack to just below the saved registers.  */
+       emit_insn (gen_addsi3 (stack_pointer_rtx,
+                              hard_frame_pointer_rtx,
-- 
1.8.5.2


