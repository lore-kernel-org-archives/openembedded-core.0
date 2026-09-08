Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CA0C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 17:06:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.348.1788887193182382041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 10:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xffU+e1s;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0AED4E41599
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 17:06:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9512E6053C
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 17:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C77E11C7AF29;
	Tue,  8 Sep 2026 19:06:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788887190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=azqbmPsaMCxL8578v6b3GzC8ZabGLBenXmXnoVyJeO0=;
	b=xffU+e1sVgv8NoXn7sglBkaT3bUGmJwGI/7MZPbDeRxu9tr4IzlJVCG3KG7YvTsnHKIy76
	6SASVOklap7CmJtbQnnq/ewEuzYVPjuqMRC/uSsrjbwPoHjzhETnS0ix35Bosm9k2Lohpx
	Hk/idY2wYTUpMWJd6JSRuabQJy0K+2zdnj5MSlNI/X9+vyD8YBSxxdjC25ps5y9m8gLOvq
	0aWELrybTIqArzapuqZWqQKH4nCfZRxsLwP7yhT6PXh1Rp26z+XQzbEhxcvCWYVuvjD5AW
	Cb2z/dD/4d1ZA2U2Y+QIqvlFIqbN40uCcUzQ4xU8ugboquPWn0Evd4lGZSdo2Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v3 0/4] oeqa/selftest/reproducible: Use a fake time during
 build
Date: Tue, 08 Sep 2026 19:06:06 +0200
Message-Id: <20260908-mathieu-reproducible-faketime-v3-0-03a856c33239@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5AoGoC/43NvQ6CMBiF4Vsxna2hPxBw8j6MQ2m/yheBkrY0G
 sK9W5h00vE9w3MWEsAjBHI+LMRDwoBuzCGOB6I7Nd6BoslNeMGroikYHVTsEGbqYfLOzBrbHqh
 VD4g4AJWGMSEEGKUtycbkweJz96+33B2G6Pxrv0tsW/+VE6MFBaVZzUtZS84vrXOxx/Gk3UA2O
 /FPj//yePYa2VTG2rI1IL69dV3f+nwB+BwBAAA=
X-Change-ID: 20260901-mathieu-reproducible-faketime-4d11333edacf
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788887187; l=1528;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=RwGGS0zQ4ksvlt0L0zRLn4K+M76NIkv8Vz7uo37sDYY=;
 b=TpljQbGMtKmkIyt75sItuUDZjXp+NKb2wTHBKYhJqlDx8QhftJCJKPe5CB1ftJ9ekLg7MKVfi
 KjNXwfeOmZfAQaj6qwdC+BznpqJEL0RSa8eDqbq2sS2/E5ixXFlNZFe
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 17:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245384

Implement some long standing idea: use a fake time during the second
half of the reproducible tests, helping to find potentially hidden
reproducibility issues.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13509

No regression seen with current master branch:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4878

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v3:
- Clean libfaketime recipe.
- Link to v2: https://lore.kernel.org/r/20260902-mathieu-reproducible-faketime-v2-0-9496dff5bde3@bootlin.com

Changes in v2:
- upgrade faketime and fix build
- Link to v1: https://lore.kernel.org/r/20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com

---
Mathieu Dubois-Briand (4):
      libfaketime: Import recipe from meta-oe
      libfaketime: update 0.9.12 -> 0.9.13
      libfaketime: Fix builds on 32 bits platforms
      oeqa/selftest/reproducible: Use a fake time during build

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py       | 28 +++++++++----
 ....c-do-not-declare-__time64-when-D_TIME_BI.patch | 46 ++++++++++++++++++++++
 .../libfaketime/libfaketime_0.9.13.bb              | 29 ++++++++++++++
 4 files changed, 97 insertions(+), 7 deletions(-)
---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260901-mathieu-reproducible-faketime-4d11333edacf

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


