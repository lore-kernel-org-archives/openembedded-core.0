Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F477C624D5
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:41:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.648.1788284511656410031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n1JalQ8v;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BBDD11A1936
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F8A16053C
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 17:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5333B11C7929D;
	Tue,  1 Sep 2026 19:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788284508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ovTmc+kJyciAiErh8XvZWM8Dm0Ydosu8Brwu4dw5UD4=;
	b=n1JalQ8vtAiK2/I4htrbQyTVqk9aiM8V0WAHQ5AxmhK6hy9kpxnKMEOA5hY/MMAd4oG5TX
	ldinFmvr614aks8Cr36KvGwK6Em0MuTEXZQkiBps6ZoHJk3yHGju8/bFEYOru+YlKdvzWF
	ZV3jUsFOLG4BCQSGgyPV+jgQtB7uLj42JNHXo9hYZ+VVQmB+z82bJpre8H0ZUrfjo43wfs
	jwy1wvUU2JKlAcspE/EAy1Ol9mRHikDg1cjsgj2uBVPdHWnMH1pIeAdWeQg+p+lAFgjrle
	LR6JsG2MFHZZMRyw4AH04XU0nxPmthQGGP7OlZsjNYRCbUeOGdMNWQAjPNdJrQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] oeqa/selftest/reproducible: Use a fake time during
 build
Date: Tue, 01 Sep 2026 19:41:43 +0200
Message-Id: <20260901-mathieu-reproducible-faketime-v1-0-eac182548422@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFcOl2oC/x3MTQqDMBAG0KvIrB1ITCm0VykuYvJFh9YfJiqCe
 PcGl2/zTspQQaZ3dZJilyzzVGDrisLgpx4ssZga0zzNy1ge/ToINlYsOsctSPcDJ//FKiP4Ea1
 1ziH6kKgciyLJcf+f9rr+0pm0hG8AAAA=
X-Change-ID: 20260901-mathieu-reproducible-faketime-4d11333edacf
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788284507; l=1119;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=9nrXXAi6AKsel12teueDzxBXF4f6S6Ijs5tqidIfcw8=;
 b=MVOS1Hk8SVjSvpRVRd5N41febHOELuzWOjhWq177OcpauWSwUlVgRdeZfL1El/vA3LeXtixvP
 ibTSJ1lKYmOCUamKTXfU8MBPnv5RIhZKNpP9j0FQdXyGuHnDfxZXtDo
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244841

Implement some long standing idea: use a fake time during the second
half of the reproducible tests, helping to find potentially hidden
reproducibility issues.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13509

No regression seen with current master branch:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4878

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      libfaketime: Import recipe from meta-oe
      oeqa/selftest/reproducible: Use a fake time during build

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py       | 28 +++++++++++++-----
 ...onst-qualifiers-to-fix-build-with-ISO-C23.patch | 34 ++++++++++++++++++++++
 .../libfaketime/libfaketime_0.9.12.bb              | 31 ++++++++++++++++++++
 4 files changed, 87 insertions(+), 7 deletions(-)
---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260901-mathieu-reproducible-faketime-4d11333edacf

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


