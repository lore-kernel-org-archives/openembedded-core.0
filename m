Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35102C79FA0
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:03:23 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21341.1788728596211101080
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=X52UMPfF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2026090621031301ca6d99800002078f-y8vxlo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026090621031301ca6d99800002078f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Sep 2026 23:03:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=d7CGwtHA5/DW8tQOiY6MUZaDLbmFG9INYBBZ8v4/Gv4=;
 b=X52UMPfFo/usZ1uVwnFuxgLbIc+gHJ2R9gjpCLlYc09/mSCs+3+qf9LXqh5Mnjs0OWYnkr
 0MgW40Kk94K0cBbI6D5kfiIdLnV1T7DZPcvSA6mJ4pbe5Pff1OgdDOeqAPVG5NRsrRyy0Bra
 rUTnX1F57xFjmU13HwOoGFELxdEd6BCnSVNKvUa8Z9N8pu+XbojgWdTCZ2cBZAwT5IydmU1J
 MffLOWcoC/U37rXFVgF+6ev/i5I3AHjr7kLJjuiNiiNZgUure5yQDX4fWOG/ry7QdLc7Kj8h
 qzMYV7gBIHlne2KiKQPP7AgXQX1eJZanE2UiVL/XW9SXnX18GCem4rQA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/9] devtool: ide-sdk: bug fixes, do_install-through-bitbake, NFS deploy prep
Date: Sun,  6 Sep 2026 23:01:58 +0200
Message-ID: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 21:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245210

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Mix of three things:

1. Bug fixes (1-2): stale-lib GDB fix, don't guess the slirp SSH port in the selftest.
2. Resend of patches sent a few days ago (3-6), rebased to apply in a
   different order and independently of the more controversial
   attach-mode/port-allocation work: attach process pre-selection via
   `processFilter`, and running `do_install` through BitBake (plus its
   tinfoil/selftest coverage).
3. Cleanup/prep for the upcoming NFS rootfs export patches (7-9), which
   will be resent separately once reworked: `PSEUDO_INCLUDE_PATHS` for
   `unfsd`, decoupling deploy's pseudo calls from `bitbake.conf`, and
   dropping a dead `files_list` computation.

Adrian Freihofer (9):
  devtool: ide-sdk: fix GDB loading stale libs instead of recipe's own
    build
  oe-selftest: devtool ide-sdk: do not guess the slirp SSH port
  devtool: ide-sdk: pre-select attach process with processFilter
  oe-selftest: tinfoil: test prepared task runner
  devtool: ide-sdk: run do_install through BitBake
  oe-selftest: devtool ide-sdk: test install task
  runqemu-export-rootfs: set PSEUDO_INCLUDE_PATHS for unfsd
  devtool: deploy: make pseudo calls independent of bitbake.conf
  devtool: deploy: remove dead files_list computation

 .../pseudo-pyc-test/pseudo-pyc-test.bb        |  45 ++++++++
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  95 +++++++++++++---
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  60 ++++++++++
 scripts/lib/devtool/__init__.py               |  11 +-
 scripts/lib/devtool/deploy.py                 |  17 ++-
 scripts/lib/devtool/ide_plugins/ide_code.py   |   1 +
 scripts/lib/devtool/ide_sdk.py                | 104 +++++++++++-------
 scripts/runqemu-export-rootfs                 |   2 +
 9 files changed, 270 insertions(+), 67 deletions(-)

-- 
2.55.0


