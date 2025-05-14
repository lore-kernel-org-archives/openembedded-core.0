Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1892C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:41:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.97620.1747212097514459663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 01:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SBDAqh4w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so67559405e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747212095; x=1747816895; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Hbvile/EI2s8B/bxPdi9ZlBJgB8xK+eJMflWgiIgo=;
        b=SBDAqh4wDgk65cvmWtjAujnXVnym2b9IffvMTIHnSUeCh3xi4J9fU383Q/UCS0dc9I
         S1k06s14T1DoydAg97S5I8fbNICP7ktP5dMPMV2pluwqLxvlDqQoTmSNdhj592iwupBs
         StGkx3o6xXstV0se+VKggg9F+fRd2xOusPCqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212095; x=1747816895;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0Hbvile/EI2s8B/bxPdi9ZlBJgB8xK+eJMflWgiIgo=;
        b=Knyg6A8LKcWWrouJ7CtZX5v08wqnK4t8g32a3dbdzccGDCSoDNENKAQ4RP/lr1G/xg
         3IfEMTEQxezWgoAWHcIZkfuTFJXxEYrV5Em8kijEQ2IfNyTzKM7vVXndybyLuNwhym+T
         PU1SLiB7MAlQ+MwafM4RER5b2l+XK7UlnEl8rM9JaqMQZKx3k9bVhkx9rM/AplVmT5Br
         cy2FKfd9OUqoNNxJQSklrwuhl86g+ItpquVTwY3BX+q7pqTCU8iUR+mNA5FXZpf6Za3k
         wLoVg/ZhS8L8HNNqukvxU1eTyCegwNLdB/dD5ycFnrEk7Eb1Q5fROlka3WaChlpbJjyX
         dlwg==
X-Forwarded-Encrypted: i=1; AJvYcCV89OYj7Rlv5MaftntdFW4z6mZalKe062NBaAdp+AAlPV44B1EGK4IiIEAOJi8pYf3CutVvfpRPOF//ORYGyQDcJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIDNtC/BmJ60DF9qyoFFW0ce+WTmUuRqQQHVoCw7Mdwq7BFBUK
	64UjYQ0lShGsPDhC/pP6bOkcQ+hckwJqpgaNQXUNY+hLzUxOzrNqQ3Aq9BgzOp8=
X-Gm-Gg: ASbGncvXLyn6eJmcyk7OaP7lpEuY2DSO15CXGdxoOIlDh/ElgkAYGcJVpiZiEISYpEW
	cRyS/hu90yxAJaZvaHdaOfraej3ZlR7lh5SUg3uX6czE/7s55LA3zOfOtEE5pWuWqGDBN/95xTA
	sprFK/KyOoTBdhW2Jg2tStbXJoowapGarZ05iIlzBtoqMcOkA94jFoMcVJ52YVrBHO93Migcgsm
	F5GsQOHpfkRmHPME2k6Fl9P1VmyzKL/oixx6LbTHY2UT/+dsAGfra0dTmNJ1v21ySzNg2WNZ00T
	u1MsiBdeQX92grAnZYoIfeS5uqCbrk3ZhhyA5rGGZDpvh50gCBup1ZYZYq9KC+0D1qcVm2R8Wjw
	wxtDB+PnMY3kyHZNs8qxP8rvu44OmDMV2uxEcCZ8z
X-Google-Smtp-Source: AGHT+IEQd50tVJUxbh9zwjGpeKDaUY1Q9X4JNZ5sgFxmWdMBtS0MEfPz8JQB2VvNdvyt3CR2LZc0rw==
X-Received: by 2002:a05:600c:c0f:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-442f2179271mr26467525e9.30.1747212095572;
        Wed, 14 May 2025 01:41:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f397926asm20104665e9.36.2025.05.14.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:41:34 -0700 (PDT)
Message-ID: <276e35cdebf6c10415eeb59a187a2994f1b64b2f.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on Sun 11
 May 2025 01:49:49 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Wed, 14 May 2025 09:41:34 +0100
In-Reply-To: <183F52864AC179B7.11104@lists.yoctoproject.org>
References: <20250511115243.D83E9100407@builder.sakoman.com>
				 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
			 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
			 <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
		 <08371b2e9910aae9eef58828773ed8c196ea3c0f.camel@linuxfoundation.org>
		 <AS1PR10MB5697AF8F027BA971886C12DDFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <183F52864AC179B7.11104@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216488

On Wed, 2025-05-14 at 07:58 +0100, Richard Purdie via lists.yoctoproject.or=
g wrote:
> On Wed, 2025-05-14 at 06:51 +0000, Marko, Peter wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Sent: Wednesday, May 14, 2025 8:46
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > steve@sakoman.com; openembedded-core@lists.openembedded.org; yocto-
> > > security@lists.yoctoproject.org
> > > Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on
> > > Sun 11 May
> > > 2025 01:49:49 AM HST
> > >=20
> > > On Wed, 2025-05-14 at 06:43 +0000, Marko, Peter wrote:
> > > > Sure thing, I have sent 3 patches to yocto-patches on Sunday.
> > > > So far they're not merged...
> > >=20
> > > Sorry, I've been meaning to but there is a lot going on. I'm not
> > > sure
> > > we want to stop styhead metrics quite yet so that means one of them
> > > needs tweaking and I didn't want to push back and as for a new
> > > version.
> >=20
> > I don't think that I have removed styhead metrics in my patches.
> > I have removed only check-layer-nightly and meta-oe-mirror jobs which
> > are I think useless now as there are no new patches accepted.
>=20
> Which is the thing I'd like to see left so that we gather data about
> how these figures change after we stop accepting patches. That is
> useful information to encourage people to update for example.
>=20
> > If those are to be kept, I need a guidance e.g. on when these jobs
> > are to be run for walnascar as I am now reusing "newly free" time
> > slots.
> > If you have a suggestion, please comment on the patches so I know
> > what to change.
>=20
> In order to make those suggestions, I need to go and look at the
> timeslots and work this out, which is the thing I've been struggling to
> find the time to do. I didn't reply as I had a feeling this would be
> the push back so either I replied comprehensively, or I just tweaked
> the patch but a half reply doesn't help other that to show I'm
> overloaded. I will try and get to that this morning. Yes, I feel bad I
> don't get patches handled quickly enough.

Just to follow up, your patches were correct and I had
misread/misremembered something. It just shows review isn't easy, sorry
about the delay and confusion and thanks for sending them.

I've merged them and restarted the appropriate services to allow things
to update.

Cheers,

Richard

