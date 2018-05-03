Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E6D9B6AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 23:04:38 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40cW1g0wPJz1qtdd;
	Fri,  4 May 2018 01:04:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40cW1g0WBZz1qqkv;
	Fri,  4 May 2018 01:04:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id cfrTR-T1Dov0; Fri,  4 May 2018 01:04:38 +0200 (CEST)
X-Auth-Info: 8BhkGHe6evw9M1FoMF5kebfCkLW/Q2TMOrjxSs6XJYw=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri,  4 May 2018 01:04:37 +0200 (CEST)
To: Stefano Babic <sbabic@denx.de>, Lukasz Majewski <lukma@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
	<2a2d73fb-edec-f179-8693-6efb0942a979@denx.de>
	<6135f505-9afd-3428-4275-8a5a961559cb@denx.de>
	<5835447d-e8fb-dd1a-5d13-1561e475758f@denx.de>
	<ebd64202-de5e-68f8-d7bc-5d47b59128f8@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <bd3ec344-4221-ccea-d364-acd8c5b09681@denx.de>
Date: Fri, 4 May 2018 01:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ebd64202-de5e-68f8-d7bc-5d47b59128f8@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
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
X-List-Received-Date: Thu, 03 May 2018 23:04:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 10:58 PM, Stefano Babic wrote:
> Hi Marek,
> 
> On 03/05/2018 18:59, Marek Vasut wrote:
>> On 05/03/2018 06:50 PM, Stefano Babic wrote:
>>> On 03/05/2018 18:36, Marek Vasut wrote:
>>>> On 05/03/2018 06:28 PM, Stefano Babic wrote:
>>>>> On 27/04/2018 17:07, Marek Vasut wrote:
>>>>>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:
>>>>>>> This commit provides the ability to generate u-boot environment(s) as
>>>>>>> images, which afterwards can be used to produce image (with wic) for
>>>>>>> flashing (eMMC or SPI-NOR).
>>>>>>>
>>>>>>> This change removes the need to run "env default" during production phase,
>>>>>>> as proper environment (including redundant one) is already stored on
>>>>>>> persistent memory (the CRC is also correct).
>>>>>>>
>>>>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>>>>>
>>>>>> If your default env is correct, why do you need this ? I can see some
>>>>>> use with non-default env, but then that can be wrapped into a separate
>>>>>> recipe.
>>>>>>
>>>>>
>>>>> A use case is when the environment must be changed from user space.
>>>>> fw_setenv will report the CRC error and it needs the default environment
>>>>> to add changes. The default environment is linked together to fw_setenv,
>>>>> but this prohibites to use fw_setenv for multiple boards and must be
>>>>> explicitely built for that machine and with the same sources as u-boot
>>>>> (at least, they must share the same CONFIG_EXTRA_ENV). If the default
>>>>> environment is extracted, we could have a general (distro ?) fw_setenv.
>>>>
>>>> I think in that case, the real solution is to either build fw_setenv per
>>>> machine 
>>>
>>> This is how we try to do now, fw_setenv is built per machine but it is
>>> enough that u-boot-fw-utils is built in a different version as u-boot to
>>> get a mess.
>>
>> Well yes, if you mix and match packages, it becomes a mess. Isn't that
>> to be expected ?
>>
> 
> Well, quite. But in the specific case, it is weird that the environment
> tools are built by a separate recipe. u-boot-fw-utils generates binaries
> from the same sources as u-boot (or it should), and building the tool
> per machine means for me to have a single recipe for it, that generates
> as additional package the env tools. This guarantees that they are
> always in sync.

Patches welcome ? :)

>>>> OR fix fw_setenv to take env defaults from a file or somesuch ?
>>>
> 
> Having a separate recipe as now means for me to try to have the tools
> not per machine, and then makes sense to pass as input the default
> environment to the tools.

Cfr the conclusion (?) we reached with Lukasz I think ?

>>> Right, I interprete this patch as a step in this direction. This patch
>>> generates a default that can be used as input for fw_setenv.
>>
>> It generates environment images which can be written -- on certain
>> specific setups -- into the flash. It doesn't generate any sort of input
>> for the fw_setenv to my knowledge ?
> 
> Not the current patch - we are discussing how it could evolve ;-)

Ah, I wonder if we shouldn't start a new thread for this and crosspost
it to the U-Boot ML too then ?

-- 
Best regards,
Marek Vasut

