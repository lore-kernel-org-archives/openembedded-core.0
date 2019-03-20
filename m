Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id D5A9D7CE21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 00:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88BA340B9F;
	Wed, 20 Mar 2019 00:22:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6qo1VDoXYm-T; Wed, 20 Mar 2019 00:22:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6547A40A93;
	Wed, 20 Mar 2019 00:22:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18FCD16CEA0; Tue, 19 Mar 2019 20:22:40 -0400 (EDT)
Date: Tue, 19 Mar 2019 20:22:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190320002240.GF11946@denix.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Wed, 20 Mar 2019 00:22:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> From: Jon Mason <jdmason@kudzu.us>
> 
> Add new QEMU BSP for a Arm Cortex-A15 system and use this as qemuarm,
> moving the old armv5te Versatile PB based machine to qemuarmv5.
> 
> The new machine uses the QEMU virt machine type, which should be
> faster to emulate and updates the qemuarm support to a modern
> architecture.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/machine/qemuarm.conf                | 34 +++++++++++++------
>  meta/conf/machine/qemuarmv5.conf              | 23 +++++++++++++
>  .../linux/linux-yocto-rt_4.19.bb              |  2 +-
>  .../linux/linux-yocto-rt_5.0.bb               |  2 +-
>  .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
>  .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
>  8 files changed, 52 insertions(+), 17 deletions(-)
>  create mode 100644 meta/conf/machine/qemuarmv5.conf
> 
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index a5443126273..95550461899 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
...
> +KMACHINE_qemuarmv5 = "qemuarm"
> \ No newline at end of file
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> index 07dc5b77a14..36761b99437 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  
>  LINUX_KERNEL_TYPE = "preempt-rt"
>  
> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"

Did you mean to list here "qemuarmv5" instead of "qemuarma15"?

>  
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index 2350973fef2..52c289903be 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  
>  LINUX_KERNEL_TYPE = "preempt-rt"
>  
> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarm64|qemuppc|qemumips)"
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"

This one uses the correct "qemuarmv5", though.


>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> index c6d1594a828..52dbabd7a47 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
> @@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
>  
> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"

Here again looks like a typo - "qemuarma15"


>  # Functionality flags
>  KERNEL_FEATURES = ""
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> index e0a68014461..b6401199a41 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> @@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
>  
> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm"
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"

Correct "qemuarmv5" here.


>  # Functionality flags
>  KERNEL_FEATURES = ""
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> index 8a4355ee833..3ef26a12baa 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> @@ -37,7 +37,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  
> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"

"qemuarma15"?


>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index f2c066a1503..ae6e80c0108 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -40,7 +40,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  
> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"

Ok, "qemuarmv5" - I see a pattern here! Was it a challenge? :)


>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

