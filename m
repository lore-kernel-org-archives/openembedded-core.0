Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.11457.1622221965525039719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 10:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pnkUlGlb;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso7558499pjx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/O4Yhn5+C6O3wD6xfDGBdY0me7KpkUkrvERm40mmJk=;
        b=pnkUlGlbdjVXe5djxEGxY+H8nazXBMGWunpQbw1XWo8ih6rl275xNfTF0KRmzNAkbx
         sBIRv6gThXK89WqmxVZrYIZaWziKG2DwgG3L85viziGkCEHYV6vXdzC1HijgJB9XXh5Z
         tAhf3CwBYOsjvjmR5qfY4Al/d0rsuMksUn+lAaxBmETdcXZITZZC+J+URVRZFNzQOrN8
         ux0zQ1Tpnd5B/wuC00YRq8kQ/u0jWxAoRbKnEAJgSmK0AC50a6LQSciRud1hDQhD2cvX
         O6U7dP5+DNx4yj/jv3alG0Z1gG60Ih7X4Zt+R62ECqME7UeGNVaaca4b61tGT9AvjytG
         Q/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q/O4Yhn5+C6O3wD6xfDGBdY0me7KpkUkrvERm40mmJk=;
        b=WJ2+ChgJ0oZ+JqiXPtx1SGV31v5e++ZYSfsggfgbec4Ky/k9opy0932gcDXjkMbEt7
         RbSV2qVoWS0krTEJfDlMPTuQYwjdyKv9Zn5ZQJ1ZdOAG0zAJ/Bt7U4kGcTCoXhl7aY7U
         57xqktq82bsNhhZp0jXnsGgMQi7UWgMXKmU7vtXvWUbWyZx3+J3Rd5qFeuoCYeFCKRNl
         1XkjQTucK0A0zyv2YMjiHZmGzPGyuBAHkWKlcKlbtX2zcbOgHTtVreq+6ohsppUup4I1
         NuwVYFTlH5Yb1A7eq1yybvg6X8wsGhm6m6tKUicpL34VOHHnHdOftu5HY66IiqZWDKWl
         GHtQ==
X-Gm-Message-State: AOAM530CSE6O9woyRJT2cgMtHrVvfXNbL1Yx7hV7hwyZombKrRn+HRhR
	eHezUYT1TjLx2Hcvb6sQmQUpJDp2udUgyg==
X-Google-Smtp-Source: ABdhPJzxYMFNNlN8N4yrnkzN/Am+LcdanqHvO40nlXYz+jOd/0oDpDJulYD6/58jHv83AIyEu8W7Mg==
X-Received: by 2002:a17:90a:ea10:: with SMTP id w16mr5255429pjy.46.1622221964643;
        Fri, 28 May 2021 10:12:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d579])
        by smtp.gmail.com with ESMTPSA id y26sm4941168pge.94.2021.05.28.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 10:12:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ovmf: Fix VLA warnings with GCC 11
Date: Fri, 28 May 2021 10:12:41 -0700
Message-Id: <20210528171241.1865615-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 696c234035..888ea082ec 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://zero.patch \
            file://debug_prefix_map.patch \
            file://reproducible.patch \
+           file://0001-Fix-VLA-parameter-warning.patch \
            "
 
 PV = "edk2-stable202102"
-- 
2.31.1

