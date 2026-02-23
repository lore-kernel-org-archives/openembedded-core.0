Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75A2EEC286
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5318.1771880890339131884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Pbn5xKYO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260223210807a38cdd700600020756-zbvubc@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260223210807a38cdd700600020756
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DZtXcbyfCTI1KZOBiWa8iRkZO79tuqOng97KDcxe8lA=;
 b=Pbn5xKYOP/R5YnPA6qCzyLrfuq2GnjJWzBShinoT89RJCCQB9+MXYD/RYaolWnnL/QFCRc
 PLq4Lv8IMqPF1/ba+JqOqN+4lBbS22twzRWMuv8YXIYB+lNn61f7EBrteFbKoN8hrC1CzKjN
 FsDuTFy/zBacy/0ALi3Wk3IZuNLmsGQ0EHgEkN5oNWsR8Y9mhwJTY4ZiC64pta0+2AeFlhS3
 tM/71a8ZV1QxeXB7RIgsDOPywK54JSt11GymUR2LqvqC7CcYx00MftNTvjR8bHQ1i4Yfx/Y3
 0nXEqxeRe2weiyMeL6aTHzM/YunQs77TiEHOzncrEX0Eh7HkdIkm8Kxg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/7] devtool ide-sdk: test improvements and basic kernel module development support
Date: Mon, 23 Feb 2026 22:06:33 +0100
Message-ID: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231695

From: Adrian Freihofer <adrian.freihofer@siemens.com>

- Some improvements and fixes for the existing devtool ide-sdk tests
- Intial support for building and deploying kernel modules with devtool ide-sdk,
  including a new selftest-kmodule recipe and test cases

Adrian Freihofer (7):
  oe-selftest: devtool: add compile step in ide-sdk tests
  oe-selftest: devtool: improve test_devtool_ide_sdk_shared_sysroots
  devtool: ide-sdk gate gdbserver warnings on recipe need
  module.bbclass: move environment setup to kernel_module.py
  devtool: ide-sdk: support kernel module development
  meta-selftest: add test kernel module recipe
  oe-selftest: devtool: add ide-sdk test for kernel modules

 .../selftest-kmodule/files/Makefile           |  16 +
 .../selftest-kmodule/files/selftest-kmodule.c |  56 ++++
 .../selftest-kmodule/selftest-kmodule.bb      |  18 ++
 meta/classes-recipe/module.bbclass            |  21 +-
 meta/lib/oe/kernel_module.py                  |  22 ++
 meta/lib/oeqa/selftest/cases/devtool.py       | 288 +++++++++++++++++-
 scripts/lib/devtool/ide_plugins/__init__.py   |   7 +
 scripts/lib/devtool/ide_plugins/ide_code.py   | 189 ++++++++++--
 scripts/lib/devtool/ide_sdk.py                |  46 ++-
 9 files changed, 598 insertions(+), 65 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/files/Makefile
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/files/selftest-kmodule.c
 create mode 100644 meta-selftest/recipes-test/selftest-kmodule/selftest-kmodule.bb
 create mode 100644 meta/lib/oe/kernel_module.py

-- 
2.53.0


