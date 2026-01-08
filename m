Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6D6D185E6
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:54:11 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4756.1767872955813249506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=CKFkZ4NC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1333546-20260108113908f67ab876c8000207ef-m_yona@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260108113908f67ab876c8000207ef
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Jan 2026 12:39:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Gr6Mq6f9emoUhgrIWgqK1Yoy2TEz3JroAOpkfGMLlKU=;
 b=CKFkZ4NCYtjOFPbCyG7EWkURwb8E3jZSc5zxSS9PvmZETD8oBB0WxLoOFeMNP2VLUkzdpY
 0IqiJKu8Kx5fV6if2vOYI0U+Ycjd+FV9/wjMELXbVZtPbN43ZJjYnXQ7FuHfDihj2vI7Esek
 9hNEmz9UavPU8dVKUz5OtQP+1nmEmAd7tfeVV9hfpH2g8XnmYYoriAena6tHJ+BHXkXFwuJm
 qRQLugqilwoPQ09/7Z3DrYEklJpgzGLaRyaHjfSfqFSZdMQDq6E6omwl+YN8Ug6U6T5j//wv
 N/h0YFH/YijOONK1xpz4R0F5wMdszF30U+j3e9iJWfNkqYFAANYkFg7A==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 0/4] resulttool: JUnit ptest support and robustness; add selftests
Date: Thu,  8 Jan 2026 12:36:43 +0100
Message-Id: <20260108113647.56663-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229066

Hello maintainers,

This series improves resulttool’s JUnit exporter and extends oe-selftest coverage.

Highlights:

JUnit ptest support: Emit a structured hierarchy for imagetests and ptests, with optional per-ptest attached logs.
Robustness: Avoid KeyError when ptest results are missing (e.g., absent ptestresult.* entries).
Correct statuses: Report real failures as FAILED (not SKIPPED) and include failing testcase names for first-read diagnosability.
Readable failures: Preserve useful multiline details; where only attribute messages are possible, collapse “\n” to spaces to avoid “ ” artifacts in GitLab.
Tests: Add and refine oe-selftests that exercise imagetests and ptests (both inline and attached logs), and verify improved status/error reporting.

Adrian Freihofer (2):
  resulttool: junit support ptests
  oe-selftest: add resulttool junit test

Miroslav Cernak (2):
  resulttool: junit: improve ptest status handling and log
  oe-selftest: improved junit test

 .../oeqa/selftest/cases/resulttooltests.py    | 187 +++++++++++
 scripts/lib/resulttool/junit.py               | 310 +++++++++++++++---
 2 files changed, 445 insertions(+), 52 deletions(-)


