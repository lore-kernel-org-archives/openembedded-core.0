Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587D9C61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 07:41:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.22087.1700898077516933837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 23:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=qlJnAXCy;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 83E8A86FC6;
	Sat, 25 Nov 2023 08:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1700898074;
	bh=lk9ihMNpalv16TL9X6rOISF0hPoFl9m0qT33rFpF+S8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qlJnAXCyjWIJRAJZrL52OW3DFlqQd1ZtRPcDf3D8W0JrRO6tuQiF2QKSkCAg4kclT
	 pyCmf2s2lwBYKzLZX2xxC5eyUQuu0cUpYaPAM77wkPLUhCzvix9T7wG1Ckpvh/Z8RL
	 tjBXHj5Jomteu5e3gA59y2Vhqb07LFdizJxs34027ECFqZJrttBcfGgwv/iHCWIkRo
	 HJwmb510cvRw/AZIYFywV+I3mQp5txyLqoalXJPjdw1diOMCv2GJFtS7ZFHqT8AHRl
	 U6bHXe3mSG11Oy5vMsoe/lSQDlxPoF3wW4VWSq0nRN2KlvhyXoTuQK1PC+yA32sziL
	 54Bb1mealcEnA==
Message-ID: <3146ce48-57df-4136-b9b4-501021407aeb@denx.de>
Date: Sat, 25 Nov 2023 08:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231123004605.82598-1-marex@denx.de>
 <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
 <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
 <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
 <CAMKF1sq+KCHsQ524XWynBiepeW403UgP3NsX5s99R54HrqVTSA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1sq+KCHsQ524XWynBiepeW403UgP3NsX5s99R54HrqVTSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191221

On 11/24/23 23:28, Khem Raj wrote:
> On Fri, Nov 24, 2023 at 12:18=E2=80=AFAM Martin Jansa <martin.jansa@gma=
il.com> wrote:
>>
>> On Fri, Nov 24, 2023 at 8:52=E2=80=AFAM Alexander Kanavin <alex.kanavi=
n@gmail.com> wrote:
>>>
>>> On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de> wrote:
>>>
>>>> The lzop is called in oe-core and I was under the impression that
>>>> oe-core shouldn't depend on anything except bitbake . So either this
>>>> stuff should be moved to meta-oe too (which would be unfortunate gro=
wth
>>>> of dependencies) or the lzop should be reinstated . I would obviousl=
y be
>>>> in favor of the later.
>>>
>>> There are plenty of recipes in oe-core that have optional features
>>> (enabled via PACKAGECONFIG) that depend on recipes that are not in
>>> core. If you enable them, bitbake will say that the needed recipe is
>>> missing and then you need to figure out which layer to add (typically
>>> something in meta-openembedded tree). This is not that different:
>>> optional feature, disabled by default, and the error will be the same=
:
>>> missing lzop recipe.
>>
>>
>> I think this case is slightly different as this optional dependency mi=
ght be "enabled" by MACHINE config in some BSP layer and BSP layer depend=
ing on meta-oe just to build the kernel (with BSP preferred compression) =
isn't great - compared with some DISTRO config enabling some additional P=
ACKAGECONFIG in some other recipe the DISTRO uses.
>>
>=20
> do we have some data on how many machines are needing this ? if not
> then I think we can say that
> its not actively needed and few machines if any needing this can house
> the recipe in the BSP layer
> core support is still in core so that's good.
>=20
>> At least if Marek agrees to maintain it instead of restoring Denys as =
maintainer :).
>=20
> That's good although it will be nicer to see a wider use case to keep
> it in core.

I can think of at least two SoM vendors that actively use this.
I don't think that's "a few machines if any".

