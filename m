Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA8DB60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2O98wC6012593 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:08:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gwNDQ-XtuO7d
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:08:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2O98f8k012590
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 09:08:53 GMT
Message-ID: <1427188121.14020.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2015 09:08:41 +0000
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Add patch to fix qemux86-64 EDSCA key problems
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
X-List-Received-Date: Tue, 24 Mar 2015 09:09:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this patch, x86_64 images would show invalid EDSCA key errors
with sshd from openssh (but not dropbear) during init.

This would cause problems with operation with some distros where EDSCA
keys were mandatory. The issue was present in qemu 2.2.1 and not in
2.3.0-rc0, bisected to this commit which was then backported. This fixes 
intermittent failures on the autobuilder. Issue is not present when
using KVM (consistent with a fault in TCG).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch b/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
new file mode 100644
index 0000000..6972355
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
@@ -0,0 +1,59 @@
+Without this patch, x86_64 images would show invalid EDSCA key errors
+with sshd from openssh (but not dropbear) during init. 
+
+This would cause problems with operation with some distros where EDSCA 
+keys were mandatory. The issue was present in qemu 2.2.1 and not in 
+2.3.0-rc0, bisected to this commit which was then backported.
+
+From 37ed3bf1ee07bb1a26adca0df8718f601f231c0b Mon Sep 17 00:00:00 2001
+From: Richard Henderson <rth@twiddle.net>
+Date: Fri, 20 Feb 2015 11:13:50 -0800
+Subject: [PATCH] tcg: Complete handling of ALWAYS and NEVER
+
+Missing from movcond
+
+Signed-off-by: Richard Henderson <rth@twiddle.net>
+---
+ tcg/tcg-op.c |   22 +++++++++++++++++-----
+ 1 files changed, 17 insertions(+), 5 deletions(-)
+
+Upstream-Status: Backport
+RP 2015/3/24
+
+Index: qemu-2.2.0/tcg/tcg-op.h
+===================================================================
+--- qemu-2.2.0.orig/tcg/tcg-op.h
++++ qemu-2.2.0/tcg/tcg-op.h
+@@ -2186,7 +2186,11 @@ static inline void tcg_gen_movcond_i32(T
+                                        TCGv_i32 c1, TCGv_i32 c2,
+                                        TCGv_i32 v1, TCGv_i32 v2)
+ {
+-    if (TCG_TARGET_HAS_movcond_i32) {
++    if (cond == TCG_COND_ALWAYS) {
++        tcg_gen_mov_i32(ret, v1);
++    } else if (cond == TCG_COND_NEVER) {
++        tcg_gen_mov_i32(ret, v2);
++    } else if (TCG_TARGET_HAS_movcond_i32) {
+         tcg_gen_op6i_i32(INDEX_op_movcond_i32, ret, c1, c2, v1, v2, cond);
+     } else {
+         TCGv_i32 t0 = tcg_temp_new_i32();
+@@ -2205,6 +2209,11 @@ static inline void tcg_gen_movcond_i64(T
+                                        TCGv_i64 c1, TCGv_i64 c2,
+                                        TCGv_i64 v1, TCGv_i64 v2)
+ {
++    if (cond == TCG_COND_ALWAYS) {
++        tcg_gen_mov_i64(ret, v1);
++    } else if (cond == TCG_COND_NEVER) {
++        tcg_gen_mov_i64(ret, v2);
++    } else {
+ #if TCG_TARGET_REG_BITS == 32
+     TCGv_i32 t0 = tcg_temp_new_i32();
+     TCGv_i32 t1 = tcg_temp_new_i32();
+@@ -2246,6 +2255,7 @@ static inline void tcg_gen_movcond_i64(T
+         tcg_temp_free_i64(t1);
+     }
+ #endif
++    }
+ }
+ 
+ static inline void tcg_gen_add2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 209b910..757de89 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"



