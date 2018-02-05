Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B303078400
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 01:28:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w151SD8k024446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Feb 2018 17:28:13 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 17:28:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 20:28:00 -0500
Message-ID: <323d1c45bb713a379bd97bfa81650c40c0e500a8.1517793934.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517793934.git.hongxu.jia@windriver.com>
References: <cover.1517793934.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] openssl/nativesdk-openssl: improve reproducibility
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
X-List-Received-Date: Mon, 05 Feb 2018 01:28:12 -0000
Content-Type: text/plain

Remove build host references from the internally
generated file buildinf.h. The references get compiled into
executables, which leads to non-reproducible builds.
The removed references (--sysroot, -fdebug-prefix-map) were
only used as part of the `openssl version -f' which do not have
side effect.

The fix apply for target/nativesdk, and does not affect native.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl/0001-improve-reproducibility.patch     | 50 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2m.bb | 11 +++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch b/meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch
new file mode 100644
index 0000000..35edaf5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch
@@ -0,0 +1,50 @@
+From e4a70a64877c084cd90a84d0888c994cbb679dc4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 11 Jan 2018 09:41:03 +0800
+Subject: [PATCH] crypto/Makefile: improve reproducibility
+
+Remove build host references from the internally
+generated file buildinf.h. The references get compiled into
+executables, which leads to non-reproducible builds.
+The removed references (--sysroot, -fdebug-prefix-map) were
+only used as part of the `openssl version -f' which do not have
+side effect.
+
+...
+$ openssl version -f
+compiler: cc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC
+-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -m64
+-DL_ENDIAN -g -O2 -fstack-protector-strong -Wformat
+-Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2
+-Wl,-Bsymbolic-functions -Wl,-z,relro -Wa,--noexecstack -Wall
+-DMD32_REG_T=int -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT
+-DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM
+-DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM
+-DGHASH_ASM -DECP_NISTZ256_ASM
+...
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ crypto/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 29c2dcf..4851026 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -54,8 +54,9 @@ top:
+ 
+ all: shared
+ 
++COMPILER = $(shell echo "$(CC) $(CFLAGS)" | sed -e "s,$(TOOLCHAIN_OPTIONS),,g" -e "s,$(DEBUG_PREFIX_MAP),,g")
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	$(PERL) $(TOP)/util/mkbuildinf.pl "$(COMPILER)" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
index 9270f52..4906aec 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
@@ -43,10 +43,21 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
             file://0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch \
+            ${SRC_URI_REPRODUCE} \
             "
 SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
 SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
 
+SRC_URI_REPRODUCE = "file://0001-improve-reproducibility.patch"
+SRC_URI_REPRODUCE_class-native = ""
+
+EXTRA_OEMAKE += "${EXTRA_OEMAKE_REPRODUCE}"
+EXTRA_OEMAKE_REPRODUCE_class-native = ""
+EXTRA_OEMAKE_REPRODUCE  = ' \
+                 TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
+                 DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}" \
+'
+
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 
-- 
2.8.1


