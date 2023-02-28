Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E10C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:10:40 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.31407.1677607837193655980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c86Wxyui;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 25F14100009;
	Tue, 28 Feb 2023 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qcHeZRjz/dhSSPzqoa6jODiJb++tC+CJ86pzWng4x48=;
	b=c86Wxyui8QU8j004lGa4N7Pb8rNAxpffvon0tweGhWlRzUZ0xaGokF3rAAELW8CYf/UhxJ
	cEA6/1ZJtjSN4jDhsb9cDCykB2tIS6KWNa0iZMBEFRHYyDDGtVuj5QVY6PsudJ6lumYNu8
	oUav5aKc10zMbxSt6Vvzr+tASrodCVUXXhEUiElbzYFWFeTWsgp6NR7W0d8V8LN84JCn/0
	T/AIXSgOyyPVdEArWhfBvICPDnIo47x0iRKKUbA8hR/7RWjRkQnAJIBX1JyRiMYVAqBF1h
	N3UK6vPrQXrdXiF4u6jjdeXUTZbuPul9LHyUPSiWp7nsHYKS9oFANrsn4l1jEQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 0/6] keep reducing regression reports noise
Date: Tue, 28 Feb 2023 19:10:44 +0100
Message-Id: <20230228181052.4191521-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177847

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Hello,
here is another batch of fixes to reduce noise in regression reports. Fixes are
directly linked to main noise sources seen in 4.2_M3 regression report ([1]).
- fix some existing selftests for resulttool
- add more filters for ptests incorrectly logging failures. The root cause of
  those wrongly named test results remained to be fixed to stop saving broken
  test results, but this series fixes at least parsing for existing results
- Stop logging "newly passing" tests in regression reports. Some real
  regressions are "hidden" in big chunks of newly passing tests:
foo: FAIL -> PASS
bar: FAIL -> PASS
moo: FAIL -> PASS
[...]
xxx: PASS -> FAIL
[...]
yyy: FAIL -> PASS
zzz: FAIL -> PASS

We are reaching a point where regression reports are small enough to get posted
on pastebin, so by following [2] you can find a report sample generated with
tooling patched with this series

[1] https://autobuilder.yocto.io/pub/releases/yocto-4.2_M3.rc1/testresults/testresult-regressions-report.txt
[2] https://pastebin.com/QgfLKhpx

Alexis Lothoré (6):
  scripts/resulttool: call fixup_ptest_names in regression_common
  oeqa/selftest/resulttool: fix ptest filtering tests
  oeqa/selftest/resulttool: fix fake data used for testing
  scripts/resulttool: fix ptests results containing a non reproducible
    path
  oeqa/selftest/resulttool: add test for error propagation in test name
    filtering
  scripts/resulttool: do not count newly passing tests as regressions

 .../oeqa/selftest/cases/resulttooltests.py    | 112 +++++++++++-------
 scripts/lib/resulttool/regression.py          |  66 +++++++----
 2 files changed, 112 insertions(+), 66 deletions(-)

-- 
2.39.1


