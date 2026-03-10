Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DF6EB105D
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:29 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39639.1773148096516611080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=miroslav.cernak@siemens.com header.s=fm1 header.b=Qspj2OlE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1333546-202603101258102d9e5ac3fb000207f1-_fg1cs@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202603101258102d9e5ac3fb000207f1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 10 Mar 2026 13:58:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=miroslav.cernak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oo34MjerEI42cr5RTv0rlBDMNBe5+FzFBboULsStejE=;
 b=Qspj2OlECSa1nFUYT3LgsDEJHh0DR339qkXWvauvlsKg7bjwfpFVN/GhcWQgM+qw+6Iubb
 EhB9O9Bwl1nHMsL2X60Eje+douZS7E2v4eQHw5LLvOiFvlJc7w/ipgt/5CnTqGmqM46wefCf
 tQdvdBp9ZfDrWxj3OvgtWu6SKOPuufdZNx5e7U4K7ryHiQeRraLghIJdOKRzjb5GIhY7YZYC
 vm6yOiK/mK/6QHO3Jmoc/o67Df34zWbO+8SWXPyJeioVJqNgQ1/uAaragmeRqMnoj8XGvXjL
 K3+Ztzhwh5GPPNiIAGWTs/5ea2i+ATB7yiDUGwL9oHSmecpnNFCr8ejw==;
From: Miroslav Cernak <miroslav.cernak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Miroslav Cernak <miroslav.cernak@siemens.com>
Subject: [PATCH 0/1] resulttool: Fix UnboundLocalError when missing ptests or image tests
Date: Tue, 10 Mar 2026 13:57:52 +0100
Message-Id: <20260310125753.658173-1-miroslav.cernak@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1333546:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 14:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232790

Hello maintainers,

This patch fixes an issue in resulttool's JUnit output generation that occurs when either ptest results or image test results are missing from the testresults.json file.

The problem was that variables for tracking test counts and metrics (image_errors, image_failures, ptest_errors, etc.) were being initialized
inside the test results loop. When certain test types were completely absent from the JSON, these variables would remain uninitialized,
causing UnboundLocalError exceptions when the code attempted to use them later.

The fix is simple: move the variable initialization outside the loop so they always have default values of 0, even when test sections are missing.

This patch also adds comprehensive test coverage for three scenarios:
- Empty testresults (e.g. missing testresults.json)
- Missing image tests (only ptest results present)
- Missing ptest results (only image tests present)

These edge cases can occur in various CI/build scenarios where not all test types are executed, and the tool should handle them gracefully
rather than failing with exceptions.

Please review and consider for inclusion.

Best regards,
Miroslav Cernak

Miroslav Cernak (1):
  resulttool: fix UnboundLocalError when missing test results The
    junit_tree function failed when either ptest or imagetest results
    were missing from testresults.json due to uninitialized variables.
    Move variable initialization outside the loop to ensure they always
    have default values.

 .../oeqa/selftest/cases/resulttooltests.py    | 109 ++++++++++++++++++
 scripts/lib/resulttool/junit.py               |   5 +-
 2 files changed, 112 insertions(+), 2 deletions(-)


