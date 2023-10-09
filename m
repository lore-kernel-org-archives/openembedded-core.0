Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E4FCD612D
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:30:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.72370.1696879822687686934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=HgLYfiIl;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 773E186489;
	Mon,  9 Oct 2023 21:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696879820;
	bh=arN18e4Az6wZobsov1kEmyMMMdANne0OFXPWncYXGKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HgLYfiIlEpTi1aOXnqsfqS3BTrSArz8CE8Frk8GWbbyU1hqMU8gdQgkSNPW15zMWS
	 UN7AFgdOSUu7TS6aC265Vt3R8DLWZ+1K43t6CiEpvLsJToRvv3Wez15U14zRrF/kzZ
	 zR0dC272OqOnXLY+jp5hWIVagEQm0iPI7Wn5EAOB0Hyj2CvASzxB1tb2b1w6V6aa7i
	 tDgR86/wwba7S6FraEAP+5inZYVQBmDo16DbGC2Hqe9WjgMyXT1hnBZt4hC8ENc9Uv
	 nUzh08G8zALQq47dDNMPrIyhEet8HGM3cOSYfcHMDa1MY38Mpyj4hlXqCliNZmuaqv
	 epEfOpKPJP3bg==
Message-ID: <ee77727b-e8d7-4c34-8b67-bd09bc5e9288@denx.de>
Date: Mon, 9 Oct 2023 21:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ncurses: Mitigate CVE-2023-29491
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, steve@sakoman.com,
 openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 19:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188864

On 10/9/23 18:44, Richard Purdie wrote:
> On Mon, 2023-10-09 at 18:31 +0200, Marek Vasut wrote:
>> Configure with "--disable-root-environ" to disallow loading of
>> custom terminfo entries in setuid/setgid programs, mitigating the
>> impact of CVE-2023-29491.
>>
>> This is taken from debian:
>> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b8780d51cd09bd5a08ac
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/recipes-core/ncurses/ncurses.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>> index 367f3b19f4..1bc07ec2d4 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -87,6 +87,7 @@ ncurses_configure() {
>>   	        --enable-sigwinch \
>>   	        --enable-pc-files \
>>   	        --disable-rpath-hack \
>> +	        --disable-root-environ \
>>   		${EXCONFIG_ARGS} \
>>   	        --with-manpage-format=normal \
>>   	        --without-manpage-renames \
> 
> Should the patch add a CVE_STATUS entry as well so the cve tooling can
> tell we've mitigated this?

I think I will try to backport the actual fix for this CVE from 
Kirkstone first.

