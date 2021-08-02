Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.17098.1627890835237985778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002148"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002148"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655310"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 36/37] ovmf: Fix VLA warnings with GCC 11
Date: Mon,  2 Aug 2021 15:52:23 +0800
Message-Id: <811ce3e6fa51ff615b7f81126d0611ba30408c85.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5406ce83e07c3f89b9f2bb26f083861467b7bc59)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ovmf/0001-Fix-VLA-parameter-warning.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
new file mode 100644
index 0000000000..d658123b81
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
@@ -0,0 +1,51 @@
+From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adr.her.arc.95@gmail.com>
+Date: Mon, 22 Mar 2021 21:06:47 +0000
+Subject: [PATCH] Fix VLA parameter warning
+
+Make VLA buffer types consistent in declarations and definitions.
+Resolves build crash when using -Werror due to "vla-parameter" warning.
+
+Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
+Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
+---
+ c/dec/decode.c | 6 ++++--
+ c/enc/encode.c | 5 +++--
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
+index 114c505..bb6f1ab 100644
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
++++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
+@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErrorCode SafeProcessCommands(
+ }
+ 
+ BrotliDecoderResult BrotliDecoderDecompress(
+-    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
+-    uint8_t* decoded_buffer) {
++    size_t encoded_size,
++    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
++    size_t* decoded_size,
++    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
+   BrotliDecoderState s;
+   BrotliDecoderResult result;
+   size_t total_out = 0;
+diff --git a/c/enc/encode.c b/c/enc/encode.c
+index 68548ef..ab0a490 100644
+--- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
++++ c/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
+@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
+ 
+ BROTLI_BOOL BrotliEncoderCompress(
+     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
+-    const uint8_t* input_buffer, size_t* encoded_size,
+-    uint8_t* encoded_buffer) {
++    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
++    size_t* encoded_size,
++    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
+   BrotliEncoderState* s;
+   size_t out_size = *encoded_size;
+   const uint8_t* input_start = input_buffer;
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 896b3b6320..9a1bfbd69c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0004-ovmf-Update-to-latest.patch \
            file://zero.patch \
+           file://0001-Fix-VLA-parameter-warning.patch \
            "
 
 PV = "edk2-stable202102"
-- 
2.31.1

