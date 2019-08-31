Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0267DDAA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 05:23:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id y1so4251184plp.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 22:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eb3C1gcfIBeDlgxz6Ysy0J07gWuJgnPdmRDFQ6HdwKg=;
	b=jpmrkJ8x2SRrKq22C1XJ4j/xo/wgJLQNOqNlwC0lLk9uvR9Oq2AF9iGlE1hTftzSYk
	H4CnbMiQQEZb8/TbdXU+ttx7JD0jF94NuqsH9nGByDmgsMDUjnxoMoabCHtLHEQ8OTPL
	tbeHNedACNHwID3pW5YFuJHskPP6fRvyIONpQr6Gwh3etMc8NdNFzJRP/PNfFzLL9ZSH
	S9Zh74A4vsErt0j9Q7OnxACj8rmbGxGiShP1zYMxogb4CA8Ng2W55RJjpG/tONI2in9I
	BXNfk/X7fsevhh2auzretZ3RwqFZxOkvzzMF1ghVe0C9oN3reSSdFFJgQGyN4Xcj2NZq
	RgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eb3C1gcfIBeDlgxz6Ysy0J07gWuJgnPdmRDFQ6HdwKg=;
	b=QvubOUtIVLVKHRt9RzvAdfAe0CV/WBmP9ANy40AkD9ryJyICeEALXPghSUUiBZl9zS
	NZ8kxFtXpKGgmSkt3CFfg2Kln4eLDF/ETlEHk1QCB7eoTPXtc5iCET/xUA1V/l5Uqw1Z
	vcCNfKmcI+r9IJFakvtLHLM+543gUvlUlR1SNSukBvlIvf1Dwdyl3oMePdxDDuRDkMjv
	dY1yBlNpKMjhuwHf1VC/CMo0UELY4vEynZc/qDdsQSH3TzrrTzm/3wwIVHqmEuJAJ+qu
	ApIpVgEKX6r097KhaW/PsGDxX7G3NXE0+TOJBZ6A5HbmziBsZipK4Kwli7mq0f307zgI
	le3g==
X-Gm-Message-State: APjAAAXXzf6xLwXxIWQ/+ylMKzMM4Wfqqo7xbDj1tM24aN+4rE6v/EOj
	v5gR2/RUTkn3qkx5JwqUKj/VD036LoA=
X-Google-Smtp-Source: APXvYqw4J8GSRTSZe6nVKF076UbJP+Psty0TGUhlbPUHeInxh9CVEWVeBjQryz60r8TJ+GHp0QBbKg==
X-Received: by 2002:a17:902:e311:: with SMTP id
	cg17mr18711457plb.183.1567229005901; 
	Fri, 30 Aug 2019 22:23:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	131sm6493221pge.37.2019.08.30.22.23.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 22:23:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:23:11 -0700
Message-Id: <20190831052314.19974-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/4] powerpc-tunes: Introduce bigendian tune
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
X-List-Received-Date: Sat, 31 Aug 2019 05:23:25 -0000
Content-Transfer-Encoding: 8bit

This helps in defining LE tunes and at the same time specifies
endianness on compiler cmdline clearly, clang e.g. defaults to
little-endian always, so unless specified with -mbig-endian won't
compile the code right

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../machine/include/powerpc/arch-powerpc.inc  | 22 ++++++++++++++++---
 .../include/powerpc/arch-powerpc64.inc        | 10 +++++++--
 meta/conf/machine/include/tune-power5.inc     |  4 ++--
 meta/conf/machine/include/tune-power6.inc     |  4 ++--
 meta/conf/machine/include/tune-power7.inc     |  4 ++--
 meta/conf/machine/include/tune-ppc476.inc     |  2 +-
 meta/conf/machine/include/tune-ppc603e.inc    |  2 +-
 meta/conf/machine/include/tune-ppc7400.inc    |  2 +-
 meta/conf/machine/include/tune-ppce300c2.inc  |  2 +-
 meta/conf/machine/include/tune-ppce500.inc    |  2 +-
 meta/conf/machine/include/tune-ppce500mc.inc  |  2 +-
 meta/conf/machine/include/tune-ppce500v2.inc  |  2 +-
 meta/conf/machine/include/tune-ppce5500.inc   |  4 ++--
 meta/conf/machine/include/tune-ppce6500.inc   |  4 ++--
 14 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 9cf6b88fd1..8c0c943044 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -8,6 +8,11 @@ DEFAULTTUNE ?= "powerpc"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 ABIEXTENSION ?= ""
 
+# Endian
+TUNEVALID[bigendian] = "Use PowerPC Big Endian"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"
+
 TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
 TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'powerpc', '', d)}"
@@ -22,13 +27,24 @@ TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', 'soft', '', d)}
 TUNEVALID[altivec] = "Altivec"
 
 # Basic tune definitions
-AVAILTUNES += "powerpc powerpc-nf" 
-TUNE_FEATURES_tune-powerpc-nf = "m32 fpu-soft"
+AVAILTUNES += "powerpc powerpc-nf powerpcle powerpcle-nf" 
+
+TUNE_FEATURES_tune-powerpc-nf = "m32 fpu-soft bigendian"
 BASE_LIB_tune-powerpc-nf = "lib"
 TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
 
-TUNE_FEATURES_tune-powerpc = "m32 fpu-hard"
+TUNE_FEATURES_tune-powerpc = "m32 fpu-hard bigendian"
 BASE_LIB_tune-powerpc = "lib"
 TUNE_PKGARCH_tune-powerpc = "powerpc"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
+
+TUNE_FEATURES_tune-powerpcle-nf = "m32 fpu-soft"
+BASE_LIB_tune-powerpcle-nf = "lib"
+TUNE_PKGARCH_tune-powerpcle-nf = "powerpcle-nf"
+PACKAGE_EXTRA_ARCHS_tune-powerpcle-nf = "powerpcle-nf"
+
+TUNE_FEATURES_tune-powerpcle = "m32 fpu-hard"
+BASE_LIB_tune-powerpcle = "lib"
+TUNE_PKGARCH_tune-powerpcle = "powerpcle"
+PACKAGE_EXTRA_ARCHS_tune-powerpcle = "powerpcle"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index d9916d43da..4bc5983087 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -13,8 +13,14 @@ TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in d.getVar('OVERRIDES').spl
 # user mode qemu doesn't support ppc64
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
 
-AVAILTUNES += "powerpc64"
-TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard"
+AVAILTUNES += "powerpc64 powerpc64le"
+
+TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard bigendian"
 BASE_LIB_tune-powerpc64 = "lib64"
 TUNE_PKGARCH_tune-powerpc64 = "powerpc64"
 PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
+
+TUNE_FEATURES_tune-powerpc64le = "m64 fpu-hard"
+BASE_LIB_tune-powerpc64le = "lib64"
+TUNE_PKGARCH_tune-powerpc64le = "powerpc64le"
+PACKAGE_EXTRA_ARCHS_tune-powerpc64le = "powerpc64le"
diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
index 39501bd8c5..48c33fb273 100644
--- a/meta/conf/machine/include/tune-power5.inc
+++ b/meta/conf/machine/include/tune-power5.inc
@@ -6,12 +6,12 @@ TUNEVALID[power5] = "Enable IBM Power5 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' -mcpu=power5', '', d)}"
 
 AVAILTUNES += "ppcp5 ppc64p5"
-TUNE_FEATURES_tune-ppcp5 = "m32 fpu-hard power5 altivec"
+TUNE_FEATURES_tune-ppcp5 = "m32 fpu-hard power5 altivec bigendian"
 BASE_LIB_tune-ppcp5 = "lib"
 TUNE_PKGARCH_tune-ppcp5 = "ppcp5"
 PACKAGE_EXTRA_ARCHS_tune-ppcp5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp5"
 
-TUNE_FEATURES_tune-ppc64p5 = "m64 fpu-hard power5 altivec"
+TUNE_FEATURES_tune-ppc64p5 = "m64 fpu-hard power5 altivec bigendian"
 BASE_LIB_tune-ppc64p5 = "lib64"
 TUNE_PKGARCH_tune-ppc64p5 = "ppc64p5"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p5"
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
index 1d5e8ecc26..b708660217 100644
--- a/meta/conf/machine/include/tune-power6.inc
+++ b/meta/conf/machine/include/tune-power6.inc
@@ -6,12 +6,12 @@ TUNEVALID[power6] = "Enable IBM Power6 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' -mcpu=power6', '', d)}"
 
 AVAILTUNES += "ppcp6 ppc64p6"
-TUNE_FEATURES_tune-ppcp6 = "m32 fpu-hard power6 altivec"
+TUNE_FEATURES_tune-ppcp6 = "m32 fpu-hard power6 altivec bigendian"
 BASE_LIB_tune-ppcp6 = "lib"
 TUNE_PKGARCH_tune-ppcp6 = "ppcp6"
 PACKAGE_EXTRA_ARCHS_tune-ppcp6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp6"
 
-TUNE_FEATURES_tune-ppc64p6 = "m64 fpu-hard power6 altivec"
+TUNE_FEATURES_tune-ppc64p6 = "m64 fpu-hard power6 altivec bigendian"
 BASE_LIB_tune-ppc64p6 = "lib64"
 TUNE_PKGARCH_tune-ppc64p6 = "ppc64p6"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p6"
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
index 8f3f037ebb..e976cc0467 100644
--- a/meta/conf/machine/include/tune-power7.inc
+++ b/meta/conf/machine/include/tune-power7.inc
@@ -6,12 +6,12 @@ TUNEVALID[power7] = "Enable IBM Power7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' -mcpu=power7', '', d)}"
 
 AVAILTUNES += "ppcp7 ppc64p7"
-TUNE_FEATURES_tune-ppcp7 = "m32 fpu-hard power7 altivec"
+TUNE_FEATURES_tune-ppcp7 = "m32 fpu-hard power7 altivec bigendian"
 BASE_LIB_tune-ppcp7 = "lib"
 TUNE_PKGARCH_tune-ppcp7 = "ppcp7"
 PACKAGE_EXTRA_ARCHS_tune-ppcp7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp7"
 
-TUNE_FEATURES_tune-ppc64p7 = "m64 fpu-hard power7 altivec"
+TUNE_FEATURES_tune-ppc64p7 = "m64 fpu-hard power7 altivec bigendian"
 BASE_LIB_tune-ppc64p7 = "lib64"
 TUNE_PKGARCH_tune-ppc64p7 = "ppc64p7"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p7"
diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
index d0011ff213..31eecc435c 100644
--- a/meta/conf/machine/include/tune-ppc476.inc
+++ b/meta/conf/machine/include/tune-ppc476.inc
@@ -6,7 +6,7 @@ TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', ' -mcpu=476', '', d)}"
 
 AVAILTUNES += "ppc476"
-TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
+TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476 bigendian"
 TUNE_PKGARCH_tune-ppc476 = "ppc476"
 PACKAGE_EXTRA_ARCHS_tune-ppc476 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
 
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 13f60dd067..b110f13870 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -6,7 +6,7 @@ TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', ' -mcpu=603e', '', d)}"
 
 AVAILTUNES += "ppc603e"
-TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e bigendian"
 TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
index 425e8bd215..92d902994b 100644
--- a/meta/conf/machine/include/tune-ppc7400.inc
+++ b/meta/conf/machine/include/tune-ppc7400.inc
@@ -6,7 +6,7 @@ TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400 -mno-spe', '', d)}"
 
 AVAILTUNES += "ppc7400"
-TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
+TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec bigendian"
 TUNE_PKGARCH_tune-ppc7400 = "ppc7400"
 PACKAGE_EXTRA_ARCHS_tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc7400"
 
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index af21f601a8..6adeb4bdec 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -6,6 +6,6 @@ TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c2', ' -mcpu=e300c2', '', d)}"
 
 AVAILTUNES += "ppce300c2"
-TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
+TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2 bigendian"
 TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 89ec3f38a7..abf81b90c4 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -15,6 +15,6 @@ SPEABIEXTENSION = "${@bb.utils.filter('TUNE_FEATURES', 'spe', d)}"
 ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500"
-TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
+TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500 bigendian"
 TUNE_PKGARCH_tune-ppce500 = "ppce500"
 PACKAGE_EXTRA_ARCHS_tune-ppce500 = "ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index bc26a0f875..9f8a172804 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -6,7 +6,7 @@ TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', ' -mcpu=e500mc', '', d)}"
 
 AVAILTUNES += "ppce500mc"
-TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
+TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc bigendian"
 TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
 
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index d318bba361..f6c7c17623 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -15,6 +15,6 @@ SPEABIEXTENSION = "${@bb.utils.filter('TUNE_FEATURES', 'spe', d)}"
 ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500v2"
-TUNE_FEATURES_tune-ppce500v2 = "m32 ppce500v2"
+TUNE_FEATURES_tune-ppce500v2 = "m32 ppce500v2 bigendian"
 TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "ppce500v2"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
index cebb244068..acc6a50fca 100644
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -6,12 +6,12 @@ TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' -mcpu=e5500', '', d)}"
 
 AVAILTUNES += "ppce5500 ppc64e5500"
-TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
+TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500 bigendian"
 BASE_LIB_tune-ppce5500 = "lib"
 TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
 PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
 
-TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500"
+TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500 bigendian"
 BASE_LIB_tune-ppc64e5500 = "lib64"
 TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
 PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
index 5db7e760c3..d12d218d06 100644
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -6,12 +6,12 @@ TUNEVALID[e6500] = "Enable Freescale e6500 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' -mcpu=e6500', '', d)}"
 
 AVAILTUNES += "ppce6500 ppc64e6500"
-TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec"
+TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec bigendian"
 BASE_LIB_tune-ppce6500 = "lib"
 TUNE_PKGARCH_tune-ppce6500 = "ppce6500"
 PACKAGE_EXTRA_ARCHS_tune-ppce6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce6500"
 
-TUNE_FEATURES_tune-ppc64e6500 = "m64 fpu-hard e6500 altivec"
+TUNE_FEATURES_tune-ppc64e6500 = "m64 fpu-hard e6500 altivec bigendian"
 BASE_LIB_tune-ppc64e6500 = "lib64"
 TUNE_PKGARCH_tune-ppc64e6500 = "ppc64e6500"
 PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e6500"
-- 
2.23.0


