Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949F1CD612C
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:28:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.72808.1696879679301412349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=nPHAMPN8;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 704E186A02;
	Mon,  9 Oct 2023 21:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696879677;
	bh=io5MTQ/WqyJfkYuUDAUdgCBh/gJPEjrlEjIb/7SmYRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nPHAMPN8rQwgCJkk1KcUIBlLtz7Yv3FKFT9nwtY0DjLLdhjyr9xtIChP5GdrjKdwa
	 5UOFzR9r5VMx0nUffnZyWR0e0FmiOtIYY5OFk4IWJaikc9PdIE8g+ut69BDDzSKlbS
	 SEtndP7uj0jynfVwe74tOrL4olsrcXfoxEj6Hgn/bzwuSvLkA07dN7HxDyLbo2DtmL
	 sLrSUOM1Z4lrZ+U8S7Jl/gNcF9CBvQU9zlD8vzh+iB/74niOgtSnlFXGTnlzIC101h
	 UO5jPC/IqzUMpHgDlhajK/vkJVb6G1M+AiHHFVV6COPxStC8Oa5gXpf2WYTTzuSYUj
	 2ec68/n6/iz0A==
Message-ID: <faa8e420-8a86-4523-9d79-b6348a93023c@denx.de>
Date: Mon, 9 Oct 2023 21:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
 <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <71c01da4-1fcf-438e-ad90-d17970a9adc2@denx.de>
 <AS1PR10MB5697B786381725B14B540C96FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AS1PR10MB5697B786381725B14B540C96FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 19:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188863

On 10/9/23 19:27, Marko, Peter wrote:
> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Monday, October 9, 2023 18:57
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; richard.purdie@linuxfoundation.org
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>; steve@sakoman.com; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
> 
>> On 10/9/23 18:51, Marko, Peter wrote:
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org
>>> <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
>>> via lists.openembedded.org
>>> Sent: Monday, October 9, 2023 18:44
>>> To: Marek Vasut <marex@denx.de>; steve@sakoman.com;
>>> openembedded-core@lists.openembedded.org
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Subject: Re: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
>>>
>>>> On Mon, 2023-10-09 at 18:31 +0200, Marek Vasut wrote:
>>>>> Configure with "--disable-root-environ" to disallow loading of
>>>>> custom terminfo entries in setuid/setgid programs, mitigating the
>>>>> impact of CVE-2023-29491.
>>>>>
>>>>> This is taken from debian:
>>>>> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef03
>>>>> 9b
>>>>> 8780d51cd09bd5a08ac
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> ---
>>>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>>    meta/recipes-core/ncurses/ncurses.inc | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/recipes-core/ncurses/ncurses.inc
>>>>> b/meta/recipes-core/ncurses/ncurses.inc
>>>>> index 367f3b19f4..1bc07ec2d4 100644
>>>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>>>> @@ -87,6 +87,7 @@ ncurses_configure() {
>>>>>    	        --enable-sigwinch \
>>>>>    	        --enable-pc-files \
>>>>>    	        --disable-rpath-hack \
>>>>> +	        --disable-root-environ \
>>>>>    		${EXCONFIG_ARGS} \
>>>>>    	        --with-manpage-format=normal \
>>>>>    	        --without-manpage-renames \
>>>>
>>>> Should the patch add a CVE_STATUS entry as well so the cve tooling can tell we've mitigated this?
>>>
>>> ncurses 6.4 is not affected and not shown in CVE report, not sure why this is submitted for master.
>>> Peter
>>
>> Just wanted to make sure the configuration is consistent across all the releases.
> 
> I think that the commit message should be changed.
> It's misleading when it only says that it mitigates already fixed CVE.

Will do, how does this sound:

"
     ncurses: disallow loading of custom terminfo entries in 
setuid/setgid programs

     Configure with "--disable-root-environ" to disallow loading of
     custom terminfo entries in setuid/setgid programs. This is related
     to CVE-2023-29491, even though CVE-2023-29491 itself is fixed in
     this OE release by a backport patch.

     This is taken from debian:
 
https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b8780d51cd09bd5a08ac
"

?

