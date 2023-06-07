Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF1CC7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:23:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7059.1686140627337124583
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 05:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iYr2nPNP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686140625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/iXUWY5IKJLlK1MHykbKPwH5Ho0D09CpnXrzdUS1O2k=;
	b=iYr2nPNPlGmm5+QOOg8hb/bXymsUCjQXd/hwpa5wnCU91Ljkd2g5ivhJ/LZ5bw6abKSaPI
	rWwM+2+Nb0y2PIWehjvgMznq9k0swo7zND+2DALDjhr++7+LkvqRHG4isRK1ilF5kVlMFQ
	DiKUrsMIq75sftwEtwl68xBZjWCqNhRNyf6YDPmZG+Bw1TR3ahmOw46BAfoimjDNe1CItJ
	yGZxvpmkty6ClWlNykA3aXx9p07Zjd9NoszMLzfl2lgtUHO1KANbbfsqzNGnRegjoxUwP/
	K6SQWQow/Kh0gCDMKg+uMGSsR7dVjUrBpIEWWFQo4VZ37u5d7ywHpwKDAKNQig==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3F23240008;
	Wed,  7 Jun 2023 12:23:44 +0000 (UTC)
Message-ID: <f731aef7-c59b-c283-0ce2-369341b2594c@bootlin.com>
Date: Wed, 7 Jun 2023 14:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts
 retriever for failing tests
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
 <20230607083015.20760-3-alexis.lothore@bootlin.com>
 <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
 <CANNYZj_84WzoPgCLGE2wpKqmn=H5+3WxZV3u3vaH9_iYGCP-Ww@mail.gmail.com>
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <CANNYZj_84WzoPgCLGE2wpKqmn=H5+3WxZV3u3vaH9_iYGCP-Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 12:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182472

Hello Alexander, Richard,

Thanks for the feedback. Indeed my testing setup is quite minimal, so it may not
reflect how many files may be pulled in real cases.

On 6/7/23 11:20, Alexander Kanavin wrote:
> What might work better without code complications is testimage.bbclass
> setting only the minimum set (no ptests):
> 
> +TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
> +    ${localstatedir}/log \
> +    ${sysconfdir}/version \
> +    ${sysconfdir}/os-release \
> "
> 
> 
> Then core-image-ptest.bb should append "${libdir}/{MCNAME}/ptest" to
> that. As that same image recipe installs only a single ptest via
> IMAGE_INSTALL:append, and the artifacts are retrieved only if that
> ptest would fail, this would achieve the same outcome. Other images
> (which can potentially include many ptests) can then set what
> artifacts to retrieve themselves as they please.

I am not familiar with multiconfig, so I'll have to document myself before
trying what you suggest, especially to make sure it will not make the retriever
too dependant on a proper multiconfig definition.

Thanks,
Alexis
> 
> Alex
> 
> On Wed, 7 Jun 2023 at 10:49, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Wed, 2023-06-07 at 10:30 +0200, Alexis Lothoré via
>> lists.openembedded.org wrote:
>>> Add a basic artifacts retrievers in testimage class which:
>>> - triggers when at least one runtime test fails but tests execution
>>>   encountered no major issue
>>> - reads a list of paths to retrieve from TESTIMAGE_FAILED_QA_ARTIFACTS
>>> - checks for artifacts presence on target
>>> - retrieve those files over scp thanks to existing ssh class
>>> - store those files in an "artifacts" directory in "tmp/log/oeqa/<image>"
>>>
>>> This implementation assumes that the SSH or Qemu target has run and
>>> finished gracefully. If tests do not finish because of an exception,
>>> artifacts will not be retrieved
>>>
>>> Bring partial solution to [YOCTO #14901]
>>>
>>> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
>>> ---
>>> Changes since v1:
>>> - only gather artifacts in nominal case (ie qemu runs without any raised
>>>   exception)
>>> - list artifacts directly in variable instead of using external file
>>> - use standard variables in artifacts paths
>>> - allow glob patterns usage in artifacts paths
>>> - expand/filter artifacts list on target before retrieving them
>>> - tune default artifacts list
>>> ---
>>>  meta/classes-recipe/testimage.bbclass | 49 +++++++++++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
>>> index b48cd96575d2..c6ce74a9e7a8 100644
>>> --- a/meta/classes-recipe/testimage.bbclass
>>> +++ b/meta/classes-recipe/testimage.bbclass
>>> @@ -18,6 +18,16 @@ inherit image-artifact-names
>>>
>>>  TESTIMAGE_AUTO ??= "0"
>>>
>>> +# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and for
>>> +# each entry in it, if artifact pointed by path description exists on target,
>>> +# it will be retrieved onto host
>>> +
>>> +TESTIMAGE_FAILED_QA_ARTIFACTS ??= "\
>>> +    ${localstatedir}/log \
>>> +    ${sysconfdir}/version \
>>> +    ${sysconfdir}/os-release \
>>> +    ${libdir}/*/ptest"
>>
>> I know Alex Kanavin asked for this but I'm really not sure
>> ${libdir}/*/ptest is a great idea. This will effectively copy the
>> entire ptest package files for every ptest on the image. Now we split
>> ptests to different images it is less of an issue but it is still
>> potentially rather large. Could we at least limit it to failing ptests?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#182462): https://lists.openembedded.org/g/openembedded-core/message/182462
>> Mute This Topic: https://lists.openembedded.org/mt/99380468/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


