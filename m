Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 514F66D881
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 21:54:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 13:50:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434841035"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2013 13:54:15 -0800
Message-ID: <5283F507.7050607@linux.intel.com>
Date: Wed, 13 Nov 2013 13:54:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Wed, 13 Nov 2013 21:54:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2013 06:31 AM, Otavio Salvador wrote:
> This updates lttng-modules for 2.3.2 and also includes a bugfix
> imported from 3.4 kernel. The changes included are:
>
> 6c26b01 Blacklist Linux kernels 3.10+
> b97d469 LTTng trace-clock: shrink kernel blacklist
> 7d40f8e Version 2.3.1
> 2aecb9b Blacklist kernels 3.10.13 and 3.11.2
> 4f1217f Version 2.3.2
> 92fff0c Import fix from LTSI: 3.4+ RT kernels use CONFIG_PREEMPT_RT_FULL
> 1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty implementation
>

Otavio,

Tried to build this locally and got the following failure with 
genericx86 and master:

|   CC [M] 
/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o
| In file included from 
/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-tracer.h:37:0,
|                  from 
/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.c:24:
| 
/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/wrapper/trace-clock.h:40:2: 
error: #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the 
timekeeping subsystem. Fixed by commit 
7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK 
related deadlock from ntp lock changes\" in Linux."
|  #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the 
timekeeping subsystem. Fixed by commit 
7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK 
related deadlock from ntp lock changes\" in Linux."
|   ^
| make[2]: *** 
[/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o] 
Error 1
| make[1]: *** 
[_module_/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git] 
Error 2
| make[1]: Leaving directory 
`/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/src/kernel'
| make: *** [default] Error 2
| ERROR: oe_runmake failed

So I am going to hold off on this patch set until you can resolve this.

Thanks
	Sau!

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
> index 789b5ec..e887a86 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
> @@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
>
>   inherit module
>
> -SRCREV = "78c8710bb8e6b7f6301d95afec0305f40fa063ad"
> -PV = "2.3.0+git${SRCPV}"
> +SRCREV = "18740750760fde894eac0cd4e3ef4d8c7c4ba8c3"
> +PV = "2.3.2+git${SRCPV}"
>
>   SRC_URI = "git://git.lttng.org/lttng-modules.git \
>              file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
>

