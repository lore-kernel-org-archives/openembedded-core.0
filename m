Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 684CE73259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:58:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0T6wYV5018576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jan 2016 22:58:34 -0800 (PST)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 28 Jan 2016 22:58:33 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
	<F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
	<1453932798.10340.11.camel@linuxfoundation.org>
	<56A983DE.6030907@windriver.com>
	<1454000660.10340.52.camel@linuxfoundation.org>
	<56AADEEB.6050106@windriver.com>
	<1454049630.10340.60.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56AB0D8C.2070603@windriver.com>
Date: Fri, 29 Jan 2016 14:58:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454049630.10340.60.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 06:58:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2016 02:40 PM, Richard Purdie wrote:
>
> I investigated this a little. When I tried your patch I saw:
>
> $ bitbake glibc -e | grep TARGET_CFLAGS=
> export TARGET_CFLAGS="
> -I/media/build1/poky/build/tmp5/sysroots/qemux86/usr/include -O2 -pipe
> -g -feliminate-unused-debug-types -fdebug-prefix
> -map=/media/build1/poky/build/tmp5/work/i586-poky
> -linux/defaultpkgname/1.0-r0/defaultpkgname-1.0=/usr/src/defaultpkgname
> -fdebug-prefix-map=/media/build1/poky/build/tmp5/work/i586-poky
> -linux/defaultpkgname/1.0-r0/defaultpkgname-1.0=/usr/src/defaultpkgname
> -gno-record-gcc-switches -fdebug-prefix
> -map=/media/build1/poky/build/tmp5/sysroots/x86_64-linux= -fdebug
> -prefix-map=/media/build1/poky/build/tmp5/sysroots/qemux86= "
>
> and then once I commented out:
>
> SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
>
> in glibc.inc I see:
>
> $ bitbake glibc -e | grep TARGET_CFLAGS=
> export TARGET_CFLAGS="
> -I/media/build1/poky/build/tmp5/sysroots/qemux86/usr/include -O2 -pipe
> -g -feliminate-unused-debug-types -fdebug-prefix
> -map=/media/build1/poky/build/tmp5/work/i586-poky-linux/glibc/2.22
> -r0/build-i586-poky-linux=/usr/src/glibc -fdebug-prefix
> -map=/media/build1/poky/build/tmp5/work/i586-poky-linux/glibc/2.22
> -r0/git=/usr/src/glibc -gno-record-gcc-switches -fdebug-prefix
> -map=/media/build1/poky/build/tmp5/sysroots/x86_64-linux= -fdebug
> -prefix-map=/media/build1/poky/build/tmp5/sysroots/qemux86= "
>
> I'd much prefer to fix glibc.inc and put the entries in bitbake.conf
> than further complicate the variables unnecessarily.
>
> For example, we could do:
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 17fa2d5..8e62b3a 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -10,25 +10,20 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
>   
>   # glibc can't be built without optimization, if someone tries to compile an
>   # entire image as -O0, we override it with -O2 here and give a note about it.
> -def get_optimization(d):
> +python () {
>       selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
> -    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O2", "x", "", d) == "x":
> -        return selected_optimization
> -    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
> +    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
>           bb.note("glibc can't be built with -O, -O -Wno-error will be used instead.")
> -        return selected_optimization.replace("-O", "-O -Wno-error")
> +        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
>       elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
> -        bb.note("glibc can't be built with -O0, -O2 will be used instead.")
> -        return selected_optimization.replace("-O0", "-O2")
> +        bb.fatal("glibc can't be built with -O0, using -O1 -Wno-error or -O1 instead.")
>       elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
>           bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
> -        return selected_optimization.replace("-Os", "-Os -Wno-error")
> +        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
>       elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O1", "x", "", d) == "x":
>           bb.note("glibc can't be built with -O1, -O1 -Wno-error will be used instead.")
> -        return selected_optimization.replace("-O1", "-O1 -Wno-error")
> -    return selected_optimization
> -
> -SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
> +        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
> +}
>   
>   # siteconfig.bbclass runs configure which needs a working compiler
>   # For the compiler to work we need a working libc yet libc isn't
>
> which will now give an error for -O0 but I think that is reasonable.
> I'd even prefer to drop the above entirely and use bitbake.conf to be
> honest but I know some people insisted we should have the above.

Yes, you are right! They immediate expand SELECTED_OPTIMIZATION
in glibc and systemtap. I will modify both of them by 'anonymous python
function to replace' to replace in V3.

And then, I will directly put the entries in bitbake.conf.

V3 incoming

//Hongxu
> Cheers,
>
> Richard


