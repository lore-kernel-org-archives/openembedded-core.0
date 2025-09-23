Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F70CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:47:33 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.16061.1758631642612368440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hHYPNbJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5802792f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758631641; x=1759236441; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUk9qnVi/JsV72vwu12d7cWGCglfeYXK4IGdXfIzmqY=;
        b=hHYPNbJ8RCAz4dJUKD+pL25pqbJmo+JzRr3WKE9F10rqDsswlR381hQXnWas2CDTYQ
         HYgqGE/ZwKv/uQRhCcHwmTm7pETzVq0/3xX26SeBpP+0MbFG0UReOszwX/HnknSruevx
         JJETk2L8Wrh4PodhUA/VZ3qIwQGq6E4kDBXxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631641; x=1759236441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUk9qnVi/JsV72vwu12d7cWGCglfeYXK4IGdXfIzmqY=;
        b=Cb1JPfJw4x9KZPb/OppP6aXp8USjRWVkPxBBD8Rbd5fQSy/8AcXo8w1EM0wACz27Ye
         MU5vXaMi4WCmqMrV5PgfKSoE+uVU77XmtqD+7q2JM3K5+ZiIUW0m0P/sNhz3pJ14OyKt
         gyJ7OB23yFtNhVn0TDceTA3kvtBMSy7bbHCyzBKOmFGXIgVj6PBDoC+hulT0f3jv31/O
         rcs0fZ8xxJHwSRex2nt/etqHDS7bycjWRZ5sYI2cXBWKgPRTuHsQi5gQMuD6HitRKFn1
         zzm3aSiOMkR5r8ed+wYT+cFAQn6/Bp/mbskVYR8T3UlYQUo+/RTcIWbsIkOpVvthE96y
         uVow==
X-Forwarded-Encrypted: i=1; AJvYcCWAxyuW+T4NXgj8lQ6s1AUJmdmvpF3CFnVk9GA/DNKY1whdbUpNAMNO6SZywaFFHuE60jLDOXNWgzBtTHYJPhOw3Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBYQUCV9CE3kSjfVQ1jAFiX7G/s+C8G1nMrG6vx7swrHk9+mAr
	p5GKZkubMmKAjMawmjDWpn8agRmQJl3W6zPc5TpzbOorUOrPWqCKCoT30DAzMdfieTmWcLckF+N
	6v5FH
X-Gm-Gg: ASbGncsZSiP6litN4DI+P1x85obT60X5TblicVTzP1TbpmOJwDt9+Jcjeqtsx2huhwP
	sgBJ7rLOpgbb/M66mF4nn51Gxt+5x9EPOZCN6/Gpmix4oXWY3iawa4a04vPp3+sFy+A0E/YdzNV
	WN6Jnia4yUphPpDlZjoIEWzg8SKNNNWRx5HbjWWs8iNUZxhmSBH5E3DEZyfaL0A4NuNZs/baWj4
	Nib1vk173ub70dZXe97kPbRBHCtwmyfCWHSRM1xYKvNDYnIbzbu3g4Y1fGRTHCBvBOZdxVEGqRZ
	903i/gVMAGfnoPdol+tlZc9EYsI7HHRsOU7QYyPPqI1wtD+akpgCLL3Z/2joA3gqhS04mnBWYq3
	13PHbuBXBNN9Uf5N3a/wZATX3LnHgaoCJKCZWaVdrRePIy7+iT+uWg7pRSRy4Akv9WKepMdR1TC
	0p/3iJASzibNGjo4PU1fgljQ==
X-Google-Smtp-Source: AGHT+IHSOKRjC9ms4gr7ta5+dXWQcdVBAIayNA75TX0Ws4x+OnCXKnoX6wM9t9++X16CdJtjGINK2A==
X-Received: by 2002:a5d:5889:0:b0:3e8:e7a6:e5a9 with SMTP id ffacd0b85a97d-405cba9c1bcmr2170536f8f.48.1758631640868;
        Tue, 23 Sep 2025 05:47:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe09:3ae7:900c:f751? ([2001:8b0:aba:5f3c:fe09:3ae7:900c:f751])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbffaeasm23918979f8f.62.2025.09.23.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:47:19 -0700 (PDT)
Message-ID: <201b074a0d05dda923ff4ba10d86d74357cf45d6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add force
 update for future time
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Niko Mauno
	 <niko.mauno@vaisala.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2025 13:47:19 +0100
In-Reply-To: <AS1PR10MB5697B95623B2339AA021CA90FD1DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250826185922.20154-1-peter.marko@siemens.com>
		 <a9a5777d-d622-4e89-9888-3989f884e816@vaisala.com>
		 <PA4PR10MB5707144A5B4B39EEDF739AEFFD16A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
	 <50952460f2bf31d8f1632d20f696a4e06985386b.camel@linuxfoundation.org>
	 <AS1PR10MB5697B95623B2339AA021CA90FD1DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223874

On Tue, 2025-09-23 at 12:30 +0000, Marko, Peter wrote:
>=20
>=20
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Friday, September 19, 2025 0:16
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Niko
> > Mauno
> > <niko.mauno@vaisala.com>; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] cve-update: log timestamps and add
> > force update
> > for future time
> >=20
> > On Thu, 2025-09-18 at 12:55 +0000, Marko, Peter wrote:
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Niko Mauno <niko.mauno@vaisala.com>
> > > > Sent: Thursday, September 18, 2025 14:48
> > > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > > openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core][PATCH] cve-update: log timestamps and
> > > > add force
> > update
> > > > for future time
> > > >=20
> > > > On 26.8.2025 21.59, Peter Marko via lists.openembedded.org
> > > > wrote:
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >=20
> > > > > CVE update is currently not working properly on autobuilder.
> > > > > This improves logging for problem analysis.
> > > > >=20
> > > > > Future time is something which could be reason for current
> > > > > autobuilder
> > > > > problems since the DB was not updated for more than 3 months
> > > > > by now.
> > > > >=20
> > > >=20
> > > > CVE check mechanism, which relies on a CVE database that can
> > > > silently fail to
> > > > update for several months, seems troubling to say the least.
> > > >=20
> > > > Looking at the do_fetch() method in both recipes they seem to
> > > > use the
> > > > os.path.getmtime() method to resolve the last modified time of
> > > > the database.
> > The
> > > > value is however based on database file modification time. This
> > > > seems
> > inherently
> > > > fragile, and I would be curious if there would be a less
> > > > problem-prone
> > approach
> > > > that could be used to resolve the last modified date, such as
> > > > resorting to the
> > most
> > > > recent CVE last modified date. Seems it can be extracted from
> > > > the database
> > file
> > > > by issuing:
> > > >=20
> > > > =C2=A0=C2=A0 select MODIFIED from NVD order by MODIFIED desc limit =
1;
> > > >=20
> > > > I'm not sure if all things considered it is completely
> > > > appropriate to utilize the
> > NVD
> > > > MODIFIED value in this fashion, but it would feel at least less
> > > > hazardous than
> > > > referencing the modification time of the database file itself.
> > > >=20
> > >=20
> > > I was considering multiple options, also using a text file with
> > > timestamp instead
> > of the getmtime.
> > > Your proposal looks nicer.
> > > But I decided to first look at the AB logs before implementing
> > > something.
> > >=20
> > > Unfortunately, my patch to expose the logs was not merged yet :-(
> > > https://lists.yoctoproject.org/g/yocto-patches/message/2083
> >=20
> > Basically I'm worried that this is something to debug a one off
> > issue
> > but we'll be left with files building up on the shared storage.
> > We've
> > multiple other debugging experiments like this from previous such
> > situations. People add them but never remove things.
>=20
> I believe that I have written the patches in a way that they are not
> temporary.
> Then focus on improving logging which will be hopefully kept also
> after the potential rework of timestamp handling.
> Please let me know if this can be merged or in which other direction
> do you think that we could go in investigating the clearly non-
> working yocto CVE statistics.

I get lots of requests to keep all kinds of build data "just in case".
If I said yes to all of them, we'd just end up with mountains of files
in an unmaintainable mess. In fact that already happens, hence the
source of frustration and my reluctance to save more logs, especially
since this isn't apparently temporary for debugging but permanent :(.

I'm frustrated as where I have said "yes" to adding extra files in the
past, they're cluttering up UIs, space on the NAS and it is left to
others to try and cleanup the mess that builds up. These files are
probably only useful to you and you alone since nobody else knows where
they end up, why or how to use them. There is no documentation on any
of this.

Yes, we could develop policies and processes to clean these things up.
Nobody has actually done that though, or has much interest in it, they
just hope someone else does.

I'm trying really hard to sort bitbake-setup and I'm sorry but I simply
don't have the bandwidth to try and work out how to resolve this :(

I guess I just merge the patch and get quietly upset/annoyed/frustrated
since if I'm seen to "block" any form of CVE work, that is a huge
problem too.

Cheers,

Richard






