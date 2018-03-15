Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 96E64785A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 19:42:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 12:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,312,1517904000"; d="scan'208";a="39264227"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2018 12:42:58 -0700
To: openembedded-core@lists.openembedded.org
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <3dab59e8-c09c-622e-148b-4c8d1ffe2fc9@intel.com>
Date: Thu, 15 Mar 2018 12:42:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180125031227.18327-1-california.l.sullivan@intel.com>
Cc: bruce.ashfield@windriver.com
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
X-List-Received-Date: Thu, 15 Mar 2018 19:42:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping. This is still an issue and it looks like this patch fell through 
the cracks!

Thanks,
Cal

On 01/24/2018 07:12 PM, California Sullivan wrote:
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


