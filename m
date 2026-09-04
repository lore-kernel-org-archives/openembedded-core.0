Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC6DC79F85
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:23:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9187.1788510191091380408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hhDqR0db;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3B854E41501
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8073C6057F
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0600711C7A463;
	Fri,  4 Sep 2026 10:23:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788510184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=b1HMWQfiTz0exTngWdY8ZY9ReX8zDOVWvGjLUVe15SE=;
	b=hhDqR0db7HnAOWZw+Xk1hWwHEWfGV6KzfBPiVX8FDA8Av+c0S40X9fVZBYS/j+92P7caNe
	+oKH0uXUBxS4q9rWgDXLWG2NLdG7478FNhgRZz5yTizp+9Bg9GK5JcFcN0KzqEkZumK2ek
	fh0KGiaE12fLVGEsgM7To2URup50m+sdxEKUhrzcK+mrBeEIMpvT+Drw3M3X7Q3LHgTeyz
	q8HGx4ZU/zyjLIrw3ps/HtsgJ9SA+oA9tyajXSfFCCIjJOI4y+6jkHJbvQAlBmbVuVLbkZ
	Lt8A2i7utZ/yNBl8ueDl/XHcZJbpCzvsAo91HMJ4LU+IKGzB9F8AyKq5BddQZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Minor cleanups and improvements for
 script/oe-depends-dot
Date: Fri, 04 Sep 2026 10:22:57 +0200
Message-Id: <20260904-oe-depends-dot-cleanups-v1-0-b56bf05fc5fd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBG4Vchs3aSCnipr2Jc1PZHx5i26QAxI
 bw7VZff4pyFFEWgdGkWKphFJcWK/a4h/3TxAZZQTa1pj8aanhM4ICMG5ZBG9m+4OGXlw+DsCbD
 nzluqdS4Y5PM7X29/63R/wY/fHa3rBn1xLeF7AAAA
X-Change-ID: 20260904-oe-depends-dot-cleanups-5fa97ee983c9
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BfMVazIj+3qQcOsepgp0mOZO1C3+rYHDuG1Wz5Qrt+k=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqmn/mzmhDSfyiDPFg6A8Gs+AwcLt+h9FoUnwIi
 b+HdC74dKaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapp/5gAKCRDRgEFAKaOo
 NgVlD/9ApIivKi5JIqW9UJim/4XxvUH5unwJc+8IInmmi7wHowMozIBEkj6fLnzDDNOMPzqB6j5
 fQb5qpYhffKQbQJYXdK58+q9jLlgKP+bRp6TyS6D/oH7VvZjjp8cNZx848V+K7ZVdMWIdGHCfVA
 9F+LhgnQjiTDjg3NWW+ICoirpWmG1y+hYQK1mqfmaK7UYeqG+hYuYmK2WqztZqzZzaFCYCizRdd
 GA0niXxsm4ANn6mCF4N1PSthGB0rRwnHp/NRonRSbILZ8N/hp9lCE2qAZsynbh/vTzU9kOyWnQB
 w2dhuIwc7AQAZJIPYdhOq6Y74vMLQzklqkZxwJYSfFCvovJy5kBPgcMmzlrj2WlP+UbdP8mRs2o
 HQBuRqsLe32N50k235iXQcqIDMsHti8nQfxjiR7Aoc09lRReB+TLHEPdicZRVXIfPVFjbex9YEm
 y2Pj6wbx/feQWzHiQKfMDhTTS0xMUgXCHBc993URTSbHAlouVPsQ5vkJVPGXZXgQGF2qlyVqohM
 SxgaC4LrAEb4O7X5QTV8Ms5mNDc6HQT40pOPEUJ0i27nBfvRf7m35ZML2+M1LQRRIOyRXiGhNjJ
 APpFvdUouiCi7UVrvG31J0EfRHDYIrrvNrtKij1BgE4g4z+MtRNU6oQeABcI6YivlWMAt+l8Bd+
 nF3UVviNl7pDd7Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245065

This series is a simple round of cleanups and improvements for
scripts/oe-depends-dot, along with making the dotfile optional as it is
mostly always ./task-depends.dot.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      scripts/oe-depends-dot: fix dotfile argument type
      scripts/oe-depends-dot: remove custom argument checking
      scripts/oe-depends-dot: fix Fonud -> Found typo in warning
      scripts/oe-depends-dot: give the dotfile argument a sensible default

 scripts/oe-depends-dot | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
---
base-commit: 934e84e9ea1fa2faf14bdafa71638fdca22dd79a
change-id: 20260904-oe-depends-dot-cleanups-5fa97ee983c9


