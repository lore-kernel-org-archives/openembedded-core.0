Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF8EC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:26:24 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.14646.1737732374368182041
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=A/rYdHLF;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F1FB108860C0;
	Fri, 24 Jan 2025 16:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737732372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SibsRif/y2HSImlbsUlW2amIu5WjdISEnDsHXxDzYs8=;
	b=A/rYdHLF11PKuPAFZiOZPDecoPQTEohwy8ikmQpS5AH2U89dCqwp/RKZKkDoPqWaBOTloG
	FvmsSi2FbX3Xe9EKVxcKCXSGblrP0mBDDncVx+sHRI/BvT51e/lB8K1cPUWhReCw+Qzs/T
	HgV8Jz39WbJGuce6r3Ua4NEbPLbLNm0KgABZkZKACs0umwjZRRWfO992CF6Knk/afi69SK
	DVPYbX/CM9M3bMQklASAQoOfTOCkMkH1nI1Re6uOktU+Q1doERLfYCUaduH2129HxsS8ix
	/kHxC3tV/4l0oY1v+3dq7p2SYidZi4vXwx4nIFqFMXtkYrVymitkFTyJtr8wNA==
Message-ID: <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
Date: Fri, 24 Jan 2025 14:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210223

On 1/23/25 10:18 PM, Khem Raj wrote:
> On Thu, Jan 23, 2025 at 12:12=E2=80=AFPM Marek Vasut via
> lists.openembedded.org <marex=3Ddenx.de@lists.openembedded.org> wrote:
>>
>> Remove /bin/sh from bash RPROVIDES as this has a side-effect which
>> confuses rpm package manager when also busybox provides /bin/sh and
>> base-files depend on /bin/sh . The problem is broken down below.
>>
>> First, bash depends on base-files and bash pkg_postinst must run
>> after base-files was installed, because it requires /etc/shells
>> provided by base-files to be in place.
>>
>> Second, base-files depends on /bin/sh, which is provided by either
>> bash or busybox in this case. This is the actual problem here, if
>> bash is selected as /bin/sh provider, then there is cyclic dependency
>> between bash and base-files, and that confuses dnf which may install
>> the packages in the wrong order, bash first and base-files second .
>>
>> To make this worse, if busybox is also /bin/sh provider, it can and
>> does happen that some systems pick busybox as the /bin/sh provider,
>> while others pick bash as the /bin/sh provider, and that cyclic
>> dependency does not always appear.
>>
>> Attempt to break this dependency, drop RPROVIDES /bin/sh from bash
>> recipe to always force base-files to pick /bin/sh from busybox .
>> (I am really unsure about this approach)
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexander Kanavin <alex@linutronix.de>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-extended/bash/bash.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extend=
ed/bash/bash.inc
>> index 634209c9115..6a061b8a612 100644
>> --- a/meta/recipes-extended/bash/bash.inc
>> +++ b/meta/recipes-extended/bash/bash.inc
>> @@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D "${libdir}/bash/*"
>>
>>   # Limit the RPROVIDES here to class target so that if usrmerge is en=
abled for nativesdk, it does not
>>   # include host system paths in /bin/
>> -RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTR=
O_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
>> +RPROVIDES:${PN}:append:class-target =3D " ${@bb.utils.contains('DISTR=
O_FEATURES', 'usrmerge', '/bin/bash', '', d)}"
>=20
> Does this now mean that system will always need busybox ?

The system will require some other /bin/sh provider than bash .

I suspect there will always be one , but maybe I am wrong and there are=20
systems without busybox and with bash only (probably yes) ?

>  some distros
> may not want that and simply use
> other variants to fill in the shoes. I wonder if shell choice could be
> a distro option or image feature which can then
> help sort this out ?
I don't think this specific fix is the correct solution, I think what I=20
need to figure out is how to make sure base-files is installed before=20
bash, even if there is this cyclic dependency which confuses rpm/dnf=20
into installing the two packages in arbitrary order:

base-files -depends_on-> /bin/sh -depends_on-> bash (the /bin/sh provider=
)

bash -depends_on-> base-files

I still have to check the input from Martin Jansa , there was some hint=20
which might be the better fix for this.

Any ideas ?

