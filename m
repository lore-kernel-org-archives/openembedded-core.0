Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43E3965E7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:23:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3ADMwo0019594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 06:22:59 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 10 Apr 2014 06:22:58 -0700
Message-ID: <53469B2C.5050407@windriver.com>
Date: Thu, 10 Apr 2014 09:22:52 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1397120750.24597.238.camel@ted>
In-Reply-To: <1397120750.24597.238.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH] perf: Fix sysroot option to CC handling
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
X-List-Received-Date: Thu, 10 Apr 2014 13:23:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-10 05:05 AM, Richard Purdie wrote:
> If you build perf in tree /xxx/treea, then cleansstate perf and build it
> in /xxx/treeb having deleted treea, the build will fail, unable to find libc.
>
> The problem is that the --sysroot option passed in through CC is missing.
> This works fine if the default sysroot is ok, if it isn't, things will fail.
> In 1.7 we'll start poisoning the default sysroot in gcc to catch this kind of
> issue however that doesn't fix the problem with perf.
>
> The problem is that various Makefiles set CC = $(CROSS_COMPILE)gcc. The
> easist fix for now is to sed out the problematic Makefile lines. Its worth
> noting the tools/lib/traceevent Makefile has a much more funky way of setting
> CC which works for us and may be the way we need to fix the other Makefiles
> upstream.
>
> This fixes build failures we're occasionally seen on the autobuilders.

I've bounced back and forth a few times with the way that CC is assigned
in the perf Makefiles versus it being taken from our environment
variables .. and of course the flags that are passed to gcc (as you well 
know).

This looks simple enough and it'll work. The alternatives wouldn't have
been doable with replacements .. and hence we'd only be able to patch
and fix linux-yocto out of the box. So not a good idea.

We'll have to take the discussion to lkml to get this fixed in tree, but
this wouldn't be the first time :)

Tomz: did you want to try that ? Nothing immediate, but I wouldn't want
it to fall completely off the radar.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 9dfccdf..ef21b6c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -133,6 +133,18 @@ do_configure_prepend () {
>       if [ -e "${S}/tools/perf/config/Makefile" ]; then
>           sed -i 's,libdir = $(prefix)/$(lib),libdir = $(prefix)/${baselib},' ${S}/tools/perf/config/Makefile
>       fi
> +    # We need to ensure the --sysroot option in CC is preserved
> +    if [ -e "${S}/tools/perf/Makefile.perf" ]; then
> +        sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
> +        sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
> +    fi
> +    if [ -e "${S}/tools/lib/api/Makefile" ]; then
> +        sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
> +        sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/lib/api/Makefile
> +    fi
> +    if [ -e "${S}/tools/perf/config/feature-checks/Makefile" ]; then
> +        sed -i 's,CC := $(CROSS_COMPILE)gcc -MD,CC += -MD,' ${S}/tools/perf/config/feature-checks/Makefile
> +    fi
>   }
>
>   python do_package_prepend() {
>
>


