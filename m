Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48624CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:56:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48509.1778500551620834812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 04:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=EKd6lmOO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E00A2C5E176;
	Mon, 11 May 2026 11:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D61E60646;
	Mon, 11 May 2026 11:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6E9211AE8077;
	Mon, 11 May 2026 13:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778500548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P8aUFrnFTYqf9IUgKwXMfBgWbT88O+OUyR4nKrcRnKg=;
	b=EKd6lmOOcsDvYxEIJfvwR8MQTqdO3kiHj3wB3HhRk/GO9olg9SyKdDvWVhnwpjELQjrk2Y
	SU+4QJMC46hTijjAowpy6NRWz/Cf11EY01u3ng3bVHArV1VegXUc+n7usJICuMtsqBbYO3
	8IidC2pVJ9ngS0SJgk4zLlbnidjrEhb8BX/kZS2rDEEW6nv4AMNoGG7GtLrs3dN5Tr+x61
	6oNKRjqKgmABU7915TYiS9fl+8+HX1BU85hz2hgxmGwbtGD73odjNsanu9GUERbeAtLfXu
	iiaQtaMvyZd/tfzaMY22tyyIwUAIb1ikoFTdcqNO8ogvnJOYla0TlzUAkvjFWw==
Message-ID: <2079917b-4de1-4949-9793-14428bdbdbe8@bootlin.com>
Date: Mon, 11 May 2026 13:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/4] Split vim and xxd in different recipes
To: quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, paul@pbarker.dev,
 mathieu.dubois-briand@bootlin.com
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
 <257f886d-2be0-4af7-9233-716a68ce038a@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <257f886d-2be0-4af7-9233-716a68ce038a@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 11:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236809

Hello,

On 5/11/26 12:03, Quentin Schulz via lists.openembedded.org wrote:
> Hi Jo=C3=A3o,
>=20
> On 5/8/26 11:40 PM, Jo=C3=A3o Marcos Costa wrote:
>> Hello,
>>
>> Honestly, my main motivation to send this series comes from a time whe=
n
>> I was building u-boot (meta-freescale) and I saw vim-native in Bitbake=
's
>> tasks. It blew my mind that a bootloader somehow dependend on a text
>> editor (yes, only to be built, not to be executed, I know), and the wh=
ole
>> text editor was being built to provide nothing more than xxd.
>>
>> Just to be clear, what bothers me is NOT u-boot depending on xxd. It i=
s
>> actually configuring and compiling Vim (considering the overhead this
>> represents) only to use a single tiny piece of it.
>>
>=20
> What's the build time impact? Because it may not be worth it in terms o=
f=20
> complexity.

I performed some tests and the data below comes from tmp/buildstats. In=20
my local.conf:

BB_NUMBER_THREADS =3D "20"
PARALLEL_MAKE =3D "-j 20"

Before every run, I ran 'bitbake -c cleansstate XXXX + rm -rf tmp/':

1) Before the splitting:

$ bitbake vim-native

Elapsed time: 18.53 seconds
CPU usage: 3.9%

$ bitbake xxd-native

Elapsed time: 18.52 seconds
CPU usage: 3.9%

2) After the splitting:

$ bitbake vim-native

Elapsed time: 18.49 seconds
CPU usage: 4.0%

$ bitbake xxd-native

Elapsed time: 4.89 seconds
CPU usage: 0.8%

2.1) Since I'm not sure if the total elapsed time counts in the parsing=20
time, let's also compare the time spent in specific tasks:

vim-native-9.2.0340-r0: do_configure
Elapsed time: 6.81 seconds

vim-native-9.2.0340-r0: do_compile
Elapsed time: 4.43 seconds

vim-xxd-native-9.2.0340-r0: do_configure
Elapsed time: 0.03 seconds

vim-xxd-native-9.2.0340-r0: do_compile
Elapsed time: 0.23 seconds

3) I also compared the 'pn-buildlist' for both targets, and xxd-native=20
after the splitting is minimal, considering the only dependencies are=20
defined by BASEDEPENDS.

Another thing to consider is the build time dependencies of vim were in=20
sstate-cache, so this is not an entirely clean build. If that was the=20
case, the delta would be even higher (once again: vim's DEPENDS vs.=20
xxd's BASEDEPENDS).

> Note that you also need to specify how much it impacts a build in which=
=20
> both vim and vim-xxd are brought in the final image, which will result=20
> in a biggest build time.

Well, vim already RDEPENDs on vim-xxd, so by default they are installed=20
together if you have 'vim' in IMAGE_INSTALL. After the split, it is true=20
that both recipes will be built, but as per the numbers above, the time=20
spent building vim-xxd-native is minimal.

As a matter of fact, I do believe that the total elapsed time counts in=20
the parsing time, because a quick sum of the per-task elapsed time=20
reveals that the whole thing takes roughly 2 seconds.

$ cat tmp/buildstats/20260511115114/vim-xxd-native-9.2.0340-r0/do_* |=20
grep "Elapsed time" -B1

The major difference would be seen in the case where you have *only*=20
vim-xxd in IMAGE_INSTALL:
- before the split, vim is built only to provide vim-xxd
- after the split, only vim-xxd is built and the same package is provided

I made my best effort to keep the runtime side identical so this doesn't=20
break anything in the final image.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

