Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F466C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:26:24 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.14785.1737732373485736347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=MsgU8sBz;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B996D101D2388;
	Fri, 24 Jan 2025 16:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737732371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZjoWex5JMebndRTS6fF+4W575meOPdnowiWEmDdGrg=;
	b=MsgU8sBzQjVrp9S7nld7xW0ahT8zdcOYonr8fio2oCPcgFOzKVccgjfPDwPMGon+eLd6Nb
	eiB3kepK5nhRWo5V1R/x/TSYdOba5iWLMNzSnWCiWcj6nruOJ3SlGHyVjiw5ka2+MQYgQr
	21nBQvGugxct16mjj1VPVHzoMwyC9gDEs8mvlZL52dftLhlbnbHnO4lpBF3kY/dnvrDH0m
	tCEXNrVgtc3NP7a0xq+dODWsvzPK1Wqxwwc4plcCX+q0vRhTE/jdUY5+CWYPsGMUsj58aD
	7/MAICCVrtL6xXqOhiBus1DKWjRXE/A0UHYGnKwvMKTSYBiGsEPhJ7iY3l64fA==
Message-ID: <e5278b22-ca06-409e-8b7a-b2f5fe6b915c@denx.de>
Date: Fri, 24 Jan 2025 14:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CANNYZj9B-ZY+L9Wk0DED5yMxSxMzFca1SOfKVH1ZgPfo2GG7Xg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANNYZj9B-ZY+L9Wk0DED5yMxSxMzFca1SOfKVH1ZgPfo2GG7Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210222

On 1/24/25 1:43 PM, Alexander Kanavin wrote:
> On Thu, 23 Jan 2025 at 21:12, Marek Vasut via lists.openembedded.org
> <marex=denx.de@lists.openembedded.org> wrote:
> 
>>   # Limit the RPROVIDES here to class target so that if usrmerge is enabled for nativesdk, it does not
>>   # include host system paths in /bin/
>> -RPROVIDES:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/bash', '', d)}"
>> +RPROVIDES:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/bash', '', d)}"
> 
> This was added for a reason (that you can find in git history), if we
> partially remove it, then the reason will come back and bite us.

That's why there is [RFC] tag in subject.

> What I'd like to understand is how bash's postinst is actually failing
> when /etc/shells is not there yet:
> 
> grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo
> ${base_bindir}/bash >> $D${sysconfdir}/shells

Grep will complain about the missing file /etc/shells .

I can totally imagine we can take the easy way out here for all the 
postinst scripts and do something like :

"
# Make sure $D${sysconfdir}/shells exists
touch $D${sysconfdir}/shells
# Remove previous bash entry (if any)
sed -i '/^${base_bindir}/bash$/ d' $D${sysconfdir}/shells
# Add new bash entry , now surely a singular one
echo ${base_bindir}/bash >> $D${sysconfdir}/shells
"

But I have the bad feeling that this would be hiding some deeper issue.

> Basically you either need to show me how to reproduce the issue

I cannot, because so far this only happens in internal CI.
I am not able to reproduce it on multiple local build machines.

> , or
> show an error message you're getting

The grep -q fails on missing /etc/shells , because base-files which was 
supposed to add it was not installed yet.

> , or an incorrect outcome on the
> rootfs.
That incorrect rootfs will only contain /etc/shells from base-files , 
the base-files which were installed AFTER bash was installed already , 
which will be missing the bash entry because that was never added 
because the bash postinst ran before base-files was installed .

(and I still plan to reply to Khem and also got some hint from Martin 
Jansa, which I have yet to explore)

