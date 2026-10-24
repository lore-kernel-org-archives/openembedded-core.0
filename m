Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5430.1792845267750646252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 05:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aX/IKbqj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DDFFA4E412ED
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A19C860769
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAF80103284BB;
	Sat, 24 Oct 2026 14:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792845265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3FE4DhivkrrkIB9aqr4iIAQaiMjM+YoVDjQwj2K/DoE=;
	b=aX/IKbqjvZWFTik1iTK2LesoPDU3ONZNJXSUcEUDBMYxl/8c7lZ5siDrDpgERw+6C3mZol
	Q3v1sIBdTMOiFEriJ/XOv2Dm88B3T7Qep0CBmktLpr3BWOcDRD4BmLoNg1VDhs4ffvOjw3
	rP+Jn/GWCDxEhgbJWM+DFKjE7TymxX3tyOsOkmrNgNegT3zGhjzoKQfi9JQguxVVHLENwy
	w+bxFdDQygrz5rsZgfPc6Qh7p1d/Uf1irZZ1U14hFb3uN8Modrn6fp+hew8mdhzFjNoH5D
	VNtTTDjqNth8RXPx3URV8nhWFsCtn1kChLOHztCmF9hFUt4hD9V4z43ZvvLZew==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH RFC 0/3] sstate: Replay warnings and errors when restoring
 from sstate
Date: Sat, 24 Oct 2026 14:34:09 +0200
Message-Id: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGl3GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNj3dzEkozM1FLdlNSk0nTdotSCnMRK3TITXVNj02QLy6TERHOjZCW
 g7oKi1LTMCrDJ0UpBbs5KsbW1ALCLSK5uAAAA
X-Change-ID: 20261023-mathieu-debug-replay-v4-535c89baa72c
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792845263; l=1391;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Qh+viDie4uwhuttw7OZ49gHfICYQLp4kplIBF+3QSa8=;
 b=7tofJnKOrMIJiobZS45MK6mdzNB0jYWbfzQIoegTdcbrZTwGbmuoWdul9Ws8Xw7fCvdvYQDne
 t7PL4E2vWCrDr2+3xad6E+e0Jt6NkvsQmwIUZ1AedDJGe11QlrdlpQ5
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248587

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
Mathieu Dubois-Briand (3):
      sstate: Replay warnings and errors when restoring from sstate
      sstate: Replay the records of tasks covered by setscene
      oeqa/sstatetests: Add tests for sstate log replay

 .../log-replay-error-test/log-replay-error-test.bb |  11 ++
 .../log-replay-test/log-replay-test.bb             |  29 +++++
 meta/classes-global/sstate.bbclass                 | 116 ++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 128 +++++++++++++++++++++
 4 files changed, 281 insertions(+), 3 deletions(-)
---
base-commit: ae5cafacec8e99c5a27fa5b3b378eefc595910ef
change-id: 20261023-mathieu-debug-replay-v4-535c89baa72c

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

