Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07787CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 22:51:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1853.1778280702911356631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 15:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=SG67ekr/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F1877C5DC73;
	Fri,  8 May 2026 22:52:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A0A9605D0;
	Fri,  8 May 2026 22:51:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A66110819D7A;
	Sat,  9 May 2026 00:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778280700; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cZtIGbONXS2e3+lrEukdmVYCakUFPXDLyOdhMn7yYpQ=;
	b=SG67ekr/waQkz/w68oLNX9Jdj0gyKaORrDkD5Zrvr84K3PATo0jbOG2++4DIPfbrYxPlBa
	kT2T/NJMwSzpcRxaO5Z81JR5Ps1z7stMdN1Y/1vmVsL8zCGCFEwqdF9FXT/3CZoxFJggWy
	ZCSVQLQijgiMFyB9aqCT5UdY6xIB1jAGxbW0IzKm7LJ6YesrFPVCTgEv9/ldNV5Jxyz+0v
	ZpkQ2hMrlgO/JGi7Hunop+LEIkP7yvr9T53T3y3PPyyIm7BTSMUk4nSKYNuNMSlXXBQxBz
	Yp+y6bdSqQ13uvXibvsMX8r02AjXnzsixAH1uxeKjZwj3Ly8dvrK+We5kvxFow==
Message-ID: <3e713ce0-bc74-4c5c-873b-d6402f664a79@bootlin.com>
Date: Sat, 9 May 2026 00:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: quentin.schulz@cherry.de, ricardo.salveti@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <8410dd92-5356-49d2-a294-ec197ec67bac@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 22:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236746

Hello Quentin and Ricardo,

First, thanks @Ricardo for spotting this v1-instead-of-v2 error!

On 5/8/26 16:35, Quentin Schulz via lists.openembedded.org wrote:
(...)
>=20
> This means any recipe including recipes-bsp/u-boot/u-boot-common.inc=20
> will need to override SRC_URI in addition to SRCREV otherwise the patch=
=20
> may not apply.

It's actually a bit harsher than not applying:

ERROR:=20
/src/openembedded-core/meta/recipes-bsp/dummy-u-boot/u-boot-foo_2026.04.f=
oo.bb:=20
Unable to get checksum for u-boot-foo SRC_URI entry=20
0001-scripts-dtc-drop-yaml-in-DT-validation.patch: file could not be foun=
d

so bitbake halts right away, far before do_patch.

While I agree the v2 was not fully correct, this patch cannot be added=20
to .inc files, since they may be required by recipes whose FILESPATH=20
list wouldn't include the patch in the first place.

See "72d1f9ec6fc060ea586a61f3da92ffac440f0ded: u-boot: relocate=20
SRC_URI_RISCV into recipe".

--=20
Best regards,
Jo=C3=A3o Marcos Costa

