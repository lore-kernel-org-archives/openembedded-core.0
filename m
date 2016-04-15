Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 272E160762
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 06:19:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3F6JUmO004713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Apr 2016 23:19:30 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Apr 2016 23:19:29 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	<richard.purdie@linuxfoundation.org>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
	<83cc5f17761498dbf3dcd5bade28f5583f9bcfad.1460563722.git.bruce.ashfield@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571087EF.9070000@windriver.com>
Date: Fri, 15 Apr 2016 14:19:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <83cc5f17761498dbf3dcd5bade28f5583f9bcfad.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] linux-yocto: make aufs4 optional
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
X-List-Received-Date: Fri, 15 Apr 2016 06:19:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Bruce,

I got do_patch error when add features/aufs/aufs.scc:

KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/aufs/aufs.scc"

MACHINE = "qemux86-64"

$ bitbake virtual/kernel -ccleansstate && bitbake bitbake virtual/kernel

|    mark --> aufs.scc
|          patch aufs-kbuild-support.patch 
(.kernel-meta/patches/standard/base/series)
|          patch aufs4-base-support.patch 
(.kernel-meta/patches/standard/base/series)
|          patch aufs4-mmap-support.patch 
(.kernel-meta/patches/standard/base/series)
|          patch aufs4-standalone-module-support.patch 
(.kernel-meta/patches/standard/base/series)
|          patch aufs-core-filesystem.patch 
(.kernel-meta/patches/standard/base/series)
|    mark <-- aufs.scc
| (1/5) aufs-kbuild-support.patch
| [INFO]: check of 
.kernel-meta/patches/standard/base/links/kernel-meta/features/aufs/aufs-kbuild-support.patch 
with "git am" did not pass, trying reduced context.
| [INFO]: Context reduced git-am of 
.kernel-meta/patches/standard/base/links/kernel-meta/features/aufs/aufs-kbuild-support.patch 
with "git am" did not work, trying "apply".
| error: patch failed: fs/Kconfig:222
| error: fs/Kconfig: patch does not apply
| error: patch failed: include/uapi/linux/Kbuild:59
| error: include/uapi/linux/Kbuild: patch does not apply
| [ERROR]: Application of 
.kernel-meta/patches/standard/base/links/kernel-meta/features/aufs/aufs-kbuild-support.patch 
failed.
|          Patch needs to be refreshed. Sample resolution script:
|              .git/rebase-apply/resolve_rejects
| ERROR. could not update git tree
| WARNING: exit code 1 from a shell command.


// Robert

On 04/14/2016 12:12 AM, Bruce Ashfield wrote:
> An always on configuration of aufs4 crept into the default kernel
> configuration blocks.
>
> With this change, aufs-enable.scc can be used to turn on aufs via
> a KERNEL_FEATURES entry. We can now have co-existing unionfs solutions
> and can update them without breaking builds that haven't opted-in.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
>   meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
>   3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> index cb245eeb913a..d81ca13872c0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
>
>   require recipes-kernel/linux/linux-yocto.inc
>
> -SRCREV_machine ?= "328830680bc35257c83fc400d9d8e2ae94d86f77"
> -SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
> +SRCREV_machine ?= "2bc112a6ccd16800a4c45e47ccb3018a1042abdf"
> +SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> index 2821f448e7f1..684e8809859a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
>   KMETA = "kernel-meta"
>   KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
> +SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
>
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 5509dd697bfb..3c5ee1bd43b2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
>   KBRANCH_qemux86-64 ?= "standard/base"
>   KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "d0dae8a98254e7ddd8d9be107e33c3a492bccdae"
> -SRCREV_machine_qemuarm64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_machine_qemumips ?= "9024e9c842557e258a88470f8b1a772df18d9813"
> -SRCREV_machine_qemuppc ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_machine_qemux86 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_machine_qemux86-64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_machine_qemumips64 ?= "88fb42ec863d20ccde57dd35da06d6221cfb4c03"
> -SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
> -SRCREV_meta ?= "ab0d998117cca8c55f7ca49ec98b843782bdd25b"
> +SRCREV_machine_qemuarm ?= "ec9167bcb0ccd4897177c5e235af68b5890aa326"
> +SRCREV_machine_qemuarm64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_machine_qemumips ?= "900f98d3ab6498bc7f4ff6b7a489db3bca4e6417"
> +SRCREV_machine_qemuppc ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_machine_qemux86 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_machine_qemux86-64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_machine_qemumips64 ?= "4b08dfb1fb3bc7659e8f3e13665597d9a9f0816d"
> +SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
> +SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
>

