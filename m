Return-Path: <andrew.shadura@collabora.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B67C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 19:04:32 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web11.32756.1641236670868078446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 11:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@collabora.co.uk
 header.s=mail header.b=HUISXmJ7;
 spf=pass (domain: collabora.co.uk, ip: 46.235.227.227,
 mailfrom: andrew.shadura@collabora.co.uk)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh)
	with ESMTPSA id F24851F41A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
	s=mail; t=1641236668;
	bh=mH4CJI74wUW09QoUWRwfg2pH9+R/EPFE21ghp7NtsLg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HUISXmJ7VvO4ySKWugI/jt6DPyAn+Qr6U3DHQzTk3cMhSFiJRxH+m6HsnB3aw/pe/
	 Y7PzYxhdJn7HgzWtg181RrrGJ8TNkRzMzYUytDNluQAZjVf9w8H3OWHYrhriWzFrzW
	 BHkJsAncftLQ1/G9QE2iqzpis2EI1HyXa1xxBK0ywyJEF896pXOCgP7UY5YPvVCkCo
	 d5BKPRCeC7+Tw7+jtNwi8LTxRHGRc+2JgDFI3CmJjPjCsfEmpz5N4QmYhML+90e2Gl
	 IXaXCcB32vif10CBmnZrtGlhpHAr+VSGKSDgS7JYnb4gvpACvGgPIUVGvHiBzseZVY
	 gL6NU/1FnP8DQ==
Message-ID: <4e46a5df-1abd-2a3c-d8b7-ec98f08be08c@collabora.co.uk>
Date: Mon, 3 Jan 2022 20:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [OE-core] pseudo FTBFS with recent glibc
Content-Language: en-GB
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <e9d8abaa-20e9-4ee6-0cfc-2705d858c432@collabora.co.uk>
 <e77792acdad02f36f436ccd7fe979c5c56f37361.camel@linuxfoundation.org>
From: Andrej Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora
In-Reply-To: 
 <e77792acdad02f36f436ccd7fe979c5c56f37361.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 19:04:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160145

Hi,

On 03/01/2022 14:47, Richard Purdie wrote:
> On Fri, 2021-12-31 at 21:40 +0100, Andrew Shadura wrote:
>> pseudo started failing to build from the source apparently after a gli=
bc
>> update [1] we had in Debian:
>>
>>>> In file included from pseudo_wrappers.c:46:
>>>> ports/unix/guts/symlinkat.c: In function =E2=80=98wrap_symlinkat=E2=80=
=99:
>>>> pseudo_client.h:14:65: error: =E2=80=98_STAT_VER=E2=80=99 undeclared=
 (first use in this function)
>>>>     14 | #define base_fstatat(dirfd, path, buf, flags) real___fxstat=
at64(_STAT_VER, dirfd, path, buf, flags)
>>>>        |                                                            =
     ^~~~~~~~~
>>>> ports/unix/guts/symlinkat.c:37:14: note: in expansion of macro =E2=80=
=98base_fstatat=E2=80=99
>>>>     37 |         rc =3D base_fstatat(dirfd, newpath, &buf, AT_SYMLIN=
K_NOFOLLOW);
>>>>        |              ^~~~~~~~~~~~
>>
>> A similar issue has been reported against fakeroot [2]. I guess,
>> something similar is required for pseudo as well.
>>
>> [0]: https://bugs.debian.org/1002136
>> [1]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D8ed0=
05daf0
>> [2]: https://salsa.debian.org/clint/fakeroot/-/merge_requests/10/diffs
>>
>=20
> That looks to be a fairly old version of pseudo. This was fixed here:
>=20
> https://git.yoctoproject.org/pseudo/commit/?h=3Doe-core&id=3Df332f5633b=
5dd73fa2b6e5d605eb33e4a446d7ad

I see. I didn=E2=80=99t realise the development moved to a different bran=
ch. How=20
about deleting the master branch and making oe-core the default one if=20
master is no longer in use? I think many more people may be missing out=20
on updates if they only fetch the master branch.

--=20
Cheers,
   Andrej

