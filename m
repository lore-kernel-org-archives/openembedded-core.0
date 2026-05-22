Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB3CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 11:37:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14854.1779449812193305677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 04:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=B+aCGTWt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 821ABC2C658;
	Fri, 22 May 2026 11:37:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E56676003C;
	Fri, 22 May 2026 11:36:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C109310810D12;
	Fri, 22 May 2026 13:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779449809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fC/HryKr4K3d8HgyVptG5y5Mxr6mcvjTuT9reeGGd9A=;
	b=B+aCGTWtqmlfvfHsv4Q3pmpk1lQwb0WesdlTyx4HBYicQL3oWuWrCiE1VEYmcvjNzOO0vA
	wGvjWeNtytde+e4VYX7cX9uH/8X0pfsWC8K3m8hPkq+qmrZUTNrmw1UOKpN2nLrEUNOp50
	M9JzqVJH6G7U5AO49pw4abpncYw8iQ+ZXyTG/J1sfttqS3l5eHH2t/hja6MuoqrXWf6KoB
	Acr0PAV5WXKSafDJDdAQgZvNaYlnrzjU66pH7LHr7cNN2eCt2BcEthKcv9QUue96e+Ytv6
	ECAeeg98j8k0k/KYIJDI9z6ZuAErhwyMPIpAXjyrdZ8iEoK+KDe41TtBoZ/UoQ==
Message-ID: <8978d56c-9c39-4f53-8751-f7de662cd664@bootlin.com>
Date: Fri, 22 May 2026 13:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/5] Split vim and xxd in different recipes
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Ross.Burton@arm.com,
 alex.kanavin@gmail.com, richard.purdie@linuxfoundation.org
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
 <b8c28ff7820c44ca506daa0cb44ceb110c1bbea1.camel@pbarker.dev>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <b8c28ff7820c44ca506daa0cb44ceb110c1bbea1.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 11:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237544

Hello,

On 5/22/26 13:12, Paul Barker wrote:
> On Thu, 2026-05-21 at 14:58 +0200, Joao Marcos Costa via
> lists.openembedded.org wrote:
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
>> As for the tests I performed:
>>
>> - machine: qemuriscv64
>> - toolchains: clang and gcc
>> - classes (xxd, vim-xxd): target, native, nativesdk
>> - classes (vim): target, native, nativesdk
>> - archiving: the resulting tarball includes only xxd's sources, as exp=
ected
>>
>> Some benchmarks as well, from a previous mail:
>>
>> vim-native-9.2.0340-r0: do_configure
>> Elapsed time: 6.81 seconds
>>
>> vim-native-9.2.0340-r0: do_compile
>> Elapsed time: 4.43 seconds
>>
>> vim-xxd-native-9.2.0340-r0: do_configure
>> Elapsed time: 0.03 seconds
>>
>> vim-xxd-native-9.2.0340-r0: do_compile
>> Elapsed time: 0.23 seconds
>>
>> (this data comes from tmp/buildstats)
>=20
> I appreciate the effort here, but I don't think the ~10 seconds saved
> during the build justifies the extra complexity in the recipes.

The whole difference is far beyond 10 seconds...
This also should include (some, not all) elements in the list of=20
dependencies (see pn-buildlist from bitbake -g vim[-native]) that will=20
no longer need to be built.

> The only dependency on xxd in OE-core is from the dosfsutils ptest. Hav=
e
> we tried running those tests using busybox xxd? If that lacks support
> for one or two arguments we need it to handle, have we considered
> submitting patches to busybox to support these?

The only dependency in *oe-core*. My initial concern was other recipes=20
(namely u-boot @ meta-freescale) that may require xxd. After all, a=20
realistic list of layers includes more elements than oe-core itself.

> Alternatively, we could look at tinyxxd [1]. This is based on xxd from
> vim with a few improvements, as a standalone repo.
>=20
> [1]: https://github.com/xyproto/tinyxxd
>=20
> Either of those two options would isolate xxd from vim completely,
> unblocking removal of vim from OE-core.
>=20
> Best regards,
>=20

I still prefer the "complex" way that keeps xxd as it is (i.e., the same=20
source code currently used), without far less risk of regressions in=20
recipes from oe-core and/or 3rd party layers.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

