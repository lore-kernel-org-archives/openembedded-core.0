Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E1DED749EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 16:38:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40cLFC5gK0z1qyB7;
	Thu,  3 May 2018 18:29:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40cLFC5HX8z1qrfx;
	Thu,  3 May 2018 18:29:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ohw-t3FVHUVP; Thu,  3 May 2018 18:29:02 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Thu,  3 May 2018 18:29:02 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id A0BE04540507;
	Thu,  3 May 2018 18:29:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MKW2wyFSGmIc; Thu,  3 May 2018 18:28:58 +0200 (CEST)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id CBE6A45404FC;
	Thu,  3 May 2018 18:28:58 +0200 (CEST)
To: Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
Date: Thu, 3 May 2018 18:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
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
X-List-Received-Date: Thu, 03 May 2018 16:38:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 27/04/2018 17:07, Marek Vasut wrote:
> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:
>> This commit provides the ability to generate u-boot environment(s) as
>> images, which afterwards can be used to produce image (with wic) for
>> flashing (eMMC or SPI-NOR).
>>
>> This change removes the need to run "env default" during production phase,
>> as proper environment (including redundant one) is already stored on
>> persistent memory (the CRC is also correct).
>>
>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> If your default env is correct, why do you need this ? I can see some
> use with non-default env, but then that can be wrapped into a separate
> recipe.
> 

A use case is when the environment must be changed from user space.
fw_setenv will report the CRC error and it needs the default environment
to add changes. The default environment is linked together to fw_setenv,
but this prohibites to use fw_setenv for multiple boards and must be
explicitely built for that machine and with the same sources as u-boot
(at least, they must share the same CONFIG_EXTRA_ENV). If the default
environment is extracted, we could have a general (distro ?) fw_setenv.

>> ---
>> This patch depends on "u-boot: Upgrade to 2018.03 release"
>> https://patchwork.openembedded.org/patch/149998/
>> ---
>>  meta/recipes-bsp/u-boot/u-boot.inc | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
>> index c2bcf99840..2796e503cf 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -305,3 +305,38 @@ do_deploy () {
>>  }
>>  
>>  addtask deploy before do_build after do_compile
>> +
>> +# Create new rules to extract default envs
>> +UBOOT_ENVS_DEFAULT ?= "uboot-envs-default"
>> +DEFAULT_ENVS ?= "u-boot-env-default.txt"
>> +DEFAULT_ENVS_SIZE ?= "65536"
>> +
>> +# Generate default environment
>> +do_gen_default_envs[doc] = "Generate image with default U-Boot environment(s)"
>> +do_gen_default_envs () {
>> +	${B}/source/scripts/get_default_envs.sh ${B} > ${B}/${DEFAULT_ENVS}
>> +
>> +	# Generate env image
>> +	${B}/tools/mkenvimage -s ${DEFAULT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT} ${B}/${DEFAULT_ENVS}
> 
> Does this actually work during cross build , when mkenvimage
> architecture is different than host architecture ?
> 
>> +	# Generate redundant env image
>> +	${B}/tools/mkenvimage -r -s ${DEFAULT_ENVS_SIZE} -o ${B}/${UBOOT_ENVS_DEFAULT}_r ${B}/${DEFAULT_ENVS}
> 
> Is redundant env always needed on all systems ?
> 
>> +	rm ${B}/${DEFAULT_ENVS}
>> +}
>> +
>> +addtask gen_default_envs before do_deploy_default_envs after do_compile
>> +
>> +# Deploy default environment
>> +do_deploy_default_envs[doc] = "Copy images with default U-Boot environment to deployment directory"
>> +do_deploy_default_envs () {
>> +	install -d ${DEPLOYDIR}
>> +
>> +	install ${B}/${UBOOT_ENVS_DEFAULT} ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}
>> +	install ${B}/${UBOOT_ENVS_DEFAULT}_r ${DEPLOYDIR}/${UBOOT_ENVS_DEFAULT}_r
> 
> Does this work with multiple machines or will it overwrite the deployed
> image ?
> 
> 
>> +	rm ${B}/${UBOOT_ENVS_DEFAULT}
>> +	rm ${B}/${UBOOT_ENVS_DEFAULT}_r
>> +}
>> +
>> +addtask deploy_default_envs before do_deploy after do_gen_default_envs
>>
> 
> 

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

