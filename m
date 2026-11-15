Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5874.1794742441807515015
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 03:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UwOWL0Do;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F225F1A166E
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:33:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C210460238
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:33:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27D1B11BC0029;
	Sun, 15 Nov 2026 12:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794742439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=I8qPuk2cDULlV8EaFun8VkFPmrEjUiaRtApZHmhUFzU=;
	b=UwOWL0DoGty5I2GTIwbtl8PEXpJSFJRU7EPVlPPtKbAkISqF2S/25zqWPICeQYCQqlqhaM
	A4MF+iFpa6sSa9/jO4Qe1cbjJw0cfV2ie0Pxh4Y0l8q2mSNN1n5YRMtYmybhalMEUTu8MS
	AvvtmPHMeFsaiU+yJsITyXH8QikydTOgofbNQRdEV0s32M38U0MpTXLvGzHgYY9ZBJe4fU
	/etTYX27Kq3SngCZ9ujt6d5hnJlHrDFhM0K3z6gr3CNIlrCSge1WPt+HWxNy0JU3+xMn94
	rrMNbAflxLbZ2GofCY8q4Q1UdtOBDXzvhb2rT477+IQ0dvJLUF0+xoKXkfgMcA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH RFC v2 0/3] sstate: Replay warnings and errors when
 restoring from sstate
Date: Sun, 15 Nov 2026 12:33:53 +0100
Message-Id: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGY+WoC/3WNwQqDMBBEf0X23C0maq09FQr9gF6LhxhXXVAji
 YaK+O8N0muPb4Z5s4Ejy+TgFm1gybNjMwaQpwh0p8aWkOvAIGN5EbFMcFBzx7RgTdXSoqWpVyv
 6FLMk09eiUiqXGsJ6stTw5zC/4fV8QBnCjt1s7Hq8eXFUP3H6V+wFxtjorBCk0zxR+b0yZu55P
 GszQLnv+xfs33KTxQAAAA==
X-Change-ID: 20261023-mathieu-debug-replay-v4-535c89baa72c
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794742439; l=1918;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=XAEUv2TqXxUD9oYmngICq904eRw1YMtb5ijwjg6y4Q4=;
 b=jm4eSesp3E2h6JSX/h0bAD90lNwzq/c3q4xErHuteKv5iu+LWEZATJ+ez0QOwWOCHBuflZVzY
 nay9i6I5dF3DL8qCzSgJIc7mp+8sHj+isaWwqPCb4feqoDqedrUX9X8
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250273

The sstate cache mechanism currently has a blind spot: log messages shown
while a task first runs are not replayed when the task output comes back
from the cache. This is particularly true for warnings, which are
effectively hidden unless the task is rebuilt.

This openembedded-core series saves each task's messages into the sstate
cache and replays them when cached output is reused. Logs are also
replayed for tasks that are not themselves sstate-covered but are
dependencies of covered tasks. This requires the companion bitbake
series.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- Bundle records of non-sstate tasks from other recipes, not only the same
  recipe.
- Replay the records claimed through BB_SETSCENE_CLAIMED_TASKS, with runqueue
  ensuring each covered task is replayed exactly once.
- Extend the selftests with cross-recipe coverage.
- Link to v1: https://lore.kernel.org/r/20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com

---
Mathieu Dubois-Briand (3):
      sstate: Replay warnings and errors when restoring from sstate
      sstate: Replay the records of tasks covered by setscene
      oeqa/sstatetests: Add tests for sstate log replay

 .../recipes-test/log-replay/log-replay-dep.bb      |  18 +++
 .../log-replay/log-replay-error-test.bb            |  16 ++
 .../recipes-test/log-replay/log-replay-test.bb     |  34 ++++
 .../recipes-test/log-replay/log-replay-user.bb     |  32 ++++
 meta/classes-global/sstate.bbclass                 | 156 ++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 171 +++++++++++++++++++++
 6 files changed, 424 insertions(+), 3 deletions(-)
---
base-commit: 34991d0ce3cc5f38dd29e824af7579512d2b917e
change-id: 20261023-mathieu-debug-replay-v4-535c89baa72c

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

