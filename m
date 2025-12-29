Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53137E9271B
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:39:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40653.1767001166378233369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=floDEbfr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4119E1A24E4
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E87360725
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8880211979251;
	Mon, 29 Dec 2025 10:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767001163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TAEHXLOA3nLPACsO4d8tUdVsqO5EmX778x3Xvkpqt/Q=;
	b=floDEbfr3zMexM5yCTCrXyWd94d72VWbnsH3VsxnTajYklZPdO/ykx3M8fzWD2pC1rpB0W
	i8hS5FSHU+B3djgCwgzNjvUEFXf424G+QlQELKdt6d7LwfjWNIyJWSIAaQrSfAc99zJPjI
	YNWstbvBKniOtF8yeOtIXQB+BWCVhJgGopuHvxlUQabe9BCDYUCZD2q95w/y+rsZoGmCWP
	rCvtPVPr/USSzzgyVBzQ5bROH3o6he31+0kmCPWVZybmEqZB31GqS7rJCufbv1sv/i2aYD
	1sMz3DGjs+5zOLXRSPng4rnPl54Z3eXdXSmGYlocsTHXyiNAIuPnLO5U8sCnsA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] oeqa: Increase some timeout and add logs
Date: Mon, 29 Dec 2025 10:38:59 +0100
Message-Id: <20251229-mathieu-oeqa-15999-fixes-v1-0-b0681fa259a6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRMUmkC/x3LSwqAMAwA0atI1gZsINB6FXERNGoW/loVQby7x
 eVjmAeSRtMEdfFA1MuSrUuGKwvoJllGReuzgSpiRxRwlmMyPXHVXdBxCAEHuzWh9yzcMw3iPeR
 9i/qHfDft+35QXRyBagAAAA==
X-Change-ID: 20251229-mathieu-oeqa-15999-fixes-885a5d52fa88
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767001162; l=897;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=rAX/Ew8d0gZb/kgSoa+JVTzoVVxJE2xHDzdjzOt/H18=;
 b=aFusgtXxdl3kw0ohEpwKQeGmWFoxEj97TSepMDT6y983e4eLFtCJS62qNArM1FCp/Hqu79owF
 fk0HACUpS2ZBjdIuXZwomjPhTG0SrWxu8KuCn/RBPsiYw/mV3zyrQ57
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 09:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228593

These two patches have been sitting in my branch for a few weeks now,
trying to address a test timeout bug entry [1].

The test_go_compile/test_go_module issue did not reproduce on my branch,
so it might be fixed by the first patch.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15999

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      oeqa: runtime: go: Increase test_go_compile/test_go_module timeout
      testimage: Print last lines of kernel log on test fail

 meta/classes-recipe/testimage.bbclass | 3 +++
 meta/lib/oeqa/runtime/cases/go.py     | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 2e4c9b8dee3b1d545aee354ac1f8c6a5c0bad433
change-id: 20251229-mathieu-oeqa-15999-fixes-885a5d52fa88

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


