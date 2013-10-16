Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 02EBB6CBA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:15:46 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so15227iec.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 17:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iYtujZv1XjhyfAYlJx24O1AkSG1xS1VUp4HshWhexKo=;
	b=piixH+dE1qDnI9nPL9MI+PBZ7u1KUTWtOOl0lrkUwi5hq6fPvTjTJtsqduN/SP+Gnx
	AKOso6n9iUmrr1424BEsBl0hxso45IH83TFXvmWpOPi+LvGgNMNBB8MVI7AQPrifw7ah
	3icsv7/WRavrwlEEH4MoqbkpDGFeOCGdRu2RxlZARvDxCa6QAaOHWDHMC05NSgth3ta5
	+IjkhHwcQWe+0jxNPkO86IXe0YKhT+ubaqf/v+0AbxRz1ki3FB/ER9JBdGefltVAqCEz
	9VBlu89rt/CUCZyAg0i5Elm3m+OS0xxkc9iCzCEPdfnUrjGHiHsyn/Z9UUPj5ymn8l/T
	duvg==
X-Received: by 10.43.178.135 with SMTP id ow7mr6181666icc.43.1381882548581;
	Tue, 15 Oct 2013 17:15:48 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id p7sm297424iga.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 17:15:47 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 20:15:16 -0400
Message-Id: <1381882516-29599-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 16 Oct 2013 00:15:48 -0000

This update also drops the following patches which appear to have been resolved upstream:
- ftd_header.patch
- target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
- target-ppc_fix_bit_extraction.patch

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 meta/recipes-devtools/qemu/files/fdt_header.patch  | 39 -----------
 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79 ----------------------
 .../qemu/files/target-ppc_fix_bit_extraction.patch | 70 -------------------
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb}          | 15 ++--
 5 files changed, 9 insertions(+), 196 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb} (44%)

diff --git a/meta/recipes-devtools/qemu/files/fdt_header.patch b/meta/recipes-devtools/qemu/files/fdt_header.patch
deleted file mode 100644
index dccfe53..0000000
--- a/meta/recipes-devtools/qemu/files/fdt_header.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Pending 
-
-qemu: define fdt types in libfdt_env.h from qemu
-    
-    * fixes
-    In file included from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/libfdt.h:55:0,
-                     from /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qemu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
-    /home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linux/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
-
-Index: qemu-1.4.0/include/libfdt_env.h
-===================================================================
---- qemu-1.4.0.orig/include/libfdt_env.h	2013-02-15 23:05:35.000000000 +0000
-+++ qemu-1.4.0/include/libfdt_env.h	2013-04-13 14:17:27.918885225 +0000
-@@ -21,6 +21,10 @@
- 
- #include "qemu/bswap.h"
- 
-+typedef uint16_t fdt16_t;
-+typedef uint32_t fdt32_t;
-+typedef uint64_t fdt64_t;
-+
- #ifdef HOST_WORDS_BIGENDIAN
- #define fdt32_to_cpu(x)  (x)
- #define cpu_to_fdt32(x)  (x)
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
diff --git a/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch b/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
deleted file mode 100644
index 631d23b..0000000
--- a/meta/recipes-devtools/qemu/files/target-ppc_fix_bit_extraction.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Delivered-To: raj.khem@gmail.com
-Received: by 10.50.216.195 with SMTP id os3csp11191igc;
-        Thu, 15 Aug 2013 04:32:45 -0700 (PDT)
-X-Received: by 10.180.98.3 with SMTP id ee3mr1508103wib.48.1376566364872;
-        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
-Return-Path: <aurelien@aurel32.net>
-Received: from hall.aurel32.net (hall.aurel32.net. [2001:470:1f0b:4a8::1])
-        by mx.google.com with ESMTPS id vv5si15578100wjc.49.2013.08.15.04.32.44
-        for <raj.khem@gmail.com>
-        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
-        Thu, 15 Aug 2013 04:32:44 -0700 (PDT)
-Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted sender) client-ip=2001:470:1f0b:4a8::1;
-Authentication-Results: mx.google.com;
-       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:470:1f0b:4a8::1 as permitted sender) smtp.mail=aurelien@aurel32.net
-Received: from [2001:470:d4ed:1:2db:dfff:fe14:52d] (helo=ohm.aurel32.net)
-	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
-	(Exim 4.80)
-	(envelope-from <aurelien@aurel32.net>)
-	id 1V9vnG-0006cO-NN; Thu, 15 Aug 2013 13:32:42 +0200
-Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
-	(envelope-from <aurelien@aurel32.net>)
-	id 1V9vnF-0002Lw-7L; Thu, 15 Aug 2013 13:32:41 +0200
-From: Aurelien Jarno <aurelien@aurel32.net>
-To: qemu-devel@nongnu.org
-Cc: Khem Raj <raj.khem@gmail.com>,
-	Alexander Graf <agraf@suse.de> ,
-	qemu-stable@nongnu.org,
-	qemu-ppc@nongnu.org,
-	Aurelien Jarno <aurelien@aurel32.net>
-Subject: [PATCH] target-ppc: fix bit extraction for FPBF and FPL
-Date: Thu, 15 Aug 2013 13:32:38 +0200
-Message-Id: <1376566358-8989-1-git-send-email-aurelien@aurel32.net>
-X-Mailer: git-send-email 1.7.10.4
-
-Bit extraction for the FP BF and L field of the MTFSFI and MTFSF
-instructions is wrong and doesn't match the reference manual (which
-explain the bit number in big endian format). It has been broken in
-commit 7d08d85645def18eac2a9d672c1868a35e0bcf79.
-
-This patch fixes this, which in turn fixes the problem reported by
-Khem Raj about the floor() function of libm.
-
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
-
-Upstream-Status: Backport
-
----
- target-ppc/translate.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-I don't know if we still have time to get this into 1.6, hence the Cc:
-to stable. In anycase it also needs to be fixed in 1.5.
-
-Index: qemu-1.5.0/target-ppc/translate.c
-===================================================================
---- qemu-1.5.0.orig/target-ppc/translate.c	2013-05-20 08:34:40.000000000 -0700
-+++ qemu-1.5.0/target-ppc/translate.c	2013-08-15 06:49:25.028144352 -0700
-@@ -428,9 +428,9 @@
- EXTRACT_HELPER(SR, 16, 4);
- 
- /* mtfsf/mtfsfi */
--EXTRACT_HELPER(FPBF, 19, 3);
-+EXTRACT_HELPER(FPBF, 23, 3);
- EXTRACT_HELPER(FPIMM, 12, 4);
--EXTRACT_HELPER(FPL, 21, 1);
-+EXTRACT_HELPER(FPL, 25, 1);
- EXTRACT_HELPER(FPFLM, 17, 8);
- EXTRACT_HELPER(FPW, 16, 1);
- 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1b861d7..e533a84 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -55,7 +55,7 @@ do_configure() {
        KVMOPTS="--enable-kvm"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.6.1.bb
similarity index 44%
rename from meta/recipes-devtools/qemu/qemu_1.5.0.bb
rename to meta/recipes-devtools/qemu/qemu_1.6.1.bb
index 06c2cdb..03e28a0 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.6.1.bb
@@ -3,14 +3,15 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fdt_header.patch \
-            file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
-            file://target-ppc_fix_bit_extraction.patch \
-            file://fxrstorssefix.patch \
-           "
+SRC_URI += "file://fxrstorssefix.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
-SRC_URI[sha256sum] = "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
+SRC_URI[md5sum] = "3a897d722457c5a895cd6ac79a28fda0"
+SRC_URI[sha256sum] = "fc736f44aa10478223c881310a7e40fc8386547e9cadf7d01ca4685951605294"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
-- 
1.8.4.rc3


