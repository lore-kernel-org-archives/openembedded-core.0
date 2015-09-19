Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 31EC375F3A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 22:43:14 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nJRrc0pLCz3hjMP;
	Sun, 20 Sep 2015 00:43:12 +0200 (CEST)
X-Auth-Info: WcjCvUwlyo+NFzzJXkcpweT72ao11bNKI+JWkypRaMk=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nJRrb6BFlzvdWt;
	Sun, 20 Sep 2015 00:43:11 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Sep 2015 00:43:14 +0200
Message-Id: <1442702597-5619-6-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442702597-5619-1-git-send-email-marex@denx.de>
References: <1442702597-5619-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 5/8] openssl: Add nios2 configuration
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
X-List-Received-Date: Sat, 19 Sep 2015 22:43:14 -0000

Add small patch which adds NIOS2 configuration settings into
the OpenSSL library.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 .../openssl/openssl/openssl_add_nios2.patch        | 33 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch b/meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
new file mode 100644
index 0000000..cae9e99
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
@@ -0,0 +1,33 @@
+From ea3e9d0870509e58e5703bb75edcc76a3398c63b Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 28 May 2015 00:55:47 +0200
+Subject: [PATCH] Configure: Add initial NIOS II support
+
+Add Configure entry for the Altera NIOS II soft processor.
+Based on older patch for OpenSSL 0.9.8 by Frans Meulenbroeks [1].
+
+[1] http://permalink.gmane.org/gmane.comp.handhelds.openembedded.scm/44572
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ Configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Configure b/Configure
+index 7192677..2b70a4c 100755
+--- a/Configure
++++ b/Configure
+@@ -394,6 +394,8 @@ my %table=(
+ "linux-mips32",	"gcc:-mabi=32 -O3 -Wall -DBN_DIV3W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${mips32_asm}:o32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-mips64",   "gcc:-mabi=n32 -O3 -Wall -DBN_DIV3W::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${mips64_asm}:n32:dlfcn:linux-shared:-fPIC:-mabi=n32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::32",
+ "linux64-mips64",   "gcc:-mabi=64 -O3 -Wall -DBN_DIV3W::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${mips64_asm}:64:dlfcn:linux-shared:-fPIC:-mabi=64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
++#### NIOS-II
++"linux-nios2",	"$ENV{'CC'}:-DL_ENDIAN -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O3 -Wall::-D_REENTRANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ #### IA-32 targets...
+ "linux-ia32-icc",	"icc:-DL_ENDIAN -O2::-D_REENTRANT::-ldl -no_cpprt:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-KPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-elf",	"gcc:-DL_ENDIAN -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 32d8dce..99e7bb7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
+            file://openssl_add_nios2.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.1.4


