Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC7EC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:39:11 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.1561.1645576750626212163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=aEKuGRw4;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C6B165C014F;
	Tue, 22 Feb 2022 19:39:09 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 19:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=Y4oR3kqJVoMnIxLMX9dF7JmCHoN7T91nbfaPCz
	c2rU0=; b=aEKuGRw4QNP7RiLEbXW6joBlFuDVfgcFHejIYWWUXjZ+7wDJtCiWhu
	I0+IbyrkDe2hRIim8yAodIE+JyzPRqSzl+ZikwC6jC/tIC18XZu/k4CFZPM65ymL
	PV9m6ozWryiov/9gmHii3cIRSauYd0iWerU7BhpBIr9N2WnqJmNMDkYD/i6Svu/Z
	vQygLwogRIFEnNfFYzVkSMkiU9dOrBq0WPQzcL/4r/0a+L4X99RVWL18CdRO2wuU
	oR7HX967Th1mUu0Cmhh3ynlBDlEMnghBWMEApt4gbZYrPPHxilTrUcqCkM6ApkUV
	bAgU8ou9mSQBwnPhCxG+nwZ23uQ/RoxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y4oR3kqJVoMnIxLMX
	9dF7JmCHoN7T91nbfaPCzc2rU0=; b=l0WnAeMjyaWf7HeP/2DRyNV8UVRmg7Mx9
	u7DvZsovMcXuHY7R4Gvf888l5la4qh9tXkDu1mieZdzhniVjqCYUjnbdmjJJ8x6b
	jusBIG91hCVGdixK/eN0iLtC418/MrOq/QC/P6+GxBOWAMppeYbZmmIG8xcdSrbi
	K5KGFkfjsXTKEwDJiSkpFDns+E3qkJRS870i71kSU6oQ2DHwSLmzrLL/GIG7QD6B
	9xV9ExaoVFngaulFfSHnBrKuWmXd1lV5kPyn7fjhGoNgl0Vn8XE8AuraOtrd6Ekp
	DsSZ+V+KHObwjZGagPql9UEL1MvBAPRoRYljogWBKRibAFO3W19nA==
X-ME-Sender: <xms:LYIVYhTk3r3tt7-GS6yzIhRFFPpDIWdZAXlfv4JKGhDesTTbB_ECAg>
    <xme:LYIVYqwwN_tedN5F9WO5qzgkHgfAhvDIS5QT6Z4bmO2CDXIEU5-6uu6-dQanHfDtW
    HPVFUBOFTbjs_XAPg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:LYIVYm2ZKoqUEsqpCUjxqhSSBk7cggmvA6RL0OnW5_8SN_oTLicmKg>
    <xmx:LYIVYpCtWlUkruSw-f52OlP5V1vaH2uFJ4vCp3QKM3Txixu5v2FUBw>
    <xmx:LYIVYqgKj-zRtxtLh9T-unERywLCTexbJ31l2bBrU5MmeWJ6l6h5_w>
    <xmx:LYIVYgdN-PV9XUNNEYZnRoO31h2Qg8R-lyjiWm0ELt9wZFOxCdsuig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8BB561920081; Tue, 22 Feb 2022 19:39:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <e77a8568-cc54-4706-84a6-718657532662@www.fastmail.com>
In-Reply-To: 
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-7-andrew@aj.id.au>
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
Date: Wed, 23 Feb 2022 11:08:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 6/8] rust: Mitigate duplicate sections on
 matching
 architectures
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:39:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162236



On Tue, 22 Feb 2022, at 20:27, Alexander Kanavin wrote:
> This needs a better explanation. 

Ack.

>What is the problem and how is it being fixed?

The immediate error was the build bailed out complaining of duplicate 
sections in the config. Possibly this is an indication of a broken build 
configuration rather than the code needing fixes, but this is how I 
made the problem go away. As mentioned I kind of just slashed my way 
though everything. It deserves some closer analysis like you stated 
above.

Let me take some time to get a better grip on what's happening here.

Andrew

