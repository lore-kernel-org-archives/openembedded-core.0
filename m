Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A099EE498E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 17:48:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68901.1767116877987341262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 09:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SqKtoNsM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 504624E41E73
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17FFC6072C
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E411113B062B;
	Tue, 30 Dec 2025 18:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767116875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=u7lrOWvOfRCKyFy4Ed/mKdxKQdFuCyu8ruFpT085DbU=;
	b=SqKtoNsME0TG9rlz7rEHVKqDdX1oV/Ccr2an2LNObZBwO4zDf8A/vZhC47YwWDjTjtAox1
	7/YCLc3rrYiplJ5M2NvSEZMfGOJJ5xoma6UttuSfdAjo52AM9WIehIM2wSq07d2G1o1mDB
	CgUzNMsHQXE5fVL7ocMjjt/dfGv7/E0OseyLNiRWLF8NoqLBtWI65UaYyq+D7BzbL8Ya4H
	yj2+WUi4pHKQt4Jx3Lo/aUo4IlT7hpUfPMo/9Q3Oy2VDnLddV0K/XfCaMs/IKKned5hSga
	JKvC1qsb9h9JHJkOq3Ba+QQMbUeJOHsVYOSncd/49Dtm7fPglU6zFH+rb5OZHA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] oeqa/gitarchive: Push tag before copying log files
Date: Tue, 30 Dec 2025 18:47:47 +0100
Message-Id: <20251230-mathieu-fix-15696-v1-0-b4de13efebc0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMQVGkC/x2Myw5AMBAAf0X2bJNuqw1+RRyKxR480iIS8e8ax
 8lk5oHIQThCnT0Q+JIo25qA8gz62a8TowyJQSttSRuFiz9m4RNHuZGsqxwa3XFBpSXfe0jdHjj
 J/9m07/sBni11rGMAAAA=
X-Change-ID: 20251230-mathieu-fix-15696-32be41851aca
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767116873; l=553;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=MmCx9cpJVkpNUkPlFn8vaXj9ydEcV423ptEQoktIdAw=;
 b=8TYPVye4x6voyOTMxezWi1WhcusyytsfvbqMKFnEfN1rOM7Caf9jvVGQLtETjRiuqoj5bMRIZ
 dX1R4QiDVoiD/4uraAHJd8lOZnhiEQZ3SvD6tsG/CwpQmkk9Ea6hZnF
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 17:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228687

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      oeqa/gitarchive: Fix git push URL parameter
      oeqa/gitarchive: Push tag before copying log files

 meta/lib/oeqa/utils/gitarchive.py | 6 +++++-
 scripts/lib/resulttool/store.py   | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)
---
base-commit: 2e4c9b8dee3b1d545aee354ac1f8c6a5c0bad433
change-id: 20251230-mathieu-fix-15696-32be41851aca

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


