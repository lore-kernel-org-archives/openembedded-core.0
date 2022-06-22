Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2AEC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:50:30 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.4592.1655884228319207152
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id 49DA7124AB;
	Wed, 22 Jun 2022 09:50:26 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o3v86-3rnCE50; Wed, 22 Jun 2022 09:50:26 +0200
Message-ID: <699d5f83-7e9c-41b9-d39c-84fec7101e6d@t-online.de>
Date: Wed, 22 Jun 2022 09:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [oecore][PATCH] bc: add missing bison-native dependency
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220618175258.4655-1-f_l_k@t-online.de>
 <d0bd217004d6ff8fb860cd61eb23c6eab1ee39c3.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <d0bd217004d6ff8fb860cd61eb23c6eab1ee39c3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1655884226-01436587-5ABE0E60/0/0 CLEAN NORMAL
X-TOI-MSGID: 80ce54ab-b03a-4451-81b6-5d4193fd29a0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167222


Am 21.06.22 um 19:32 schrieb Richard Purdie:
> On Sat, 2022-06-18 at 19:52 +0200, Markus Volk wrote:
>> this fixes an error i encountered building for raspberrypi4 32bit:
>>
>> prefix-map=3D/home/flk/build/poky/build-raspi/tmp/work/cortexa7t2hf-ne=
on-vfpv4-poky-linux-gnueabi/bc/1.07.1-r0/recipe-sysroot-native=3D  -Wall =
-funsigned-char -c -o warranty.o ../../bc-1.07.1/bc/warranty.c
>>> ../../bc-1.07.1/ylwrap: line 176: yacc: command not found
>>> make[2]: *** [Makefile:429: bc.c] Error 127
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-exte=
nded/bc/bc_1.07.1.bb
>> index 1bec76bb2a..67453de822 100644
>> --- a/meta/recipes-extended/bc/bc_1.07.1.bb
>> +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
>> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb=
673463ab874e80d47fae504 \
>>                       file://lib/number.c;endline=3D20;md5=3Dcf43068cc=
88f837731dc53240456cfaf"
>>  =20
>>   SECTION =3D "base"
>> -DEPENDS =3D "flex-native"
>> +DEPENDS =3D "flex-native bison-native"
>>  =20
>>   SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>>              file://no-gen-libmath.patch \
>
> The question is why you see that and nobody else has, including our
> autobuilder.
>
> I'm guessing something in your build is being rebuilt, hence the need
> for bison whereas in most other builds that isn't rebuilding and hence
> isn't needed.
>
> Are you using a different configuration or extra patches or something?
>
> I'm worried there is a reproducibility issue somewhere in here.
>
> Cheers,
>
> Richard

The problem occurred after I updated the oe-core master and started an=20
image rebuild. Built the=C2=A0 image successfully for intel and aarch64 b=
ut=20
got the above error for raspberrypi4.I ran 'bitbake -c cleansstate=20
bc-native bc' but the problem persisted and I added bison-native and was=20
able to continue. I never had this problem before, and after checking=20
again, I can say that I don't have it anymore either. My image can be=20
created again even without bison-native dependency.

I didn't do any patching on bc and also didn't change its configuration.

Markus


