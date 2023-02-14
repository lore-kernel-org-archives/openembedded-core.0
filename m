Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2EEC6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:52:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7339.1676382755796823457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gVoRgXGC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2406D6001A;
	Tue, 14 Feb 2023 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676382753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VVyZWAWCXV7+/p0DeWRy7SzrcF5p1g90iZH9gVxWwiU=;
	b=gVoRgXGCcKogUmsEQSVzBV0FBjcBBJAc8clvB95iGtKKpO2t+YjQLwl5zyKRybNOidTUne
	jdrhafP3OhmmGbRgEPljDYAopW5elZEj0Q/f+45OOuLWLWZDa+ht8uYO1B7o5w+sIiwgih
	iL2o0OyZZ52LwPBympsHu7GUT9gItjiLvhkvsQCFDxE294pKEsdNYd49JNjG/DyqS8HYR3
	/W/jtYBe7Nmf9FZX1kG41qoBywIjXQNKjqZEgIWfuNnjBQj5JKndn7M9IUh/NhyxSrx7Ib
	jXDmh88lgri42QmrWuSJlKpCpsNXfHn/4nwmMf+xz7ka4bdl0OZAMIQtd7U4Ew==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 0/4] scripts/resulttool/regression: add metadata filtering
Date: Tue, 14 Feb 2023 14:52:10 +0100
Message-Id: <20230214135214.42413-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177144

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


