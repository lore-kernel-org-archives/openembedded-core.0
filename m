Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E7C61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:56:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16283.1787640965429329405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ePlA9d+l;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 310001A1810
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E65F4604C4
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0189E11C79F38;
	Tue, 25 Aug 2026 08:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787640958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=c/4CPys/bC0qgJ+B11ydiqfrqw0EBCyo5JJTSpIgwJs=;
	b=ePlA9d+lJEjQKfU3g8ydw9v5P5RVQRRZzHAzSuaPuIDQRh7SQamEDAcjqKITRk4+ptJ7vs
	zSJKwuxttiswtoh2iiY/PuLJtbhZngHvPXZKVjWqJKdO4uHFqxoRY8De8bMBAw0q8XNo7B
	nW6FTD65gUGjZSL9njQu4NlkKV4TfSUeM7tKrdHcOaomHawfH+uqPE3e6VqtbmaD5m0lR9
	sJw4NaFFRxLVwBuZD2hT9UBxTzPXPsow1ULgnM73wsQLn35+iZvuNQ/aVSuU3VZx0/kIBV
	B8qell9WqbQUOc67YMdiIgjT8g+OyzGD3Ju5VY/WIcArkYJEcKgBzj59gfmd5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] Disk space monitoring fragment and minor tooling
 tweaks
Date: Tue, 25 Aug 2026 08:55:48 +0200
Message-Id: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBAAv0J6dk2pCOjJfxgO7bLAqrSmrY2G8
 HcBP+BxksnMJAJ5piDO2SQ8JQ7s7AJqlwkctO0JuF1YKKlKWascgnEjYCLAgfAOndf9SDZCSwE
 Bj1rpotD14VSLJfH01PF7y1+bH4eXuRHGtbkaA4fo/Gf7p3z1/lylHCSQLDsyVVEZWV2Mc/HBd
 o9uFM08z189DFSs3AAAAA==
X-Change-ID: 20260821-sbom-cve-check-fragment-desc-c5a2a44a8398
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=v4UQ9WLnyIZvFbfLpvWhCRXi5Tkkq2/karfd2STQB98=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqjTx75x2RPrNp4cDN30xdhmfvinwHsOlABr/cm
 lnGSMz3SGGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao08ewAKCRDRgEFAKaOo
 NvrEEAChuZiYe5KOsnoQKkrip6hDyBvyCIhQ53jOZWwQJM3i+E0JA7z60IUs2iXQ1iaxPWw0KAt
 Zl/u/7mnoeDlNK2JbulBsalgY6TV1VNLXJI2lllhQ9lZxe6XrwgXtYsi5kRTVTth42Tbmpxul0i
 fX9Y2l4fP4lPL+aDDRr2VG/CVwa/d4Z5tjatT2G3YYQgkufpPl0nUwcR2UH40bkOqzXsxMZHfrm
 QB+iBoG2ni4XGAChtEi0YzH0/bFWpP7roUNQ//kBltAZK8FRey1WBwsV8jRrMMTRaZGwZUcpT65
 krxTCShLuIthOZEj7hTx1+l0iKN6QVms7R1tC6OX6tFuCfpuFjZP2u2gD0Q99OCqRn20JZSVHEu
 +eGZsYM1/OY0pj4+jdIfqPC6FWbBTq5n3CYbiMgk6jkX+Jq0t/ZSBGEqPOtYQVXt1FaQ2jyStLd
 PTmQqVMo25swDDYND95hYdlNyTtwE52PI5GaXZIGsMIrFwvBKpaa/CRkV1Ve4OpEHL9UN7wyFsq
 A1Gyu3QE+COqlX3/FcF1nO+ioVCzStEWpdwiI+tWUSJtfO8jSsB2BoMG+fn0sIrG2GoKBjE1dnv
 2w86vQUBQtcdtsXBLdvh6UpdhFsFBQDg80B7nk2WL9zsgqtnH5O/aoHvKMsJJ6k9+XvRDqxLj86
 r+jB56Qe/fMqNBw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244205

First two patches are minor adjustments, no functional changes. The last
patch proposes a new fragment to enable disk usage monitoring.

I was also wondering if simple fragments that enable a class would be
interesting, such as one for buildstats for example. But it would be
very tiny, as it would only consist of:

  USER_CLASSES:append = " buildstats"

Yet it would probably promote the feature a bit more.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com

---
Antonin Godard (3):
      meta/conf/fragments: harmonize fragment summaries and descriptions
      lib/bbconfigbuild/configfragments.py: match Available and Enabled built-in fragment lists
      meta/conf/fragments/yocto/monitor-disk-space.conf: add fragment

 .../autobuilder-resource-constraints.conf              |  4 ++--
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf |  4 ++--
 meta/conf/fragments/yocto/monitor-disk-space.conf      | 18 ++++++++++++++++++
 meta/conf/fragments/yocto/sbom-cve-check.conf          | 12 ++++++------
 meta/lib/bbconfigbuild/configfragments.py              |  2 +-
 5 files changed, 29 insertions(+), 11 deletions(-)
---
base-commit: ace4d721578b8bbb217d760ee86171009d2efc7c
change-id: 20260821-sbom-cve-check-fragment-desc-c5a2a44a8398


