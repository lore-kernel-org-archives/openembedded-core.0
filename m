Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9D0CD6112
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:57:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.68209.1696870614118104883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=RGvl4Z3J;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E70BB8692B;
	Mon,  9 Oct 2023 18:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696870612;
	bh=We40QmptLW+nHpAhV6fFNiXNG4GSIujvZGXu3VJdyuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RGvl4Z3Jr0qCGw7HP7i3y05VCg34u4GMSTayiDLc//g2LQx5+6gISLH5wPbqKBreY
	 vypBJXi6uyAVhuIppbeLpwLxWl7/uxfS4lEcbzTa5tnHmtV6g+3SGRliy7vRg7G7qQ
	 I3n2NA35mok9rp3lO7LeNJvQfcL6KVtLCULvBLjqyXb2Omb7L49tCBV+0EEBJ71v/R
	 QLTkk+EfycF9pgnXugrCkl2EUR9DY6l+2HMZL5q9gbrwbST/vvjTcNLPU4a0pcmQBd
	 8NkZWBpMwK8I/4nIlZuUaM/jGZ1HdB3sW4Y2bD4yXEQ9JlRpcdCjL1G9OGQ/1Sf71f
	 ZR8ma8o99ihCQ==
Message-ID: <71c01da4-1fcf-438e-ad90-d17970a9adc2@denx.de>
Date: Mon, 9 Oct 2023 18:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Content-Language: en-US
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
 <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188856

On 10/9/23 18:51, Marko, Peter wrote:
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie via lists.openembedded.org
> Sent: Monday, October 9, 2023 18:44
> To: Marek Vasut <marex@denx.de>; steve@sakoman.com; openembedded-core@lists.openembedded.org
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Subject: Re: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
> 
>> On Mon, 2023-10-09 at 18:31 +0200, Marek Vasut wrote:
>>> Configure with "--disable-root-environ" to disallow loading of custom
>>> terminfo entries in setuid/setgid programs, mitigating the impact of
>>> CVE-2023-29491.
>>>
>>> This is taken from debian:
>>> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b
>>> 8780d51cd09bd5a08ac
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>   meta/recipes-core/ncurses/ncurses.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/ncurses/ncurses.inc
>>> b/meta/recipes-core/ncurses/ncurses.inc
>>> index 367f3b19f4..1bc07ec2d4 100644
>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>> @@ -87,6 +87,7 @@ ncurses_configure() {
>>>   	        --enable-sigwinch \
>>>   	        --enable-pc-files \
>>>   	        --disable-rpath-hack \
>>> +	        --disable-root-environ \
>>>   		${EXCONFIG_ARGS} \
>>>   	        --with-manpage-format=normal \
>>>   	        --without-manpage-renames \
>>
>> Should the patch add a CVE_STATUS entry as well so the cve tooling can tell we've mitigated this?
> 
> ncurses 6.4 is not affected and not shown in CVE report, not sure why this is submitted for master.
> Peter

Just wanted to make sure the configuration is consistent across all the 
releases.

