Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D199C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 14:53:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.23946.1684767228410555594
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 07:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vn/MuXza;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexis.lothore@bootlin.com)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF2D4FF802;
	Mon, 22 May 2023 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684767226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PxlnJbISgcai9lh6tbvg8VDdUmRzWhEYuhPAU97l82E=;
	b=Vn/MuXzaQB1sHlu+C5n4otSf/gbkhgnJbpTIJ6zr30efIY5Ss6mguzVVIUsNv2QMmeAhsa
	FPX6nbVQNhlbirlpy/y/QtJFkfibyrcEmlusS+fNNi4fYR4HOduD6tttLSYGy0Rjm4JYpU
	xnRWj0XG+DEFcMwTMth8ATEvkladSusXirejpJfKjHuvyj2mrG+ROjYYD9IqgBYTx7QCKo
	SC7rZGNjkg/PZ1aDE7+PJ4+aoCUsObJVycnHcQ8cUM8mkc6RdxvpXeAcsnyDjr/b4FqqQe
	TBi6mH/3TimuDuu6ZXxLgM5IoR6usJQFREli5YJYY875NKlrcPtQbmK/hhRFDg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexis.belloni@bootlin.com>
Subject: [OE-core][RFC] tests artifacts retriever
Date: Mon, 22 May 2023 16:52:57 +0200
Message-Id: <20230522145257.3003760-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 14:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181596

Hello everyone,
I have been briefed about the need to add an infrastructure to be able to
retrieve some test files (test output, logs, etc) in Yocto/CI
automation to ease debugging of some hard-to-reproduce issues. Before
starting to implement a solution, I would like to get some feedback about
what I have understood from the original issue and what I propose to
implement to improve this. Please find below my reflexions, feel free
to comment, correct, enrich and/or approve.

# Motivation

Some test failures appearing in automatic testing can be hard to fix, based
on too few informations from failing tests (see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901 ). Sometimes
packages/binaries under test are able to generate more detailed output in a
dedicated file, but there is actually no standardized way of retrieving
such output files. There has been some custom efforts done to solve this issue
for specific recipes, for example for lttng-tools tests :
https://git.yoctoproject.org/poky/commit/?id=2ea27691aa57951aaba3cc1714a080a112d15408 

The goal of this RFC is to propose an architecture for a generic system which
allows to retrieve an arbitrary list of files from a test run.

# Use case example

lttng-tools recipe provides LTTNG tools tests as ptests (see
meta/recipes-kernel/lttng/lttng-tools/run-ptest) and generate some log
files (error.log, test-suite.log), it would be convenient to retrieve those
files.

# Proposal

- Introduce an "artifacts.conf" file
  - this file contains a "files of interest" list to be retrieved onto
    host after running ptests (exact format to be defined)
  - artifacts.conf is specific to a ptest package and is stored next to
    run-ptest script in package
  - artifacts.conf contains, for each ptest package, the following
    informations:
    - name of file to retrieve
  - artifacts.conf will be installed in target image (as for
    package-specific run-ptest script)
  - each ptest package MAY have an artifacts.conf file
- When running ptests, for each available ptest, ptest-runner (on the
  target) will read artifacts.conf if it exists, and retrieve
  corresponding artifacts file in an artifacts directory, with one
  subdirectory per ptest.
  - Artifacts will be aggregated only if at least one test has a status
    different from "PASS"
- Once tests are finished, tests manager on host (ptest.py) will fetch
  artifacts directory. It will put this directory alongside testresults
  file on host
- This mechanism will work for both real targets and emulated targets
  (Qemu), and will based on SSH to transfer artifacts back to host

# Additional questions

- once retrieved from target, aside from default test results directory
  (build/tmp/log/oeqa/<...>), where should we store artifacts ? For
  automated testing, should we publish them alongside other test and
  regression reports (in web server directory) ?
- current proposal is focused on ptests: should I broaden the scope and
  include all kind of runtime tests (as found in
  meta/lib/oeqa/runtime/cases ?)
- are there examples of tests producing files to retrieve with non-static
  names (which will then require the artifacts.conf to be smarter) ? 

