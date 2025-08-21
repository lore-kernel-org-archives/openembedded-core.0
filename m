Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC69CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2499.1755816210957105863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GfEFM7B9;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-618b83e5b27so1816640a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816209; x=1756421009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfzhpkuMm5N10RPGJEpL6L9GzHUivVU+m4Ov8CP9Xso=;
        b=GfEFM7B9zjdTzP3LEJEhCampZFmWwSqVCdjGxWCY5gVkJqKYhgv9yNIAaMhMO1HTz3
         UzEgOt5B+aiKk0kay0EAsEnijVFos8/Tvhry9/D3orXEOJuTZ1EgTN4gKTRPdrE+QGbR
         k0h3vN6PCJ62OSepltK57ffneXbtPXMOqM4boTPxVnrfp8viSMqHsvVbof5/VpUhqhny
         A0yYbNB70OIc2zmXfiYgDa3vqhE0h0cdKgL+pgugWN3K0ZQTT+/eMaHQ2Hn8c66oDk04
         3w3z+Lh35g6Jg23Jceda6pvaNO8tboGU5nhjp5z85bHU/pjeT1T0xHhmCwoD9cRkcd1Y
         xDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816209; x=1756421009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfzhpkuMm5N10RPGJEpL6L9GzHUivVU+m4Ov8CP9Xso=;
        b=bXfVW/89TlVuwTjOVislJwCmVuL+s0SLOs+33f1luqZKp0coT/j9ojPia7qoLZ6ss4
         bPVWWZqfzQQAnM4/iWYDV4hHoYgPM2C+6Z4+HrKOYX+bb5dqnqtrkqV3uZ6bVwHF0kHY
         l+3mIYedQMCCIhq1S7VQ+WZS+98JNlAFblP4QpckNbUNc1ABMrsYgfgdwHUsKT1PsJnj
         J30obmOcFQUhX7su2a2zMSK/ObHow4/3wlT/JoDPQK1VSKhf8NG4U+VI7g1IzHoBBtsP
         We3mgK1QmM85Ar3JAGTJTiqymNy8p9/qHoFu5EGimX9NNl3D9IFHEesspduQgXz/+fRc
         kC0Q==
X-Gm-Message-State: AOJu0YzLfIFW9H8urKv6g55v2gurK6K/Bj2sUKv8vMjOav+8m6sVxX+h
	rzlWk09m036YTpUhpkHZqjsGAH2kyLKh/5py3Rvex4/EbB7ZkeDsS91BAWLBng==
X-Gm-Gg: ASbGncvvg75387EdiYv/Ua8JfM0C2krtJ1DiBaFWSWC9HZZegkD3iTf1CkGeDERCXNO
	sTuu9Npae9J8p0R/xj3CFkrNaadT0+6EK+7dcJhfoXGq4cLufL60WuVL+Tb9CnmkvkUGg/UgwUG
	qWzURjfcBdMr0sLYRSmtkWFyXVXtBJZWNDiImxhGWEkU3guEn0bX8iCJG5L9mb7+cS0pRmSnRbK
	w1agdHJ+V2ulaT4X7rxP5iim1XBtSQ3ULX3cm3c1OPU0pmLp33L9vQPySqBHibpuV1NiNN0W9h/
	pavrW45tpdp2NEmzuqze7ASw5F+yBFtAgLVue384QQJdt62+ooI5QtdXoyiO6aCmsKaUy0HLyJe
	aeFX2l+LZuOF07gx/pUBw26zANwX0MXPePk5IqTmae7aWNuJnJUgxznj98kBDV7+RPYc=
X-Google-Smtp-Source: AGHT+IHU7LKJ+5CdvRxWecaSWjtzxqUEJaRahcEzUSS69SFjBK/9RsHMFqijpjngI9QIHeDHuPjmmw==
X-Received: by 2002:a05:6402:5057:b0:61a:8c7c:a1f4 with SMTP id 4fb4d7f45d1cf-61c1b48f5e9mr503788a12.11.1755816209110;
        Thu, 21 Aug 2025 15:43:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-61a757a48e2sm5798978a12.40.2025.08.21.15.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:28 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 09/15] rust-llvm: fix build with gcc-15
Date: Fri, 22 Aug 2025 00:43:03 +0200
Message-ID: <20250821224314.1690103-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222294

From: Martin Jansa <martin.jansa@gmail.com>

As in meta-clang for clang-native:
https://github.com/kraj/meta-clang/commit/f915bbfc71f7b58c38607b8407718bd8b5cefa44

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
 

