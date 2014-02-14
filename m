Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 817D06EFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 02:38:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1E2cdkG000694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:38:39 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 13 Feb 2014 18:38:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 10:40:57 +0800
Message-ID: <bb2f7982a6dbb66ad9a15458f8d233bbaa3b2f41.1392345397.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392345397.git.liezhi.yang@windriver.com>
References: <cover.1392345397.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM
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
X-List-Received-Date: Fri, 14 Feb 2014 02:38:38 -0000
Content-Type: text/plain

From: Holger Hans Peter Freyther <holger@moiji-mobile.com>

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

(From OE-Core master rev: 3004eb3b7ee5fd8dfe9c4e5749b4e125d0bd4b59)

Signed-off-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../0048-PR58854_fix_arm_apcs_epilogue.patch       | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index b34c7ae..f1260af 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -78,6 +78,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
 	   file://0048-PR57532.patch \
+	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
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
1.8.3.1


