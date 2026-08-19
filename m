Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E76CC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:01:53 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1136.1787176907030834856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=hZygDNXM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260819220143ce7e0414cb00020721-zyadme@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260819220143ce7e0414cb00020721
        for <openembedded-core@lists.openembedded.org>;
        Thu, 20 Aug 2026 00:01:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QqwIllFq6ANTDIuDozelX0JUqQQCm4NByZA0yG0e+zg=;
 b=hZygDNXMLk2oRP5yUpA5ycJZyzj79lw7lmgqQzHBC2bfesX3caWRECC/H2hP+7aKNJSm12
 lJxIaKlMidzmdXIcbQ8r9TxOC+PtjVOQAgXg18ElNb5h+UpDIPFLZjsFLNZajjsfwGp2kesK
 viqKT7bwqR+7LBUUwiQJH9V9jCGRV3DMKd0tv/rZAaTqAgkFzSBGgX0+A+yVoSeNvVrK2Txr
 DTdhAh35XNOuBzXjzE26b28cVmQsqzwy76YSs0Lg5j2zFuIFVsh52sg50ACLjtdb2/4CcAlP
 9PBbG9FfsEyzlrFpzFFth0WaqdaBXtIl6CxQbrZQ2GYem3FumNX+czQw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 00/14] devtool: ide-sdk: robust attach-mode debugging and test cleanup
Date: Thu, 20 Aug 2026 00:00:07 +0200
Message-ID: <20260819220138.4095398-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 22:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243793

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes from v2 --> v3:
- Fix AssertionError: False is not true : gdbserver did not report readiness on port 1234
  I was able to reproduce, understand, and fix the issue locally. It was not
  visible when oe-selftest was run with -v, as I had been running it locally,
  but appeared when running without -v, as the autobuilder does.
- Add one more minor improvement as a new commit on top.

Adrian Freihofer (14):
  devtool: deploy-target: pass tar -m to avoid future timestamp warnings
  oe-selftest: devtool deploy: use QEMU target commands
  oe-selftest: devtool ide-sdk: Add new test classes for ide-sdk tests
  devtool: ide-sdk: fix meson IntelliSense for gcc toolchain
  ccp-example: fix PID file handling
  devtool: ide-sdk: default to all modified recipes
  devtool: ide-sdk: let gdbserver reuse the shared debug server wait
    helper
  oe-selftest: devtool ide-sdk: support $ in gdbserver task command
  devtool: ide-sdk: attach via extended-remote
  oe-selftest: devtool ide-sdk: wait for gdbserver readiness
  oe-selftest: devtool ide-sdk: verify debugger shutdown
  oe-selftest: devtool ide-sdk: use qemu.run for target checks
  oe-selftest: devtool ide-sdk: verify attach debug workflow
  devtool: ide-sdk: detect stale gcc python helpers in the recipe
    sysroot

 .../recipes-test/cpp/files/cpp-example.init   |   5 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 576 ++++++++++++------
 scripts/lib/devtool/deploy.py                 |   5 +-
 scripts/lib/devtool/ide_plugins/__init__.py   | 114 ++--
 scripts/lib/devtool/ide_plugins/ide_code.py   | 160 +++--
 scripts/lib/devtool/ide_plugins/ide_none.py   |  44 +-
 scripts/lib/devtool/ide_sdk.py                |  23 +-
 7 files changed, 582 insertions(+), 345 deletions(-)

-- 
2.55.0


