Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89480C9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 20:52:17 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5351.1790196731682369882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 13:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hFY3AydD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026092320520847b697d38f0002073e-wz1rfh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092320520847b697d38f0002073e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Sep 2026 22:52:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aopGNhjBeTN6QsTfan5MelD9hIjtBeA66i/QUs4b3C4=;
 b=hFY3AydDo9/WY93nN1VLRUNjQ1cD+RoqBEdi0pQXKgNHqGa/3gFtMTcXP4SbLlJDRWrqyp
 VrEzOyU3Q85Rack/qUILFsClV2h7IeAtKrM80nQoXiVMxymWjxFWPG39STR6fOmIN6A3MRPC
 s2jZ4By6v71NSkexsqNpYKLemcdf5eBxoC3dEEYN7rTpp9esTzTpAgaSIfBvgB8pwk0EB0sj
 yeyBtIHb96JDEQEj31d7hI33u4TirmQb7ZKIoscf+BAy/gKS6f6Rua3mBi2XY7bGKUd0V0Ja
 NrMtcCz5zBoW8heiwz47QiMGz+B/d3aNCQpleIZcTW5hIqS/dHbB1ZrA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/3] Fix kernel complementary package installation
Date: Wed, 23 Sep 2026 22:51:52 +0200
Message-ID: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 20:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246555

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v1: Completely different approach
- Complementary package installation for kernel sources is disabled
- The linux-yocto-src package can now be installed as a regular package which
  was not possible before.
- Additionally, the kernel source files are now correctly included in the
  linux-yocto-src package.

Adrian Freihofer (3):
  kernel.bbclass: make the -src package installable on purpose
  core-image.bbclass: do not pull the kernel -src package in via
    complementary packages
  oe/package.py: copydebugsources: add all kernel source files

 meta/classes-recipe/core-image.bbclass        |  4 +-
 meta/classes-recipe/kernel.bbclass            |  3 +-
 meta/lib/oe/package.py                        | 25 ++++++-
 meta/lib/oeqa/selftest/cases/oelib/package.py | 74 ++++++++++++++++++-
 4 files changed, 98 insertions(+), 8 deletions(-)

-- 
2.55.0


