Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0998E6FF77
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:45 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so10087494qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nX3g648i7sEGoze/4TKvL6TRjhsmqSmJny3au0xT1cg=;
	b=hRxqm21RpgwPsl8+n8h5hnHYZUqb2YONUFTlgE/YDjofQNWURjFYkFmwsp4ObRxDiv
	pZWUcSQeXpnfgEezUP8MxPX7qdFtZz9MBPwJHhaxX8wgKGSy5sztT7NWTlNI0BMU2mbn
	yAHcu46hBXRTA4+7QsFil3dXYYbxWYzVtjPLgki0pkJLR+2bIYSPkrFEZ322f/tDVLQ9
	Yk+aNX5dbvdf7aLRLaZy9Jr5x6x/m65my+G7eX9mhHgNFpeaOEPL5q+PZX4mw2U/M0Bt
	e9Bu6wbdF+mZ48a9nqP6qvXdyl+ITMEu0gsYq5745/jDKXVBPzoUHrGF0VQDllFt/QS2
	vrTQ==
X-Received: by 10.140.81.112 with SMTP id e103mr2113717qgd.99.1449562365870;
	Tue, 08 Dec 2015 00:12:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:31 +0000
Message-Id: <10e517815b08aac4808777f4dd0cfb2cebed1875.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 11/13] openssl: Add musl configuration support
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:45 -0000

use termios instead of termio

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |  4 +++-
 .../openssl/openssl/configure-musl-target.patch    | 27 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 429fc5e..199e9ab 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -18,10 +18,12 @@ S = "${WORKDIR}/openssl-${PV}"
 PACKAGECONFIG[perl] = ",,,"
 
 AR_append = " r"
+TERMIO_libc-musl = "-DTERMIOS"
+TERMIO ?= "-DTERMIO"
 # Avoid binaries being marked as requiring an executable stack since it 
 # doesn't(which causes and this causes issues with SELinux
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	-DTERMIO ${CFLAGS} -Wall -Wa,--noexecstack"
+	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
 
 # -02 does not work on mipsel: ssh hangs when it tries to read /dev/urandom
 CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
diff --git a/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
new file mode 100644
index 0000000..613dc7b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
@@ -0,0 +1,27 @@
+Add musl triplet support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: openssl-1.0.2a/Configure
+===================================================================
+--- openssl-1.0.2a.orig/Configure
++++ openssl-1.0.2a/Configure
+@@ -431,7 +431,7 @@ my %table=(
+ #
+ #       ./Configure linux-armv4 -march=armv6 -D__ARM_MAX_ARCH__=8
+ #
+-"linux-armv4",	"gcc: -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-armv4", "gcc: -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-aarch64","gcc: -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${aarch64_asm}:linux64:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ # Configure script adds minimally required -march for assembly support,
+ # if no -march was specified at command line. mips32 and mips64 below
+@@ -504,6 +504,8 @@ my %table=(
+ "linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-musleabi-arm","$ENV{'CC'}:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-musleabi-armeb","$ENV{'CC'}:-DB_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ 
+ "linux-avr32","$ENV{'CC'}:-O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 249f8c4..454d075 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
+            file://configure-musl-target.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.6.3


