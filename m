Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id AE53D744C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 08:40:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40Phfq2nRwz1qx9M;
	Mon, 16 Apr 2018 10:40:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40Phfq2HHXz1qs50;
	Mon, 16 Apr 2018 10:40:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id R2QYcOaq54kb; Mon, 16 Apr 2018 10:40:50 +0200 (CEST)
X-Auth-Info: uhSVM0DCPBbjpMW67ME8RXW2idngZ1S8F6NGqTTW4pk=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 16 Apr 2018 10:40:50 +0200 (CEST)
To: yamada.masahiro@socionext.com, mnhu@prevas.dk, raj.khem@gmail.com
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
Date: Mon, 16 Apr 2018 10:40:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2018 08:40:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04/16/2018 10:38 AM, yamada.masahiro@socionext.com wrote:
> Hi.
> 
>> -----Original Message-----
>> From: Martin Hundebøll [mailto:mnhu@prevas.dk]
>> Sent: Wednesday, April 11, 2018 5:42 PM
>> To: Yamada, Masahiro/山田 真弘 <yamada.masahiro@socionext.com>;
>> marex@denx.de; raj.khem@gmail.com
>> Cc: otavio@ossystems.com.br; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] u-boot: Upgrade to 2018.03 release
>>
>> Hi,
>>
>> On 2018-04-11 04:28, yamada.masahiro@socionext.com wrote:
>>> Hi.
>>>
>>>>> I had to patch up our own u-boot recipe as shown in the attached patch
>>>>> to make v2018.03 compile for qemu-x86.
>>>>>
>>>>> The thing is that the build of pylibfdt became unconditional since
>>>>> 15b97f5c5e ('pylibfdt: move pylibfdt to scripts/dtc/pylibfdt and
>>>>> refactor makefile')
>>>>>
>>>>> In my case u-boot/pylibfdt failed to find the correct (native) headers,
>>>>> because python setuptools / distutils looks into STAGING_{LIB,INC}DIR
>>>>> when compiling the native extension for libfdt. I didn't find any other
>>>>> way to specificy this in either the u-boot Makefile or some other magic
>>>>> environment variable.
>>>>
>>>> CCing Yamada-san, maybe he has an idea.
>>>> Also, do not top post.
>>>
>>>
>>>
>>> The build of pylibfdt is conditional.
>>> It is built only when CONFIG_PYLIBFDT=y,
>>> which is selected by CONFIG_DTOC.
>>>
>>> If you really do not need pylibfdt,
>>> you can disable it by tweaking the configuration.
>>>
>>> If you need pylibfdt but you cannot build it,
>>> it is a different problem.
>>>
>>> Thanks.
>>
>> Correct. But I was building u-boot.rom for qemu-x86, which depends on
>> binman and thus pylibfdt. Before the mentioned commit, one could avoid
>> the building of pylibfdt by installing it on the host, as the makerule
>> checked if python could already import pylibfdt. This check is now removed.
>>
>> Or am I missing something?
> 
> 
> Understood what you mean, but I do not know
> whether the previous behavior was intended, or just something
> people discovered to work.
> 
> 
> Now U-Boot bundles its own DTC (scripts/dtc/dtc),
> so compiling also pylibfdt from the source in U-boot tree makes sense.
> 
> Isn't it possible to solve your issue in the OE side?
> 

Can we NOT compile DTC alongside U-Boot somehow ? :)
That'd be the most desired solution IMO.

-- 
Best regards,
Marek Vasut

