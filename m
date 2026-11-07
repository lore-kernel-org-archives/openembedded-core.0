Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8995.1794059715838317742
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 05:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gzx/Tki0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 77BCE4E41406
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 313EA5FFBC
	for <openembedded-core@lists.openembedded.org>; Sat,  7 Nov 2026 13:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D1310328D8B;
	Sat,  7 Nov 2026 14:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794059712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yLCMwyI3TFeZHd8CLT5EMNhm4IyIygXzWUicpz7trBo=;
	b=gzx/Tki0TEJr+KFzxOlW7bj3d3lWRsQL1QDI+zOdSPWudvNyBEGeKCwX0E8uzMYGUQcqE5
	NighcfiLxBotGbPCq4QA+vkSnt0AIcFFwDL6cYHcm5nbr0h1uZpmc0GWG1HfERjRkRebeQ
	ahlZf7r2mEpaSmG/H3LliInLg6MAKEcTbxMQ/H1TrD+Jtzu8eW/X2ZFJgm1CpdTn+N9lp7
	+eG7cTmdYe9S2+7bmjIOy2hNO6djI7RfY9oC6e77RUpcdqyQoAF/jOJUfXh27ZsZJFNrBR
	PKrERfdVeKGeCc2Ht0RBooKj9eNQ3oqRtQ+0JyEIfleR9b1OBEDKeNbTv0OYcw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/3] runqemu: Fix a deadlock resulting in files left behind
Date: Sat, 07 Nov 2026 14:54:52 +0100
Message-Id: <20261107-mathieu-master-next-b16487-v1-0-2fe0e7b9b1fb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwt72oC/x3MQQqEMAxA0atI1hNoarXiVYZZVI2ahVXajhTEu
 1tcfd7mXxA5CEfoqwsCnxJl9wX0qWBcnV8YZSoGrXRLpCxuLq3C/9KYOKDnnHCg1nQW1dy4adD
 GkqmhDI7As+R3/v3d9wMjBF9PbAAAAA==
X-Change-ID: 20261107-mathieu-master-next-b16487-0f5adb247143
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794059710; l=1444;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=SbY9m/sfZ1ww5/U+nnUNytH4ww3udsf3XOzgI4M7mSk=;
 b=m2UTzujehKCMwSrOVi4NgTnlnv2m5D533fgU3kw49/MTPlAGdn/4IhYNf3M8rxeppl8I0oS68
 mrlNpCaBp48CniXi1bt2DNUu6u+BLrtqv25jXeiJERgx3+IjgGdGZk6
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 13:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249740

Current implementation tries to use subprocess.communicate() on the QEMU
process from the SIGTERM sighandler, while we also have a
subprocess.wait() on this process in the main thread. This will result
in a race that might lead to a deadlock. When run from oeqa, a SIKGILL
is later fired, which will lead to skipping the QA and leaving files
behind.

Fix the deadlock by having the SIGTERM handler only transfer the signal
to QEMU. Clean-up is made later, on the normal exit path.

Also fix another bug leaving half-copied files on a copy failure, and
increase the debug level of SIGKILL traces in oeqa.

To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (3):
      oeqa: qemurunner: Increase verbosity of SIGKILL log
      runqemu: Also remove file when copy failed
      runqemu: Do not run cleanup in signal handler

 meta/lib/oeqa/utils/qemurunner.py |  2 +-
 scripts/runqemu                   | 39 +++++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 19 deletions(-)
---
base-commit: 3a3eef7afb41dd4fbdc92d1ac121baa55eca0a95
change-id: 20261107-mathieu-master-next-b16487-0f5adb247143

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

