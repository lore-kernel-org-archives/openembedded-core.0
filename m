Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1411048921
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 23:38:15 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109828.1772235493507645132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 15:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=PBnrW3oG;
 dkim=pass header.i=@valla.it header.s=default header.b=DQKkoq0q;
 spf=pass (domain: valla.it, ip: 185.56.87.9, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235493;
	 b=KLDJ6LiwbDzIASCzTEsNJqQTX1CHAuev4El3+5aL+OgVXPuoovpeE58ykgp17pPMgUeDyfvSDZ
	  J9IfRAF4kl7uZBjUYmP+AYBgDikgb06x6OXRwAc87So9AE12RrYuFaFd9oxe0tcEsYxbqNL+D3
	  JUFyy4b/c9Malwy3wPfTom6UQGXL7CKKXzzRjTT4XTPZzInWuKJnaXk0PuhnB8PFp4zNpMkf9Q
	  VLO36U+qy6jAHFM6mrmyIwKl778mH/6774pVRtUyd8ijjhjw2G9RjzsRmKZKLU2rzr0oB4eeo9
	  3VYgMAAPwjcyFLfMbTS1vvpzbbBZCtrDJRRVcPo9fFFEmg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235493;
	bh=YzFF2JxyIiGz3uHMRzbNBinFeQDg9s8C3yq5aMW9W3A=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=FI9Io+NaXCv3+0acwf/2261P0pqgmCDe/qEB+cs+eXO/HumX39pai4dKl8tDzS8fzRYRxsG9E1
	  lTozVh8uXgEQmKqGL66LDqLsFnwHGjTRuafAohbPMiQvUgULE3mIp4ZFFuFDUZX4xa8TgzTxwZ
	  LgT3oe/W1lFdsofwEaVgYmdoKiCGJBWJYWQR9f6zB1h3Xq4FJcSz9sAxZElC5TJz/nNiLadc1d
	  a+lL4giVLo9lOI/YtVRYrbbg3Eg62sagv0qOu6mpVDoFjnHjTS0R9ANEU8hvsQOA/CRdgFUKjq
	  ZYxsvn3PB+BVYrYZ+47LXkkUzB75cQVF8w6Pq0xsH1Kk4w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=RdTGHN72aaq0NmyAa+GXotjCXCcuXReMb3P5KNaY7XY=; b=PBnrW3oG/3P9m7ddw+CJpKcUnl
	TZ2Bji2P0XzkGzpXqBcz7S7NBiQSxqlA3a/Z9nV3iPYzjko/pLa2fOg9V636KpUwhXgGTnsLeiClH
	AQxpqC196SOS8OkhlMVIKzFEK05BeO+oJEw+MbCASBbBCH1IA8OtGgSGoNfYOtz1chKs=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-75sj.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PM-00000006gq8-3YPr
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Feb 2026 23:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=RdTGHN72aaq0NmyAa+GXotjCXCcuXReMb3P5KNaY7XY=; b=DQKkoq0qcovEawKq7jZlkRonAv
	PQDdLvtkGNbSZdOvSnJHwIjDrq7jf7U27IF+2Il/AjACrbOJfI8P4EDV81CAFzRBAQeQForU4aeFB
	EdEIJIAqxnpmj6OAPW1CoJYvNkSNxhodgbQKT2vD6intrjHIScjT8SIx2rRjHPpdEvtM=;
Received: from [82.57.88.19] (port=63008 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PF-000000003u2-1Zju;
	Fri, 27 Feb 2026 23:38:01 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH 0/2] fitimage: add ability to include arbitrary loadables
Date: Sat, 28 Feb 2026 00:37:28 +0100
Message-Id: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3bTMkvic/MSUxKSc1GJdwzRL4yTLZPNE8zQjJaCegqLUtMwKsHn
 RsbW1AN2RAqxfAAAA
X-Change-ID: 20260227-fit_loadables-1f93b9c7a7f2
To: openembedded-core@lists.openembedded.org, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Francesco Valla <francesco@valla.it>, Usama Arif <usama.arif@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; i=francesco@valla.it;
 h=from:subject:message-id; bh=YzFF2JxyIiGz3uHMRzbNBinFeQDg9s8C3yq5aMW9W3A=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmLtM4/sthxoyrMKtzxphP39mv1vrl/c0+orQxhZphS5
 VvwcdaLjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiikWMDNd3H1nwOyTROItF
 9+IWno9zfzcfMGyapbrbrjgs/3/6XmeGfzbFu6LmVHkGCd9QmfFhu2jo/kfhM1fsnyEppb+fPej
 VHnYA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: d0cee32b955f55c74e0a266c3c61f75f
X-AntiAbuse: ID - d0cee32b955f55c74e0a266c3c61f75f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vw7PM-00000006gq8-3YPr-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 23:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232119

Hello,

this patchset adds the possibility to include arbitrary loadables in a
kernel FIT image and to define all associated parameters (description,
compression, type, arch, os, load address and entry address) through
variables.

Patch 1 simply extends the fitimage test infrastructure to allow
checking for existence of node properties regardless of their values,
while patch 2 contains the new functionality and associated tests,

The idea behind the proposal is to be able to generate FIT images for
complex boot flows, in which components beyond the Linux kernel, its FDT
and an initramfs need to be loaded before the aforementioned Linux
kernel is up and running.

As an example, the setup propose by Marek Vasut in [1] (boot of the
kernel through OP-TEE, with both components being loaded from a single
FIT by U-Boot) could be simply obtained with:

  FIT_LOADABLES = "tee"
  FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
  FIT_LOADABLE_TYPE[tee] = "tee"
  FIT_LOADABLE_ARCH = "arm"
  FIT_LOADABLE_OS[tee] = "tee"
  FIT_LOADABLE_LOADADDRESS[tee] = "0xde000000"
  FIT_LOADABLE_ENTRYPOINT[tee] = "0xde000000"

while a more complex flow I'm experimenting on (boot of the OP-TEE and
the kernel through TF-A on the i.MX93, with all components being loaded
from a single FIT by U-Boot SPL after verification) as:

  FIT_LOADABLES = "atf tee"

  FIT_LOADABLE_FILENAME[atf] = "bl31-imx93.bin"
  FIT_LOADABLE_DESCRIPTION[atf] = "TF-A Firmware"
  FIT_LOADABLE_TYPE[atf] = "tfa-bl31"
  FIT_LOADABLE_OS[atf] = "arm-trusted-firmware"
  FIT_LOADABLE_LOADADDRESS[atf] = "0x204E0000"

  FIT_LOADABLE_FILENAME[tee] = "tee.bin"
  FIT_LOADABLE_DESCRIPTION[tee] = "OP-TEE"
  FIT_LOADABLE_TYPE[tee] = "tee"
  FIT_LOADABLE_OS[tee] = "tee"
  FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"

Being inside the FIT image, and part of all configurations, the
loadables can be in this way hashed and (optionally) signed and/or
encrypted with the same flow and key(s) already in place for the kernel.

The generated FIT image is compatible with the U-Boot FIT "full" boot
flow, which loads any component part of the "loadables" group after the
kernel, the fdt and the initramfs.

Regards,
Francesco Valla

[1] https://embedded-recipes.org/2025/images/slides/er-2025-vasut.pdf

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (2):
      oe-selftest: fitimage: allow relaxed node checks
      kernel-fit-image: support arbitrary loadables

 meta/classes-recipe/kernel-fit-image.bbclass | 33 ++++++++++++++++++
 meta/conf/image-fitimage.conf                | 18 ++++++++++
 meta/lib/oe/fitimage.py                      | 30 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py     | 50 +++++++++++++++++++++++++++-
 4 files changed, 130 insertions(+), 1 deletion(-)
---
base-commit: be8cdcf13a658e9e81ff2f7b71d1c8c37a920ce7
change-id: 20260227-fit_loadables-1f93b9c7a7f2

Best regards,
-- 
Francesco Valla <francesco@valla.it>


