Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE99E11258BE
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 00:29:28 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5305.1773361761604844051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 17:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62D0SkjC2351651;
	Thu, 12 Mar 2026 19:28:46 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, twoerner@gmail.com
Cc: mark.hatle@amd.com
Subject: [PATCH 0/2] Rework WIC sector size
Date: Thu, 12 Mar 2026 19:28:44 -0500
Message-Id: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 00:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233017

This work is effectively based on the 'v7' of the 'standalone wic'
submission.  It was requested that the submission be broken into
individual parts so we can review and get merge things individually.

Changes from v7:

Introduction of additional (previous implementation) vfat 4k tests.

Update the test suite to add a new cmdline argument test in addition
to (not replacing) the previous variable version of the test.

Update the test case to include fat partition tests.

Cleanup Deprecation message so it only displays once, if the older
style is used.  In v7 the message may have been displayed twice.

Mark Hatle (1):
  oeqa/selftest: wic: Add vfat to test_wic_sector_size

Trevor Woerner (1):
  wic: re-implement sector-size support

 meta/lib/oeqa/selftest/cases/wic.py                | 105 ++++++++++++++++++++-
 scripts/lib/wic/engine.py                          |  60 +++++++-----
 scripts/lib/wic/help.py                            |  23 +++--
 scripts/lib/wic/misc.py                            |   6 ++
 scripts/lib/wic/partition.py                       |  97 ++++++++++++++++++-
 scripts/lib/wic/plugins/imager/direct.py           |  18 +---
 scripts/lib/wic/plugins/source/bootimg_efi.py      |   5 +-
 scripts/lib/wic/plugins/source/bootimg_pcbios.py   |  11 ++-
 .../lib/wic/plugins/source/isoimage_isohybrid.py   |   5 +-
 scripts/wic                                        |  41 ++++++++
 10 files changed, 306 insertions(+), 65 deletions(-)

-- 
1.8.3.1


