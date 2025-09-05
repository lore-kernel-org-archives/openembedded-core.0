Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8F1CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:24:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.20306.1757075077156378506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BLmVmTqF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FFAF1A0DDE
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 12:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65A2B606A1;
	Fri,  5 Sep 2025 12:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F454102F0916;
	Fri,  5 Sep 2025 14:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757075073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iZebFwdyQOE0Z50loToncGhAvl6dqI0KP/of41WZwyY=;
	b=BLmVmTqF96SwfAOYJyu7BTNVRYcZLZsNpydNuYIDI+s2oqaQcn+P4x/MVbg/LIi3fwvWXy
	eoC4HZ6CF8LFHBDNMNanVVOaqTuvKKt/iNzoy7Ok0g1zyE5RkjOIXWd/KeX/5l34kUD1Ml
	RNrkouKmm3vF5Z26bvttdD8ZtFmfEKwZPQfL7oYm8E2TblDBXrUW8AQTPyaAeaTQnNoKga
	OURR1k19KzM71/trWnT+HIuumV5FgwUk4zLHJs8GWPxkZM5iMusMW4W1unfZXbukpyuCW9
	PXqVkwmA1s4rpyfKGPaTnS5KMAi4wafk+l3MmfDj0XxcogVBm2hRPDtXg7itCA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] lib/configfragments: add a show-fragments command
Date: Fri, 05 Sep 2025 14:23:56 +0200
Message-Id: <20250905-show-fragments-v2-0-c13ec8df9296@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFzWumgC/3WNQQ6CMBBFr0JmbU2noSquvIdhUXAKY7Q1nYoaw
 t0FXLt8yfvvjyCUmASOxQiJBhaOYQazKaDtXehI8WVmMNpYXelSSR9fyifX3SlkUVhqf3BodtY
 hzKNHIs/vNXiufyzP5kptXiqL0bPkmD7r44CL9zc+oELlfYneur2tbHVqYsw3Dts23qGepukLM
 uoZScAAAAA=
X-Change-ID: 20250904-show-fragments-140f8a1265a1
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vBISEV7gfHma2DJ0sskpeZM6shU83jUXAhS3tPD+v2E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoutZ+JfXCl6ylVG3nHIUYB096IriaoKWXFQfRe
 EOmzBDwz9eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLrWfgAKCRDRgEFAKaOo
 NoqwD/9DLHwE2C/cK/uD0NgGbAibFPlqxVzoz9qC47om5e1+JNDGNc0pTnsJFCj/pBL3rcpHUsb
 WHVgl9cDNyx219RiIwEF33QPPTdi9Y4eHrUAlMVQ2y4qBE6b2JoTvDU+LBg9U+nh2SjtMvHeq1e
 kJ7gCHnkG6p6SpGrigsfWfinKAHoQch+G1GlRWdRHqGW+h3IIgFCY8BsQZZaUjdvaidR/VdfYtz
 Jmupfj97Yl6g5o1OepikqqqkkwyIJORdnG754zhl7E+P9EHbWPkFxRu2W0O5NVH2wrmQ0Rjh8cf
 g+MkBtW6Ra4MCqZbZF/70MFWFE7OwwGXTeYMaJ9qR5UXbShV/qiYhc38xbmcOfIM9LObIdfAbqN
 LEwCnrECxz9UH9y0myA23WV2TpfC3J++crJvL8/fwIfxanFlH/vDgaREX7faEzhmuQAL6SR+1Pr
 1M+cSXTmBC3DSRbhwNn77PbtfFOX9+kZ4y3NeNuuhmOwem0VgJyId5FsmVEPQ0UO7tsbi9Ng/kB
 6CmKBqG0szKvf0/RXns44rlWPP7cJQIDGd3l+Iwp7MTOz2adB9a11MO/y+ctfdbR1yQRRbMw1YA
 xCbewel7Dct5+KZ1S5cQtluf/t5KhuEUNuXgHfmiWHaxH2b52xSmGgJWPBAOJdIJTha9dfrOa4B
 Kl9gwVzR0aJ8aOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222996

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add a test case (patch 2/2). Patch 1/2 unchanged.
- Link to v1: https://lore.kernel.org/r/20250904-show-fragments-v1-1-ff41f5a75959@bootlin.com

---
Antonin Godard (2):
      lib/configfragments: add a show-fragments command
      oeqa/bblayers.py: add a test case for bitbake-config-build show-fragment

 meta/lib/bbconfigbuild/configfragments.py | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py  | 26 ++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
---
base-commit: 0a849dc7edeecb6c16a8a0fe347015d6d85e9dfd
change-id: 20250904-show-fragments-140f8a1265a1

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


