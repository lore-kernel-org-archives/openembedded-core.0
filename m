Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D849EC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:37:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.8043.1646908667132548313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=op1rwFAq;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-017.002.205.pools.vodafone-ip.de [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A480E8009D;
	Thu, 10 Mar 2022 11:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646908664;
	bh=VPb97NHirp4xnozN+dWlxuwHhDgXQaV17m0OMb7EYPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=op1rwFAqQdkDjyiKcjEfQWJbWiKqXLQVXbkiXZwkqoIBybAhAoX7mErcVdKiaCbct
	 srvQuOGOWDNctNOe3T3Ez0PDDfxr5kqKNYVng+vdFFOUIba2uElcExH0yi+e3piihd
	 DegPmxu1GKo029E+5r/JOIlVZVK0698pjliidtRNTZgxn97YAwrqfgW9iDYqrW6OSh
	 DZ5PMTGVBGQ3qM+OXOO901HsIzmW9MOaqV/DWBhNyvqldxq5GcH9f+VWI9T2tac24m
	 lE6TxzoMYvea70RQM8Z2J6q/6/WgFyKQXdvzx3RrIIR8KgSvX5MiFkXngNHoNMd9BA
	 X73mauw5Jts0g==
Message-ID: <830782cd-7cd6-a38a-595e-3e604e584059@denx.de>
Date: Thu, 10 Mar 2022 11:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH] overlayfs: add systemd unit path prefix to
 FILES:${PN} array
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <20220309142946.3028564-1-ch@denx.de>
 <37dadffea7d833f128aacd1454f7bbfaae4c8563.camel@linuxfoundation.org>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <37dadffea7d833f128aacd1454f7bbfaae4c8563.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:37:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163012

Hi Richard,

On 2022-03-10 11:11, Richard Purdie wrote:
> On Wed, 2022-03-09 at 15:29 +0100, Claudius Heine wrote:
>> The 'FILES:${PN}' array is missing the systemd unit dir prefix causing
>> them to not be packaged and the build fails with the
>> `installed-vs-shipped` error.
>>
>> This adds the `systemd_system_unitdir` variable in front of every unit
>> file added with this class.
>>
>> Signed-off-by: Claudius Heine <ch@denx.de>
>> ---
>>   meta/classes/overlayfs.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>> index 4a860f7308..f525ea6625 100644
>> --- a/meta/classes/overlayfs.bbclass
>> +++ b/meta/classes/overlayfs.bbclass
>> @@ -103,7 +103,8 @@ python () {
>>       unitList = unitFileList(d)
>>       for unit in unitList:
>>           d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit)
>> -        d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
>> +        d.appendVar('FILES:' + d.getVar('PN'), ' ' +
>> +		d.getVar('systemd_system_unitdir') + '/' + strForBash(unit))
>>   
>>       d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
>>   }
> 
> I have to wonder how this is being tested since this patch injects tabs into a
> python function and that triggers warnings about tabs in python code.
> 
> That caused selftest failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3227
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3240
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3271
> 
> I've tweaked the patch to fix the whitespace here and in the other patch but I
> notice more patches on the list also with what I suspect are whitespace issues.

Ouch, I will check my editor config. Sorry for this.

regards,
Claudius

