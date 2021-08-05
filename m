Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web09.10510.1628177760895353718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jBUCd0c8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so5562667oth.7
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jmmaIxIns0szcBi25J5LHSOQD5ETHwwCSv9q2poomyw=;
        b=jBUCd0c88iPgArd2rNEZsLI8s+1JSSDVEFXFRFOwmh1oPoqK3QDBdVorLlI//vAq4R
         CC7JMmsmwUuKoVvIgK5vhSpukWVlQUbBMbRaPi4x/ybyw1MyHOiorjQ+YWr9nSUMlsZ6
         UbpeszRv4dIAHA44EsA2j26v44UZZmtzWIP1r2IBb7cTLACvyFw85x4baIi5yYifD8RA
         JrPLTltXeqgdQGsjGCxYpJWpnYOHM5XyVcon0uBM1GtegxRGl1S9T9dl/tR77P7BL/AX
         hmjrIZyQMgPPUggi1anT/pt1ZBunq50DCxS3pEje0ZXGEjbwmjAxxoPAa1+esTlOMdxF
         LR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmmaIxIns0szcBi25J5LHSOQD5ETHwwCSv9q2poomyw=;
        b=E061j1mMBZNmO64e6uWtBMbhsJV1G2vGPHxfakkWwZ7V2zKVTSxV4QTjU0aQptlAdq
         ejH/J+bm2JsjOuaubqNNYijHnI7r5tAmR9SjJG0Vwr2VxzQ6O9fkgkW6FHWfOZdZepS1
         GIp9aMnUhg82GbLs6ceYhnxoQLjs/pErBHCKqBa24GYyK1FhcCfJXGl1bsRvI6oOd9Xa
         MBSvYh1SSm/MrWL9u1VwbDCga2SF6Avxt5tf1dO9HcF3OtiH3J8Pqnszh+KRSvhBo7ZX
         idGPJPqjsEu1XQye1EZ7zIRy38bWWoTctTBGBRV36M1XDo18D7HYNOWAQ9EhBNfAT1sB
         Yg1w==
X-Gm-Message-State: AOAM5332HA6mAIl3HZ8M0untNwkjzcdwgZGxXaBDZzonbF6sPbp0smz5
	AAc9OrVi+znEOJRK79zWnPtOlXFkwEZUSWcq
X-Google-Smtp-Source: ABdhPJwzjWXBlC7k+0u9w+VuCSU8kR0+XpJzURXzxxSq0eR5w1T0MkIQj+vX9/6i26tmvBMB5DpCsA==
X-Received: by 2002:a9d:4590:: with SMTP id x16mr4232874ote.94.1628177759718;
        Thu, 05 Aug 2021 08:35:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/33] ovmf: Fix VLA warnings with GCC 11
Date: Thu,  5 Aug 2021 05:33:47 -1000
Message-Id: <5a02a56d3e0c88626418391b8d4253f7cee4c38c.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 5406ce83e07c3f89b9f2bb26f083861467b7bc59)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ovmf/0001-Fix-VLA-parameter-warning.patch | 51 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
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
index 088e348bdc..a73bb916b0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -17,7 +17,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
            file://0003-ovmf-enable-long-path-file.patch \
            file://0004-ovmf-Update-to-latest.patch \
-        "
+           file://0001-Fix-VLA-parameter-warning.patch \
+           "
 
 PV = "edk2-stable202008"
 SRCREV = "06dc822d045c2bb42e497487935485302486e151"
-- 
2.25.1

