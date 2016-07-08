Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 736B260119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u68H4X4M019624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Jul 2016 10:04:33 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Jul 2016 10:04:33 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1467997249.28829.13.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <577FDD20.3000700@windriver.com>
Date: Fri, 8 Jul 2016 13:04:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467997249.28829.13.camel@linuxfoundation.org>
Cc: "saul.wold" <saul.wold@intel.com>
Subject: Re: [PATCH] linux-yocto-dev: Handle performance regression
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
X-List-Received-Date: Fri, 08 Jul 2016 17:04:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-08 01:00 PM, Richard Purdie wrote:
> After commit 0437a59e3c298d40aaa96af09b80bff8fcbe292d, the linux-yocto-dev
> recipe is being parsed every time we run "bitbake -p". This was spotted
> on some performance benchmarks and showed up as a performance regression.
>
> We can tweak the recipe to ensure this doesn't happen and that its only
> used if selected.

Makes sense to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 3085263..c50b319 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -20,6 +20,9 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>   python () {
>       if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
>           raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
> +    else:
> +        d.setVar("SRCREV_machine", "${AUTOREV}")
> +        d.setVar("SRCREV_meta", "${AUTOREV}")
>   }
>
>   KBRANCH = "standard/base"
> @@ -33,8 +36,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>   # linux-yocto-dev is the preferred provider, they will be overridden to
>   # AUTOREV in following anonymous python routine and resolved when the
>   # variables are finalized.
> -SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> -SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> +SRCREV_machine ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
> +SRCREV_meta ?= "29594404d7fe73cd80eaa4ee8c43dcc53970c60e"
>
>   LINUX_VERSION ?= "4.6-rc+"
>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>
>


