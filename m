Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D094BC79FA8
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:38 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28900.1788763051702610338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=II/mtI/c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260907063728cf5197bc740002076b-slitcr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260907063728cf5197bc740002076b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CiDxf2seOxyOrnmn7gcQ9mADXS4b++LO7PwPmgX1oz0=;
 b=II/mtI/cXxR4EpiOs/CIvUcEQeuvIsdvgdCoQvyPZ7kZTr1r9CYmZofbextyy2KePbBeG3
 m7KARUFYMBrc38nJxqMB0G7DKosputOKBk+tBqPHUtS4oEoMgXOUUQX2/RUdRHkdSBb4wNqA
 XZuckfr6wogJINMF4hO2O5HwBBjdhZOs2nmClDjOClmejFQ2cdR0uQiIF91Zhv5FA1AHEeWb
 CRqmQHyTz2eqwCWAHYHcoNqmW0jjNrDYYwnncqMNn8W6ozbgJKAWhgaCX+V3nDfAo0XSaA5v
 auTGmAzivaAlZ5xASS+W10Ex7v7lAQJ8ULf0Dj3j1pQCBnOc/nHXwtfA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/9] devtool: ide-sdk: bug fixes, do_install-through-bitbake, NFS deploy prep
Date: Mon,  7 Sep 2026 08:36:06 +0200
Message-ID: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245233

From: Adrian Freihofer <adrian.freihofer@siemens.com>


v1 -> v2: Patchwork complained because the Signed-off-by line was missing:
  FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by.
        Add it manually or with "git commit --amend -s"
        (test_mbox.TestMbox.test_signed_off_by_presence)


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


