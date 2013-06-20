Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA8DF60810
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:59:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2013 06:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,905,1363158000"; d="scan'208";a="356779727"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2013 06:59:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 16:59:10 +0300
Message-Id: <0f051dbd4d0af87b5341cacfd69f9cc5f75231fe.1371736529.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371736529.git.laurentiu.palcu@intel.com>
References: <cover.1371736529.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1371736529.git.laurentiu.palcu@intel.com>
References: <cover.1371736529.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] qemu: fix segfault in Xorg when not using kvm
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
X-List-Received-Date: Thu, 20 Jun 2013 13:59:37 -0000

This backported patch will fix this Xorg issue and, probably, many
others which didn't show up yet.

[YOCTO #4737]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch |   79 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.5.0.bb           |    3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch

diff --git a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch b/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
new file mode 100644
index 0000000..852efd1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Backported
+
+From dec3fc9657e0682637de4d5a29d947284d01985c Mon Sep 17 00:00:00 2001
+From: Richard Henderson <rth@twiddle.net>
+Date: Wed, 29 May 2013 12:30:51 -0700
+Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67 prefix
+
+The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.
+While fixing this, tidy and comment the code so that it's more obvious
+what's going on in setting both aflag and dflag.
+
+The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the
+constant zero when TARGET_X86_64 is undefined.
+
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+Reported-by: Laszlo Ersek <lersek@redhat.com>
+Signed-off-by: Richard Henderson <rth@twiddle.net>
+Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
+Message-id: 1369855851-21400-1-git-send-email-rth@twiddle.net
+Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
+---
+ target-i386/translate.c |   30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/target-i386/translate.c b/target-i386/translate.c
+index 0aeccdb..14b0298 100644
+--- a/target-i386/translate.c
++++ b/target-i386/translate.c
+@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
+     }
+     s->pc = pc_start;
+     prefixes = 0;
+-    aflag = s->code32;
+-    dflag = s->code32;
+     s->override = -1;
+     rex_w = -1;
+     rex_r = 0;
+@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
+     }
+ 
+     /* Post-process prefixes.  */
+-    if (prefixes & PREFIX_DATA) {
+-        dflag ^= 1;
+-    }
+-    if (prefixes & PREFIX_ADR) {
+-        aflag ^= 1;
+-    }
+-#ifdef TARGET_X86_64
+     if (CODE64(s)) {
+-        if (rex_w == 1) {
+-            /* 0x66 is ignored if rex.w is set */
+-            dflag = 2;
++        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
++           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
++           over 0x66 if both are present.  */
++        dflag = (rex_w > 0 ? 2 : prefixes & PREFIX_DATA ? 0 : 1);
++        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
++        aflag = (prefixes & PREFIX_ADR ? 1 : 2);
++    } else {
++        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
++        dflag = s->code32;
++        if (prefixes & PREFIX_DATA) {
++            dflag ^= 1;
+         }
+-        if (!(prefixes & PREFIX_ADR)) {
+-            aflag = 2;
++        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
++        aflag = s->code32;
++        if (prefixes & PREFIX_ADR) {
++            aflag ^= 1;
+         }
+     }
+-#endif
+ 
+     s->prefix = prefixes;
+     s->aflag = aflag;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index 2ea4f12..9b9d0d7 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -3,7 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fdt_header.patch"
+SRC_URI += "file://fdt_header.patch \
+            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
-- 
1.7.9.5


