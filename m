Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 17AB36FF0E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 17:37:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40Xh2j1B9gz1qvTD;
	Fri, 27 Apr 2018 19:37:17 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40Xh2j0k6Qz1qqkk;
	Fri, 27 Apr 2018 19:37:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id EpjZ2h44KA-Y; Fri, 27 Apr 2018 19:37:15 +0200 (CEST)
X-Auth-Info: +rV5heM8YF5qMVYM3o6mOWrUHgBvuO2/AS6zxisSkKY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 27 Apr 2018 19:37:15 +0200 (CEST)
To: Lukasz Majewski <lukma@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<20180427181521.1bc4095c@jawa>
From: Marek Vasut <marex@denx.de>
Message-ID: <39086351-ed53-3cf5-606e-3b17bd95d825@denx.de>
Date: Fri, 27 Apr 2018 19:37:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427181521.1bc4095c@jawa>
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
X-List-Received-Date: Fri, 27 Apr 2018 17:37:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/27/2018 06:15 PM, Lukasz Majewski wrote:
> Hi Marek,
> 
> Thanks for prompt feedback.
> 
>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:
>>> This commit provides the ability to generate u-boot environment(s)
>>> as images, which afterwards can be used to produce image (with wic)
>>> for flashing (eMMC or SPI-NOR).
>>>
>>> This change removes the need to run "env default" during production
>>> phase, as proper environment (including redundant one) is already
>>> stored on persistent memory (the CRC is also correct).
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>  
>>
>> If your default env is correct, why do you need this ? 
> 
> Some users wants to have the working board (i.e. without any warnings
> that CRC for envs is bad) after flashing the SPI-NOR/eMMC

And the board is not working when it tells you your env is not
populated? Then maybe the board port is broken.

>> I can see some
>> use with non-default env, but then that can be wrapped into a separate
>> recipe.
> 
> I can add this functionality as a separate recipe. This is v1, so ideas
> are welcome.

I think that only makes sense.

>>> ---
>>> This patch depends on "u-boot: Upgrade to 2018.03 release"
>>> https://patchwork.openembedded.org/patch/149998/
>>> ---
>>>  meta/recipes-bsp/u-boot/u-boot.inc | 35
>>> +++++++++++++++++++++++++++++++++++ 1 file changed, 35 insertions(+)
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>>> b/meta/recipes-bsp/u-boot/u-boot.inc index c2bcf99840..2796e503cf
>>> 100644 --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>> @@ -305,3 +305,38 @@ do_deploy () {
>>>  }
>>>  
>>>  addtask deploy before do_build after do_compile
>>> +
>>> +# Create new rules to extract default envs
>>> +UBOOT_ENVS_DEFAULT ?= "uboot-envs-default"
>>> +DEFAULT_ENVS ?= "u-boot-env-default.txt"
>>> +DEFAULT_ENVS_SIZE ?= "65536"
>>> +
>>> +# Generate default environment
>>> +do_gen_default_envs[doc] = "Generate image with default U-Boot
>>> environment(s)" +do_gen_default_envs () {
>>> +	${B}/source/scripts/get_default_envs.sh ${B} >
>>> ${B}/${DEFAULT_ENVS} +
>>> +	# Generate env image
>>> +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o
>>> ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}  
>>
>> Does this actually work during cross build , when mkenvimage
>> architecture is different than host architecture ?
> 
> Yes. This was tested.

How can it work if this binary cannot be executed ? :)

>>> +	# Generate redundant env image
>>> +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o
>>> ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}  
>>
>> Is redundant env always needed on all systems ?
> 
> No, they are not. However, it shall not be a problem if it is build
> anyway - user can adjust wic to only put primary env image.

So many wasted CPU cycles for a feature barely anyone needs. Nope :)

>>> +	rm ${B}/${DEFAULT_ENVS}
>>> +}
>>> +
>>> +addtask gen_default_envs before do_deploy_default_envs after
>>> do_compile +
>>> +# Deploy default environment
>>> +do_deploy_default_envs[doc] = "Copy images with default U-Boot
>>> environment to deployment directory" +do_deploy_default_envs () {
>>> +	install -d ${DEPLOYDIR}
>>> +
>>> +	install ${B}/${UBOOT_ENVS_DEFAULT}
>>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
>>> +	install ${B}/${UBOOT_ENVS_DEFAULT}_r
>>> ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r  
>>
>> Does this work with multiple machines 
> 
> Unfortunately not.
> 
> For multiple machines one needs to add ${target}, which would add
> machine name into path:
> 
> target=${MACHINE}_defconfig
> 
> and change ${B} -> ${B}/${target}
> 
> 
> I suppose, that I would need to adjust this script to be similar to
> do_install() and do_compile() in this matter.

Yep

>> or will it overwrite the
>> deployed image ?
> 
> As it is now - it will overwrite the image.
Yep

-- 
Best regards,
Marek Vasut

