Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9499AC7EE32
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:50:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8884.1685699420237370845
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LClbN+eG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685699418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lxQncmq/3tRGkwosP2Hx618R3FU150RYqpT1iJ8Sf/M=;
	b=LClbN+eG6DGOGg89puP8pI/dzrVdt5VpD6wojfnA6It4aJ6SAQd6Bs5/YH6e4kNcDHoGKJ
	g84iYXAnD5osrumv4eWB1WYMLOOKv738+1NLDOGwuf1kJjLA5T38ZmaPMMQT2MBlef42XH
	FhtcmF+1B5t3Qb3+3Df4V3uwMOgIqlWJsDRpLPc0RJfAtNAs6ya4IMWY1k0QguoeytuLPe
	4SlY+TdqKJONdmDpz641aiUMPEMUmPpDmpnCj3XwiGrfDe36/xhSN1UQ97f5waXpsts2S1
	mSiGjUAw3CPwavaPSnkZL8yro4wg9frw3O/bNQHDz+BJU2HZSJdJc0Pe+PBe0w==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE808C0015;
	Fri,  2 Jun 2023 09:50:17 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][RFC][PATCH 0/3] add failed test artifacts retriever
Date: Fri,  2 Jun 2023 11:50:34 +0200
Message-Id: <20230602095037.97981-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182299

This series is a proposal to bring in an "artifact retriever" to ease
debugging when some runtime tests fails. This is a follow-up to
corresponding RFC ([1]), which in turn is a proposal to address general
debugging issues like [2]

In the proposed form the retriever is pretty simple/dumb: it waits for all
tests listed for a testimage run to be done, and if any of those tests has
failed, it tries to read a list of "artifacts of interest to retrieve", and
pulls those files onto the host system (next to testresults.json) for
further analysis. This is true for ALL runtime tests. So for example, a
failing test in a very basic test session running ping, ssh and ptests will
trigger artifacts retrieval, the failing test being either a ping test, a
ssh test or a ptest.
The artifacts list is provided in the form of a configuration file which
must be a valid json file, with an 'artifacts' entry at its root, pointing
to an array of aths to retrieve. Such paths must be absolute and can point
either to files or directories. For example:

{
        "artifacts": [
                "/usr/lib/lttng-tools/ptest",
                "/var/log",
		"/etc/version",
        ]
}

There is one single artifacts file to be provided for a whole test run (i.e
a run done with bitbake -c testimage). The artifacts configuration file is
not submitted with this series: current design assumes that this
configuration is linked to CI runs, so artifacts configuration file(s) may
be stored in yocto-autobuilder-helper, which then can pass the
configuration to the testimage class (where retriever is implemented)
through a new bitbake variable: ARTIFACTS_LIST_PATH

Retrieved files are pulled through scp to allow compatibility for both
Qemu and SSH targets, and are currently stored "as is"
(unarchived/uncompressed) in tmp/log/oeqa/<image>/artifacts.

The series has been tested with the following process:
- create an 'artifacts.json' file based on sample above
- add dummy failing ptest in lttng-modules through a custom patch in
  meta/recipes-kernel/lttng
- build core-image-minimal image with:
  - DISTRO_FEATURES:append = " ptest"
  - CORE_IMAGE_EXTRA_INSTALL += "dropbear lttng-tools-ptest"
  - TEST_SUITES = "ping ssh ptest"
  - IMAGE_CLASSES += "testimage"
  - ARTIFACTS_LIST_PATH="<yocto_dir>/build/artifacts.json"
- run tests: bitbake core-image-minimal -c testimage
- ensure artifacts are properly retrieved and stored

Depending on this series feedback, here is what could follow:
- documentation update for new ARTIFACTS_LIST_PATH variable and artifacts
  storage path
- adding some artifacts.json file(s) to yocto-autobuilder-helper to
  automatically pull out some artifacts for intermittent failures
- adding compression and publication of artifacts on Autobuilder web
  server

The main questioning I have about current implementation is the
granularity level to offer to select which files/directories to retrieve.
Based on Alexander's feedback on initial RFC, it may be too tedious to
specify for each ptest what file to retrieve, so I have gone for a very
simple version which list files for the whole run. But feel free to
challenge it and provide some insights if some finer controls would be more
useful.

[1] https://lore.kernel.org/openembedded-core/20230523161619a8c871d9@mail.local/T/#t
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901

Alexis Lothoré (3):
  oeqa/target/ssh: update options for SCP
  testimage: shut down DUT later
  testimage: implement test artifacts retriever for failing tests

 meta/classes-recipe/testimage.bbclass | 55 ++++++++++++++++++++++++++-
 meta/lib/oeqa/core/target/ssh.py      |  6 ++-
 2 files changed, 59 insertions(+), 2 deletions(-)

-- 
2.40.1


