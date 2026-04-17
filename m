Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609C8F8DFFF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:48:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40275.1776415724216858201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i/2GO4nR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00E984E42A22
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B631D60497
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1143510460980;
	Fri, 17 Apr 2026 10:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776415717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CtO946rbd7rrod455i5IkxdTxHE9cPm8kbXeFdFlDMI=;
	b=i/2GO4nRD/Gy5VshT1qIXPqwukE+WgYPOfJNscxkQiPcRl0eT7fEh56H5oCl7KS1oLDs+U
	MyMOt9AGc/RG4vTLydCbojLH9zHfb31Hw+8KKej7u6PfcgC8tVz9RSujtUaWrfVM0ZcQb1
	YE6aNKG0o0Wl6NM4hIHEtvKcfo0a8C98R6ujB0Bc9HfdxrC8ZROk5L2GTkZKjEgpMUtrJ6
	rwWj2FiIPgQVVkkMFpd9xprN3MMAKShxazDkg1XYY2Hls/EWbjQD8oIujbyyKSnMSng18P
	7+AldhaNpPIqxnYrTfvN9NND+/eG6onVA7c3dSenXQbO4Tt6QkfzbjDPOZ/rew==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] python3: exclude test_timerfd_TFD_TIMER_ABSTIME from
 ptest
Date: Fri, 17 Apr 2026 10:48:21 +0200
Message-Id: <20260417-mathieu-python3-ptest-v1-0-9b5ec044a1b8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXz4WkC/x3MTQ5AMBBA4avIrE1Srfi7ilgUQ2ehmraEiLtrL
 L/Few8E8kwBuuwBTycH3m1CkWcwGW1XQp6TQQpZibKocdPRMB3o7mh2q9BFChGbUS00ylq0rYL
 UOk8LX/+3H973A/6NkP9nAAAA
X-Change-ID: 20260417-mathieu-python3-ptest-8b3feb270993
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776415716; l=661;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=jmsXeY9wfuDL1GAmNUuDdjNG4U3krF/KwFVgIOSxW8Y=;
 b=DWf6/jeXSxn0xiKu/jbqDe91jBpCQybxsGTVWV1NLMZJOY10PI6xBWZ4TeTn3avFEAUv6+0it
 3UpH/k7DFPADZ0O/mOJfMjzbkaree/T7kAgUSzA3d5IxQRSZntUllnv
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235493

Add a test exclusion, and rework how test exclusions are specified. The
first patch can be merged alone, if needed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      python3: exclude test_timerfd_TFD_TIMER_ABSTIME from ptest
      python3: Simplify ptest exclusion list

 meta/recipes-devtools/python/python3_3.14.4.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)
---
base-commit: a9cc47107cbbfe1cc4bc91bf01dc1ffafa5f9bec
change-id: 20260417-mathieu-python3-ptest-8b3feb270993

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


