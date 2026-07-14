Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F416C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:26:53 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9433.1784035607387619768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 14 Jul 2026 22:26:44 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.121 with ESMTP; 14 Jul 2026 22:26:44 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v2 0/3] kernel: make the kernel toolchain switchable to clang
Date: Tue, 14 Jul 2026 22:26:39 +0900
Message-ID: <20260714132642.2225115-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240888

From: "mark.yang" <mark.yang@lge.com>

Since v1, clang kernel toolchain support has been merged to master
with 928d81916f ("kernel-arch: Add clang toolchain support") and
e88ee794a3 ("kernel-yocto: Set CLANG_FLAGS for kernel config checks
when using clang"), superseding two of the three v1 patches. As
discussed on the v1 thread, this rework contains what remains on top
of current master.

On current master a clang kernel only builds when ld-is-lld happens to
be in DISTRO_FEATURES, since nothing else stages a bare ld.lld:

  scripts/Kconfig.include:41: linker 'ld.lld ' not found

Full log: https://errors.yoctoproject.org/Errors/Build/242422/

Patch 1 falls back to GNU ld in that case.

kbuild wants the same toolchain for every make invocation against a
build tree (Documentation/kbuild/llvm.rst: "The same value used for
LLVM= should be set for each invocation of make"), and the out-of-tree
module and make-mod-scripts builds run make against that same tree.
Setting TOOLCHAIN on the kernel recipe alone leaves them on the gcc
defaults: kbuild spots the CC_VERSION_TEXT mismatch and silently
regenerates .config. On current master, building cryptodev-module
after a clang kernel succeeds without a warning, produces a gcc .ko
and flips the shared .config back to CONFIG_CC_IS_GCC.

The toolchain has to be known at parse time to set up the cross
toolchain dependencies, so this needs to be a configuration variable.
Patch 2 moves modules and make-mod-scripts onto explicit cross
toolchain dependencies and patch 3 adds a KERNEL_TOOLCHAIN switch
covering all kernel-arch recipes.

Tested on qemux86-64 (master c2bd43b373, clang 22.1.8, gcc 16.1.0):
with KERNEL_TOOLCHAIN unset, core-image-minimal and cryptodev-module
build with gcc as before. With KERNEL_TOOLCHAIN = "clang" the kernel,
make-mod-scripts and cryptodev-module all build with clang, the shared
.config keeps CONFIG_CC_IS_CLANG after the module build, and linking
uses GNU ld, or LLD with ld-is-lld in DISTRO_FEATURES.

mark.yang (3):
  kernel-arch: fall back to GNU ld unless ld-is-lld is in
    DISTRO_FEATURES
  module.bbclass/make-mod-scripts: inhibit default dependencies
  kernel-arch: add KERNEL_TOOLCHAIN to switch the whole kernel toolchain

 meta/classes-recipe/kernel-arch.bbclass                      | 5 +++--
 meta/classes-recipe/module.bbclass                           | 3 +++
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
 3 files changed, 9 insertions(+), 2 deletions(-)


