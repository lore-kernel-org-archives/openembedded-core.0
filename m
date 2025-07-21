Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFA4C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40628.1753104274218339655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04968153B
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 743D93F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/5] clang: improve LLVM target selection logic
Date: Mon, 21 Jul 2025 14:24:24 +0100
Message-ID: <20250721132426.3321928-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721132426.3321928-1-ross.burton@arm.com>
References: <20250721132426.3321928-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220689

The GPU targets are incredibly slow to build, so if the DISTRO_FEATURES
doesn't include opengl or vulkan assume that the user will not be using
a GPU and disable them.

Alternatively, a distribution could state that they'll only be using
one of the backends, and set LLVM_TARGETS_GPU explicitly.

On my build machine, disabling the GPU targets reduces the build time of
clang-native from 21m to 16m.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 884398dcaa3..5a3893c0474 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -111,16 +111,18 @@ CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_=
DEFAULT_UNWINDLIB;\
 CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
 LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIR=
V_HEADERS_SOURCE_DIR;\
 "
-#
-# Default to build all OE-Core supported target arches (user overridable=
).
-# Gennerally setting LLVM_TARGETS_TO_BUILD =3D "" in local.conf is ok in=
 most simple situations
-# where only one target architecture is needed along with just one build=
 arch (usually X86)
-# Core tier targets:
-# AArch64;AMDGPU;ARM;AVR;BPF;Hexagon;Lanai;LoongArch;Mips;MSP430;NVPTX;P=
owerPC;RISCV;Sparc;SPIRV;SystemZ;VE;WebAssembly;X86;XCore
-# Known experimental targets: ARC;CSKY;DirectX;M68k;Xtensa
=20
-LLVM_TARGETS_TO_BUILD ?=3D "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X8=
6;LoongArch;NVPTX;SPIRV"
-LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
AMDGPU;BPF;NVPTX;SPIRV"
+# By default we build all the supported CPU architectures, and the GPU t=
argets
+# if the opengl or vulkan DISTRO_FEATURES are enabled.
+#
+# For target builds we default to building that specific architecture, B=
PF, and the GPU targets if required.
+#
+# The available target list can be seen in the source code
+# in the LLVM_ALL_TARGETS assignment:
+# https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
+LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'open=
gl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
+LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;Loong=
Arch;${LLVM_TARGETS_GPU}"
+LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb, d)};=
BPF;${LLVM_TARGETS_GPU}"
=20
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
=20
--=20
2.43.0


