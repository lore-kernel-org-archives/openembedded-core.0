Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB1CC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 18:22:08 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1633.1786990924805197042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 11:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lneOwx61;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso2644426a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786990924; x=1787595724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ndC0eF2qaThqT+p1MskoWSaZEcpcE8Xh4WATQG6oOc=;
        b=lneOwx614KGwJ7rlKWRdlKDvBMS5Fzko49SZiiz1XhWZfF8QF6ytSaUJzAHOMYW5TZ
         I30rVtmBrXh53Xz6YtiXv+M22+1vZY+2NOh0jE+PQgXVlO7tXnJ1KfJ+/CAlo5utYx6n
         n/mrzUMij2r5ATKupiRA5ATLoogD417vMzVKuxaeZeK/fku2F+9no173oYdQLJCLUrp8
         ioJh7dpGETkUAfJhEy5gL6UxhsiOtRvDs78P8fQdIyS/CfsvHDMTW0T/r6XJzLfbLy3e
         MK6iRzffZwz17DHILDOvX1qpvGCXcuoG3n6FNrrdqO5jiDjHxED5MKGIsr3knZV8Qxzy
         NixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786990924; x=1787595724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ndC0eF2qaThqT+p1MskoWSaZEcpcE8Xh4WATQG6oOc=;
        b=O3AF8t79i2fSpTu3dMRDpaWpd5SG9QDtAHcwy9Rb2E4y2ImhSSP4Q3b7qOSVbZTw+c
         PBm08rxJIVX9QfFDNwiKQ4Zq9NPznRjja9PkhEL6kRHbE57WSHPYOGQvBkyMuCFMcUf+
         2mlG98GaXN++7GSJAF/iYPkyEMC5NtkMpeJ3shLJpWlTVkLxQBJE7SRS1DyBObVQU31y
         Dht6wE8P3LkxvcvcH3b4VN9krcuDTFYl2Q7kt9kBxzIJSWU+YMf/xgztvqtIfWN+pRd6
         pNpgsLxnSA9ab2MUrU2keIY3INlv9+gIlp95IQ6i81PQt6EIr2jFz0uzkmsVxo86YrjB
         4Vzg==
X-Gm-Message-State: AOJu0YycawVkY+wgP5A4A4bO9ryDbTJ/QgROGq426ZEv5DzCi/qdZqVq
	/HXTeu63Tij5jhHPDWxT2HhMfseHzqwaI+rNsy4cIUmgepXGcwLnQC8Rsz0SsUhk
X-Gm-Gg: AR+sD13x2MnPDbumcd0PkH7y7cxjJmzAuqp4ggtBC1EUK+q6Dd9mxPsDFSTNrqADXxa
	HuKdsHAcu53TC6hJk2pfKMJSVoZzOlT5vfxUal1xc2mzMUj7usZG71jBoFdNaVlby48kLGN5mBp
	uzLfhEskSEJadHx8Z87fE93czLanJhjUxjueqrFyYhiajTcAE6fOp4sNzascbfjQ6cLjROm30is
	9BgAKKREBTvZj9408NmIG2EOJu6yA5OzmxyMfTJbVYsbUNCnSByncN4DxRL8ogLGL8uPGL9gq4Y
	FAqNp4kcJ76atIq5FGq6KHZ6cn8VXGHXyx9zv8H6ESjwxaHRN0BzTmAE+xJATrHFPjYSwKO2OAy
	J7mn0/TSBP9RiXj8wlkS3NSkot8ilhOKgKK77CcCV6NvD3EvRbLoPG07Xp5XmxJweNmsbTbKqwT
	Pkfm7aSXni0D9FJa9aFnmxVc4gUaRWzx/uN/G2a2ojbbtuGiQ4KZLNUbKPEC+7jdJQdH9eklRi7
	Ac69cow2VY6L2gOpKiJLLXjD/DqT2PyA2H1i6apz9/kwmbOf+JJ7McK0HQ9X7IF02b2lmI7wELd
	JbS14xOl+GTLYChg/We5iuIUDathc9MBjgLWdoadW1ueFIYcJc+OL9gFq42tp/PWJyt0XKGNMFA
	Fhh/m5fErOCa1H0WLSn4OaXicw66t5FR/0KQafPsUbmaxQA==
X-Received: by 2002:a05:6a21:2d46:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3ccda54b66cmr2458079637.0.1786990924047;
        Mon, 17 Aug 2026 11:22:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326761d3539sm7624964eec.0.2026.08.17.11.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 11:22:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] mesa: fix clang+lld link failure in addrlib AVX2 detection
Date: Mon, 17 Aug 2026 11:22:01 -0700
Message-ID: <20260817182201.2388973-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 18:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243635

Fixes

ld.lld: error: relocation R_X86_64_PC32 cannot be used against
symbol '__cpu_model'; recompile with -fPIC

Check CPUID directly instead, avoiding the __cpu_model reference
entirely.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...uiltin_cpu_supports-for-avx2-detecti.patch | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
new file mode 100644
index 0000000000..7234f76b39
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -0,0 +1,56 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 13 Aug 2026 00:00:00 +0000
+Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
+
+__builtin_cpu_supports("avx2") lowers to a PC-relative reference to the
+libgcc/compiler-rt __cpu_model global. With clang+lld, linking that
+reference into a shared library fails because __cpu_model is treated as
+preemptible there:
+
+  relocation R_X86_64_PC32 cannot be used against symbol '__cpu_model';
+  recompile with -fPIC
+
+Check CPUID directly instead, which avoids the __cpu_model reference
+entirely and works with both GCC and Clang.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43820]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/amd/addrlib/src/core/addrswizzlersimd.h | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/amd/addrlib/src/core/addrswizzlersimd.h b/src/amd/addrlib/src/core/addrswizzlersimd.h
+index fd53e40..ce30204 100644
+--- a/src/amd/addrlib/src/core/addrswizzlersimd.h
++++ b/src/amd/addrlib/src/core/addrswizzlersimd.h
+@@ -57,6 +57,8 @@
+ #if ADDR_HAS_AVX2
+ #if _MSC_VER
+ #include <Windows.h>
++#else
++#include <cpuid.h>
+ #endif
+ #include <immintrin.h>
+
+@@ -85,7 +87,18 @@ static inline bool CpuSupportsAvx2() {
+ #if _MSC_VER
+     return IsProcessorFeaturePresent(PF_AVX2_INSTRUCTIONS_AVAILABLE);
+ #elif defined(__GNUC__)
+-    return __builtin_cpu_supports("avx2");
++    // __builtin_cpu_supports() lowers to a PC-relative reference to the
++    // libgcc/compiler-rt __cpu_model global, which some clang+lld
++    // configurations reject when linking into a shared library (the
++    // symbol is treated as preemptible: "relocation R_X86_64_PC32 cannot
++    // be used against symbol '__cpu_model'"). Check CPUID directly instead.
++    unsigned int eax, ebx, ecx, edx;
++    if (__get_cpuid_max(0, nullptr) < 7)
++    {
++        return false;
++    }
++    __cpuid_count(7, 0, eax, ebx, ecx, edx);
++    return (ebx & bit_AVX2) != 0;
+ #else
+ #error "What platform is this?"
+ #endif
+--
+2.43.0
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a139ebb176..8ee7db50ed 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
+           file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
 SRC_URI[sha256sum] = "efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef"

