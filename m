Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F32C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 00:13:39 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.14632.1646007217478481542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 16:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=D+BiIVZz;
 spf=pass (domain: aj.id.au, ip: 66.111.4.26, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3F3B85C01B6;
	Sun, 27 Feb 2022 19:13:34 -0500 (EST)
Received: from imap49 ([10.202.2.99])
  by compute3.internal (MEProxy); Sun, 27 Feb 2022 19:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=fHXNlcwMXLDDzzFg2uKrhkSihJ5g+n2FxlUG1t
	iv24E=; b=D+BiIVZz9OTdiRQvZkvbXy7yEgqXijsgisk8ePl4ZM2hwa7zULHo6A
	ZN/UD32VXj+Nib4JmPh5f+DaXsMYUS6qhD8MUzKoaBSu/XCewwmVjrBti7ENbl1D
	cRPkWCNdJ5ykfRACT8XWLKw+qQ+gXjA+1ngPAzPEVhYXL01WHICzdgi3lQajEd2B
	NlBsbs6v539QCc+n9kkPu99TdYeU/O5kRDBbyA8XpbAqC91QS9eTFlt6MdO9klmX
	u+Mof3YKnigvVATEn/jqveMmMSbmxIqNsx/+qO0pasZ84NI4g2+ssvPWuknryUmu
	Ow0Erm0h2QvQ9+wPu8Lj4e+wh80A9sIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fHXNlcwMXLDDzzFg2
	uKrhkSihJ5g+n2FxlUG1tiv24E=; b=J9EjqPlty9cZLMZdMuYHDIkJGC2EFl4/q
	mOoPYCfIM40Sd9hLuFohsVmD4USd6Vtb55SrFqBYjVFckUIaq4C+KRULaujM3e+W
	K07p53WCcgxGxWr68qNtPlC9RtdrXquhHelYKaSPMiW3B7AMzcWLLGcM+Fs53h+g
	+sK2MecWvUJIGu3UtLTdiRGMbZIbM8QysfocZFQVRrWOiIqpQa90vao4gUEkkeL/
	6xJXzZAAyIRuqaeN3RiXY4ZVkm0p9Mmg26CxrdjC6ZxE9uI+gosf08gul7SsDIZb
	CByGqvaCPUocyNCVg9A7X3kN+q27rulPfozadNVjILLwGjpqJylxA==
X-ME-Sender: <xms:rhMcYkOfDo_-lwvpstiZfcX3MFn7QougbENIRMnxcLlMHU_0sEueLg>
    <xme:rhMcYq8dCkCNXuisqsmyH5teOd4nB23ETts4u6W2V20d7jb5MVRLHEmWKQcSwFpjO
    kS9hECUx3KRBQ-FXA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrleelgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeffvefhieefgeefgfetvdfgfefgteetteekudekleegudfhudefvdeuleef
    hfdtueenucffohhmrghinhepghgrthhhvghrrdhhohifnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:rhMcYrQ1rnGe44vVL-vFalzpCrdTquOLEA_DfJiYo-iL4DyNOT_MWw>
    <xmx:rhMcYssBQMqpC8mvd6snMsehAmRku87fpfQuds5kNb-JwqZPYh2VSg>
    <xmx:rhMcYsfpRIyodf_omqK-hty_e_io8yNmlpUjmJwhUC7dNg8ysK4xfQ>
    <xmx:rhMcYmq3zPRBDdnWeIWAPhYDd0-J-iVdJL_u9PIy1eozQa1lbSLBzQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EE64EF60083; Sun, 27 Feb 2022 19:13:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <eed550ec-96ac-4dd4-96e2-ce139db13a5b@www.fastmail.com>
In-Reply-To: <e77a8568-cc54-4706-84a6-718657532662@www.fastmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-7-andrew@aj.id.au>
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
 <e77a8568-cc54-4706-84a6-718657532662@www.fastmail.com>
Date: Mon, 28 Feb 2022 10:43:11 +1030
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 00:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162446



On Wed, 23 Feb 2022, at 11:08, Andrew Jeffery wrote:
> On Tue, 22 Feb 2022, at 20:27, Alexander Kanavin wrote:
>> This needs a better explanation. 
>
> Ack.
>
>>What is the problem and how is it being fixed?
>
> The immediate error was the build bailed out complaining of duplicate 
> sections in the config. Possibly this is an indication of a broken build 
> configuration rather than the code needing fixes

Okay, so the root cause of this was I was setting RUST_{HOST,TARGET}_SYS
to "powerpc64le-unknown-linux-gnu", which matched RUST_BUILD_SYS. I did
that because rustc seems to be quite unhappy when supplied with
`--target ppc64le-linux` or `--target powerpc64le-linux'. I'm trying to
understand why, but I'm struggling because rustc seems just fine with
`--target x86_64-linux` despite none of `ppc64le-linux`,
`powerpc64le-linux` nor `x86_64-linux` appearing in the `rustc --print
target-list` output that I could gather.

How/why does `--target x86_64-linux` work?

Andrew

