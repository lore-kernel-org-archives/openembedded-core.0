Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE02FCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:59:26 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11691.1778767162761862326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 64EDxBBX2247463;
	Thu, 14 May 2026 08:59:11 -0500
Received: from [192.168.2.90] ([192.168.2.90])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 64EDx9Og026709;
	Thu, 14 May 2026 08:59:10 -0500
Message-ID: <60bcb857-3146-4bc9-8a1d-2c6295ba81cb@kernel.crashing.org>
Date: Thu, 14 May 2026 08:59:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] spdx30: default SPDX_PACKAGE_SUPPLIER to
 OpenEmbedded
Content-Language: en-US
To: Paul Barker <paul@pbarker.dev>, Javier Tia <floss@jetm.me>,
        openembedded-core@lists.openembedded.org
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
References: <20260511-spdx30-package-supplier-default-v1-1-12e0d086ccf4@jetm.me>
 <ec97074d05b92478b07987230e835ea57012b2b1.camel@pbarker.dev>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <ec97074d05b92478b07987230e835ea57012b2b1.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237036



On 5/14/26 6:43 AM, Paul Barker wrote:
> On Mon, 2026-05-11 at 17:55 -0600, Javier Tia wrote:
>> spdx_package.suppliedBy is only set when SPDX_PACKAGE_SUPPLIER is
>> explicitly configured. Default builds leave the property empty on every
>> software_Package Element, so SBOM consumers that require it (BSI
>> TR-03183-2 v2.1.0 validators among them, surfaced by shipcheck at
>> https://github.com/jetm/shipcheck/issues/3) treat the SBOM as missing a
>> normative field.
>>
>> Default SPDX_PACKAGE_SUPPLIER_ref to the SPDX_AUTHORS_openembedded
>> agent already defined in this file. new_agent() resolves the _ref
>> redirect (meta/lib/oe/sbom30.py), so the existing OpenEmbedded
>> Organization Element gets attached as suppliedBy on every Package
>> without creating a duplicate Agent. Builds that already configure
>> SPDX_PACKAGE_SUPPLIER via _name/_type/_import/_ref keep their
>> behavior; the ??= only kicks in when nothing is set. The default
>> resolves to a fixed in-tree string, so SPDX output stays reproducible.
>>
>> This follows the additive pattern used by commit c8e6953a0b
>> ("spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM"): give
>> the field a sensible default value, leave overrides untouched.
>>
>> Signed-off-by: Javier Tia <floss@jetm.me>
>> ---
>> COVER-LETTER-BODY-FOLLOWS
>> shipcheck v0.0.6 (https://github.com/jetm/shipcheck) added an SPDX 3.0
>> validator that scores SBOMs against the BSI TR-03183-2 v2.1.0 minimum
>> content set. A stock poky core-image-minimal with
>> INHERIT += "create-spdx-3.0" scores 0/30 on the per-package field
>> check because suppliedBy is empty by default. Patch context and a
>> public issue are at https://github.com/jetm/shipcheck/issues/3.
>>
>> This series gives SPDX_PACKAGE_SUPPLIER a sensible default by
>> reusing the SPDX_AUTHORS_openembedded agent already defined in
>> create-spdx-3.0.bbclass. new_agent() (meta/lib/oe/sbom30.py) already
>> supports _ref redirection, so the change is one line and no Python
>> is touched. Builds that already configure SPDX_PACKAGE_SUPPLIER via
>> _name/_type/_import/_ref keep their behavior.
>>
>> Two adjacent BSI gaps were considered for this series and intentionally
>> left out:
>>
>> - software_declaredLicense as a field on software_Package. The
>>    SPDX 3.0.1 spec
>>    (https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Package/)
>>    does not define such a property; license is modeled exclusively via
>>    Relationship Elements. The hasDeclaredLicense Relationship is
>>    already emitted per package in meta/lib/oe/spdx30_tasks.py
>>    (61ba0ef140 switched it from hasConcludedLicense). The shipcheck
>>    validator needs the relationship-traversal path, not a new field.
>>
>> - Per-package verifiedUsing aggregated from contained software_File
>>    Hash Elements. This is a real spec property (cardinality 0..*) but
>>    the multi-hop aggregation is invasive enough to warrant a separate
>>    discussion. Tracked on the shipcheck issue above.
>>
>> Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   meta/classes/create-spdx-3.0.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
>> index 56fd01fd53..1fc15ecc7d 100644
>> --- a/meta/classes/create-spdx-3.0.bbclass
>> +++ b/meta/classes/create-spdx-3.0.bbclass
>> @@ -123,6 +123,7 @@ SPDX_ON_BEHALF_OF[doc] = "The base variable name to describe the Agent on who's
>>   
>>   SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
>>       is supplying artifacts produced by the build"
>> +SPDX_PACKAGE_SUPPLIER_ref ??= "SPDX_AUTHORS_openembedded"
> 
> This variable sets the suppliedBy property, which according to the SPDX
> 3.0.1 spec [1] identifies "the actual distribution source for the
> artifact". This should be the person/organisation building and
> distributing the packages, not the author of the recipes. So this is not
> correct as a default.
> 
> [1]: https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/suppliedBy/

I don't often chime in with an 'I agree', but in this case I think it's 
important that the actually supplier is the one whose name shows up here.  This 
can have ramifications for CRA or other legal liability.  So defaulting to the 
author of the recipe is incorrect.  It is not the authors, OpenEmbedded or Yocto 
Project's responsibility to 'supply' and 'support' these packages, it's the 
people who are building a product.

I would fix this by introducing a warning that this value is not defined, and 
then make sure the documentation has clear instructions (with references back to 
the SPDX specs) on what this is for and what should be set there.

--Mark

> Thanks,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237027): https://lists.openembedded.org/g/openembedded-core/message/237027
> Mute This Topic: https://lists.openembedded.org/mt/119266994/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

