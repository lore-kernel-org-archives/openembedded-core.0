Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377F4C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 06:42:34 +0000 (UTC)
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
 by mx.groups.io with SMTP id smtpd.web11.80209.1749537745976128911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 23:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=B9Cyvn4x;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=B9Cyvn4x;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.189, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id OsgguyEgX75drOsghuCDSG; Tue, 10 Jun 2025 08:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1749537744; bh=/1QJapm0HGrAtmlVl4f78EPLFilX+qQYq8bKotXtLXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=B9Cyvn4xToYoS+i1ijWSTYgiT0Ib+dIpslkUuDWFXvCwhIzGHfLGDZTJUzso7t+nU
	 Rz54rlTTkSsfWv5m8piIGXpRtp8kYcVAToluIS9h7HEhqp/uVnoYgMODqCBUbmlUWn
	 KdJvN31FIk7v8bFpswavRLd1nJNRlxHyh2JcQteYgEDK5ZkdM/g0obJC9W5hcs/42l
	 bL6nhjYGc5UVe8hTlFUWFozJoWi8AAn/dtDN4ACSI2NGB962kUBR0KhsbNO3VgegS4
	 7KGyiejCCZaEjqmmRt1B+Ew0Inm7UjodNwhIocEfmvgNhqwzhzd6NmY5bY4rDxFYhK
	 3vJmpVEumYNHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1749537744; bh=/1QJapm0HGrAtmlVl4f78EPLFilX+qQYq8bKotXtLXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=B9Cyvn4xToYoS+i1ijWSTYgiT0Ib+dIpslkUuDWFXvCwhIzGHfLGDZTJUzso7t+nU
	 Rz54rlTTkSsfWv5m8piIGXpRtp8kYcVAToluIS9h7HEhqp/uVnoYgMODqCBUbmlUWn
	 KdJvN31FIk7v8bFpswavRLd1nJNRlxHyh2JcQteYgEDK5ZkdM/g0obJC9W5hcs/42l
	 bL6nhjYGc5UVe8hTlFUWFozJoWi8AAn/dtDN4ACSI2NGB962kUBR0KhsbNO3VgegS4
	 7KGyiejCCZaEjqmmRt1B+Ew0Inm7UjodNwhIocEfmvgNhqwzhzd6NmY5bY4rDxFYhK
	 3vJmpVEumYNHA==
Message-ID: <e36d3a92-1548-4bce-af35-cb35b4327bbe@skyrain.eu>
Date: Tue, 10 Jun 2025 08:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [oe][meta][PATCH] dropbear: add xauth runtime
 dependency when x11-forwarding is enabled
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250605091828.50442-1-andrej.v@skyrain.eu>
 <912349A0-C95B-487F-80D0-D5402A94ED30@arm.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <912349A0-C95B-487F-80D0-D5402A94ED30@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD2rBWXtZs9ZfnRX8N/lDVcO56Qk8Bi7eUYlLwRlqj/LDdaFFZekMcAFDE+EDwnwMIUSdF+DfHNHXFHefadTFNsthkL1psP8g59YcJrgek/Z8ZU9zrEq
 IBbM320+WMiXbqHiacCP4CGtNHx9SzQzpdP9+cE2uOEmxYMBh2tKZSFkCbkHlxzHjFleyOCGKKCHfO4xSShONOXSEkmwqDAHyJdKo2RZABvM8dhcdjld2KIA
 urSjCoP5BUpSOn2Z1HtLrQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 06:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218317

Hi Ross,

What do you mean by "should be a recommends not a depends"? AFAIK: 
PACKAGECONFIG[x] = "with,without,depends,rdepends", so I would say my 
variant is ok, or?

No, I'm fully on your side to enable the forwarding by default when x11 
is enabled.

Will you take a care of it, or should I?

BR,
Andy

On 09.06.2025 18:54, Ross Burton via lists.openembedded.org wrote:
> On 5 Jun 2025, at 10:18, Andrej Valek via lists.openembedded.org <andrej.v=skyrain.eu@lists.openembedded.org> wrote:
>> -PACKAGECONFIG[enable-x11-forwarding] = ""
>> +PACKAGECONFIG[enable-x11-forwarding] = “,,,xauth”
> It feels like this should be a recommends not a depends (so add another comma).
>
> Whilst you’re here: do you think we should enable x11 forwarding if x11 is in DISTRO_FEATURES by default, or is there a good reason to keep it disabled by default?
>
> Thanks,
> Ross
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218301): https://lists.openembedded.org/g/openembedded-core/message/218301
> Mute This Topic: https://lists.openembedded.org/mt/113482164/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


