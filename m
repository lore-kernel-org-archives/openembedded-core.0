Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A78CF8856
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:14:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33797.1763644478431402198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 05:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RRP+g+FV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775895d69cso3967345e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 05:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763644477; x=1764249277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiKgMc+LTFgJNTMt3YyiWhSNPk3ILEbc2DMWJTH2jz8=;
        b=RRP+g+FVu5ECzxTKoRbc0GEWc8yzxXHpQ0l7a0tMCY/e1yHC42d2unP7WRqpsQnfjU
         d8k2BxfEQs4UMsS3kBMrl8b1ybfYZGSpv5L9guKPh2R8LJFEl5KyNN+5qf0DSDHpZDxC
         D+ny8Va1ZU8Lq/vOMB4YKrm230BPYpY30KizOdM4hmUCBYwfOVA6erXIIPak5KxB80Xm
         EA2QQhU5nrBk2PWlbNBKt9JXq6U/9T9UtESY0pmT3u1Fe3q6JXC09PYH8JHa1xXQZxZi
         9BKVkSzsb9JaE7FbJRjPFi1lBdIfDpPlEFp8BhmkkrhgtYudJv6NGf9kKTeLIgxrGUiT
         IZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644477; x=1764249277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiKgMc+LTFgJNTMt3YyiWhSNPk3ILEbc2DMWJTH2jz8=;
        b=iI9KvkAKmSIZGtAlW/1xKeQ6RmE81sCFtFZ+YnJoc2z7z2D5ypMr5YsyAohbxKvjWo
         XvYTC+Z6D/zAjRl3EwSqx/e9WJMamMvphUYDT4qUx4Y4V9vsKA0xv4CohxL0VKETkHOD
         RffDe85Nff/8g4EOGatkO8dIhVAq/kRgegWHDGg5GLiYsPhL/HJ0Qq5LnPmmMhN/up6D
         fZlY9TZHny9cakph72ongMQAzn0jKdYlbLoidBOfWHMgPlQL20swzDn7x8kvLpvISs1k
         5Ai5ks4K5eMesFNhgYwl/nl+i6XDRJxPpWDgvgwt2TibzdrcPupL0KW3DBNKp13RQLH3
         a2Kg==
X-Gm-Message-State: AOJu0Yy+OUWGtZPzqF4Pe/9AKikQ89CvlUvPsJw3nbGn8SXRpaPV6+N5
	MJVJysejQ5cYvTlzAMkeuHGtFnyUhZNRw1xF6N5cQcb3B88d/5EEKVCmU/Kbd6mX
X-Gm-Gg: ASbGnctITAJv6CKGKCuRhE1rlBFR5WiUog2EPnPn+C1pWhtlQJjZYBirywxLJG+Jukw
	45uKOU9+o4O1Skw5PEixTl+SDVNQX3oXuiAjM7n/ziMavaLZydGcBnlnBr7EWMH7LDswnpE/uWG
	FKsft+oBBiCjhwuc3UtgTC8fVf04ZkUiPy8FkCAIkAKAly3eWQFB9YjcvYBGWr3lOmFOjYaxYzn
	hhtPsaJWDUlzZ9ByCflUaKhNEw+5y0spk1p0lC9NCNp4OJ3t4Nql9KisqVNm1K0TivZcj14GW2I
	mM+HYIxJAuhECO9M13YYZV12fgtqjh9E+/MXWf10hhz43p/EQoA4fgiBF98wF8PIQEVWQm5/+9e
	WQjbj6tfjbxH3+AQ+Md7zu7fHsMhetcUttWPQLj1ndN3Vjos+YHV/ohYXGII0Q/N9U5HIAcnoWh
	fkgIW4TCt2
X-Google-Smtp-Source: AGHT+IEB5Wa5jnJSqtAJ/Fj0DLQLxIm/x34tm2iSoVKrROYM3H9P+hALJlcaRhobQyGxy8i4TqpoSg==
X-Received: by 2002:a05:600c:444c:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-477b8aa06c0mr34035925e9.31.1763644476502;
        Thu, 20 Nov 2025 05:14:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dfd643sm62142165e9.14.2025.11.20.05.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:14:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] glslang: fix compiling with gcc15
Date: Thu, 20 Nov 2025 14:14:35 +0100
Message-ID: <20251120131435.4106436-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 13:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226620

Backport a patch that fixes a compilation failure with gcc15:

| .../git/SPIRV/SpvBuilder.h:238:30: error: ‘uint32_t’ has not been declared
|   238 |     Id makeDebugLexicalBlock(uint32_t line);
|       |                              ^~~~~~~~
| .../git/SPIRV/SpvBuilder.h:64:1: note: ‘uint32_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...uilder.h-add-missing-cstdint-include.patch | 30 +++++++++++++++++++
 .../glslang/glslang_1.3.275.0.bb              |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch b/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000..02b072c56a
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch
@@ -0,0 +1,30 @@
+From e40c14a3e007fac0e4f2e4164fdf14d1712355bd Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Fri, 2 Aug 2024 22:44:21 +0100
+Subject: [PATCH] SPIRV/SpvBuilder.h: add missing <cstdint> include
+
+Without the change `glslang` build fails on upcoming `gcc-15` as:
+
+    In file included from /build/source/SPIRV/GlslangToSpv.cpp:45:
+    SPIRV/SpvBuilder.h:248:30: error: 'uint32_t' has not been declared
+      248 |     Id makeDebugLexicalBlock(uint32_t line);
+          |                              ^~~~~~~~
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/glslang/commit/e40c14a3e007fac0e4f2e4164fdf14d1712355bd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ SPIRV/SpvBuilder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/SPIRV/SpvBuilder.h b/SPIRV/SpvBuilder.h
+index b1ca6ce1..00b2e53a 100644
+--- a/SPIRV/SpvBuilder.h
++++ b/SPIRV/SpvBuilder.h
+@@ -56,6 +56,7 @@ namespace spv {
+ }
+ 
+ #include <algorithm>
++#include <cstdint>
+ #include <map>
+ #include <memory>
+ #include <set>
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
index 2fd1e72a26..b688b3df48 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
+           file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

