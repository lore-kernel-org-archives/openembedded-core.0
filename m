Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F8C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 17:21:45 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13298.1705080103622105283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 09:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MF8ymjSX;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so5627017b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 09:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705080103; x=1705684903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0uH2YTEymCYYTiWBrEAwaPAdYCKKjZ5UXMsFIesxWc=;
        b=MF8ymjSXsddENdkFVzVoTtuE9QqvJoMHRTOVfJyiiJhbHabe7+x8AoHSX3/nGhAKYL
         c6ua9EgxlboACj4P4+JGXRKwSNi+bonvQbWcU0llgL/+bP97SZAzrQfR/6Ixd2Wq1JNp
         iGfozvVVDXhHyfIbHUfUFQNLlXevzf6Z5rbTKBZGZeFnTDQAfrVxbJm5sy2MLqk/4prV
         Ku/PvPUkS5ekBRTXsSy8vzn0yZLt+x2ErM7b2+yW0t3bBqZPFUAOhE0lSWU/Qz54Bp0H
         10w9inaKoKzHTALp/j3jShKNrauSALM+l0cRVctOIN/8M5U8avrXsJRuv/hpuIO5JRST
         N4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705080103; x=1705684903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0uH2YTEymCYYTiWBrEAwaPAdYCKKjZ5UXMsFIesxWc=;
        b=Zp8quHk0rZexjNmk9oRLBg4i2oYAikFKJoJhNEiJsfqt27zQH1Veos4L6s0pcRDLxE
         ikiiUQOVTdzpogVq/FDtwzESxh1rjmx/+X6fVzJQ8mpPyVLiSMEnN4EFCXXQrUNevsKB
         /Jx1uIgnC9RJAQbkwvuVfzj0DTZi8w6ezi8pGtjRpkuC0sITianVQaY5gJJ6nWLmXVTG
         JP9Vm+4A8nWfP0PE6E0gIy+ZDgiGK8l/ZHYdBPOGtlTAGoBrPHTjcQa5k+J1fx6K6Ihe
         gPlH5e/KgyTCTl5tMh5Fk6NQA6VdDeAu6zie+pqwq+Wv3MGKl86Lqup46zxbKs0EcKhr
         1jhQ==
X-Gm-Message-State: AOJu0YyhbjjpIXH7JyKHn1+WWcGAR7pFQgAbCBPLzjBdsc4AzYAjqmRq
	RTlFj9FOYnGnZem1/PfuxdsTkM+gb9qL9A==
X-Google-Smtp-Source: AGHT+IHNLz/O5qgSHeXt8S922TeI4k8/i9RqRJXBjuyFlW50MAMcF/fsX4sBm1WYn9Drmotsl0ee2g==
X-Received: by 2002:a05:6a21:329c:b0:19a:5c85:fff6 with SMTP id yt28-20020a056a21329c00b0019a5c85fff6mr1340850pzb.33.1705080102634;
        Fri, 12 Jan 2024 09:21:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2e3])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78c18000000b006d7f1ae421csm3529444pfd.145.2024.01.12.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 09:21:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Workaround for clang compiler segfault
Date: Fri, 12 Jan 2024 09:21:39 -0800
Message-ID: <20240112172139.2929419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 17:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193598

This is a compiler crash which is under works upstream, until its fixed
lets disable musttail calls on clang+arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/no-musttail-arm.patch    | 21 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.42.2.bb  |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
new file mode 100644
index 00000000000..a6d67c1d703
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -0,0 +1,21 @@
+clang/arm: Do not use MUST_TAIL_CALL
+
+This causes clang-17 to crash see [1]
+this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
+
+[1] https://github.com/llvm/llvm-project/issues/67767
+[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
+
+Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/Compiler.h
++++ b/Source/WTF/wtf/Compiler.h
+@@ -284,7 +284,7 @@
+ /* MUST_TAIL_CALL */
+ 
+ #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
+-#if __has_cpp_attribute(clang::musttail)
++#if __has_cpp_attribute(clang::musttail) && !defined(__arm__)
+ #define MUST_TAIL_CALL [[clang::musttail]]
+ #endif
+ #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
index 2ba60eb65ba..997aa5575b0 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
+           file://no-musttail-arm.patch \
            "
 SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
 
-- 
2.43.0


