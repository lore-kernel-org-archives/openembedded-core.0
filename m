Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C869C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 11:16:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.133196.1700824576873139722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 03:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=cQY9OWr2;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C636686FB2;
	Fri, 24 Nov 2023 12:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700824574;
	bh=d4OPXIutAyTBX2OTp+BASpGO9nhlT97VUkgZGU7MJKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cQY9OWr2WhwqKhst/HJuFOy/5zvBz1EwmNW7bVL8PD7Ip45QH14qoNdVHlwefxeD+
	 S+cEbLmVXgl9QCwcJVymHIT4ieaCPnAuWil0npaMFuxmFfUxrbjb4jfHuKMLD418HZ
	 hbvUfiZbHikHBjA/99O9KokVMObvCKCnyqF9tI/EBUf0BE/H/pZb/cAlZayazOT9oZ
	 DQec7jmhL7vbXDPPTDBq2R3rLLMGYJG/eKJB19YLv2FHWZviq7002XhsLOM2Xj2pBg
	 BUH5mJ49YtOOxwse3hqkoWMzoBv2gpXAlNu7RYivpo7kd5UG+HblDC1vmiQDJLC9nm
	 0Lssj0B1dY56w==
Message-ID: <2d05b96c-b567-4387-9814-1e49b04e9c37@denx.de>
Date: Fri, 24 Nov 2023 12:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231123004605.82598-1-marex@denx.de>
 <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
 <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
 <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 11:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191181

On 11/24/23 09:18, Martin Jansa wrote:
> On Fri, Nov 24, 2023 at 8:52=E2=80=AFAM Alexander Kanavin <alex.kanavin=
@gmail.com>
> wrote:
>=20
>> On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de> wrote:
>>
>>> The lzop is called in oe-core and I was under the impression that
>>> oe-core shouldn't depend on anything except bitbake . So either this
>>> stuff should be moved to meta-oe too (which would be unfortunate grow=
th
>>> of dependencies) or the lzop should be reinstated . I would obviously=
 be
>>> in favor of the later.
>>
>> There are plenty of recipes in oe-core that have optional features
>> (enabled via PACKAGECONFIG) that depend on recipes that are not in
>> core. If you enable them, bitbake will say that the needed recipe is
>> missing and then you need to figure out which layer to add (typically
>> something in meta-openembedded tree). This is not that different:
>> optional feature, disabled by default, and the error will be the same:
>> missing lzop recipe.
>>
>=20
> I think this case is slightly different as this optional dependency mig=
ht
> be "enabled" by MACHINE config in some BSP layer and BSP layer dependin=
g on
> meta-oe just to build the kernel (with BSP preferred compression) isn't
> great - compared with some DISTRO config enabling some additional
> PACKAGECONFIG in some other recipe the DISTRO uses.
>=20
> At least if Marek agrees to maintain it instead of restoring Denys as
> maintainer :).

The recipe seems low maintenance anyway and I use it often, so yeah, why=20
not.

