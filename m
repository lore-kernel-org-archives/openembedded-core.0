Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAECC001DB
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 13:38:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.134454.1692106706947857409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 06:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QZlrqhKU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31771bb4869so5036244f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692106705; x=1692711505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E8psupXNyTKkb6EV9VTQQYCnQ9V5TYtpNNaYcxlaCAc=;
        b=QZlrqhKUhZx77dKr0AFsFiwk13Lj2amtlwQulam+knlWl2oTSi/9Thj0mekQDrm9M3
         lgzbRDRTHr02ol/DiS/cI+Z6kz7FngLpnoc8HQ4uYi5DLGUqoCmcGBPEvIBJ18AWIyVc
         dDTP3VXkoQNxx+ZM5RlMkekNFZuWg9VHK8i5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692106705; x=1692711505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8psupXNyTKkb6EV9VTQQYCnQ9V5TYtpNNaYcxlaCAc=;
        b=coMcRXkr2UP/CSfY7sA68cYhSK1KTzvHbUpVpaBfG0jsGcNUgvB/W6jKv+UYmfiU3x
         lgtY8jO2GNnbjrmEE2CeV+/1p9MZgyeoDe0QSCUmEnBYXBrqqzXzBzHDImydzVTurbOL
         GJ+7L9+iAGFN8pOA8uu0PFO7E6WsiE0DVrz46GV3CI6Z6hI2r0tzzhrtB7eNzS8PK4x/
         7SdESv5ThNo6hT9s09kDTE20Jdb7CSAIVb8qIG5v5S6atuvhYu3+ZjAq0nVcbsUZlmYh
         POpGvakIY0V3kDBbWqZSWqtyssSotEIQisTuPzjaWVtavzgWc8QMGv08wdKlLDoVEI9a
         vB1Q==
X-Gm-Message-State: AOJu0Yw2+t8fbqaxOznpGQZrxQC8u98kUtJTFFVYjNrTcJyojr0lR7R0
	pKmbJdjvKaSBJbLq6YLkc0cvaA==
X-Google-Smtp-Source: AGHT+IEaZ5grv6HBbmVft0ClcF1zyXYhJA4NzJiY3HlYXSseucQHLsFGlCu2GUSBScTY+jKvFZix0Q==
X-Received: by 2002:a5d:53c3:0:b0:315:a74c:f627 with SMTP id a3-20020a5d53c3000000b00315a74cf627mr9595851wrw.16.1692106705252;
        Tue, 15 Aug 2023 06:38:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6020:ab41:e8d3:f1e6? ([2001:8b0:aba:5f3c:6020:ab41:e8d3:f1e6])
        by smtp.gmail.com with ESMTPSA id f14-20020adffcce000000b00317a04131c5sm17961232wrs.57.2023.08.15.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 06:38:24 -0700 (PDT)
Message-ID: <ae080c906767f7779112449f52caf4ba71506343.camel@linuxfoundation.org>
Subject: Re: Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Aug 2023 14:38:23 +0100
In-Reply-To: <ZNt45UVb0Ps/kKLM@windriver.com>
References: 
	<1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
	 <ZNt45UVb0Ps/kKLM@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186065

On Tue, 2023-08-15 at 09:08 -0400, Paul Gortmaker wrote:
> [Dilemma on changes - merge or not to merge (e.g. 6.4)] On 14/08/2023 (Mo=
n 10:54) Richard Purdie wrote:
>=20
> > I'm becoming a little weary/wary of some of the changes that are coming
> > in. The challenge is that once they merge, issues become the problem of
> > a very small number of people.
> >=20
> > My current dilemma is the 6.4 kernel. People would like it, we'd really
> > ideally use it for the next release but there are issues.
> >=20
> > I've worked through a few, at least pinning down where the issues were
> > then resolving them with the help of others (thanks Bruce, Jon, Ross).
> >=20
> > Remaining are:
> >   * an error upon boot on preempt-rt on qemux86-64
> >      (e.g. https://autobuilder.yoctoproject.org/typhoon/#/builders/72/b=
uilds/7616/steps/36/logs/stdio)
> >      We'll probably just have to ignore it in parselogs as it has been?=
?
> >      around for a while and nobody seems interested in fixing it upstre=
am.
>=20
> Just back from vacation and I see an internal report of 10-ish at boot
>=20
>   NOHZ tick-stop error: local softirq work is pending, handler #80!!!
>=20
> ..on the 6.1.43-rt10-yocto-preempt-rt kernel, on real hardware.  So it
> seems we can't blame that one entirely on v6.4 kernel (or qemu).

That lets us rule out qemu and maybe look at "stable" series updates?
Any idea if it is there in early 6.1.x or just appeared?

> We used to get (late 3.x and 4.x era) pretty common "NOHZ: local softirq
> pending" messages even on common/popular distro kernels.  But I haven't
> seen those for a long time and they didn't scream "error" or have the
> alarmist three exclamation marks either.

When I was looking around I did see a commit which "clarified" the
message adding the "error" keyword...

> I'll see if I can dig into that further.  This instance is new to me, so
> any additional context or information I might not turn up myself would
> be useful.

Thanks. I don't really have any at this point, I've just been
collecting the failures. Bruce may have more. I have a few too many
issues going on at once atm.

> >   * some random hangs:
> >      https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds=
/349/steps/12/logs/stdio
> >      https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds=
/354/steps/12/logs/stdio
> >=20
> > The latter are rare and intermittent, mainly taking out CI test builds.
> > Most people aren't affected by them, find them hard to reproduce let
> > alone fix and will ignore them. That will leave me/Bruce/PaulG holding
> > the pieces.
>=20
> Ugh.  The RCU one is ugly and the Silent Boot Death one is no better.
> Nobody likes SBD cases.  They suck.

They do indeed.

> > I know Bruce spends a ton of time debugging weird things just to get
> > the kernel to the point we can even consider merging and nobody ever
> > really sees or appreciates that work :(.
>=20
> Well, not "nobody".  There are at least two people who have a good idea
> of what Bruce does.  :-P

Too few would have been more accurate I guess :)

Cheers,

Richard

