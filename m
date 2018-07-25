Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C66D874A35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 08:05:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P85Y42025202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 01:05:34 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 25 Jul 2018 01:05:33 -0700
To: Lei Maohui <leimaohui@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>
Date: Wed, 25 Jul 2018 16:04:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
Subject: Re: [PATCH v2] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Wed, 25 Jul 2018 08:05:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Maohui,

Thanks for sending it, I do think that oe-core needs this patch.

// Robert

On 06/26/2018 06:27 AM, Lei Maohui wrote:
> The arm toolchain has a "-gnueabi" suffix, but aarch64 doesn't,
> this makes multilib sdk doesn't work, there will be error as following:
> 
> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find crtbeginS.o: No such file or directo
> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find -lgcc
> .../usr/libexec/armeb-poky-linux-gux-linux-gnueabi/7.3.0/real-ld: cannot find -lgcc
> collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>   meta/recipes-devtools/gcc/libgcc-common.inc | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
> index 848a476..a49fc98 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -145,11 +145,22 @@ fakeroot python do_extra_symlinks() {
>       if bb.data.inherits_class('nativesdk', d):
>           return
>   
> -    targetsys = d.getVar('BASETARGET_SYS')
> +    base_targetsys = d.getVar('BASETARGET_SYS')
> +    targetsys = d.getVar('TARGET_SYS')
> +
> +    if base_targetsys != targetsys:
> +        dest = d.getVar('D') + d.getVar('libdir') + '/' + base_targetsys
> +        dest_list = [dest]
> +        # For multilib like aarch64 + arm, need 2 symlinks:
> +        # 1) BASETARGET_SYS as usual
> +        # 2) BASETARGET_SYS + "-gnueabi" for multilib
> +        libce = d.getVar('LIBCEXTENSION')
> +        abie = d.getVar('ABIEXTENSION')
> +        if abie and libce and targetsys.endswith(libce + abie):
> +            dest_list.append(dest + libce + abie)
> +        src = targetsys
> +        for dir in dest_list:
> +            if not os.path.lexists(dir) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
> +                os.symlink(src, dir)
>   
> -    if targetsys != d.getVar('TARGET_SYS'):
> -        dest = d.getVar('D') + d.getVar('libdir') + '/' + targetsys
> -        src = d.getVar('TARGET_SYS')
> -        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D') + d.getVar('libdir')):
> -            os.symlink(src, dest)
>   }
> 

