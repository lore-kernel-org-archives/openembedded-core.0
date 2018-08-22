Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9795974561
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:42:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7MDgEUF018669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2018 06:42:14 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 22 Aug 2018 06:42:13 -0700
To: Lukasz Majewski <lukma@denx.de>, <openembedded-core@lists.openembedded.org>
References: <20180822134022.1067-1-lukma@denx.de>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <446ed947-bbab-1bb6-4fad-e222af1fa662@windriver.com>
Date: Wed, 22 Aug 2018 09:42:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180822134022.1067-1-lukma@denx.de>
Subject: Re: [PATCH] kernel: yocto: Add dependency on do_prepare_recipe_sysroot
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
X-List-Received-Date: Wed, 22 Aug 2018 13:42:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2018 09:40 AM, Lukasz Majewski wrote:
> Without this patch it happens that do_populate_recipe_sysroot is called
> just before do_compile (on multi core build machines).
> This is way too late as the .config generated in do_kernel_configme()
> is already broken.
> 
> The problem is that do_kernel_configme() calls native's merge_config.sh
> script which may call bison and arm-linux-*-gcc to compile kconfig
> infrastructure to create base .config
> (scripts/kconfig/conf  --allnoconfig Kconfig.)
> 
> It turns out that we only got above binaries after do_prepare_recipe_sysroot()
> is called.
> If those binaries are not available, the merge_config.sh do not generate
> base .config and without any error produces malfunctioned .config.
> The build process continues and as a result broken kernel is compiled.
> 
> To reproduce:
> 
> bitbake -c cleansstate virtual/kernel
> bitbake -c kernel_metadata -v virtual/kernel
> bitbake -c do_kernel_configme -v virtual/kernel
> (one shall see broken .config in ${B}/.config)
> bitbake -c do_populate_sysroot -v virtual/kernel
> bitbake -c do_compile -v virtual/kernel
> 

I already have a queue of changes for the 4.18 kernel that has a
similar tweak.

I'll double check the use case above, and if it isn't already
fixed, I'll add this to my queue.

Bruce

> (Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>   meta/classes/kernel-yocto.bbclass | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 4ac3a39e47..19a3f2bc46 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -276,6 +276,7 @@ do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
>   do_validate_branches[depends] = "kern-tools-native:do_populate_sysroot"
>   
>   do_kernel_configme[dirs] += "${S} ${B}"
> +do_kernel_configme[depends] += "virtual/kernel:do_prepare_recipe_sysroot"
>   do_kernel_configme() {
>   	set +e
>   
> 


