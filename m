Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91121C3ABC5
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 06:58:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.96516.1747205916414336677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 23:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WnN3kD6O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so74088955e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747205914; x=1747810714; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3SXv0jkB7tMNOSx0WGvyckqDfi1wNHDklZTnLbRRGo=;
        b=WnN3kD6OxHwdVonb3KJa4q2jbTAwDQ2GGxgFiEfyukxwaS5gaZwE+kkTbiO57VDFBe
         3oVB76A07ATVsSHVZngSdoW3oBGXVn4GnfDWQtze48Se4DtGP+HaznaiEs+aNY/RHToj
         unuz3tU0asaggDIgfN/2EeQYYumqQMDJmL9ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205914; x=1747810714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3SXv0jkB7tMNOSx0WGvyckqDfi1wNHDklZTnLbRRGo=;
        b=T1d+x42fHE90UhHz56QijbSnmtGtqIZbFjvNrfc0+8QdvTaeeQ2THpXL4NOOKMEOQF
         zpLZelXBruXGCRuZrbTp290vIRERuvuOR6gdwxLyunZ/pytCZKfheAk/HBqHw+pdoA/c
         v6zj/VueQyomGFM3F+QZb5qb2ANKSmIm9xsuUXOavDfVEeKEViYzlpbInsEqWQ8KdL7I
         Qq2vIEPydD2of0I1KcO6WlJZkt5GzepQAnQh+JD94f+t8JmtQCgZ5L8WjuSNXxJqZndl
         R1QzLi5wmCP1Q2vzHb7kxivNI0pk45VTBmpEdL7xvXs8WoLcUwizStFgwBSwGnr5epbB
         yCew==
X-Forwarded-Encrypted: i=1; AJvYcCXIqHyntGMu+D+8haCV9AsOTOQJJQDzHgsiySkhH/vMHQN+i3kHLjofuY5Hd81V0i3HNcooZi35HRTtzaACnBGZ0Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxaYZvpfr9CzK6gDOZ+0iM8BwVzzshrdRPARouVF1n6AR8m5o5u
	q4v45DF24/fpevCnlinWm8pCcQL/jcZo2hYRyUbZu0tpLkirrkbabZs/IuwFAWs=
X-Gm-Gg: ASbGnctontwgGqMtuhvwpw1mE1X2QGBt0dX1cmr/M2fS2tPE+BwRDh5gQvYCsIo4IIK
	I4yv6dY1lCXx0XLjObdj/upNy/r8MOMEx1W1KKFQbnoAwsbGboMb676e6BWzcVw6mH0FOyk+TAu
	2BFOx4MXmQpsvwtN8Ngms+T2DCYY8Bxe7sywaKMml95p3xBoywMkMa5M8UHK7ALc0MlAL2MeF2v
	E+i+7+pw0utFHlHyFvs3ydUF/+iF7lasqCnkNg5NiAeFYhAqswOKCcgi12WgkqFVqfyPXutEYW2
	ic+hUJ4qneh5qiAfxthuu9Iksd7JmsXpwrU8CGk3L+8lz/MGAAv6FElH5ZT8d6TfddpeMWldiFc
	/Q9ERGR54O5LsDANOeqQNTB5NgyGp8C6jTxSqbIiL
X-Google-Smtp-Source: AGHT+IFK+YJHg7f4I8nJ/xrCfv+/uxnJigrtcxdxRdYsqhtH6J0XNqG8guqTz/9v+4gDMEipBROw6w==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-442f20bae9amr17659335e9.6.1747205914413;
        Tue, 13 May 2025 23:58:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f32b46casm17196435e9.0.2025.05.13.23.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:58:33 -0700 (PDT)
Message-ID: <7e12b3a35312989460afc1d9df55013ce2f22f9f.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on Sun 11
 May 2025 01:49:49 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Wed, 14 May 2025 07:58:32 +0100
In-Reply-To: <AS1PR10MB5697AF8F027BA971886C12DDFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511115243.D83E9100407@builder.sakoman.com>
			 <AS1PR10MB5697B496C5947EC961F51DBFFD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
		 <3a5a047bd48aae6576a4422f421616211b1a262d.camel@linuxfoundation.org>
		 <AS1PR10MB569724059D582CAF8A6A2A8CFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <08371b2e9910aae9eef58828773ed8c196ea3c0f.camel@linuxfoundation.org>
	 <AS1PR10MB5697AF8F027BA971886C12DDFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 06:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216478

On Wed, 2025-05-14 at 06:51 +0000, Marko, Peter wrote:
>=20
>=20
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Wednesday, May 14, 2025 8:46
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > steve@sakoman.com; openembedded-core@lists.openembedded.org; yocto-
> > security@lists.yoctoproject.org
> > Subject: Re: [yocto-security] OE-core CVE metrics for walnascar on
> > Sun 11 May
> > 2025 01:49:49 AM HST
> >=20
> > On Wed, 2025-05-14 at 06:43 +0000, Marko, Peter wrote:
> > > Sure thing, I have sent 3 patches to yocto-patches on Sunday.
> > > So far they're not merged...
> >=20
> > Sorry, I've been meaning to but there is a lot going on. I'm not
> > sure
> > we want to stop styhead metrics quite yet so that means one of them
> > needs tweaking and I didn't want to push back and as for a new
> > version.
>=20
> I don't think that I have removed styhead metrics in my patches.
> I have removed only check-layer-nightly and meta-oe-mirror jobs which
> are I think useless now as there are no new patches accepted.

Which is the thing I'd like to see left so that we gather data about
how these figures change after we stop accepting patches. That is
useful information to encourage people to update for example.

> If those are to be kept, I need a guidance e.g. on when these jobs
> are to be run for walnascar as I am now reusing "newly free" time
> slots.
> If you have a suggestion, please comment on the patches so I know
> what to change.

In order to make those suggestions, I need to go and look at the
timeslots and work this out, which is the thing I've been struggling to
find the time to do. I didn't reply as I had a feeling this would be
the push back so either I replied comprehensively, or I just tweaked
the patch but a half reply doesn't help other that to show I'm
overloaded. I will try and get to that this morning. Yes, I feel bad I
don't get patches handled quickly enough.

Cheers,

Richard

