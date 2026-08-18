Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A93DC5DF88
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3142.1787034698732242466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=hWMuJKjV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2026081806313564396c782a00020764-cravcl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026081806313564396c782a00020764
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SM9s9Cox0kwTl1OuWt3EwU+trwHbErf3i93xeAhRHH8=;
 b=hWMuJKjVTK1tu9N4ENk7lTD2A8oOsKseyhkgO7PCBbOF+ogPNgUa7pa+aOf6WUrYjkly3G
 hXp2gBTFggSVa+kTk3leV0i1O4EIIgbu1HpfkQliX762v0wrgnY2dtnYWXX2p2mB0681D+g/
 UbE4RNyupEgRKCjrvGd3ATLM1dSNfx+W1R39nHB9D98msXQ8KPt4cpNBU8jQqr//59jDO14H
 J0Wt1OMkOlCBXdxZR/xdRDHgg1bPREq973oWvIcPD62fVPYXOXjBK1BB1gn+aG6g7KpHJmrm
 7rA/wK1GHGbdPAAU7kxzMPLbutotR0/5brRIiWD6Vu6AcEeu1nL02udw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 00/14] devtool: ide-sdk: robust attach-mode debugging and test cleanup
Date: Tue, 18 Aug 2026 08:30:39 +0200
Message-ID: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243656

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes from v1 to v2:

On autobuilder the the test_devtool_ide_sdk_code_cmake and
test_devtool_ide_sdk_code_meson tests failed with:

File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3695, in _verify_launch_config
    self.assertTrue(
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on port 1234

Probably this could happen when the attach tests start a gdbserver and then
the once mode tests reuses the same port for gdbserver --once before the first
gdbserver --multi released the port and terminated. This is fixed by using
different ports for different debugging modes which can theoretically also be
used concurently.

Adrian Freihofer (13):
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

Alex Kiernan (1):
  wpa-supplicant: Use wpa_supplicant.conf from ${S}

 .../recipes-test/cpp/files/cpp-example.init   |   5 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 519 ++++++++-----
 .../wpa-supplicant/wpa_supplicant.conf        | 690 ------------------
 .../wpa-supplicant/wpa-supplicant_2.12.bb     |   3 +-
 scripts/lib/devtool/deploy.py                 |   5 +-
 scripts/lib/devtool/ide_plugins/__init__.py   | 111 ++-
 scripts/lib/devtool/ide_plugins/ide_code.py   | 160 ++--
 scripts/lib/devtool/ide_plugins/ide_none.py   |  44 +-
 scripts/lib/devtool/ide_sdk.py                |  18 +-
 9 files changed, 522 insertions(+), 1033 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf

-- 
2.55.0


