Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C59F6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 14:21:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0PELumv002920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 25 Jan 2018 06:21:56 -0800
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 25 Jan 2018 06:21:56 -0800
To: California Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e66c755a-c1d1-0e73-d18f-f8836139fb85@windriver.com>
Date: Thu, 25 Jan 2018 09:21:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180125031227.18327-1-california.l.sullivan@intel.com>
Subject: Re: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
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
X-List-Received-Date: Thu, 25 Jan 2018 14:21:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/24/2018 10:12 PM, California Sullivan wrote:
> Kernel v4.14 and newer contain the following in their Makefile:
> 
> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
> HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
> 
> This breaks our menuconfig, because it can no longer find ncurses if its
> not on the host machine. This can be seen in linux-yocto-dev, for
> example:
> 
> [clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig
> 
>    GEN     ./Makefile
>    HOSTLD  scripts/kconfig/mconf
> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
> collect2: error: ld returned 1 exit status
> make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
> make[2]: *** [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei7-64/kernel-source/Makefile:504: menuconfig] Error 2
> make[1]: *** [Makefile:146: sub-make] Error 2
> make: *** [Makefile:24: __sub-make] Error 2
> Command failed.
> Press any key to continue...

Does this fix still require a kernel patch ? I was trying to test
it out here, and may have messed up the steps.

If I remove ncurses-dev from my builder, I'm not able to get a
working menuconfig no matter what combination of this patch
applied (or not) or my menuconfig patch applied (or not).

I can say that having this applied didn't break my menuconfig,
but I wasn't able to fully test.

Should I expect a builder without ncurses-dev + just this patch
to be able to run menuconfig ?

Bruce

> 
> Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
> 'make menuconfig' command.
> 
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>   meta/classes/kernel.bbclass | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 2f6eca382e9..e4df1531c19 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
>   
>   inherit cml1
>   
> +KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
> +
>   EXPORT_FUNCTIONS do_compile do_install do_configure
>   
>   # kernel-base becomes kernel-${KERNEL_VERSION}
> 


