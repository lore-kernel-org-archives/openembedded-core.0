Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB24C4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 01:20:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8975.1708046436871263263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 17:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AgGcNoTd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G1KZHK040582;
	Thu, 15 Feb 2024 19:20:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708046435;
	bh=iofjD9c9s7xiSruMv7/DeXt6u1MfP5rErSsrEm9EMu4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=AgGcNoTd0Cc5yoAaJe4JSNEBVbLVkLXCfPA90lj5nWYSJGsrVBrzCM92w8Nx8o3Xr
	 uGwYsvncI4Cspn3ifykdPk4Lak2ETUsNRMm75RRbeveqOkSduY3SXoCUdkX1wXdzrk
	 vkKA0y/9e2sW3G0oU3E9JjUsYPxowW/x/iGXLjWY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G1KZmq018447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 19:20:35 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 19:20:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 19:20:35 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G1KZwN044996;
	Thu, 15 Feb 2024 19:20:35 -0600
Message-ID: <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
Date: Thu, 15 Feb 2024 19:20:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
        <openembedded-core@lists.openembedded.org>
References: <cover.1707745886.git.steve@sakoman.com>
 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195734


With this patch in place we are seeing a breakage on our kernel builds. 
This patch was cherry picked from master, but the next patch on this 
file in master removes the LOCALVERSION setting...

https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/kernel-arch.bbclass?h=master-next&id=b378eec156998eea55ba61e59103cb34fab0d07c


There is a disconnect here.  Why did we change kirkstone, a stable LTS 
version with a partial patch series based on master?


On 2/12/2024 7:54 AM, Steve Sakoman wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> During testing of the v6.4 reference kernel, it was noticed that
> on-target modules no longer matched the magic value of the running
> kernel.
> 
> This was due to a different localversion in the cross built kernel
> and the scripts / resources created on target.
> 
> This was due to changes in the setlocalversion script introduced
> in the v6.3 series.
> 
> The .scmversion file is no longer used (or packaged) to inhibit
> the addition of a "+" (through querying of the git status of the
> kernel) or the setting of a local version.
> 
> We recently introduced the KERNEL_LOCALVERSION variable to allow
> recipes to place a value in .scmversion, so we extend the use of
> that variable to kernel-arch.bbclass and use it to set the
> exported variable LOCALVERSION.
> 
> We must do it at the kernel-arch level, as the variable must be
> exported in any kernel build to ensure that setlocalversion always
> correctly sets the localversion.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691
> 
> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/classes/kernel-arch.bbclass |  7 +++++++
>   meta/classes/kernel.bbclass      | 10 ++++++++--
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 4cd08b96fb..0a79dea0af 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -66,3 +66,10 @@ KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>   KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>   TOOLCHAIN ?= "gcc"
>   
> +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
> +# the local version. Having it empty means nothing will be added, and any
> +# value will be appended to the local kernel version. This replaces the
> +# use of .scmversion file for setting a localversion without using
> +# the CONFIG_LOCALVERSION option.
> +KERNEL_LOCALVERSION ??= ""
> +export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5951347361..940f1a3cf4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
>   	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>   		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
>   
> -		# Module.symvers gets updated during the
> +		# Module.symvers gets updated during the
>   		# building of the kernel modules. We need to
>   		# update this in the shared workdir since some
>   		# external kernel modules has a dependency on
> @@ -635,7 +635,13 @@ kernel_do_configure() {
>   	# $ scripts/setlocalversion . => +
>   	# $ make kernelversion => 2.6.37
>   	# $ make kernelrelease => 2.6.37+
> -	touch ${B}/.scmversion ${S}/.scmversion
> +	# See kernel-arch.bbclass for post v6.3 removal of the extra
> +	# + in localversion. .scmversion is no longer used, and the
> +	# variable LOCALVERSION must be used
> +	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> +		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> +	fi
>   
>   	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
>   		mv "${S}/.config" "${B}/.config"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195328): https://lists.openembedded.org/g/openembedded-core/message/195328
> Mute This Topic: https://lists.openembedded.org/mt/104311283/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

