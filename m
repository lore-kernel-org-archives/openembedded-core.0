Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D7FC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:53:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12508.1676393594754086076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hm18KHT9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A6ABAFF809;
	Tue, 14 Feb 2023 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676393592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XaYEY1hiw700tx5BD3knDnIedjtvHJFD3oegfhA6+ss=;
	b=hm18KHT9I/Gl07FV82tkz9RBoiOWkeOV9l9jC0StYZ6PgSG9lvgOcfs7fqTGN5lFnROS/4
	zCy0ui6IbydIBrmrCaTcmxHEGIVYDb2mGXSvG0qKi74KckCPsi0EJdeD2KoiNxE44Ahijp
	LJrcT+wpkCHm1YSF4xmmPIH/4Dn/PVNpL9w0M8RHY2JaseuRPxDq4Flki/QGT6hnVMr+wU
	Um8Zc3dN9bFSHMf7dqlnXZDrNmVcxlatvlyJhPuo6eTX1r+nYjdDiFPB4cZDJtmPK6CMGL
	Uscgfh1lgd05Qyn7PxuMMth0uWdTWMnqjMOuZlsmq/W0Up1iFtl48uXYk+AdVQ==
From: alexis.lothore@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH v2 0/4] scripts/resulttool/regression: add metadata filtering
Date: Tue, 14 Feb 2023 17:53:05 +0100
Message-Id: <20230214165309.63527-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177161

From: Alexis Lothoré <alexis.lothore@bootlin.com>

This v2 does not contain any change in patches content, it only sets the From:
field correctly. Sorry for the noise.

This patch serie is a proposal linked to discussion initiated here:
https://lists.yoctoproject.org/g/automated-testing/topic/96652823#1219

After integration of some improvements on regression reporting, it has been
observed that the regression report of version 4.2_M2 is way too big. When
checking it, it appears that a big part of the report is composed of "missing
tests" (regression detected because test status changed from "PASS" to "None").
It is mostly due to oeselftest results, since oeselftest is run multiple time
for a single build, but not with the same parameters (so not the same tests
"sets"), so those test sets are not comparable.

The proposed serie introduce OSELFTEST_METADATA appended to tests results when
the TEST_TYPE is "oeselftest". An oeselftest result with those metadata looks
like this:
	[...]
	"configuration": {
		"HOST_DISTRO": "fedora-36",
		"HOST_NAME": "fedora36-ty-3",
		"LAYERS": {
			[...]
		},
		"MACHINE": "qemux86",
		"STARTTIME": "20230126235248",
		"TESTSERIES": "qemux86",
		"TEST_TYPE": "oeselftest",
		"OESELFTEST_METADATA": {
		    "run_all_tests": true,
		    "run_tests": null,
		    "skips": null,
		    "machine": null,
		    "select_tags": ["toolchain-user", "toolchain-system"],
		    "exclude_tags": null
		} 
 	}
	[...]

Additionally, the serie now makes resulttool look at a METADATA_MATCH_TABLE,
which tells that when compared test results have a specific TEST_TYPE, it should
look for some specific metadata to know if tests can be compared or not. It will
then remove all the false positive in regression reports due to tests present in
base results but not found in target results because of skipped tests/excluded
tags

* this serie prioritize retro-compatibility: if the base test is older (ie: it
does not have the needed metadata), it will consider tests as "comparable"
* additionally to tests added in oeqa test cases, some "best effort" manual
testing has been done, with the following cases:
  - run a basic test (e.g: `oeselftest -r tinfoils`), collect test result, break
    test, collect result, ensure tests are compared. Change oeselftest
    parameters, ensure tests are not compared
  - collect base and target tests results from 4.2_M2 regression report,
    manually add new metadata to some tests, replay regression report, ensure
    that regressions are kept or discarded depending on the metadata

Alexis Lothoré (4):
  scripts/oe-selftest: append metadata to tests results
  oeqa/selftest/resulttooltests: fix minor typo
  scripts/resulttool/regression: add metadata filtering for oeselftest
  oeqa/selftest/resulttool: add test for metadata filtering on
    regression

 .../oeqa/selftest/cases/resulttooltests.py    | 123 +++++++++++++++++-
 meta/lib/oeqa/selftest/context.py             |  15 ++-
 scripts/lib/resulttool/regression.py          |  34 +++++
 3 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.39.1


