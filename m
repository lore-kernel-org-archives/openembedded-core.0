Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD368CA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 15:26:41 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17984.1791473193104286068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 08:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 698FQSvw3955776;
	Thu, 8 Oct 2026 10:26:28 -0500
Received: from [192.168.2.47] ([192.168.2.47])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 698FQRFe009680;
	Thu, 8 Oct 2026 10:26:27 -0500
Message-ID: <effbb186-66cb-4a09-9337-92be41e8f9f3@kernel.crashing.org>
Date: Thu, 8 Oct 2026 10:26:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH RFC v2 12/19] meta/lib/oe/tune.py: add
 riscv_pkgarch()
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>,
        openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <20260930-riscv-tuning-rework-v2-12-9e29f3531d0e@baylibre.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20260930-riscv-tuning-rework-v2-12-9e29f3531d0e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 15:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247434



On 9/30/26 11:38 AM, Trevor Gamblin wrote:
> Create a new function to help match RISC-V ISA extension combinations
> against recognized profile strings (e.g. 'rva22u64'), so that we can use
> simpler patterns for naming things like sstate/build paths.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   meta/lib/oe/tune.py | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
> index 7296f39e66..0d8e4417e7 100644
> --- a/meta/lib/oe/tune.py
> +++ b/meta/lib/oe/tune.py
> @@ -90,3 +90,32 @@ def riscv_isa_to_tune(isa):
>       # Eliminate duplicates, but preserve the order
>       feature = list(dict.fromkeys(feature))
>       return ' '.join(feature)
> +
> +# riscv_pkgarch(features, exact_pkgarch)
> +#
> +# Prefer a RISCV_PROFILES name (plus any extensions enabled on top of it) as the
> +# package arch fragment, since otherwise the full ISA extension list will exceed
> +# what the sstate class can handle. When several profiles match, the one with
> +# the most extensions is preferred, as it is the more specific/clearer match.
> +# If there's no clear profile matching the extension list, then fall back to
> +# exact_pkgarch.
> +def riscv_pkgarch(features, exact_pkgarch):
> +    if not features:
> +        return exact_pkgarch
> +
> +    current = set(features.split())
> +
> +    best_match = None
> +    best_features = None
> +    for name in RISCV_PROFILES:

Where is 'RISCV_PROFILES' defined?

As long as someone is willing to keep this up to date with all of the new 
profiles, I don't have a concern with it.

On my AMD platforms, we have dynamic (user defined) ISA for our parts, the users 
don't really use 'profiles', but select individual isa components.  I would LIKE 
(but only because it's easier for me) a way to see the ISA and not have it 
converted back to a profile.  However, if profiles are the risc-v ISA standard, 
I'm fine without a way to disable the translation.

--Mark

> +        profile_features = set(riscv_isa_to_tune(name).split())
> +        if profile_features.issubset(current):
> +            if best_features is None or len(profile_features) > len(best_features):
> +                best_match = name
> +                best_features = profile_features
> +
> +    if best_match is None:
> +        return exact_pkgarch
> +
> +    extra = sorted(current - best_features)
> +    return '_'.join([best_match] + extra)
> 

