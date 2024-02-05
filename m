Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C7C48297
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:57:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.66454.1707148655113597398
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Dbc9e8X8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3F85C0013;
	Mon,  5 Feb 2024 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707148653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GCF+BQ7zwESpGTtc8CMkFTWb947+wbodyjW0yPN91UU=;
	b=Dbc9e8X8wDrJmTBXRydVrxg7w2RMKr4H4h/E8mK8e+fNlejND/UdODjIQ/5zZR7VvZDB59
	X5GSiQIsJvSBJAHDWW5o83WTmWNef8oYvx6qDqj7jqXLAVEpG/wgHDBw1oriUW4dkaHEO8
	0EX9dS6D/UMNBEDNgkEbL60bbeVcuVaElvGAZz6WTnV3QH/tlTol6FtOr3Zvvax7mZHs+8
	i+GIiQMoSRmrAQ8S3/QKCwIumUxTIdgdZnBk+VgoaIwpE3pQuqs3ToR8ZIgRIKEDEz/n/C
	XDW/dRQ6cNBiAaZh11DOlxrXhjOKtBsqmhl7tSkSFuPsIOFhfUsSic8zoSVB/Q==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] patchtest-send-results: prevent false positives due to commit subject
Date: Mon,  5 Feb 2024 16:57:28 +0100
Message-ID: <20240205155730.115895-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194952

Hello,
this small series aims to prevent patchtest-send-results from sending
reports to submitters in a specific case: if the commit message
contains the word "FAIL", it will (wrongly) send a report to submitter
despite all tests passing / being skipped.

The first patch is a trivial cleanup while the second patch brings in the
real fix.

Alexis Lothoré (2):
  patchtest-send-results: remove unused variable
  patchtest-send-results: properly parse test status

 scripts/patchtest-send-results | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


