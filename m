Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A55C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:56:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.986.1721073371673747909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46FJu7tC023758;
	Mon, 15 Jul 2024 14:56:08 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 0/2] Fix SPDX processing with AMD toolchain building
Date: Mon, 15 Jul 2024 14:56:05 -0500
Message-Id: <1721073367-2668-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202067

AMD (Xilinx) toolchain building for our 'vitis' product line seems to trigger
two issues with the SPDX processing.  Specifically:

*) Baremetal toolchain elements may have directories listed in them, which
   triggers a hashing failure

*) The toolchains are built of multilib packages, which triggers a failure
   reported as 'No SPDX file found for package ....'


I think the first change is pretty obvious what needs to happen if directory
names can end up in the debugsrc list.  (Why they end up there, I have no
idea -- but this is all built from existing YP binutils, gcc, and newlib.)

The second patch it was tracked down that when multilibs are activated, the
system won't use the correct 'sstate_arch' to search for the files.  This
was resolved following a similar approach to the PACKAGE_ARCHs, but does
make the assumption that 'package.bbclass' is available in all instances.


Reproducing the build environment:

git clone https://git.yoctoproject.org/poky -b master
git clone https://github.com/Xilinx/meta-xilinx -b master-next
. ./poky oe-init-build-env
bitbake-layers add-layer ../meta-xilinx/meta-xilinx-core \
    ../meta-xilinx/meta-microblaze ../meta-xilinx/meta-xilinx-standalone \
    ../meta-xilinx/meta-vitis-tc

Build for each of the toolchains (really only aarch64-tc is needed to 
demonstrate the issues)

MACHINE=<machine> DISTRO=xilinx-standalone bitbake meta-xilinx-toolchain

Where machine is one of:
  aarch32-tc
  aarch64-tc
  arm-rm-tc
  microblaze-tc
  riscv-tc

(aarch64-tc has by far the fewest multilibs so is the fastest to parse and
build.)

Any questions, let me know!

(Also these changes were made available to https://git.yoctoproject.org/poky-contrib mgh/spdx-fixes)

Mark Hatle (2):
  create-sdpx-2.2.bbclass: Switch from exists to isfile checking
    debugsrc
  package.bbclass: Add ALL_MULTILIB_SSTATE_ARCHS

 meta/classes-global/package.bbclass  |  1 +
 meta/classes/create-spdx-2.2.bbclass | 15 ++++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.8.3.1


