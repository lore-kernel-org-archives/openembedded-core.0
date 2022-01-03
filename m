Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9819AC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 19:09:56 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web11.32841.1641236995559557458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 11:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@collabora.co.uk
 header.s=mail header.b=bB2SQoue;
 spf=pass (domain: collabora.co.uk, ip: 46.235.227.227,
 mailfrom: andrew.shadura@collabora.co.uk)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh)
	with ESMTPSA id C1BC51F41B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1641236994;
	bh=VZ4FBBaGaHuXcmRW5bfRlRyv/Vk2tRyBkzlfoSDpzSs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bB2SQouePiEzJqK87PVit99uOYpHyEs/C0Ommi6jQiffkEqoC6IJWI/bUOCeXkP3C
	 f3xnGgMKYZAqVl1piv6M68DQi7N4IEGuw4EVupkC0UUNYwD50Wy0JUhPXOvo7IZT5a
	 yJjTqegL1fhuSpz3+/heStJLRapSg6FJfNsKMFz/MHxCsiJuwLxwPT9VenUnea5Km4
	 e6hspL9nCe5MGGvGNFPdxcrgCyM3IewZnOuMuFTl/rkTEda4m2CVLuWaVToAndPNzk
	 iBilZiAhXgY83zXvnbHxcv8VVASy6GZdOQ8cYN0dcGKAQ4PWENscu583HTFhsEXtES
	 JbZFpHVhHDaOA==
Message-ID: <9aaf313f-983a-a44d-cac8-822929a4dd7d@collabora.co.uk>
Date: Mon, 3 Jan 2022 20:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] pseudo FTBFS with recent glibc
Content-Language: en-GB
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
 <e77792acdad02f36f436ccd7fe979c5c56f37361.camel@linuxfoundation.org>
 <4e46a5df-1abd-2a3c-d8b7-ec98f08be08c@collabora.co.uk>
Organization: Collabora
In-Reply-To: <4e46a5df-1abd-2a3c-d8b7-ec98f08be08c@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 19:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160147

On 03/01/2022 20:04, Andrej Shadura wrote:
> Hi,
>=20
> On 03/01/2022 14:47, Richard Purdie wrote:
>> On Fri, 2021-12-31 at 21:40 +0100, Andrew Shadura wrote:
>>> pseudo started failing to build from the source apparently after a gl=
ibc
>>> update [1] we had in Debian:
>>>
>>>>> In file included from pseudo_wrappers.c:46:
>>>>> ports/unix/guts/symlinkat.c: In function =E2=80=98wrap_symlinkat=E2=
=80=99:
>>>>> pseudo_client.h:14:65: error: =E2=80=98_STAT_VER=E2=80=99 undeclare=
d (first use in=20
>>>>> this function)
>>>>> =C2=A0=C2=A0=C2=A0 14 | #define base_fstatat(dirfd, path, buf, flag=
s)=20
>>>>> real___fxstatat64(_STAT_VER, dirfd, path, buf, flags)
>>>>>       =20
>>>>> |                                                                =20
>>>>> ^~~~~~~~~
>>>>> ports/unix/guts/symlinkat.c:37:14: note: in expansion of macro=20
>>>>> =E2=80=98base_fstatat=E2=80=99
>>>>> =C2=A0=C2=A0=C2=A0 37 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rc =3D base_fstatat(dirfd, newpath, &buf,=20
>>>>> AT_SYMLINK_NOFOLLOW);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~
>>>
>>> A similar issue has been reported against fakeroot [2]. I guess,
>>> something similar is required for pseudo as well.
>>>
>>> [0]: https://bugs.debian.org/1002136
>>> [1]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D8ed=
005daf0
>>> [2]: https://salsa.debian.org/clint/fakeroot/-/merge_requests/10/diff=
s
>>>
>>
>> That looks to be a fairly old version of pseudo. This was fixed here:
>>
>> https://git.yoctoproject.org/pseudo/commit/?h=3Doe-core&id=3Df332f5633=
b5dd73fa2b6e5d605eb33e4a446d7ad=20

> I see. I didn=E2=80=99t realise the development moved to a different br=
anch. How=20
> about deleting the master branch and making oe-core the default one if=20
> master is no longer in use? I think many more people may be missing out=
=20
> on updates if they only fetch the master branch.

Oh, I=E2=80=99m being stupid. I did discover this fact in July 2020, and =
even=20
updated the watch file, but since I added it as a third source and the=20
package tracker doesn=E2=80=99t seem to support it, there was nothing to =
remind=20
me when I forgot about it.

Nevertheless, I still think the branches need to get sorted somehow.=20
Also, how about tagging a release? :)

--=20
Cheers,
   Andrej

