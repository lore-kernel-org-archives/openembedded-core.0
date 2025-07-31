Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D54BC83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 11:00:40 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web10.59249.1753959630096574216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 04:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=FmHg9rPE;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=300134c78=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1753959630; x=1785495630;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=Fr8VHQNZHDJPc6pAxK0IAi6bi8AZn7NuCjx9n3zhubs=;
  b=FmHg9rPERput1sgeuJ48U2lX4llNWeqqC7vLWbWIYV0Mtxf33jGk911w
   22V09ly9oJb2pNatO8myODhNArIAhLLyqHvSI9KLAm+bOMY/oa26jBBCR
   UOkADnE9dxxAMPaEXm3FX015zpS/JLrB+aondg/GL2K7nIe8yYqCsYDAw
   8=;
X-CSE-ConnectionGUID: fKm+OhKdSNK93VixtE0HRw==
X-CSE-MsgGUID: 9/B5v8ToQxyF8kSKlrRNLA==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 31 Jul 2025 13:00:27 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 31 Jul 2025 13:00:27 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb1.muc with ESMTP/TLS; 31 Jul 2025 13:00:27 +0200
Received: from [10.242.8.21] (10.30.85.209) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Thu, 31 Jul 2025 13:00:26 +0200
X-CSE-ConnectionGUID: xv1lFtBUR0CauPOajA2cDg==
X-CSE-MsgGUID: 2ADVKGfPRI2rijzGMtU4Uw==
X-CSE-ConnectionGUID: PHplqIKJQpGJ8QabckNuLQ==
X-CSE-MsgGUID: GNU9L+F6QomDjbHU9SGpng==
Message-ID: <27eeb3ee-697b-4b77-ace2-9fb16eda306c@bmw.de>
Date: Thu, 31 Jul 2025 13:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] insane: Explicitly fail parsing if QA
 errors were raised
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250728095936.1495441-1-philip.lorenz@bmw.de>
 <20250728095936.1495441-4-philip.lorenz@bmw.de>
 <65a430efacbf77fc7de6ae47adb38fa9150c0a0a.camel@linuxfoundation.org>
Content-Language: en-US
From: Philip Lorenz <philip.lorenz@bmw.de>
CC: <openembedded-core@lists.openembedded.org>
In-Reply-To: <65a430efacbf77fc7de6ae47adb38fa9150c0a0a.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221192

Hi Richard,

On 31.07.25 10:45, Richard Purdie wrote:
> On Mon, 2025-07-28 at 11:59 +0200, Philip Lorenz via lists.openembedded.org wrote:
>> So far, failing the build when a QA error was raised happened implicitly
>> when another (unrelated) caller called `exit_if_errors` (e.g.
>> insane.bbclass's anonymous Python function). This is error prone and may
>> also lead to inconsistent abortion behaviour when parsing QA errors are
>> only raised later.
>>
>> Fix this by introducing an explicit call to `exit_if_errors` once recipe
>> parsing has finished.
>>
>> Currently code in the following .bbclasses relies on insane.bbclass to
>> call `exit_if_errors`:
>> * license.bbclass
>> * yocto-check-layer.bbclass
>>
>> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
>> ---
>>   meta/classes-global/base.bbclass   | 4 ++++
>>   meta/classes-global/insane.bbclass | 2 --
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
>> index 6be1f5c2df2..6fe37755ffa 100644
>> --- a/meta/classes-global/base.bbclass
>> +++ b/meta/classes-global/base.bbclass
>> @@ -348,6 +348,10 @@ python base_eventhandler() {
>>                       profprov = d.getVar("PREFERRED_PROVIDER_" + p)
>>                       if profprov and pn != profprov:
>>                           raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
>> +
>> +        # Bail out early if parsing raised any QA errors
>> +        oe.qa.exit_if_errors(d)
>> +
>>   }
>>   
>>   CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
>> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
>> index fed8163c3e0..f0b7f83e51d 100644
>> --- a/meta/classes-global/insane.bbclass
>> +++ b/meta/classes-global/insane.bbclass
>> @@ -1627,6 +1627,4 @@ python () {
>>                   if broken_order:
>>                       oe.qa.handle_error("native-last", "%s: native/nativesdk class is not inherited last, this can result in unexpected behaviour. "
>>                                                "Classes inherited after native/nativesdk: %s" % (pn, " ".join(broken_order)), d)
>> -
>> -    oe.qa.exit_if_errors(d)
>>   }
> I can understand why you've sent this patch but I'm not sure it fits
> with the overall design we were trying to aim for.
>
> The aim has been for the "QA tests" to be together in insane.bbclass
> and moving this call to base.bbclass just means we're accepting we'll
> just splatter these QA checks everywhere.
>
> I'd also note that parse time checks are expensive and we really should
> be trying to avoid them it at all possible. This is just going to
> encourage them :/.
>
> I'd like to understand a bit more about the issues you saw which lead
> to this patch...

The origin of this patch series is issues related to missing calls to 
`exit_if_errors` that we saw on kirkstone which lead to a complete 
analysis of all uses `oe.qa.handle_error` in poky that are missing a 
corresponding call to `exit_if_errors`. In this analysis it turned out 
that both `license.py:check_license_format` (via `base.bbclass`) and 
`yocto-check-layer.bbclass` currently rely on some other part in the 
system to do this for them (i.e. insane.bbclass).

I guess that the call to check_license_format could actually be moved to 
do_recipe_qa and `yocto-check-layer.bbclass` could be extended to 
explicitly call `exit_if_errors` to avoid reliance on some other 
anonymous function to call it at a later stage. If that makes sense I 
can send out a revised patch.

What would be the advise for custom recipe QA checks to hook themselves 
into the build? Injecting a custom function into the task's prefuncs?

Philip

-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Michael Böttrich, Chris Brandt, Christian Salzmann
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


