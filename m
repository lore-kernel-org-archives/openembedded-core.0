Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D85C7EE43
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:30:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.3584.1686126623466937342
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BwVoZq9a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686126621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n1NZ+ahsU3TIF1ScxlfiWkcKvenxMnNuk2aNxqeh4lM=;
	b=BwVoZq9aJAfA0tYt/KKJCQmzq8kbNBqs5HWjWcLZU/RqhaZx5QxTjaVe/lE/3Xbm8ta+Qg
	t+WnRUKCQD/XXEbWLEEuIdZuu4M+PWofzmuQjTJmtXhIySfxzqUtf2L5GpyEy9sK/yVawY
	VFW7Gv8z6M72txPjTOgngO12BM25yXojDzJS1anlYKiWO8h3frKIIALkfDIXEPyjFEdAqv
	4GFWUf7BitGkL0Jr2U2mCsYnWYzqAja9p2Kp7nyFTIRUueeCbcl2dvrXhvR8PKOF6B1ZGu
	7NuKQnr7zPT504iTnqchSH6ht70CKGLo8IaZJC40iMyz41z8N4/5U86QZ2KoDA==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6001E0007;
	Wed,  7 Jun 2023 08:30:18 +0000 (UTC)
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 0/2] add failed tests artifacts retriever
Date: Wed,  7 Jun 2023 10:30:13 +0200
Message-Id: <20230607083015.20760-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182458

This series is a proposal to bring in an "artifact retriever" to ease
debugging when some runtime tests fails. This is a follow-up to
the initial version ([1]) and its corresponding RFC ([2]), which in turn is
a proposal to address general debugging issues like [3]

In the proposed form the retriever is pretty simple/dumb: it waits for all
tests listed for a testimage run to be done, and if any of those tests has
failed, it tries to read a list of "artifacts of interest to retrieve", and
pulls those files onto the host system (next to testresults.json) for
further analysis. This is true for ALL runtime tests. So for example, a
failing test in a very basic test session running ping, ssh and ptests will
trigger artifacts retrieval, the failing test being either a ping test, a
ssh test or a ptest.
The artifacts list is provided in a new bitbake
TESTIMAGE_FAILED_QA_ARTIFACTS.
There is one single artifacts list to be provided for a whole test run (i.e
a run done with bitbake -c testimage). Artifacts list can then be overriden
by affecting the variable mentioned above.
Retrieved files are pulled through scp to allow compatibility for both
Qemu and SSH targets, and are currently stored "as is"
(unarchived/uncompressed) in tmp/log/oeqa/<image>/artifacts.

The series has been tested with the following process:
- add dummy failing ptest in lttng-modules through a custom patch in
  meta/recipes-kernel/lttng
- build core-image-minimal image with:
  - DISTRO_FEATURES:append = " ptest"
  - CORE_IMAGE_EXTRA_INSTALL += "dropbear lttng-tools-ptest busybox-ptest"
  - TEST_SUITES = "ping ssh ptest"
  - IMAGE_CLASSES += "testimage"
  - TESTIMAGE_FAILED_QA_ARTIFACTS="${libdir}/*/ptest /etc/version /etc/os-release /var/log"
- run tests: bitbake core-image-minimal -c testimage
- ensure artifacts are properly retrieved and stored

Changes since v1:
- remove legacy scp option
- put back target stop in 'finally' clause
- retrieve artifacts only in nominal target run (ie no exception from
  ssh/qemu target run)
- list artifacts directly in variable instead of using intermediate file
- use standard variables in artifacts paths
- allow glob patterns in artifacts paths
- expand artifacts path on target before tryiong to retrieve them

[1] https://lore.kernel.org/openembedded-core/20230602095037.97981-1-alexis.lothore@bootlin.com/
[2] https://lore.kernel.org/openembedded-core/20230523161619a8c871d9@mail.local/T/#t
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14901

Alexis Lothoré (2):
  oeqa/target/ssh: update options for SCP
  testimage: implement test artifacts retriever for failing tests

 meta/classes-recipe/testimage.bbclass | 49 +++++++++++++++++++++++++++
 meta/lib/oeqa/core/target/ssh.py      |  5 ++-
 2 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.40.1


