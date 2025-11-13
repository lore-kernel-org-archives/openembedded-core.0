Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FA2CD6E45
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:28:28 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22629.1763036898307765005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XkO0EKLA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202511131228141354f00466000207b0-v1c0am@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202511131228141354f00466000207b0
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:28:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lQLFNzHmEnULxsQfNJCPTKx8EVOkjiwrFpiVlDF3/W8=;
 b=XkO0EKLAlAUiEyOkI9DLKjwYxQc8BiqjXHSQIdi55l3vcyCAQI7AXeMb0XaKBY5OSX7lVI
 gMC4JeLniIOLYZ5RJFdhRy+aKMKyJNcomMaLACy4ZfyVEGptArB9TEhcOPRwDZwYQfeCUHwW
 BXYhAzXUwEDOmuB8B8/aw9fWwxa3PJEtI5IKQX9yq6cTMXr3yVxJl8q9HqFIFtmD3ji4gCHG
 vR7mGaRJTrWwj8lFtOuP68JBf3naabZnv6BtZXdN/fgybJuVr5zNh8zwfuPjD5Gb9k68TFq9
 ZL722ERpFz85dBoNecKkwBLSKKzTF7Db/o6M17ZSmKKP0ripkwu0hjnA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 0/9] go tests backports
Date: Thu, 13 Nov 2025 13:27:57 +0100
Message-Id: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226238

I'm working on scarthgap/go mixin layer where I also want to run proper tests.
This series makes testing equivalent to that what is available on the master branch.

The two patches from me are not backports yet, but are already submitted.

Alexander Kanavin (1):
  goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task
    signatures

Osama Abdelkader (3):
  go: add sdk test
  go: extend runtime test
  go: remove duplicate arch map in sdk test

Peter Marko (2):
  oeqa: fix package detection in go sdk tests
  oeqa: drop unnecessary dependency from go runtime tests

Ross Burton (3):
  testsdk: allow user to specify which tests to run
  oe/sdk: fix empty SDK manifests
  lib/oe/go: document map_arch, and raise an error on unknown
    architecture

 meta/classes-recipe/goarch.bbclass  |   3 +
 meta/classes-recipe/testsdk.bbclass |   3 +
 meta/lib/oe/go.py                   |   6 +-
 meta/lib/oe/sdk.py                  |   3 +-
 meta/lib/oeqa/files/test.go         |   7 ++
 meta/lib/oeqa/runtime/cases/go.py   |  66 +++++++++++++++++
 meta/lib/oeqa/sdk/cases/go.py       | 107 ++++++++++++++++++++++++++++
 meta/lib/oeqa/sdk/testsdk.py        |   3 +-
 meta/lib/oeqa/sdkext/testsdk.py     |   3 +-
 9 files changed, 197 insertions(+), 4 deletions(-)
 create mode 100644 meta/lib/oeqa/files/test.go
 create mode 100644 meta/lib/oeqa/sdk/cases/go.py


