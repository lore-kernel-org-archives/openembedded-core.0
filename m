Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7203872EB3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 23:29:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40Z3ly1hjNz1qtdm;
	Mon, 30 Apr 2018 01:29:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40Z3ly0lyrz1qqkH;
	Mon, 30 Apr 2018 01:29:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id d6ZQ-ihrYRQl; Mon, 30 Apr 2018 01:29:16 +0200 (CEST)
X-Auth-Info: /Aq+w2RQYRCi/q1D/+9cN15rMtqMsCut7YxGW2BkhGs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Apr 2018 01:29:15 +0200 (CEST)
To: Lukasz Majewski <lukma@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<20180427181521.1bc4095c@jawa>
	<39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
	<20180429155312.56e0b987@jawa>
From: Marek Vasut <marex@denx.de>
Message-ID: <795dfc22-eb32-83c5-1a4e-416f28358554@denx.de>
Date: Sun, 29 Apr 2018 16:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180429155312.56e0b987@jawa>
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 29 Apr 2018 23:29:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/29/2018 03:53 PM, Lukasz Majewski wrote:
> Hi Marek,

Hello Lukasz,

>> On 04/27/2018 06:15 PM, Lukasz Majewski wrote:
>>> Hi Marek,
>>>
>>> Thanks for prompt feedback.
>>>   
>>>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:  
>>>>> This commit provides the ability to generate u-boot environment(s)
>>>>> as images, which afterwards can be used to produce image (with
>>>>> wic) for flashing (eMMC or SPI-NOR).
>>>>>
>>>>> This change removes the need to run "env default" during
>>>>> production phase, as proper environment (including redundant one)
>>>>> is already stored on persistent memory (the CRC is also correct).
>>>>>
>>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>    
>>>>
>>>> If your default env is correct, why do you need this ?   
>>>
>>> Some users wants to have the working board (i.e. without any
>>> warnings that CRC for envs is bad) after flashing the SPI-NOR/eMMC  
>>
>> And the board is not working when it tells you your env is not
>> populated? 
> 
> It complains that CRC is wrong, which is true as without this patch
> (and some wic adjustments) we don't have proper envs in expected
> non-volatile area.

This is NOT an error, this is warning and a correct behavior. If your
default U-Boot environment is not correct, that is a bug in your U-Boot
port.

If you need to adjust that environment later in the product life cycle,
that's a different topic.

>> Then maybe the board port is broken.
> 
> Then it proceeds with default envs - and boots.

I think I might not quite understand the problem anymore. Is the issue
here that U-Boot informs you that it's using default environment which
you do not like ?

[...]

>>>>> +# Generate default environment
>>>>> +do_gen_default_envs[doc] = "Generate image with default U-Boot
>>>>> environment(s)" +do_gen_default_envs () {
>>>>> +	${B}/source/scripts/get_default_envs.sh ${B} >
>>>>> ${B}/${DEFAULT_ENVS} +
>>>>> +	# Generate env image
>>>>> +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
>>>>> ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}    
>>>>
>>>> Does this actually work during cross build , when mkenvimage
>>>> architecture is different than host architecture ?  
>>>
>>> Yes. This was tested.  
>>
>> How can it work if this binary cannot be executed ? :)
> 
> Could you be more specific here?
> 
> I do follow normal u-boot recipe build. If mkenvimage is build in a
> wrong way (as other tools) - then I suppose that the whole u-boot recipe
> is broken.
> 
> The get_default_envs.sh script is prepared to use either native or
> cross-compiled set of binutils (that thought I had in mind when I said
> that it was tested).

Consider you crosscompile mkenvimage for ARM and try to run it on x86 host.

>>>>> +	# Generate redundant env image
>>>>> +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
>>>>> ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}    
>>>>
>>>> Is redundant env always needed on all systems ?  
>>>
>>> No, they are not. However, it shall not be a problem if it is build
>>> anyway - user can adjust wic to only put primary env image.  
>>
>> So many wasted CPU cycles for a feature barely anyone needs. Nope :)
> 
> I will try to craft some OE magic to make it not build when not
> needed... :-)

Can't you just patch a correct default env into the U-Boot port ?

-- 
Best regards,
Marek Vasut

