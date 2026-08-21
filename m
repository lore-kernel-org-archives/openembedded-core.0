Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E00FC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:27:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6277.1787315220571855343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YPB0qzYc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3BCFB4E41319
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:26:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05645604AA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:26:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0047711C77081;
	Fri, 21 Aug 2026 14:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787315213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gnevRQyCVD1I3QEeNqW3BABNLhX1P9lrRoaWasoz9wk=;
	b=YPB0qzYcYLNyR4AY0xVj2v1xckW644bmBdzQD1VJviqaVF+rrp+/K0IYRANrqQ28eEUPId
	iXKU+ioS66qbMXhQ0hvCDj68OlPCDa4fdprX+GoJU7TQrf2MtRzroJN8E/8w2QJAebq4iN
	iCeoeRBNT4vozOuDoOfw4hGYCYbshXBZ9H4yeOYRA1DKXCAP+t5I68vNGeUk1q11pbRLav
	If7e/pNIVF03w3eDi350BocGiSRGKlMPvbg0GtFi4HznKWxbrkv2yPLPrlXLWyKor4NESJ
	HwM86yp2yrZoLF99mAyZdtaeKyZ/MHKzWfq+62YyVNrTmkmE3wIx+OzTc3S3rA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Disk space monitoring fragment and minor tooling
 tweaks
Date: Fri, 21 Aug 2026 14:26:30 +0200
Message-Id: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTsJVDTVqxgWZfjAaCimg8SEc
 HerLt/mbWRICqNrsVHCqqZzzKgOBckY4gDWLptc6c6ldxVbO08sK1hGyIP7FIYJceEOJiyn4EJ
 dB3+8eMrFM6HX96+/NX/bq71Dlu9J+/4BzljYA4AAAAA=
X-Change-ID: 20260821-sbom-cve-check-fragment-desc-c5a2a44a8398
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OyG5Ar1C9lyb7iBV37ZLqNyzay4+0/gSHPCa2CKJup4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiEQJabOgKWcoUOCb2/AS+Eg/iEJMEPltlllpY
 NxjUy7kBFCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaohECQAKCRDRgEFAKaOo
 NmtuD/94SVNOHpVP3v6eResLW3bK9XqqKQK1Sc69a0muz7e4kioPL94aqGgRKkHGmWqUHyeLdeX
 IvwAEN7JA9PCFZWEcVioblD+/w5+lCFXps8bSmD+7U/p7bpt4GxHMrUownOtZMQmWpV5NfB2FmD
 FWP8AAeWvxCbn/uNOKevUyAV/+Qxq6HQq2IPW0KBzTlsbjzuQhL6s703vWvOGEWy4hiJPzp3gbY
 VfT895TC48BvCfVefMRzn9Gae6vu9tL5MhtI+bLSvMrclpySoXChYggqR8C19E7p8/e6Oe0iX6B
 aCcCwB/eWklxx5qJTzrNPlC3dt/ojZayMMSB5xeLylzLC+rkTQxTE5pZ4X83SPfjZ4hbMf87U72
 nGBDYkq9sylGhD3lV8zjzO+t8c9eDUyZ9c2K0gKTiilfCfRuiBNHV/7WZNOKnDyL5a9dztFWtL+
 lV4+NvcPupIxTy6vPzLoCZVSQ0xoXbuE5phnRlE7tVCWV+4hJVtDhTLwvBa2jBpXdUAVEHewDFO
 g6gFaQX+oKc2ifNz1eSDLbKSVbXnvTDUethXkqtD1hN3aeEdD2tEIPhsaNifLnmrsBic863WTYI
 HGzwea888ItWifXbT6XSnca18fQX/dj0GG1jN2k3ASt/fCGjOWu6l/fjb5l2tyY1UL4WNJB9xWb
 B/KLD43nnttcnWg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243934

First two patches are minor adjustments, no functional changes. The last
patch proposes a new fragment to enable disk usage monitoring.

I was also wondering if simple fragments that enable a class would be
interesting, such as one for buildstats for example. But it would be
very tiny, as it would only consist of:

  USER_CLASSES:append = " buildstats"

Yet it would probably promote the feature a bit more.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      meta/conf/fragments: harmonize fragment summaries and descriptions
      lib/bbconfigbuild/configfragments.py: match Available and Enabled built-in fragment lists
      meta/conf/fragments/yocto/monitor-disk-space.conf: add fragment

 .../autobuilder-resource-constraints.conf              |  4 ++--
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf |  4 ++--
 meta/conf/fragments/yocto/monitor-disk-space.conf      | 18 ++++++++++++++++++
 meta/conf/fragments/yocto/sbom-cve-check.conf          |  2 +-
 meta/lib/bbconfigbuild/configfragments.py              |  2 +-
 5 files changed, 24 insertions(+), 6 deletions(-)
---
base-commit: 7944665886cb0bf881807a5d849ebdf42a33d1bf
change-id: 20260821-sbom-cve-check-fragment-desc-c5a2a44a8398


