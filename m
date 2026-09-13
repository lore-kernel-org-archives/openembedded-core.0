Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF390C88E63
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:43 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5902.1789329997495265787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=AADySpAE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026091320063381c9d94572000207a0-f1ueck@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026091320063381c9d94572000207a0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5Bfj0LmyOLLzyR6ZsOm03FSIALW0Hp+u+DcqQBw4GXo=;
 b=AADySpAEbELtzFASBSPd1aRYyqB1DaejRE31XxiZjvfxYDtcsL3YfgvUakFcQneRPXkSzm
 KpFLcMIbsnxN31rbhfxCGwitXKvbBrnPCGxfPNvwpJ1RoVQeAnXwj3kyBhZNZW5HU9hgyeRd
 wV1iuN35pYcSYW2EEWlmHTKPHJ1qIEjArzXgjCzZghx/Sx5O+YtPhsiRlREeqbpGzsc1jPWF
 4t4fnWzPPq/O1kTLvEiddbLXXC6FZcrKncX4+wiaLUdrR+vmV8ybCh3gGgozmiQaidTLXIr8
 hepgB3Osg4EUKWqZxBQyh2tyos4NOGITeoCJC3XJ67R4QGiqZG2Bau5w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/6] devtool ide-sdk: cleanups for the upcoming release
Date: Sun, 13 Sep 2026 22:05:49 +0200
Message-ID: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245727

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- Fix: opt-out of automatic IMAGE_INSTALL for recipes providing
  virtual/kernel or virtual/bootloader (deployed via do_deploy, not
  installed into the rootfs).
- Feature: --ide now accepts a comma-separated plugin list
  (--ide code,none), generating multiple IDE configs from one build -
  this is what enables the test refactoring below.
- Test overhaul: consolidate the GCC/Clang, ide=code/none and NFS/slirp
  oe-selftest variants into one shared flow per toolchain, cutting qemu
  boots/image builds while keeping the same coverage, plus dead-code
  cleanup.

Adrian Freihofer (6):
  oe-selftest: devtool update: recipe drop dead code
  devtool: ide-sdk: support opt-out from auto IMAGE_INSTALL
  devtool: ide-sdk: add initialize_modified_recipe() plugin hook
  devtool: ide-sdk: allow --ide to select multiple plugins
  oe-selftest: devtool ide-sdk: consolidate GCC/Clang ide-sdk tests
  devtool: ide-sdk: trim _add_broken_srctree_prefix_map docstring

 meta/lib/oeqa/selftest/cases/devtool.py     | 1028 ++++++++-----------
 scripts/lib/devtool/ide_plugins/__init__.py |    4 +
 scripts/lib/devtool/ide_sdk.py              |  117 +--
 3 files changed, 475 insertions(+), 674 deletions(-)

-- 
2.55.0


