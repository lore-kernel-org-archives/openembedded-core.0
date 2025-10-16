Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE4ECCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:51:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3029.1760601054462263158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YcYyocZn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8733A1A140B
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:50:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 576096062C;
	Thu, 16 Oct 2025 07:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C35DF102F22AA;
	Thu, 16 Oct 2025 09:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760601051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VnYhwFghzHqqfF6C/H6BBx3fOjczbL7x48pqOYC5i/U=;
	b=YcYyocZnWYfgrpS22+ErMT4BQUq/kZ1KM7zHrSN//U5Di44U0ojbkpar1k8vlgM4qVJC93
	AV3OYdUjHqym2rlM/2UKiMw/SZAnrbrR4A7woclKCgvUqF5dQtpvgOaIVyTCHU0ZA150lY
	BqRMbsucZedOmVVDSJYv+4VkS4+PIP1qI45Kx7xO+U9q+fQ8n4LsHDko/NXC9KIWEca2bH
	DcJWHqBY/wjcC4hfyaNKvqER9rHK3iED1cDc3IVHMpkKwfcZuI6dZ3N1OYVGrYDCElcZv+
	/IhFsSirLzHTgScboltfQnGO+JAaFmo9fh1ONBAeiOul2tLWcjasDfd/8g08WA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/2] oeqa: runtime: Clean setup/tear down function on
 weston and logrotate
Date: Thu, 16 Oct 2025 09:50:24 +0200
Message-Id: <20251016-mathieu-test-clean-setup-v2-0-c4295b9334b8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCj8GgC/42NQQ6CMBBFr0Jm7RgKWoIr7mFYlGGQSaAlbSEaw
 t2tnMDle8l/f4fAXjjAI9vB8yZBnE1QXDKg0dgXo/SJociLu8pVibOJo/CKkUNEmthYDBzXBTU
 z6YGoKm89pPnieZD3mX62iUcJ0fnP+bSpn/0juinMURObui51X9Vd0zkXJ7FXcjO0x3F8AW8l5
 WzCAAAA
X-Change-ID: 20251013-mathieu-test-clean-setup-6eec6fcc734d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Joshua Watt <jpewhacker@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760601050; l=1217;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+o2jiJJAPTz/cHaCPTMBkGMHF2hddclhqxUWCUdFlJM=;
 b=pZim92NIsVbyyq+cU5Z0wzt9u3VmeOqcx0josGxnZ2oxS7OfI0nwnGgs3LvUKXxVg7vncJVhR
 5AUOQ1XYbGqBniA84FPT4z+VEqIDPlJZvb5rZVUukn5StYQke4EwKMu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224955

This was discussed on my previous series, introducing a new error on SSH
connection failure during tests: setup and tear down functions should
only do simple operations and not try to interact with the target.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- Use addCleanup() method to remove files. I clearly prefer this version
  for the logrotate tests. I'm not so sure about the weston tests, as
  some file is expected to be kept across tests in some situation and so
  lead to some strange logic in my changes.
- Link to v1: https://lore.kernel.org/r/20251013-mathieu-test-clean-setup-v1-0-6cea9936d79b@bootlin.com

---
Mathieu Dubois-Briand (2):
      oeqa: runtime: logrotate: Remove setup and tear down methods
      oeqa: runtime: weston: Remove tear down method

 meta/lib/oeqa/runtime/cases/logrotate.py | 19 ++++++++-----------
 meta/lib/oeqa/runtime/cases/weston.py    |  9 +++++----
 2 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: d098b35cfc3098448bd81245f9593fcd728e4b20
change-id: 20251013-mathieu-test-clean-setup-6eec6fcc734d

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


