Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFF0CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:07:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.41127.1760353631063922330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BygoRvaH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 74BFBC093AA
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:06:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D6D2606C6
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70B5B102F2250;
	Mon, 13 Oct 2025 13:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760353628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kpCLftedJiSjjjME7D/K6/qkQDHCMHOdR6HixJ+HFYE=;
	b=BygoRvaHDVrBpWixfkqb0tkccFNxvVpoYg8bDcU9k3HXvYU+y1uEUw37LngBiPfl3sJhi1
	jxQkkXlYHBuw/RJG6Ax33e0DLvbhtfa/jaRpe93V3P2RVy7m9MRLWxCJsZNFDAHdSX8UEO
	77GdkRUN854TjVhbRxQwfdDq52Ndf6vuwPrnc6OfnSuJ+tzukhyHrqq4DEadgd8zVSOiFv
	t7Ey9TOtiAEyNS3BQ4+UTEyPERUlpui41hRzJbIKJoU9R0g8hfqqGA2Pp6ybtluq6zYiAG
	s0Y2WzuLd5lNp3UNOx0DKrqbiJhJ92e6NjTu0PNhzCAHRvFBYvl6IfXLO5ERkQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/3] oeqa: runtime: Clean setup/tear down function on
 weston and logrotate
Date: Mon, 13 Oct 2025 13:06:42 +0200
Message-Id: <20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELd7GgC/x3MQQqDMBBG4avIrB0w2ip4FXERxt860EbJJFIQ7
 97Q5bd47yJDVBiN1UURp5ruocDVFcnmwwusSzG1Tft0jev449OmyJxgieUNH9iQ8sE9IP0qMnS
 PhUp+RKz6/a+n+b5/pdH8cGoAAAA=
X-Change-ID: 20251013-mathieu-test-clean-setup-6eec6fcc734d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760353627; l=891;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=VxjHXhLanXuXnYYb0kmfKXZTi712tuyxc0WYhLad6HM=;
 b=yV0IFO8/mxtViuv6vLvFBaCuDL5Qh4tE+MxC96te+qib9tQ+UoK8r4Mh1sTTT0DoFx9QIQ7zF
 fjk2sitwdGYAhuJvJ8lbDHcoFP6g3XGxgPBqvbrRbTJggA9I0OafuFw
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224772

This was discussed on my previous series, introducing a new error on SSH
connection failure during tests: setup and tear down functions should
only do simple operations and not try to interact with the target.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (3):
      oeqa: runtime: logrotate: Fix typos and add comments
      oeqa: runtime: logrotate: Remove setup and tear down methods
      oeqa: runtime: weston: Remove tear down method

 meta/lib/oeqa/runtime/cases/logrotate.py | 99 +++++++++++++++++---------------
 meta/lib/oeqa/runtime/cases/weston.py    |  5 +-
 2 files changed, 53 insertions(+), 51 deletions(-)
---
base-commit: 3fc1fa77dae8d138c9a0bf47172d978812b593b3
change-id: 20251013-mathieu-test-clean-setup-6eec6fcc734d

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


