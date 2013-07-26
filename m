Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4DF6B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 11:39:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2013 04:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376984615"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2013 04:39:02 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 14:41:33 +0300
Message-Id: <bdcdce42a1d29bb561accdf9e042174bb99b2dfe.1374837613.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1374837613.git.ionutx.radu@intel.com>
References: <cover.1374837613.git.ionutx.radu@intel.com>
Subject: [PATCH v3 1/1] qemu: Updated from 1.5.0 to 1.5.1
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
X-List-Received-Date: Fri, 26 Jul 2013 11:39:03 -0000

Patch target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch was backported

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch |   79 --------------------
 .../qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb}          |    7 +-
 2 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)

diff --git a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch b/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
deleted file mode 100644
index 852efd1..0000000
--- a/meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Upstream-Status: Backported
-
-From dec3fc9657e0682637de4d5a29d947284d01985c Mon Sep 17 00:00:00 2001
-From: Richard Henderson <rth@twiddle.net>
-Date: Wed, 29 May 2013 12:30:51 -0700
-Subject: [PATCH] target-i386: Fix aflag logic for CODE64 and the 0x67 prefix
-
-The code reorganization in commit 4a6fd938 broke handling of PREFIX_ADR.
-While fixing this, tidy and comment the code so that it's more obvious
-what's going on in setting both aflag and dflag.
-
-The TARGET_X86_64 ifdef can be eliminated because CODE64 expands to the
-constant zero when TARGET_X86_64 is undefined.
-
-Cc: Paolo Bonzini <pbonzini@redhat.com>
-Reported-by: Laszlo Ersek <lersek@redhat.com>
-Signed-off-by: Richard Henderson <rth@twiddle.net>
-Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
-Message-id: 1369855851-21400-1-git-send-email-rth@twiddle.net
-Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
----
- target-i386/translate.c |   30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/target-i386/translate.c b/target-i386/translate.c
-index 0aeccdb..14b0298 100644
---- a/target-i386/translate.c
-+++ b/target-i386/translate.c
-@@ -4677,8 +4677,6 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
-     }
-     s->pc = pc_start;
-     prefixes = 0;
--    aflag = s->code32;
--    dflag = s->code32;
-     s->override = -1;
-     rex_w = -1;
-     rex_r = 0;
-@@ -4801,23 +4799,25 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
-     }
- 
-     /* Post-process prefixes.  */
--    if (prefixes & PREFIX_DATA) {
--        dflag ^= 1;
--    }
--    if (prefixes & PREFIX_ADR) {
--        aflag ^= 1;
--    }
--#ifdef TARGET_X86_64
-     if (CODE64(s)) {
--        if (rex_w == 1) {
--            /* 0x66 is ignored if rex.w is set */
--            dflag = 2;
-+        /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
-+           data with rex_w, and 16-bit data with 0x66; rex_w takes precedence
-+           over 0x66 if both are present.  */
-+        dflag = (rex_w > 0 ? 2 : prefixes & PREFIX_DATA ? 0 : 1);
-+        /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
-+        aflag = (prefixes & PREFIX_ADR ? 1 : 2);
-+    } else {
-+        /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
-+        dflag = s->code32;
-+        if (prefixes & PREFIX_DATA) {
-+            dflag ^= 1;
-         }
--        if (!(prefixes & PREFIX_ADR)) {
--            aflag = 2;
-+        /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
-+        aflag = s->code32;
-+        if (prefixes & PREFIX_ADR) {
-+            aflag ^= 1;
-         }
-     }
--#endif
- 
-     s->prefix = prefixes;
-     s->aflag = aflag;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
similarity index 49%
rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
rename to meta/recipes-devtools/qemu/qemu_1.5.1.bb
index 9b9d0d7..fe0437f 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.1.bb
@@ -3,9 +3,8 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fdt_header.patch \
-            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch"
+SRC_URI += "file://fdt_header.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
-SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
+SRC_URI[md5sum] = "b56e73bdcfdb214d5c68e13111aca96f"
+SRC_URI[sha256sum] = "4c15a1ee2f387983eb5c1497f66bf567c34d14ba48517148f6eafef8ae09e3e8"
-- 
1.7.10.4


