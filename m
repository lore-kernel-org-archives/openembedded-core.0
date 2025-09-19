Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92642CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:51:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.17105.1758289903753989641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=pmx9qRQw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202509191351404da5563338000207bd-_pro81@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202509191351404da5563338000207bd
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Sep 2025 15:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UJqGFkKyM5tC2wpwhjAd1Z7V/CR9wiPcsezkk2WJyKc=;
 b=pmx9qRQwPIlXO5cytP6wGNTOf977kgKFeQjQ1cutLaD99CgzBSkYDlFABkLsFd49sezTx8
 1NWMwadfzmsc3mBAb9K3YRWkDMkuXmkEGkQJ9AtOO/4jwwubpI7LBqY3mei+UaDrBXnb54XV
 CZD9trAgPoiGlHwS/NW4I8RugEasLwwYHR7ed+oPJCcbzOMB9EkutM508G8KWWtvaL294GnQ
 oXxqG8OhPlkXungRUGf0u/Nue3PgjJtFr7r6hrSlxpOUU52aA4dB2rubqu1K5b8GNWrXn0yp
 1DFIT3X/ZE6sKtUm2ResE+JEj050FwfhrOT4eMBPfKiIiRlATaLGQY7w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 2/2] llvm: fix build with gcc-15
Date: Fri, 19 Sep 2025 15:50:07 +0200
Message-ID: <20250919135123.4177466-3-adrian.freihofer@siemens.com>
In-Reply-To: <20250919135123.4177466-1-adrian.freihofer@siemens.com>
References: <20250919135123.4177466-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223752

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Pick 3 patches from meta-clang's scartsgap branch to fix build with
gcc-15. These patches are already in upstream llvm but not in
18.1.8 release.

Note: the patch 0039-Fix-build-with-GCC-15.patch from meta-clang
is not needed as it targets lldb which we do not build.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...36-Add-cstdint-to-SmallVector-101761.patch | 28 ++++++++++++++++
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch | 23 +++++++++++++
 ...-include-to-X86MCTargetDesc.h-123320.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.8.bb     |  3 ++
 4 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch b/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
new file mode 100644
index 0000000000..cf00eacbee
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
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
diff --git a/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch b/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
new file mode 100644
index 0000000000..24e7e1234f
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
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
diff --git a/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch b/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
new file mode 100644
index 0000000000..9bfbe9e2ed
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
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
diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
index 1f4b7e74d7..615c9f9e59 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
+           file://0036-Add-cstdint-to-SmallVector-101761.patch;striplevel=2 \
+           file://0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch;striplevel=2 \
+           file://0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch;striplevel=2 \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
-- 
2.51.0


