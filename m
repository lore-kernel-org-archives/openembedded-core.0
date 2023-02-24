Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DA6C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:46:01 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.22870.1677257155219061158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zt6VnRr9;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 30A51100004;
	Fri, 24 Feb 2023 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677257153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TQLawUBZhRW48LH9sCl+x0ZOYiHGVpxXqL7uvQPMtto=;
	b=Zt6VnRr9zQmLRtcMlxaFMGL6yFUDoOKgy6Eqx7GjLsSokV4jt6u6xsmlXmB9HuhuO8g7sj
	bn+a8wveFOvLVMXsrgKqOD/T4gVqvyM/zE3Bo4tJ4sZrG3Pm/6FONl3qsuZMx2KDb4mDIm
	69Cya0pJhYyWBf8fAYFiGb/4/NoUvpST232lzE/wgPXLSl2bFBesAxQqCO8j/dNxohpV4K
	FPcQqml6vvf+0y6u3X+DXn2s9vFUtwll5OEMBe/80WZ5NlGOUi7EDyM3q1x88V9X03Ydi1
	Cb7LYJUq/L7N6E2AFa1IJe1j6hWCEg6JbdwkNA5dLMTR8YCuxj/7lyLGRBEUnQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v3 0/6] scripts/resulttool/regression: add metadata filtering
Date: Fri, 24 Feb 2023 17:45:49 +0100
Message-Id: <20230224164555.67634-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177698

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Hello,
this new series is the follow-up of [1] to make regression reports more
meaningful, by reducing noise and false positives.

Change since v2:
- add filtering on MACHINE field from test results configuration: the MACHINE
  should always match
- add "metadata guessing" mechanism based on Richard proposal ([2]). Up to the
  point where this series will be merged, tests results stored in git are not
  enriched with OESELFTEST_METADATA. To allow proper test comparison even with
  those tests, try to guess what oeselftest command line has been used to run
  the corresponding tests, and generate OESELFTEST_METADATA accordingly
- add new tool to ease test results usage: yocto_testresults_query. For now the
  tool only manages regression report and is a thin layer between send-qa-email
  (in yocto-autobuilder-helper) and resulttool. Its main role is to translate
  regression reports arguments (which are tags or branches) to fixed revisions
  and to call resulttool accordingly. Most of its code is a transfer from
  send-qa-email (another series for the autobuilder will follow this one to make
  send-qa-email use this new helper, but this current series works
  independently)
  Example: "yocto_testresults_query.py regression-report 4.2_M1 4.2_M2" will
  replay the regression report generated when the 4.2_M2 has been generated.

Change since v1:
- properly configure "From" field in series

With those improvements, the regression report is significantly reduced and some
useful data start to emerge from the removed noise:
- with the MACHINE filtering, the 4.2_M2 report goes from 5.5GB to 627MB
- with the OESELFTEST_METADATA enrichment + metadata guessing for older tests,
  the report goes from 627MB to 1.5MB

After manual inspection on some entries, the remaining oeselftest regression
raised in the report seems valid. There are still some issues to tackle:
- it seems that now one major remaining source of noise is on the "runtime"
  tests (comparison to tests not run on "target" results)
- when a ptest managed by oe-selftest fails, I guess the remaining tests are not
  run, so when 1 failure is logged, we have many "PASSED->None" transitions in
  regression report, we should probably silence it.
- some transitions appear as regression while those are in fact improvements
  (e.g: "UNRESOLVED->PASSED")

[1] https://lore.kernel.org/openembedded-core/20230214165309.63527-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/124b9c9667b038b8502f6457ba7d894fc4ef3c58.camel@linuxfoundation.org/

Alexis Lothoré (6):
  scripts/oe-selftest: append metadata to tests results
  scripts/resulttool/regression: remove unused import
  scripts/resulttool/regression: add metadata filtering for oeselftest
  oeqa/selftest/resulttool: add test for metadata filtering on
    regression
  scripts: add new helper for regression report generation
  oeqa/selftest: add test for yocto_testresults_query.py

 .../oeqa/selftest/cases/resulttooltests.py    | 137 +++++++++++++++
 .../cases/yoctotestresultsquerytests.py       |  39 +++++
 meta/lib/oeqa/selftest/context.py             |  15 +-
 scripts/lib/resulttool/regression.py          | 163 +++++++++++++++++-
 scripts/yocto_testresults_query.py            | 106 ++++++++++++
 5 files changed, 458 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
 create mode 100755 scripts/yocto_testresults_query.py

-- 
2.39.1


