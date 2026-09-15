Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97CEC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:43:55 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24785.1789483415665846519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=NtF1lmyH;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1x6UNg-0003Oz-Tt; Tue, 15 Sep 2026 10:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=iRkDg6PWELnMImGmgfDVEz3l+RfNWvoY+oTqB+aX7PI=; b=NtF1lmyHtdJp8J
	czay+0UqZhXsUw0iHNjwCABB6ya0QUH/s4bjQzB8eqq+ST9gRb/3xoNY5n41NgwXsOnBEvqHxU5Za
	5oYzmykJ1ynP12q2/hfeB4q/n24YgyZJppyoQxDc3Fq0FWWqxYto/h0kAnIDVC/Rhe6iquR6h4tP/
	bGABHkuOm48paBEwwdgqKPlwVLBXb3ZvV3azsdH+FuMjHas1sC0cGKmN+pJNMy+LjDH7vUFPvjVk9
	TyzFyKEYLNM9wJS7zwty3TXNNrazIDkJsuKDafn9Ny6WI1YJClroevd6yKg537UsLGv2A3Gz+oywu
	ksF7AX0wfp3Vo8D+Utaw==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 0/1] lib/oe/package: Add strip keep-section support
Date: Tue, 15 Sep 2026 16:43:21 +0200
Message-ID: <20260915144322.7480-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245851

Hello,

This is v4 of the .debug_frame / keep-section patch, picking back up the
thread from last year:

  v1 (PACKAGE_KEEP_DEBUG_FRAME):
  https://lists.openembedded.org/g/openembedded-core/message/203797

  v2 (PACKAGE_KEEP_SECTIONS):
  https://patchwork.yoctoproject.org/project/oe-core/patch/20250204103744.27883-1-othacehe@gnu.org/

Quick recap of the motivation: on 32-bit Arm, GCC's default EHABI unwind
tables (.ARM.exidx / .ARM.extab) don't currently allow libunwind to
produce a full backtrace once execution reaches the C++ termination path
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941). GCC also emits
DWARF Call Frame Information for the same functions under .debug_frame,
which does allow a complete backtrace, but that section is unconditionally
stripped today. This series lets a recipe opt back in on a per-section
basis via PACKAGE_KEEP_SECTIONS, e.g.:

  PACKAGE_KEEP_SECTIONS:pn-myrecipe = ".debug_frame"

What's new in v4:

- Fixed the new oe-selftest case (package.PackageKeepSections) itself:
  it located busybox.nosuid with a hardcoded "usr/bin" prefix, which
  only exists when the usrmerge distro feature is enabled.

    https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4649
    https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4842

What's new in v3:

- Rebased on master, in particular on top of the runstrip() argument
  cleanup that landed since v2 -- no more tuple unpacking

- Added an oe-selftest case (package.PackageKeepSections) that builds
  core-image-minimal for qemuarm and uses readelf to show busybox loses
  .debug_frame by default and keeps it once PACKAGE_KEEP_SECTIONS is set,
  per Alexander's request for test coverage on v2.

- A couple of open points from the v2 thread I'd like to address before
  this goes further:

  * Richard asked whether this should just be folded into minidebuginfo
    instead of being a separate "magic" option. minidebuginfo only
    injects compressed *symbol* information (.gnu_debugdata); it says
    nothing about unwind data. PACKAGE_KEEP_SECTIONS is orthogonal --
    you need both symbols and unwind information to get a readable
    on-target backtrace, but a user may reasonably want only one of the
    two (e.g. GDB against a remote symbol store vs. a fully standalone
    coredump). I'd rather keep this as a separate, generic, opt-in knob
    than silently grow every minidebuginfo image by ~70KB per Arm binary
    that uses C++ exceptions.

  * Khem asked whether minidebuginfo could reuse .ARM.exidx/.ARM.extab
    the way it uses .eh_frame elsewhere. Per the GCC bug above, those
    EHABI tables are exactly the ones that currently produce partial
    backtraces on Arm -- that limitation is the reason this series exists.
    If that gets fixed on the GCC side, PACKAGE_KEEP_SECTIONS simply
    becomes unnecessary for this particular use case, but until then
    .debug_frame is the only way to get complete backtraces on 32-bit Arm.

- The matching ref-manual documentation for PACKAGE_KEEP_SECTIONS has been
  sent as a separate patch to the docs list.

Mathieu Othacehe (1):
  lib/oe/package: Add strip keep-section support

 meta/classes-global/staging.bbclass     |  4 +-
 meta/lib/oe/package.py                  | 19 +++++++--
 meta/lib/oeqa/selftest/cases/package.py | 57 ++++++++++++++++++++++++-
 3 files changed, 74 insertions(+), 6 deletions(-)

--
2.34.1


