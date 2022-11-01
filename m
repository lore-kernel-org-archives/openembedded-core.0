Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC550FA373D
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 08:12:58 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod2-cph3.one.com (mailrelay4-2.pub.mailoutpod2-cph3.one.com [46.30.211.185])
 by mx.groups.io with SMTP id smtpd.web10.3733.1667290371492012369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 01:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=KuwWXMqN;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.185, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=qjrjzdaOMIciESwQlnBFZzVOOXEz+f74Z3MhbkcRGlA=;
	b=KuwWXMqNRS5RBlC1kKbWTGCApQj1JzW1lhJBf85q3MGH3+z3ujgsCv7uqzPkqc1d9h9evUMVIwA0E
	 Tl6Uczw/h/9lv3s+1Cq4K5MPQudEHjmokGE7woWbrHmc/q+XiNxSkhHEBO5NwHZuik+7BOPeaApJ05
	 /UDhcIs42qyRPKkUJ6MggDqVnf+iOmmmhkutVW9QWhA5/fUha9/Ll/QgOQbvw9fGHBP2CPQvZ9Swkc
	 tAhpPT6zL2gR2n4At16qWbYZ0udtDQZ+nPdYiRcwOtI73MKeOSklW1RP7jjDe5nIEzqURz8GYR87vp
	 wLwwBZDP983P2F6fwBNEhl3Hw8G4Qvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=qjrjzdaOMIciESwQlnBFZzVOOXEz+f74Z3MhbkcRGlA=;
	b=q7CXtsxaL/jRmU3YAZlOCaCMDAzEQZlCvxs1m8hgLSRn1Zh83zBV4ciaTLwQAbrxcum8cHy4PpIXw
	 U2uRPpGCQ==
X-HalOne-ID: f8bf3c91-59bc-11ed-8212-45c065e8efb0
Received: from [192.168.100.34] (ua-213-113-159-147.bbcust.telenor.se [213.113.159.147])
	by mailrelay4 (Halon) with ESMTPSA
	id f8bf3c91-59bc-11ed-8212-45c065e8efb0;
	Tue, 01 Nov 2022 08:12:49 +0000 (UTC)
Message-ID: <35e2faf3-7cc5-a266-12f3-73ef600be8b7@berginkonsult.se>
Date: Tue, 1 Nov 2022 09:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
 <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se>
 <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
Content-Language: en-US
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 08:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172352

On 2022-10-31 22:54, Alexander Kanavin wrote:
> On Mon, 31 Oct 2022 at 22:32, Peter Bergin <peter@berginkonsult.se> wrote:
>> Sure, I can do that. My aim for override those in a bbappend is just for
>> development purposes and nothing I plan to use in production or push in
>> public. My way of working when I realized this was to build latest
>> master of systemd that had a bunch of patches that I would like to test.
>> To do that I needed to change git repo to systemd.git. When tested I
>> plan to backport relevant patches that I need to add to current systemd
>> version in oe-core to my local layer until next systemd release. Then I
>> thought this could simplify things for more people. But I'm fine if this
>> is not accepted for upstream and I can work around that.
> We had a related discussion recently regarding mesa, where there is a
> similar desire to 'reuse' the recipe from core as much as possible but
> build from a different revision. Typically this would be done by
> having some kind of common .inc file (systemd.inc in this case), and
> then adding the missing parts in a custom .bb that includes the .inc
> across layers (bitbake allows this). No promises about keeping things
> in .inc compatible with whatever happens in custom layers though.

This opened my eyes for the way systemd recipes are built up in oe-core. 
It seems a bit the other way around. systemd.inc contains almost only 
version information. systemd_251.4.bb is huge and contains a lot of 
thing that I think can be shared among versions. If it had been the 
other way around it had been easy to have a systemd_git.bb, including 
systemd.inc, in my local layer (or upstream if desired) that build 
systemd main branch. What do you think of that? Is is worth working on 
such a patch? Or are there reasons for that setup?

> Another option is to use the devupstream class, and there are examples
> in oe-core for it. Would that work for you?

I'll manage this but thanks for the tip about devupstream class.

Best regards,
/Peter



