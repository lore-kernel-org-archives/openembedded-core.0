Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24689.1792941417776479667
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 08:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 69PFGu8V3173287
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 10:16:56 -0500
Received: from [192.168.2.94] ([192.168.2.94])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 69PFGtG0022809
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 10:16:56 -0500
Message-ID: <49205f5f-53b5-4874-aac6-4cbd908d5eab@kernel.crashing.org>
Date: Sun, 25 Oct 2026 10:16:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuriscv64: Enable the Vector extension in the
 kernel
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20261025065645.1993425-1-khem.raj@oss.qualcomm.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20261025065645.1993425-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 15:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248607



On 10/25/26 1:56 AM, Khem Raj via lists.openembedded.org wrote:
> QB_CPU defaults to rva23s64, which mandates V, but linux-yocto only
> enables CONFIG_RISCV_ISA_V when TUNE_FEATURES contains 'v', and
> riscv-isa-clear.scc turns it off otherwise. With the default rv64gc
> tune the kernel therefore runs without V support and any userspace
> vector instruction raises SIGILL, even code that selects RVV at
> runtime.
> 
> Append riscv-isa-v.scc to KERNEL_FEATURES_RISCV so it lands after
> riscv-isa-clear.scc. Userspace keeps the rv64gc tune and stays
> portable; the kernel detects V at boot, so this is harmless on CPUs
> without it.

This doesn't make sense to me.  If we want a default configuration to include 
vector, then we need to select an ISA that includes vector extensions.

Same with userspace, if anything is using vector instructions it should be using 
a vector based tune.

--Mark

> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>   meta/conf/machine/qemuriscv64.conf | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
> index a753af0576..0aacfa378f 100644
> --- a/meta/conf/machine/qemuriscv64.conf
> +++ b/meta/conf/machine/qemuriscv64.conf
> @@ -6,6 +6,11 @@ require conf/machine/include/riscv/qemuriscv.inc
>   
>   XVISOR_PLAT = "riscv/virt64"
>   
> +# The default QB_CPU (rva23s64) has the Vector extension, so enable it in the
> +# kernel even though the default tune is rv64gc, userspace can then use V at
> +# runtime. Appending here places it after riscv-isa-clear.scc, which disables V.
> +KERNEL_FEATURES_RISCV:append = " arch/riscv/tunes/riscv-isa-v.scc"
> +
>   EXTRA_IMAGEDEPENDS += "u-boot"
>   UBOOT_MACHINE = "qemu-riscv64_smode_defconfig"
>   UBOOT_ELF = "u-boot"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248603): https://lists.openembedded.org/g/openembedded-core/message/248603
> Mute This Topic: https://lists.openembedded.org/mt/121924427/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
