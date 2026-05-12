Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA0ACD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:03:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71421.1778576572959685950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MT0DYF29;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AA171A3567;
	Tue, 12 May 2026 09:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D38A660646;
	Tue, 12 May 2026 09:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D9CA11AF9EC6;
	Tue, 12 May 2026 11:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778576569; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ibYT3SiGYzfSz5GvNozRRirhIYErxlAWzBL4INCKs/A=;
	b=MT0DYF29P4qmQ0dfFjFJ79NZc54GKyIEbCpgBTGajudWz9gPeWkLJeRL/L22DIYv9vyPZ4
	uhy6Q3JVoMkX3suvCPwJS4GbOWeyZTJ+eBaH26bjXMO1cPNDJDaTsL8PhjyAbGpiNHvTJN
	/WRR1H0HuM26i6PWznwKWWgtR3hEeF78Hj/AW5Yi0Cdzeqdf3ogUQr5MLNMkD8ampQNwrz
	rRYjvSBMDH6wJliOrRdDb0U9iGs42xujBO2C8AlrbaOgE+yh22jGmmXuRYR7BfM7+UD9xg
	V/OgfSOsOhA1aCmWpeDydvzdh85nCEQL6o3TkM4+wlgwvjTYiWXLrGkkHgJmTw==
Message-ID: <03127fae-4d0f-46b1-b740-b6020a10a3e8@bootlin.com>
Date: Tue, 12 May 2026 11:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
 <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
 <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236868

Hello,

On 5/12/26 10:46, Richard Purdie wrote:
> On Mon, 2026-05-11 at 16:00 +0200, Joao Marcos Costa via lists.openembe=
dded.org wrote:
>> Hello,
>>
>> On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org wrote:
>> (...)
>>>
>>> Not necessarily true as I don't think we build GCC for native recipes
>>> (and ovmf has a native variant), so it depends on the GCC on the host
>>> (unless you have uninative?). I don't know the autobuilder
>>> infrastructure, e.g. whether we build patches on multiple workers on
>>> different distros to have a big GCC version test matrix.
>>>
>>> But yes, building with a newer GCC will generally not make warnings f=
rom
>>> previous versions disappear and I'm hoping upstream has had time to f=
ix
>>> warnings returned by GCC12 in the last 4 years :)
>>>
>>> Cheers,
>>> Quentin
>>
>> Yep, my whole point is based on the the distros in SANITY_TESTED_DISTR=
OS
>> being recent enough to ship GCC > 12 :)
>>
>> I should have made it explicit in my commit message.
>=20
> I hate to say this but:
>=20
> Alma/Centos/Rocky 8 have gcc 8
> Debian 11 has gcc 10
>=20
> and we don't use buildtools on debian 11.
>=20
> I'm therefore not sure how you concluded that from SANITY_TESTED_DISTRO=
S.
>=20
> Cheers,
>=20
> Richard

Ah, my bad...

 From this list here:
https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions

Considering the versions of Fedora and Ubuntu, I presumed the other=20
distros were at least as recent (in terms of packages versions) as=20
Fedora 39 (which ships GCC 13).

I will check the results in SWAT to see if this warnings pops up, but=20
the commit message could use a rewording to address this point and also=20
some questions raised by Quentin, so a v2 will be sent later in this week=
.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

