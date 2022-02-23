Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE5DC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:18:45 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.1362.1645575524254774695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=H31QU5/K;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 733A15C025B;
	Tue, 22 Feb 2022 19:18:43 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 19:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=pungQNqGCaj+ZdPWQW5iiVMmKhcgshxMpnzJyp
	UKGrg=; b=H31QU5/Kmfg6/YUmpyVFFIeC3GvW6o2GXsVy9dkrr1Mty02WuIrig7
	R/0W2O4cclWpf1wUcMKc6iLBHAnskQ0HJez5DQBGa13CvJqQrEPdMY1NBwGsmi+j
	SjRHPeCsh542nCdRtgm+pZdh8GnmfpAlxlBU1q1N/E9bnc8+a5PO3bwPmB0CLOLe
	mL9VI5xn6s3Iwni60+Bo6iEqJVhXlsUsw8a7JzOOSy7dCczn32zpzRiD3Ogy+vmh
	AoiXXnX3rhzxe3RE4T0Ti9zF8OCkdE4px5NC18bh7i5vxTIeTOT3Y0WZ5pzUE3vx
	XygMlFIkFLabefZXYALx/cjPd9u0flXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pungQNqGCaj+ZdPWQ
	W5iiVMmKhcgshxMpnzJypUKGrg=; b=g4Weqx07SDkcVd8FLNbM6JgqKlLbSb2KJ
	J03GT8E89sCqO8JaI8Tm2duau0qZIFkBNHtohOPP+c7eut2bQT7HJb5SqdcFnw8Q
	+Y3q9ucw/DbT1Br5xYzY68grsTAbXhQIwTqgNYYkOTxb0aY3QKrOsVqGfiL1k2aQ
	BbAEPQG3ZobFsgRPlcbLRN3UHUY+RODIiIO6LmRK3MYI1SwP4jKOCBGF4JBqhhqR
	djvsv6uT1HP1Z6V7OqTzVrVfVmGT/DUkoJJINgrOZzkxsZxLoLE3Q0lk6BvnFm4+
	BpDJ9YOqh7IJw/Bdr6mBeHS1/jtm5thp6dkj3HfICfSJrqrTlDYlw==
X-ME-Sender: <xms:Y30VYidwBqT5VAKqshFNWJGdFLQXHXl0lXkXwgnmOffESoh5Eyxrng>
    <xme:Y30VYsPmah1Il2OihiPFpdq0wGkxJUE5POzwjkU57Fr8hiinD4lkgc4SE0-O92B5U
    bDvi-iB6ZN8rdF5xA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefofgggkfgjfhffhffvufgt
    sehttdertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnh
    gurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeefiefhvdelgefhhfei
    tdekvddvkefhvdffjeehffegueefhffgleefhfevueetgeenucffohhmrghinhepohhsuh
    hoshhlrdhorhhgpdhmhigslhhuvghmihigrdhnvghtnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Y30VYjjL-15Wh077G5j0-eo8AnEZ4UfAB4aDXiIO68EgCs0_-FGing>
    <xmx:Y30VYv9CTdYcli2EY_fblFgL9ABI3TWGcnjHwaaqelShi3rr1fgKQw>
    <xmx:Y30VYutkbsoJZb3xhbGwF2VFzXwXHJAgl6Kg7ponJgjaFqDZy5Kj5A>
    <xmx:Y30VYk0XEvEKur93hUs70EfYa3CE_s9v4eZAZoh1im-jY9IhUw2xRw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B9B61920081; Tue, 22 Feb 2022 19:18:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <ee6810ac-3c22-45b0-ac49-e35b38e0f69c@www.fastmail.com>
In-Reply-To: 
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-8-andrew@aj.id.au>
 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
 <CANNYZj_G4Y0=sO7j7VaPeLc8gF6EFGwnuHTKcXhouTKmzODoog@mail.gmail.com>
Date: Wed, 23 Feb 2022 10:47:47 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162234



On Wed, 23 Feb 2022, at 00:53, Alexander Kanavin wrote:
> On Tue, 22 Feb 2022 at 13:28, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
>> > I have to note that YP does not support ppc systems as build hosts;
>> > can this be kept in a bbappend?
>>
>> It isn't official but there are obviously people using it. I think we should try
>> and do something in core but there is a question of how we maintain this given
>> our infrastructure/tests don't cover it :(
>
> Worse yet, there is no way to test this locally either.  If the ppc64
> binary tarball checksums are added to the core rust recipe, presumably
> I'd be expected to update them together with x86 and arm64 binary
> checksums on version updates, but I'd have to do this completely
> blindly with no testing of any kind :( That's why I am asking to keep
> them in an external bbappend.
>
> Andrew, how hard is it to obtain a shell on ppc64 machines nowadays?

(I work for IBM Power Systems)

IBM have partnered with Oregon State University to provide access to 
ppc64le machines:

* https://osuosl.org/services/powerdev/
* https://power-developer.mybluemix.net/#hardware

You can request access to the OSU setup:

* For a shell: https://osuosl.org/services/powerdev/request_hosting/
* For CI: https://osuosl.org/services/powerdev/request_powerci/

So there are some forms. I'm not sure where the bar sits for you with 
respect to how hard it is to go this route, but feel free to reply to 
me privately or via andrewrj@au1.ibm.com if you have further questions 
about setting something up on the OSU OSL infrastructure.

Andrew

