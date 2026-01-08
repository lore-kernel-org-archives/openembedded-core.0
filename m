Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7120DD1D463
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:46:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7899.1767883555047454372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LoTFtZ3S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17A444E41FFF
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E24C0606B6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 370A7103C889B;
	Thu,  8 Jan 2026 15:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767883552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YB4qHm+HHaPCVeDBfw6GH0nxqpLOz6DhVg9ydqHVwCg=;
	b=LoTFtZ3S3ee6asrUf3j/sfrUUC7tjlEuTn1g00B3OmmpKiBZYUyU+wtJswCiEDOYUMCFOt
	yk75SmZptOOX/nTOuIu69PE2fpGrNFKZVbGHnB4ABjsciBGDYoEIUKJtovi3qLHOqlnEVK
	MT83GsYKrLUP9UgCVTfrRhHbMNJJr+rswAF/2cUMu32KR3rO/aZFjWpwOB/+Y3CpaqP8Es
	5sJEU+yGlGb5Q9SvEbrynnsE1pTJ3x80ND0faxIlzXZU/kaP786aC4k5cbs/RGW9XhO+6Y
	SbzYif0UJ5hnvnQnj3HePb+ncBYVyJJXIdjn2Pd28AWQiSKWKroFFOhtCamC7g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/2] oeqa/gitarchive: Push tag before copying log files
Date: Thu, 08 Jan 2026 15:45:41 +0100
Message-Id: <20260108-mathieu-fix-15696-v2-0-fbb0967fdfed@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXDX2kC/32NSw7CMAxEr1J5jVGcfgSsuAfqIkldYok2KCkRq
 OrdCT0AyzejebNC4iic4FKtEDlLkjAX0IcKnDfznVGGwqCVbknXCiezeOEXjvJGartzh7W23NC
 pJeMMlN0zcil3560v7CUtIX72i0y/9J8tEyq0zcBU88jWqasNYXnIfHRhgn7bti+f9DvHtAAAA
 A==
X-Change-ID: 20251230-mathieu-fix-15696-32be41851aca
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767883551; l=980;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=iTfaljzmWveg6Or80gAlLXlsKCTET8ioSqlKYhA9OIU=;
 b=TJG74ZiXosB1rKROiuKq80GGiWVIkKvDi3BDMyMYQjg8DTsfZS29sYDqgNh6mfk9DHvoruj4X
 DIH8EwKbpqQAi8Ata85okJNbaGQIkmbyPqHpk9hdqYBpAJwn5TlOeoj
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229077

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- Split the `push` parameter of gitarchive in two parameters, instead of
  trying to parse the multiple possible types.
- Add a --push parameter instead of always pushing when log archiving is
  requested.
- Link to v1: https://lore.kernel.org/r/20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com

---
Mathieu Dubois-Briand (2):
      oeqa/gitarchive: Fix git push URL parameter
      oeqa/gitarchive: Push tag before copying log files

 meta/lib/oeqa/selftest/cases/gitarchivetests.py | 4 ++--
 meta/lib/oeqa/utils/gitarchive.py               | 8 ++++----
 scripts/lib/resulttool/store.py                 | 9 ++++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)
---
base-commit: 235e6d49e5888ad04416219e10b6df91a738661a
change-id: 20251230-mathieu-fix-15696-32be41851aca

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


