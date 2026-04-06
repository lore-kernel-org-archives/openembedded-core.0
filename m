Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59492FB5173
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:12:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66606.1775513516591451205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=O5WiYzK2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260406221153ecf47ff1fa00020714-5j9v4s@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260406221153ecf47ff1fa00020714
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Apr 2026 00:11:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IqvkXjt/TkJuoRifNv5MnKpCNCWrNYKWAYFOv5SUAQM=;
 b=O5WiYzK2LHVyhfLtTScrl3Ka/vV9U/TfFr8h4pHEM9lg9KAvOEbDSyK1D7nRpm4rG/R+rJ
 usUFypommrEO0FCpnR5hc+Ova2owtL/5JDm7Z2zc22Jvljh9ZFblBZQXVf1PHCWQZCbjNb5A
 tggFwGsoAhnliA/I58o5Om8ZKgG4PIkFThmz2XmGcfx4ZNPLnsf131Tc8uUwV+DSSWxeOeS0
 Ez9nGdY21vHJbzSg9sLhlW5JcI0g1EhVoCrAk5vxPjzJeGLxxwtte02dXC9w7RaJUF5BEq6Y
 uSHZoihsGComLEIHW+PUkNh7U5Q1UjndDJdSgWJFPZJzlCH150q5zoxg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/6] ide-sdk: various fixes
Date: Tue,  7 Apr 2026 00:10:27 +0200
Message-ID: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234691

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series collects small fixes found while backporting the devtool
ide-sdk work to scarthgap and while preparing LLDB support for clang
recipes (which will follow in a separate series).

Fixes in the ide-sdk self-tests: use stat instead of ls for ownership
checks (ls truncates long names), move the GDB breakpoint past the
std::vector constructor so it works with older GDB versions, use
assertRegex for meson's "Fail: 0" output to tolerate whitespace changes,
and enable static UIDs/GIDs in the test image build to avoid ownership
mismatches between cmake-example and meson-example.

The static-IDs fix revealed that devtool deploy-target silently installs
files with wrong ownership for any recipe using dynamic UIDs/GIDs, since
preinst scripts are never run. A warning is added to make this visible.

Finally, ide-sdk was reading TCOVERRIDE instead of the correct variable
TOOLCHAIN to identify the active toolchain.

Adrian Freihofer (6):
  devtool/deploy: warn when deploying a recipe with dynamic UID/GID
  oe-selftest: devtool: use stat for reading user/group names in ide-sdk
    tests
  oe-selftest: devtool: GDB breakpoint after std::vector is constructed
  oe-selftest: devtool: use assertRegex to match test output for meson
  oe-selftest/cpp-example: fix conf file ownership with static UIDs/GIDs
  devtool: ide-sdk: use TOOLCHAIN not TCOVERRIDE

 meta-selftest/files/static-group              |  2 ++
 meta-selftest/files/static-passwd             |  2 ++
 .../recipes-test/cpp/cpp-example.inc          |  6 +++-
 meta/lib/oeqa/selftest/cases/devtool.py       | 35 +++++++++++++------
 scripts/lib/devtool/deploy.py                 | 32 +++++++++++++++++
 scripts/lib/devtool/ide_sdk.py                |  6 ++--
 6 files changed, 69 insertions(+), 14 deletions(-)

-- 
2.53.0


