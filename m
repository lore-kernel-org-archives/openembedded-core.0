Return-Path: <cjp256@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id A11FD6D610
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 19:53:22 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id f11so1328178qae.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2013 12:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SP4wsbzt4w0CMhlHG7S290lzE64+tnMNjHcyIQqCtmQ=;
	b=c4C+568CKgVTwwN44bI0tgPQme8e17EKNBUXP4KypwJaIuTZyM3TqXEwkUqkDJZmeU
	LuHfiHWBjvewZ+oCnHTqpCwfz7PZRawIHNGwDq+mMgP5v6nMgxd2lrL4XidIOX/JzoBx
	6KvHx9gQuLgZVygi+6Qi6uqqiMCzFw2TfH66ZEUgnswNjrccvHxHVEU/Rp11VJviJfyN
	/zUYXqnnLb8U6hMMKars5+6sUYvNoixe+o1Z7gE0pBO1kz0O+5lqXAj0d2Gc4lIIwDAH
	MnMX+Nx9ARwVfl2h2uBvHwVa1M4Ia7wEq62VkjDKwwj4HKNNLRTzJZdyshKmCoZxDo9W
	FUVg==
X-Received: by 10.49.59.133 with SMTP id z5mr12220804qeq.18.1383422004205;
	Sat, 02 Nov 2013 12:53:24 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id og1sm30576221qeb.3.2013.11.02.12.53.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Nov 2013 12:53:23 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Nov 2013 15:52:13 -0400
Message-Id: <1383421933-16197-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH v2] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Sat, 02 Nov 2013 19:53:23 -0000

This update also drops the following patches which appear to have
been resolved upstream:
- ftd_header.patch
- target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
- target-ppc_fix_bit_extraction.patch

Qemu no longer uses the i386.ld and x86_64.ld linker scripts
and the .interp section should now have a 0x1000 size with the
proper path.  Therefore, for nativesdk-qemu, the following
patch should no longer be required and is also dropped:
- relocatable_sdk.patch

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 meta/recipes-devtools/qemu/files/fdt_header.patch  | 39 -----------
 .../qemu/files/relocatable_sdk.patch               | 34 ----------
 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch | 79 ----------------------
 .../qemu/files/target-ppc_fix_bit_extraction.patch | 70 -------------------
 meta/recipes-devtools/qemu/qemu.inc                |  6 +-
 .../qemu/{qemu_1.5.0.bb => qemu_1.6.1.bb}          | 15 ++--
 6 files changed, 9 insertions(+), 234 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/fdt_header.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/relocatable_sdk.patch
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
diff --git a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch b/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
deleted file mode 100644
index 774a49c..0000000
--- a/meta/recipes-devtools/qemu/files/relocatable_sdk.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Inappropriate [SDK specific]
-
-In order to be able to change the dynamic loader path when relocating
-binaries, the interp section has to be made big enough to accomodate
-the new path (4096 is the maximum path length in Linux).
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: qemu-1.4.0/ldscripts/i386.ld
-===================================================================
---- qemu-1.4.0.orig/ldscripts/i386.ld	2013-02-15 15:05:35.000000000 -0800
-+++ qemu-1.4.0/ldscripts/i386.ld	2013-02-28 22:55:36.138816418 -0800
-@@ -8,7 +8,7 @@
- {
-   /* Read-only sections, merged into text segment: */
-   . = 0x60000000 + SIZEOF_HEADERS;
--  .interp     : { *(.interp) 	}
-+  .interp     : { *(.interp); . = 0x1000; }
-   .hash          : { *(.hash)		}
-   .dynsym        : { *(.dynsym)		}
-   .dynstr        : { *(.dynstr)		}
-Index: qemu-1.4.0/ldscripts/x86_64.ld
-===================================================================
---- qemu-1.4.0.orig/ldscripts/x86_64.ld	2013-02-15 15:05:35.000000000 -0800
-+++ qemu-1.4.0/ldscripts/x86_64.ld	2013-02-28 22:55:36.138816418 -0800
-@@ -6,7 +6,7 @@
- {
-   /* Read-only sections, merged into text segment: */
-   . = 0x60000000 + SIZEOF_HEADERS;
--  .interp         : { *(.interp) }
-+  .interp         : { *(.interp); . = 0x1000; }
-   .hash           : { *(.hash) }
-   .dynsym         : { *(.dynsym) }
-   .dynstr         : { *(.dynstr) }
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
index 1b861d7..702fe01 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -20,10 +20,6 @@ SRC_URI = "\
     file://disable-grabs.patch \
     "
 
-SRC_URI_append_class-nativesdk = "\
-    file://relocatable_sdk.patch \
-    "
-
 SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
@@ -55,7 +51,7 @@ do_configure() {
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


