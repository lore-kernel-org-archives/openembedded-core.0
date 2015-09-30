Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB4C177008
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 03:59:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U3xBe8001646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 20:59:11 -0700 (PDT)
Received: from server.local (128.224.21.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 20:59:10 -0700
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1443564436.git.anibal.limon@linux.intel.com>
	<eb7d7ee96174039c8f6f9b93f1cda83fc1ce8687.1443564436.git.anibal.limon@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <560B5E0D.6010202@windriver.com>
Date: Tue, 29 Sep 2015 23:59:09 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <eb7d7ee96174039c8f6f9b93f1cda83fc1ce8687.1443564436.git.anibal.limon@linux.intel.com>
Cc: benjamin.esquivel@intel.com
Subject: Re: [PATCH 1/2] linux-yocto_{3.14, 3.19, 4.1}: qemuarm enable virtio drivers
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
X-List-Received-Date: Wed, 30 Sep 2015 03:59:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-09-29 6:51 PM, Aníbal Limón wrote:
> We are experimenting segfault in qemu arm SCSI driver because
> it's broken [1][2] so enable virtio drivers to use as default.

This looks fine to me, and is consistent with the other features
we are enabling for the default qemu* machines.

What (if any) message is thrown by a kernel that isn't configured
with these features ? I suppose that since we aren't NFS booting,
you simply don't have ethernet, and the user can look at the
target's kernel config to diagnose that issue.

Cheers,

Bruce

>
> [YOCTO #8060]
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2007-03/msg00093.html
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2010-07/msg01473.html
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.14.bb | 1 +
>   meta/recipes-kernel/linux/linux-yocto_3.19.bb | 1 +
>   meta/recipes-kernel/linux/linux-yocto_4.1.bb  | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> index b6b2e5a..0a37cb6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> @@ -36,6 +36,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemu
>   # Functionality flags
>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuarm=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> index e8c1640..4143a09 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
> @@ -36,6 +36,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemu
>   # Functionality flags
>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuarm=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> index 0645134..f27e0de 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -36,6 +36,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemu
>   # Functionality flags
>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuarm=" cfg/virtio.scc"
>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>


