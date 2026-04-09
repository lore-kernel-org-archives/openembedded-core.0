Return-Path: <martin.vonwillebrand@doubleopen.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04980E9DE6D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 08:56:04 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127725.1775724961826197564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 01:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@doubleopen.io header.s=google header.b=kcv02+mq;
 spf=pass (domain: doubleopen.io, ip: 209.85.208.171, mailfrom: martin.vonwillebrand@doubleopen.io)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e0aa4221fso4897691fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 01:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doubleopen.io; s=google; t=1775724959; x=1776329759; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzkGOnVybdpG2g8eEm0g3eWW0h1OdLqe1SfRScxYNXc=;
        b=kcv02+mqs59w1jH8K+jnqU4ASFcmuHuALuWS9eEDIKppCn8Fn2hSuFHp9GMqQC1C+f
         45OHaU8ZQViDyMlcZWUa3bEJ2LOQDE/H8ZvtC+BgF5FZpZNBa5Tjr0KW/LRKaesA1fWQ
         kMHYfyBbxdqFyL8nI6//LF12LO2WQVBWAB9QNomdmdISHtMYMa3ujMlZuflMsM3vKoOz
         sFYLvGmRRCwsR/9YlGpTJafHVxORlDHU6QF2QS5fcUDotGBtH6Kg/KvRcU5uVmZx5t8S
         jHFTWVZGevT3Hb1j5N6kFyNQxs+VpZpESmN1F6dqJ3UDNE7t6PqXsHfHcuvjKf0NJjDW
         fvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724959; x=1776329759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzkGOnVybdpG2g8eEm0g3eWW0h1OdLqe1SfRScxYNXc=;
        b=TlDSsBgQ1h5Vb16Cvwileird5apgStbKKYTza2XB0HHnL4LK4AhrgrBhVHMK4XuSdo
         fPzz7Iw1M376dA4qmoSQ7pnmrXUShKlKbKHqkdCwmLcHgfqyDCj/sAj1CG87VQJDtJvz
         4BOvul8R9BE/b1t73Uedsa4Hv1AEhCwgFJ0CxZZHxp0HyNcUT9mDWgTDcXqCvpnYHBii
         UrRtL6iJ6lIbaKEF5/Y2rJmnzNvyKy/qJMhfVOgSibMErm0N+NiCsFgakTmZiVwgBbMn
         USTUkGNlKjqZXIfK/e61cmBiBH9boiG/ZVmiHmT0c6MrRljRh10OLkpvJQ3gg+8N6C+o
         fsvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURbf4ULpFWl8ohQ9yE3LBsqgEfP1RFVl5wPdufZ8wzOUrHKpvZAg6Z7LPfmD1arPY4p7Ku6tQg5ZDydMy/qkQ3pA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywh6JHK2R0l4KYvprflrEoOhXAwW5piZiqREM6+6iMvjjxgjJnP
	2X/P5SvKaNUtrk1AzbCDDK43u+8GSREcSZ03aoeHXIHIT+TeIQSmMlOXMEfRKfhXmNo=
X-Gm-Gg: AeBDietWr1khXhmXkj7XW8zQFAOiOGOkRvUpwY1luRULfriq7ooydoHu+GQuzpstdIz
	HDw93ieOq5QU2LAdro/1uyQuQ1DOh7dTB/p9gu2b1Oglwy4Jx1j47JY1cxld0469Vnt490Ii5qG
	GkU8/1bPTGBqfIZLRu7SqamU3Cyghy4T2kecCMlQIiRDidFVy/wNaNpp2k7V0hza55UgDF1YxRO
	VjabfgFfvgDY69KiJfUhMa6t1VduckJF4zwfhT656llFyxqJKI6Ke6lfR+bXlqcicop1+i2AgQN
	WkZCvWS+uKEOiGCy7xuB1BRT1KuY7EpIimE9A/KByi90Uygvnb2lRZYKEAImQs0tdcFpkdc7D8o
	gloCTPIqqgOMLKIrSjFdP5Vh/EvKXVpfvb5N3A+0kB/kxKog48lT3VcdJ7yCF+SGuDTYmWVJ6lu
	r30zon8VzgHr8JzI6rZDqjZJ3mKxSzW8xvvZeuwxFzRSgSf/ZI8m+PQZHS2jhgnmftljA7hM/NF
	oQTbyG/3DvbLLKs2GpD7Yg=
X-Received: by 2002:a05:6512:6d2:b0:5a2:aec9:95f8 with SMTP id 2adb3069b0e04-5a33756030cmr8385016e87.17.1775724959053;
        Thu, 09 Apr 2026 01:55:59 -0700 (PDT)
Received: from [192.168.1.167] (h-185-57-5-116.na.cust.bahnhof.fi. [185.57.5.116])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd31afsm5291851e87.71.2026.04.09.01.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:55:58 -0700 (PDT)
Message-ID: <171ed7c8-e488-4113-a64f-a55395dccd9d@doubleopen.io>
Date: Thu, 9 Apr 2026 11:55:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] Adding PURL identifiers to SPDX 3.0.1 install
 package elements
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
References: <e615740d-eff9-4125-a6e6-e6b58ee29225@doubleopen.io>
 <f4bf51a0b26fcff35191bcedf8e51c09e27b856d.camel@linuxfoundation.org>
Content-Language: sv-SE
From: Martin von Willebrand <martin.vonwillebrand@doubleopen.io>
In-Reply-To: <f4bf51a0b26fcff35191bcedf8e51c09e27b856d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234897

On 4/9/2026 12:23 AM, Richard Purdie wrote:
> On Wed, 2026-04-08 at 16:19 +0300, Martin von Willebrand via lists.openembedded.org wrote:
>> While working with ORT (OSS Review Toolkit) to analyse Yocto-generated
>> SPDX 3.0.1 documents for ongoing vulnerability management and
>> monitoring, I noticed that install package elements
>> (`software_primaryPurpose: install`) carry only a wildcard CPE
>> identifier, e.g.:
>>
>> cpe:2.3:*:*:busybox:1.36.1:*:*:*:*:*:*:*
>>
>> ORT recently released an SPDX analyzer (since ORT 83.0) targeting Yocto
>> 5.0 generated SPDX 3.0.1 documents, which makes this gap more visible:
>> the analyzer can consume the package graph, but the identifiers
>> available are not sufficient to drive post-release CVE monitoring
>> against external vulnerability databases such as NVD or VulnerableCode,
>> since wildcard CPEs cannot be used directly as query keys.
>>
>> If I understand correctly, sbom-cve-check faces the same underlying
>> limitation. In our understanding it would benefit from this change too,
>> though the two approaches are complementary rather than overlapping.
>>
>> The upstream download URL for tarball-based packages is available at
>> build time and is already derived from SRC_URI via `fetch_data_to_uri()`
>> in `spdx30_tasks.py`. A PURL constructed from that URL and placed
>> directly as an `externalIdentifier` on the install package element would
>> give downstream consumers a durable, canonical identifier for
>> post-release vulnerability monitoring.
>>
>> Before drafting a patch I wanted to ask:
>>
>> 1. Is there a specific reason PURL is not currently emitted on install
>> package elements — policy, technical constraint, or simply not yet done?
>> 2. Would a contribution adding PURL for example as an
>> `externalIdentifier` on install packages (derived from SRC_URI fetch
>> data) be welcome in OE-Core master?
>>
>> Happy to hear comments, and discuss scope and approach before writing code.
> I'm not sure this is as simple as it first appears. We support the
> notion of "premirrors" and "mirrors", which are searched before and
> after the primary SRC_URI. We validate a checksum of the resulting
> download to verify we did get what we expected but it doesn't always
> come from that SRC_URI but can be cached. I guess we assume you use the
> unmodified original SRC_URI?
>
> What happens if there are two items in SRC_URI? If we patch the tarball
> with other entries in SRC_URI, is the PURL still valid?
>
> What happens in the cases where the recipe uses git to fetch the
> sources instead of a tarball?
>
> Can the external tooling not look at the url data already in the SPDX
> output and work out the purls itself if it wants to?
>
> I guess what I'm saying is we're trying to avoid too much "processing"
> of the data we put into the SPDX so I'm cautious about duplicating
> info. If the purl is always derived from the SRC_URI and we include
> that, should we be adding the extra data?
>
> I'm not trying to be negative, I'm just worried about where this might
> lead and the corner cases that may be involved.
>
> Coping Joshua who I suspect also may have thoughts on this.
>
> Cheers,
>
> Richard
>
Thanks for the detailed response and raising up the edge cases — I'll try
to address them below:

On mirrors and premirrors: yes, we would use the canonical upstream SRC_URI,
not the actual fetch location. The upstream URI would be correct for CVE
matching purposes, the point is not to record build-time fetch provenance.

On multiple SRC_URI entries and patches: a PURL would identify the upstream
package, not the downstream patched artefact — consistent with how the CPE is
already handled. CVEs are filed against upstream versions, and that is what
both identifiers reference.

On git sources: you're right, a git fetch produces a revision-pinned URI that
does not map cleanly to a standard PURL. Scoping an initial contribution to
non-git fetchers would sidestep this for now and cover the majority of cases.

On whether consumers can derive the PURL themselves: for the generic case
(pkg:generic/busybox@1.36.1), yes — name and version are already on the
install package element and any consumer can construct that trivially, as
long as they undestand Yocto's package structure.

The real value of doing this in OE is the ecosystem-typed cases: pkg:pypi,
pkg:npm, pkg:cpan, and similar. The bbclass inheritance information that
determines ecosystem type — inherit pypi, inherit npm, inherit cpan — exists
exclusively in the recipes and is not recoverable by downstream consumers from
the SPDX output, with or without SPDX_INCLUDE_SOURCES. It looks like that
information is available to OE at build time and nowhere else in the chain.

That said, we would propose emitting PURLs on all install package elements —
ecosystem-typed where the recipe provides that information, pkg:generic
otherwise. Partial coverage would produce an inconsistent SPDX where some
packages have PURLs and others do not, which is worse than either extreme.
And even the generic case, while derivable, removes the need for consumers
to understand Yocto's package structure at all.

The broader argument for doing this in OE: PURL is now an ECMA standard
(ECMA-426) and is on the path to becoming an ISO standard. It is the identifier
that the supply chain tooling ecosystem — ORT, Dependency-Track, CycloneDX,
and others — is converging on for package matching. OE already
takes the position that canonical package identifiers belong in the SPDX output,
by emitting CPE on install package elements. PURL is the natural complement to
that.

It is of course the community's call whether this belongs in OE or downstream. If
this doesn't belong in OE, we could instead document the (limited) derivation
algorithm so consumers can implement it consistently. But to me it looks that OE
is the right place, and that the ecosystem-typed cases, removal of need to
understand Yocto's package structure, as well as explicit purl support make it
worth doing in OE rather than leaving it to downstream.

Thanks, Martin


