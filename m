Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBAD60EE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 21:40:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ULeTue027432 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:40:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AHN7cM1SK7qr
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:40:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8ULeNTl027428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:40:24 +0100
Message-ID: <1380577220.18603.466.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Sep 2013 22:40:20 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Add fix for floating point issues on x86-64
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
X-List-Received-Date: Mon, 30 Sep 2013 21:40:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was a bug in handling of the mxcsr register since cpu flags
were not getting updated after fxrstor operations. This small tweak
fixes that.

[YOCTO #5248]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/qemu/files/fxrstorssefix.patch b/meta/recipes-devtools/qemu/files/fxrstorssefix.patch
new file mode 100644
index 0000000..59ab0f5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/fxrstorssefix.patch
@@ -0,0 +1,31 @@
+When we restore the mxcsr resgister with FXRSTOR, we need to update the various SSE
+flag files by calling update_sse_status() else we're using the flags from some other
+process with interesting results.
+
+The code isn't ordered to make this easy hence the function declaration.
+
+Upstream-Status: Pending
+
+RP 2013/9/30
+
+Index: qemu-1.5.0/target-i386/fpu_helper.c
+===================================================================
+--- qemu-1.5.0.orig/target-i386/fpu_helper.c	2013-09-30 18:46:39.283377648 +0000
++++ qemu-1.5.0/target-i386/fpu_helper.c	2013-09-30 18:46:56.895377232 +0000
+@@ -1149,6 +1149,8 @@
+     }
+ }
+ 
++static void update_sse_status(CPUX86State *env);
++
+ void helper_fxrstor(CPUX86State *env, target_ulong ptr, int data64)
+ {
+     int i, fpus, fptag, nb_xmm_regs;
+@@ -1180,6 +1182,7 @@
+     if (env->cr[4] & CR4_OSFXSR_MASK) {
+         /* XXX: finish it */
+         env->mxcsr = cpu_ldl_data(env, ptr + 0x18);
++        update_sse_status(env);
+         /* cpu_ldl_data(env, ptr + 0x1c); */
+         if (env->hflags & HF_CS64_MASK) {
+             nb_xmm_regs = 16;
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index d6dd743..06c2cdb 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://fdt_header.patch \
             file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
             file://target-ppc_fix_bit_extraction.patch \
+            file://fxrstorssefix.patch \
            "
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"



