Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A11CD6112
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:57:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.68218.1696870636528824221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=DESmahI/;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C88168692B;
	Mon,  9 Oct 2023 18:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696870635;
	bh=dsKLjMipW6Q6lPOq1kgug3RmF3QjRFccnjfiufikHpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DESmahI/5XoIq8dZCJnLsDUk4Ycbgdoqu/IPOzLlPu/k/FdFGsSoPIh0yFLOr7RM8
	 IbJHsR9PjaceLc0Mc2SGqiz/IpqqCgSzNLIeRG55sIFEBvCP9JUiG6iEgMHbM+XRKd
	 logAQ2NFPFmitam+y4WNhEpWfTkuaAy/OoQPi/q0xSBB9khgljSJfd4InK5DELZ+sH
	 yrBTrOMOA4Jlc/hRWK4n56m+rddJehKwV3mJ/IBdfOtnCatWCrkkn8Wts4KbOBmTXP
	 7jbjonIsyzsO06tHlAgdvptIgUmtYKTmn5+cDuQqS2bW4Mz7O+mf13Vu2FLhF/iEg4
	 U1kU0qkii17dg==
Message-ID: <0b41a7c3-9df6-4060-9f69-466c2be17f1e@denx.de>
Date: Mon, 9 Oct 2023 18:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491
Content-Language: en-US
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231009163211.94482-1-marex@denx.de>
 <AS1PR10MB5697897BF1DBC4BF345AB5D7FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AS1PR10MB5697897BF1DBC4BF345AB5D7FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188857

On 10/9/23 18:47, Marko, Peter wrote:
> Hi Marek,
> 
> Could you please describe why you add this configuration in kirkstone branch?
> This CVE is already patched:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/ncurses/files/CVE-2023-29491.patch?h=kirkstone
> 
> Peter
> 
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Marek Vasut via lists.openembedded.org
> Sent: Monday, October 9, 2023 18:32
> To: steve@sakoman.com; openembedded-core@lists.openembedded.org
> Cc: Marek Vasut <marex@denx.de>
> Subject: [OE-core] [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491
> 
>> Configure with "--disable-root-environ" to disallow loading of custom terminfo entries in setuid/setgid programs, mitigating the impact of CVE-2023-29491.
>>
>> This is taken from debian:
>> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b8780d51cd09bd5a08ac
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>   meta/recipes-core/ncurses/ncurses.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
>> index 1abcfae1fe..7e85044bdb 100644
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

See my reply to the master branch patch.

