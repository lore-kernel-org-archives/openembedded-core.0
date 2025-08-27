Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DFCA0FFC
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:39 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.6647.1756330235880730608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KuKEggTy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-327aa47c928so144342a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330235; x=1756935035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfydZJBr1gAko3cEegmLHVHbY/czkJHSyv1knIpuph8=;
        b=KuKEggTy6uSg8fVSfOhBSzZJvSFfVdayl1SMwf2BZStOgGC9VymNtrhLssDFKmmeiM
         XWvdSdULJ9nS5rS6Ivh6zqVIZNRiq5lJH5ovpHNsRGLBRKqlYvcZZfTwJ8+3+EizeoKH
         eOKDxj+s3PPthy1m6LGo+xzQFvOMziwzNACdC6pg9plG+ClpkW5oXS0jLb9dbGEhHCtb
         qfLX32it7ez+xTaZFPdAGkhKmSb641zMnT6pZlLwIbkuB+iTubtj2bPeLEk+gQC5obOv
         aIfFnZlbSG8OS7NZKaKRGPNSGUEVw/OYgj201rUXINXIelbLYQqHlzzx8H4fHjhpHM3w
         UHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330235; x=1756935035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfydZJBr1gAko3cEegmLHVHbY/czkJHSyv1knIpuph8=;
        b=V+wbEJozTU8nIOlJ4J4rbji8VtEU6jQPELbE0dvQwWE1cyFaiv/MtbSHeDVxDXwXLl
         W/qRf7EsxfURgD5keeBZ9jWpX+xpwxHeHqnPhkmbgi5L4Y8DnQ8IRDLabyqxytjKcqLY
         825EwS3eERK9R5RA/Cse6Jx2HCBlsiyEuLLF05DfpmMO0+vG8uRY7SSqoxj/4qL3njhc
         dGjXe8f+ZlmoBycDGvlSlgtA19pkQq6caXdpdHoCotapC958knyM9p4rkkM3dLBWdL02
         0oLdcjjNIFbDTAEwNpc7RxYbR6RvgnHbizE/N5JRn8WLT9puqezG+w0dz35XLESqqWVH
         PJVQ==
X-Gm-Message-State: AOJu0Yyt9n7IHWnyZYZK1GJ6JYWda38nhTRrxtYV4dc6sg6xjVbrrj++
	LRhGHNrnAle0FAysGOKRE7XHyCssUK3dGMGQTk0OQfEYytZuMWeEYjzKbh7AGgdJHR8X/X9Owim
	N9cu0
X-Gm-Gg: ASbGncu2q5Ppp5uDTgMm61wrCDW7kWFZ82jjMClupFJInR1oUIIrbYrB+GP1hEIDDY6
	1dwtp0Q7Or6hiIRUqmG1nwNFecZONgiDFt+40GFHwjEJbyzgaug5VoUz/48RAquvuUkozM4arUs
	1G8AdOue00Qp8hdQzuA6lGRA2a0idXqqvzsL54Rprmn/HdkOCuZObFdVUEkCy3BsFgXienI978P
	ywDQzM8ucpolaNkMW53AUNpKxytsq5SzSp9h4yL3nTn0tDfFx3dzEUnbksNEoZHmN7mAopBf14b
	AXohSG3N+7IiOgQyJM+5fdQEsrYwQh3VOu5GIqEtZ3W66Ex2AdLBQQzhuo73mfcV8/k0ot05iol
	mND+TETE3fQ7QiUMa0usNgGXR
X-Google-Smtp-Source: AGHT+IGRO6iJAIsQdldhnps/1JTKpghuR8YWh3oLE3NIBkIbqMuzHcgxs2qfsYy/zLZKSIJiDWuMng==
X-Received: by 2002:a17:90b:5445:b0:327:5360:5b1a with SMTP id 98e67ed59e1d1-3275360623bmr8802806a91.37.1756330235048;
        Wed, 27 Aug 2025 14:30:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/33] rust-llvm: fix build with gcc-15
Date: Wed, 27 Aug 2025 14:29:31 -0700
Message-ID: <818750db213dc2c0daac4757d078092be6de3fe6.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222532

From: Martin Jansa <martin.jansa@gmail.com>

As in meta-clang for clang-native:
https://github.com/kraj/meta-clang/commit/f915bbfc71f7b58c38607b8407718bd8b5cefa44

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...36-Add-cstdint-to-SmallVector-101761.patch | 28 ++++++++++++++++
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch | 23 +++++++++++++
 ...-include-to-X86MCTargetDesc.h-123320.patch | 32 +++++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |  8 +++--
 4 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0036-Add-cstdint-to-SmallVector-101761.patch b/meta/recipes-devtools/rust/rust-llvm/0036-Add-cstdint-to-SmallVector-101761.patch
new file mode 100644
index 0000000000..cf00eacbee
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0036-Add-cstdint-to-SmallVector-101761.patch
@@ -0,0 +1,28 @@
+From 9c9071480edd4093b28a9e9a9980c2426d27344c Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Fri, 2 Aug 2024 23:07:21 +0100
+Subject: [PATCH] Add `<cstdint>` to SmallVector (#101761)
+
+SmallVector uses `uint32_t`, `uint64_t` without including `<cstdint>`
+which fails to build w/ GCC 15 after a change in libstdc++ [0]
+
+[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3a817a4a5a6d94da9127af3be9f84a74e3076ee2
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/include/llvm/ADT/SmallVector.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/include/llvm/ADT/SmallVector.h b/llvm/include/llvm/ADT/SmallVector.h
+index 09676d792..17444147b 100644
+--- a/llvm/include/llvm/ADT/SmallVector.h
++++ b/llvm/include/llvm/ADT/SmallVector.h
+@@ -19,6 +19,7 @@
+ #include <algorithm>
+ #include <cassert>
+ #include <cstddef>
++#include <cstdint>
+ #include <cstdlib>
+ #include <cstring>
+ #include <functional>
diff --git a/meta/recipes-devtools/rust/rust-llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch b/meta/recipes-devtools/rust/rust-llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
new file mode 100644
index 0000000000..24e7e1234f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
@@ -0,0 +1,23 @@
+From 422390b31680305ce6babcfbf65579b7dbe090a5 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 3 Aug 2024 06:36:43 +0100
+Subject: [PATCH] Include `<cstdint>` in AMDGPUMCTargetDesc (#101766)
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/8f39502b85d34998752193e85f36c408d3c99248]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h b/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+index 3ef00f757..879dbe1b2 100644
+--- a/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
++++ b/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+@@ -15,6 +15,7 @@
+ #ifndef LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ #define LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ namespace llvm {
diff --git a/meta/recipes-devtools/rust/rust-llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch b/meta/recipes-devtools/rust/rust-llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
new file mode 100644
index 0000000000..9bfbe9e2ed
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
@@ -0,0 +1,32 @@
+From 72dc74c42eb9d9940b36c6804a4e4ac757370324 Mon Sep 17 00:00:00 2001
+From: Stephan Hageboeck <stephan.hageboeck@cern.ch>
+Date: Mon, 20 Jan 2025 17:52:47 +0100
+Subject: [PATCH] Add missing include to X86MCTargetDesc.h (#123320)
+
+In gcc-15, explicit includes of `<cstdint>` are required when fixed-size
+integers are used. In this file, this include only happened as a side
+effect of including SmallVector.h
+
+Although llvm compiles fine, the root-project would benefit from
+explicitly including it here, so we can backport the patch.
+
+Maybe interesting for @hahnjo and @vgvassilev
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/7abf44069aec61eee147ca67a6333fc34583b524]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h b/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+index 437a7bd6f..fd7d79484 100644
+--- a/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
++++ b/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+@@ -13,6 +13,7 @@
+ #ifndef LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ #define LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 292fc15c55..cba41c739e 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -10,8 +10,12 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
-            file://0004-llvm-Fix-CVE-2024-0151.patch;striplevel=2"
+            file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+            file://0004-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
+            file://0036-Add-cstdint-to-SmallVector-101761.patch;striplevel=2 \
+            file://0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch;striplevel=2 \
+            file://0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch;striplevel=2 \
+"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-- 
2.43.0


