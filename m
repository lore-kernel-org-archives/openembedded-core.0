Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA9CCCD186
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:38:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.25226.1759858700855005482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2qW7feZN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 007D34E40F61
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC328606C8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 17:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F19E3102F2175;
	Tue,  7 Oct 2025 19:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759858697; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/rIjyfgYUz9NaYMGnRvRxi5sZbJFlCQnr4DX+L21tSg=;
	b=2qW7feZNHJS2FmbeqKjMuiSBjC5xZAs7yD+UO2MuUO0rC8fJdSKxV0eNqsOEW1Sy0uOhgU
	ALcnhtJYXYwrq8lPbORyn0FH+kSl3fogipdAuf3BUf4CMn4y4MsotrIX1xY09uzD7VKo5a
	XG/Meu89tjqDlus9IfWYw+Q9SwmQFx2qfIruFEUUf0Rg/A9TL7DowDnVL6/PRbiQbqgVA0
	qbsM7oihSOxXzUdQQvE9E///vO/DEZ4YWp5e88eLBxaIdU/Asd4BRpReTNDZp6NOxYCk6E
	1T5k/QnfIx2cUukvB4o9g2anI84c2qeYiy8mAyuYnDbjRudWjlZerchKeBpCvQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/4] oeqa: target: ssh: log SSH errors during tests
Date: Tue, 07 Oct 2025 19:38:05 +0200
Message-Id: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1P5WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNz3dzEkozM1FLd4uIM3bTEzJxiXYNkA8MkQwszU1NDQyWgvoKi1LT
 MCrCZ0bG1tQAzI/BwYwAAAA==
X-Change-ID: 20251007-mathieu-ssh-fails-0c01b1865511
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759858696; l=1352;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Rumnde7lSWWBn7bkMAdg91J5FESfCysN3K4mMpyH3u8=;
 b=zg852rLD9hYKu5pcnm6dJv0uepmGyudqtNsUrMOmHXEYdQLXpNPsy3JiaKfKQPMAxKZ+OoZMz
 WJhnt7EOlQNDiWuha03Fkem/bKjMFYgjOmxEHNWkyRw6FxzcTlWk9lQ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224544

Most tests running SSH commands ask for no error to be raised when the
returned status is not 0, and handle the returned status themselves. But
most of the tests do not check if the non-zero status is caused by a
fail of the command run on the target or by a fail of SSH itself.

This can lead to confusing test results, such as the one described in
bugzilla issue #15981.

This series introduce a check for SSH failures by default, only bypassed
in some specific cases.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (4):
      oeqa: target: ssh: Fail on SSH error even when errors are ignored
      oeqa: runtime: Ignore SSH errors during setup and tear down
      oeqa: postactions: Ignore SSH errors
      oeqa: runtime: ssh: Manage any SSH failure locally

 meta/lib/oeqa/core/target/ssh.py         | 12 ++++++++----
 meta/lib/oeqa/runtime/cases/logrotate.py |  7 ++++---
 meta/lib/oeqa/runtime/cases/ssh.py       |  2 +-
 meta/lib/oeqa/runtime/cases/weston.py    |  2 +-
 meta/lib/oeqa/utils/postactions.py       |  4 ++--
 5 files changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 9dfd4f44d4f40e7926dc88cb564baa2345c2a24f
change-id: 20251007-mathieu-ssh-fails-0c01b1865511

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


