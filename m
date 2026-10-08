Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1348CA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 15:19:41 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17823.1791472779090286922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 08:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 698FJYLI3954839;
	Thu, 8 Oct 2026 10:19:34 -0500
Received: from [192.168.2.47] ([192.168.2.47])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 698FJXp0009536;
	Thu, 8 Oct 2026 10:19:34 -0500
Message-ID: <d5460230-1fd9-48b5-a854-d9140dbe04c8@kernel.crashing.org>
Date: Thu, 8 Oct 2026 10:19:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH RFC v2 01/19] tune-riscv: be explicit about
 riscv32gc, riscv64gc defaults
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <20260930-riscv-tuning-rework-v2-1-9e29f3531d0e@baylibre.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20260930-riscv-tuning-rework-v2-1-9e29f3531d0e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 15:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247433

Sorry for the late reply, but I missed this when it came in.

On 9/30/26 11:38 AM, Trevor Gamblin wrote:
> The string 'riscv64' is a generic descriptor for the 64-bit RISC-V ISA,
> and can mean different things under different contexts. In the case of
> tune-riscv.inc, it has served as an alias for the 'riscv64gc' profile
> which packages are typically built against, resulting in the following
> output (from a typical bitbake preamble):
> 
> |TUNE_FEATURES        = "rv 64 i m a f d c zicsr zifencei"
> 
> Modify tune-riscv.inc to avoid overloading the 'riscv64' string in this
> way, instead setting DEFAULTTUNE to 'riscv64gc', and changing other
> occurrences to match. TUNE_FEATURES remains the same under this
> adjustment, but the .inc file is clearer which profile is being
> targeted.
> 
> Do the same for riscv32 -> riscv32gc. In this case, we also need to
> update qemuriscv32.conf, since it sets DEFAULTTUNE to override the
> default.
> 
> Also add TUNE_FEATURE aliases for the old riscv32 and riscv64 names so
> that other layers using them don't break.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   meta/conf/machine/include/riscv/tune-riscv.inc | 18 ++++++++++++------
>   meta/conf/machine/qemuriscv32.conf             |  2 +-
>   2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
> index 12c1125c8b..8a14971d5f 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -1,15 +1,21 @@
>   require conf/machine/include/riscv/arch-riscv.inc
>   
> -DEFAULTTUNE ?= "riscv64"
> +DEFAULTTUNE ?= "riscv64gc"
>   
> -AVAILTUNES += "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
> +AVAILTUNES += "riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"

I am in favor of the above.  The original riscv64 was there only for legacy 
compatibility, but I never liked it.  Being more specific, especially on 
_embedded_ riscv systems seems like a good thing to me.

--Mark

>   # Default
> -TUNE_FEATURES:tune-riscv64 := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
> -PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${TUNE_RISCV_PKGARCH}"
> +TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
>   
> -TUNE_FEATURES:tune-riscv32 := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
> -PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${TUNE_RISCV_PKGARCH}"
> +TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
> +
> +# Compatibility aliases so that layers using old tunes don't break
> +TUNE_FEATURES:tune-riscv64 := "${TUNE_FEATURES:tune-riscv64gc}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gc}"
> +TUNE_FEATURES:tune-riscv32 := "${TUNE_FEATURES:tune-riscv32gc}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${PACKAGE_EXTRA_ARCHS:tune-riscv32gc}"
>   
>   # No float
>   TUNE_FEATURES:tune-riscv64nf := "${@oe.tune.riscv_isa_to_tune("rv64imac_zicsr_zifencei")}"
> diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
> index aff36c28a5..5cb9ba5aa9 100644
> --- a/meta/conf/machine/qemuriscv32.conf
> +++ b/meta/conf/machine/qemuriscv32.conf
> @@ -2,7 +2,7 @@
>   #@NAME: generic riscv32 machine
>   #@DESCRIPTION: Machine configuration for running a generic riscv32
>   
> -DEFAULTTUNE ?= "riscv32"
> +DEFAULTTUNE ?= "riscv32gc"
>   
>   require conf/machine/include/riscv/qemuriscv.inc
>   
> 

