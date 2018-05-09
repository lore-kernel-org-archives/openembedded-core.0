Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6A074992
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 12:09:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40gwBq62dbz1qvV5;
	Wed,  9 May 2018 14:09:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40gwBq5JDpz1qqkw;
	Wed,  9 May 2018 14:09:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id Jz7Q7nEzJ3Kg; Wed,  9 May 2018 14:09:21 +0200 (CEST)
X-Auth-Info: ZSc7d9rHy/2/dezvXZJp9p2Lp7K2FUVGep/WTm2aLro=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  9 May 2018 14:09:21 +0200 (CEST)
To: Lukasz Majewski <lukma@denx.de>, Stefano Babic <sbabic@denx.de>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
	<2a2d73fb-edec-f179-8693-6efb0942a979@denx.de>
	<6135f505-9afd-3428-4275-8a5a961559cb@denx.de>
	<5835447d-e8fb-dd1a-5d13-1561e475758f@denx.de>
	<20180503201515.5d205adb@jawa>
	<0266546b-7978-59db-14dc-4cea87b87e74@denx.de>
	<20180509134541.3f19e435@jawa>
From: Marek Vasut <marex@denx.de>
Message-ID: <18101d9d-1a98-dcbf-ffcd-5e24b1950ad5@denx.de>
Date: Wed, 9 May 2018 13:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180509134541.3f19e435@jawa>
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
X-List-Received-Date: Wed, 09 May 2018 12:09:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/09/2018 01:45 PM, Lukasz Majewski wrote:
> Hi Marek, Stefano,
> 
>> On 05/03/2018 08:15 PM, Lukasz Majewski wrote:
>>> Hi Marek, Stefano,
>>>   
>>>> On 05/03/2018 06:50 PM, Stefano Babic wrote:  
>>>>> On 03/05/2018 18:36, Marek Vasut wrote:    
>>>>>> On 05/03/2018 06:28 PM, Stefano Babic wrote:    
>>>>>>> On 27/04/2018 17:07, Marek Vasut wrote:    
>>>>>>>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:    
>>>>>>>>> This commit provides the ability to generate u-boot
>>>>>>>>> environment(s) as images, which afterwards can be used to
>>>>>>>>> produce image (with wic) for flashing (eMMC or SPI-NOR).
>>>>>>>>>
>>>>>>>>> This change removes the need to run "env default" during
>>>>>>>>> production phase, as proper environment (including redundant
>>>>>>>>> one) is already stored on persistent memory (the CRC is also
>>>>>>>>> correct).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>    
>>>>>>>>
>>>>>>>> If your default env is correct, why do you need this ? I can
>>>>>>>> see some use with non-default env, but then that can be
>>>>>>>> wrapped into a separate recipe.
>>>>>>>>    
>>>>>>>
>>>>>>> A use case is when the environment must be changed from user
>>>>>>> space. fw_setenv will report the CRC error and it needs the
>>>>>>> default environment to add changes. The default environment is
>>>>>>> linked together to fw_setenv, but this prohibites to use
>>>>>>> fw_setenv for multiple boards and must be explicitely built for
>>>>>>> that machine and with the same sources as u-boot (at least, they
>>>>>>> must share the same CONFIG_EXTRA_ENV). If the default
>>>>>>> environment is extracted, we could have a general (distro ?)
>>>>>>> fw_setenv.    
>>>>>>
>>>>>> I think in that case, the real solution is to either build
>>>>>> fw_setenv per machine     
>>>>>
>>>>> This is how we try to do now, fw_setenv is built per machine but
>>>>> it is enough that u-boot-fw-utils is built in a different version
>>>>> as u-boot to get a mess.    
>>>>
>>>> Well yes, if you mix and match packages, it becomes a mess. Isn't
>>>> that to be expected ?
>>>>  
>>>>>> OR fix fw_setenv to take env defaults from a file or
>>>>>> somesuch ?    
>>>>>
>>>>> Right, I interprete this patch as a step in this direction. This
>>>>> patch generates a default that can be used as input for
>>>>> fw_setenv.    
>>>>
>>>> It generates environment images which can be written -- on certain
>>>> specific setups -- into the flash. It doesn't generate any sort of
>>>> input for the fw_setenv to my knowledge ?
>>>>  
>>>
>>> I think that it would be great if:
>>>
>>> 1. We would have this code as a separate recipe - as suggested by
>>> Marek and Stefano already. This recipe would end up as a package to
>>> be installed on the rootfs
> 
> I've looked a bit more on the topic, and I do have some further
> questions:
> 
> 1. It seems like u-boot is compiled at least twice - once when
> do_comiple() is invoked in u-boot.inc (here we support multiple
> configs, and targets) and in u-boot-fw-utils (also u-boot-mkimage
> compiles u-boot for sandbox_defconfig).
> 
> It seems like the synchronization of the built package (and envs) is
> ensured with u-boot-common_2018.03.inc package. 
> 
> 2. It seems like it would be feasible to have a separate recipe -
> u-boot-envs_2018.03.bb [*] which would:
> 
> 	- Use u-boot-env.txt provided as an external file (from e.g.
> 	  SRC += "./file/u-boot-env.txt"). This is the approach similar
> 	  to
> 	  https://github.com/webosose/meta-webosose/blob/master/meta-webos-raspberrypi/recipes-bsp/u-boot/u-boot-env.bb
> 
> 	- If above input *.txt file is not present then get the envs
> 	  extracted from built u-boot. 
> 
> The main question for above item - how and where to extract this file?
> 
> 	- The most feasible would be to extend do_compile of u-boot.inc
> 	  to run get_default_envs.sh script there (as it builds all
> 	  the kind of u-boot variants/binaries).
> 
> 	- Then "export" those generated *.txt files to [*] recipe.
> 	  What would be the best way?
> 
> 	  Via ${DEPLOYDIR} ? Install it on /boot directory (exported by
> 	  u-boot) ? 

Compile the fw env utils per-machine for now and in parallel add option
to compile it with blank env and use env from file into upstream u-boot
fwutils ?

-- 
Best regards,
Marek Vasut

