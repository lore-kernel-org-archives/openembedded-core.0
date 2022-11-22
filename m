Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2F8C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 22:29:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5932.1669156130865511447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 14:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U6QlYUV8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD81DE0004;
	Tue, 22 Nov 2022 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669156128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B/UFbt06WCS/QctLo/+MAsj6Lrf/Vl/hWa/dZ2CfpCc=;
	b=U6QlYUV8nmxytGuRb71bA2cTVziVzvzEQEcl7rLCSwCIBTSQLkHS3/exLjMQTrhR+70o6C
	nLfOkPUvMgh4RprPmXnXP9whaGF9EfN0gniK/t82lkbRU15tJ5krB7bxD6Px1mNPjBqWI7
	KfLk7h6LQs2uw5BhrE0TwbNoqnwUowRhrjMEprzJcfh27+/gfeKEBnUPu1ASHI2p+xMNGB
	l4scG3gXQWtOV7mEFEQ2PXxdedQYNPdI2I3idtSYBLJ0H5syY2ZFqirCiKJ1u22dkObSGn
	eDFEVObkbtprbnUF/vH/edB+zF/6DbXDLLWL0a23JbkuWSN+GwIdnZrPI70LHA==
Date: Tue, 22 Nov 2022 23:28:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
Message-ID: <Y31NH+sqmDNMVZPl@mail.local>
References: <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
 <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
 <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 22:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173702

On 22/11/2022 19:32:17+0100, Alexander Kanavin wrote:
> On Tue, 22 Nov 2022 at 19:14, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Rightly or wrongly, this patch will cause large amounts of pain for
> > some portion of our userbase and I'm not sure we have enough
> > justification to do that. That pain wouldn't likely be realised for
> > some time either :/.
> 
> I have to point out that meta-python2 hasn't even received a
> compatibility update for langsdale:
> https://git.openembedded.org/meta-python2
> 
> While this might be 'too soon' to conclude that python2 is truly dead,
> maybe a year (or two, or three) from now it won't be. Fedora has
> already made the switch, Debian will follow, and honestly, I just
> can't muster any sympathy for python2 users anymore. You can't push
> back paying off technical debt forever and expect others to
> accommodate you.
> 
> Let me propose this: a PACKAGECONFIG for the python recipe that adds
> and installs the symlink in a dedicated package. We can keep it off
> for now, but somewhere down the line we could revisit that against
> established practice and what PEPs say then.
> 

I actually like the idea of having a python-is-python3 package so that
affected recipes could simply add it to their dependencies. That would
make it explicit that python is not python2.

> Alex

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173698): https://lists.openembedded.org/g/openembedded-core/message/173698
> Mute This Topic: https://lists.openembedded.org/mt/95156228/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

