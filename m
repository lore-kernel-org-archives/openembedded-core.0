Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793D8C44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:30:11 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.255.1783477805587012535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 19:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO jenkins-X670-AORUS-ELITE-AX..) (10.177.121.125)
	by 156.147.1.126 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 10.177.121.125
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [OE-core][PATCH 0/3] kernel: make the kernel toolchain switchable to clang
Date: Wed,  8 Jul 2026 11:28:53 +0900
Message-Id: <20260708022856.2087339-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240415

From: "mark.yang" <mark.yang@lge.com>

Building the kernel with clang currently means overriding TOOLCHAIN and
the KERNEL_* variables in a bbappend. The kernel builds, but modules and
make-mod-scripts keep the gcc defaults and run the shared kernel build
tree with the other compiler. kbuild then re-runs syncconfig against the
shared .config and silently drops compiler-dependent options: a
CONFIG_CFI_CLANG kernel loses kCFI as soon as any module is built.
Documentation/kbuild/llvm.rst requires the same toolchain for every make
invocation against one tree.

This series adds a KERNEL_TOOLCHAIN switch so the kernel, modules and
make-mod-scripts move to clang together. gcc remains the default.

Tested on qemux86-64 with clang and gcc: both toolchains
build linux-yocto, make-mod-scripts and cryptodev-module, the shared
.config stays consistent across module builds (also with ld-is-lld),
and core-image-sato boots.

mark.yang (3):
  module.bbclass/make-mod-scripts: inhibit default dependencies
  kernel-yocto: export CLANG_FLAGS for the kconfiglib config audit
  kernel-arch: add KERNEL_TOOLCHAIN for building the kernel with clang

 meta/classes-recipe/kernel-arch.bbclass             | 13 ++++++++++++-
 meta/classes-recipe/kernel-yocto.bbclass            |  7 +++++++
 meta/classes-recipe/module.bbclass                  |  5 +++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb        |  5 +++++
 4 files changed, 29 insertions(+), 1 deletion(-)


