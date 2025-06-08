Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41413C5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:20:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.45344.1749417603149965105
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvznU1ap;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: hiagofranco@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2400926a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749417602; x=1750022402; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUeXfvWXKifc66Yv/ohOQ7BGhb7b2arYdINzQsCjrzA=;
        b=OvznU1apswxCxKDxneRAYBYfXl031NeFVpDFJJym8TPUdenkEnopxsKGWcAuFR+9Gq
         ZqgoilrThxukdkhhFU3UcdA42whGJqdtYklcITU93Ua4/ZyJQyjS77H0CzQkLO1akTo9
         7/aZ0UmRFMBU3NJff+8WdquMWGqJ7Q0CtNLslKqXpxqoomv8ASoem70qFYybAuN8ajdi
         XrQjtU808rombB9Rv1Y85XV6UsDnAOpiQBD0zL7eyIZaQ73+VVV6n6Ys+SupkeQa+Reo
         KWuyIZJNN66nYL2FBWOeit2A6hN+sh6C47QlJfOcD9TYxDwC4CM/BX94Kqv0MZ/hWzt8
         cyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749417602; x=1750022402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUeXfvWXKifc66Yv/ohOQ7BGhb7b2arYdINzQsCjrzA=;
        b=pj1yrIi98ON4UGwHCGSH/z79E9FNoEdUIlQkF51O0xjFhEV6xahWMtGWEOYivGy0+G
         TTxYALqrWPHJ909pvjhKQZHEubNfrhVs4xGA4679632jGodQ9TubijonJZBRRRoB7nGZ
         Ojf3mYVyont5/58ZqaGsM9KsSZQh2hyihJP3Zw4RqLF7p4hLIdDA4ND7EO3wnRbJCWAO
         WpMGf/t/iiuicJPj957n8yau3fE+3QjNd6ICwI9NuJgnIFfrvVjOXlWgCfdnc8D2K22l
         VAmNLCZ0z7LpAyrWcdIjqzc4RPgy8BEIDwvK3y6fc7eMHLVbE0RsQHe/OWFZajh6wFSY
         /YHg==
X-Forwarded-Encrypted: i=1; AJvYcCVOyLlMkFasmsL49f3S71QPD5c59fMyFDcsJ7Xc0DFZ1SBhyjeVaI4hhEDsRdrOxKLTtxFpg/OJXn+PULw7uyrGYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5jkgf1c9Raa4rgDNV08mZzzSn8lcl1A2XCFyDOE98hEeYLcJJ
	D1hFoEYKoEqZYLFDJPupRxq/3PVhuO4ZGjdX0dIhW+BfxdkY6QP58HRM
X-Gm-Gg: ASbGnctoQFz3VySASsw4RlbHUG1R0IhbR+Sq5MHrGfdZq7/DETWuOKkVYf74/kvPkgy
	HDrNhv3M4JY2U7dnNSIhHWmW4/jeVGRe4jm0eEzKJZkFVuY4NVzPyjRx6Azu6ONgHOcnVlUUpx6
	8cEntfXpmpZ64rRVFlg0t2hg0LhqsXK7tlB/e9YpXCJyzzKG3Ae53frIeLLsLsDySUOReLmEsKo
	wWkVJ+9BvycsZ6LgPcbG04+MzsTWr+Uc/esqpb6sRrMkN2IH60PqF1NvotJZAqGB1HrpsvdNAqL
	6RDDsaeN+LCMI1ID3J38Le9WhwVc36oXJcTS5iEfe1hSBIq4QwnXNECBJPMyWA==
X-Google-Smtp-Source: AGHT+IHBzgaag7dgmbfu+vW8bsZpK3hLnUxOUwkJ6L2lBj7LTPhn3gnduoPGmRzIDePE65OEey8i1g==
X-Received: by 2002:a17:90b:4a47:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-313472fc053mr19179424a91.12.1749417602416;
        Sun, 08 Jun 2025 14:20:02 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c2:b9de:1dd2:24c6:bc33:d039])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13ba47sm4368744a91.40.2025.06.08.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 14:20:01 -0700 (PDT)
Date: Sun, 8 Jun 2025 18:19:58 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
Message-ID: <20250608211958.y27bvo74n6l3oyrq@hiago-nb>
References: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com>
 <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
 <20250605194043.nzlanfitchaedeyb@hiago-nb>
 <CAMKF1srYrrHALtb3MzfdPKZOBv_Vc9CvDbK9oXv=bK+echkugg@mail.gmail.com>
 <20250607214859.xtgkq6sirsvnweyo@hiago-nb>
 <CAMKF1sryNXm5K5Ex9fKuooQPHptNQf=-fsuy-6cZwj7tH_rE2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sryNXm5K5Ex9fKuooQPHptNQf=-fsuy-6cZwj7tH_rE2w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218225

On Sat, Jun 07, 2025 at 03:40:18PM -0700, Khem Raj wrote:
> I meant glibc on the build machine not Yocto target
> 

Sorry Khem. We are using a Debian 11 container, therefore it is version
2.31 or "Debian GLIBC 2.31-13+deb11u13".

So I installed Debian 12 to make a test and the build compiles
succesfully, in this case it is using version 2.36 or "Debian GLIBC
2.36-9+deb12u10". Debian 11 would still be supported, right? I followed
the unstable docs and it mentions both 11 and 12. 

If the mistake in os my side, please let me know and I can send a revert
to my patch.

> On Sat, Jun 7, 2025 at 2:49 PM Hiago De Franco <hiagofranco@gmail.com>
> wrote:
> 
> > On Thu, Jun 05, 2025 at 12:53:23PM -0700, Khem Raj wrote:
> > > On Thu, Jun 5, 2025 at 12:40 PM Hiago De Franco <hiagofranco@gmail.com>
> > wrote:
> > > >
> > > > Hi Ross, Khem,
> > > >
> > > > On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:
> > > > > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org
> > <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > Currently the libgcrypt-native build is failing with the following
> > > > > > error:
> > > > > >
> > > > > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > > > > | t-thread-local.c:(.text.startup+0x187): undefined reference to
> > `pthread_create'
> > > > > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference
> > to `pthread_join'
> > > > > >
> > > > > > Backport the fix from upstream and add "-lpthread" to
> > > > > > "t_thread_local_CFLAGS" to make the compilation successfull,
> > similar to
> > > > > > what
> > 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > > > > > does.
> > > > >
> > > > > This has been merged but I’m curious: in what situations does this
> > fail? The commit talks about NetBSD and we’re not seeing this on the
> > autobuilder cluster.
> > > >
> > > > The NetBSD part is from the commit I backported, because I saw this was
> > > > fixed upstream. Looks they were the first to see this issue.
> > > >
> > > > I am not sure why the autobuilder was not able to catch it, we do
> > > > nightly builds of oe-core master with our hardware and the upgrade of
> > > > libgcrypt recipe introduced a regression were all our machines were
> > > > broken.
> > > >
> > > > I attached the do_compile log failure, but the issue happends here:
> > > >
> > > > build/tmp/hosttools/ld: t-thread-local.o: in function `main':
> > > > t-thread-local.c:(.text.startup+0x187): undefined reference to
> > `pthread_create'
> > > > /build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0):
> > undefined reference to `pthread_join'
> > > >
> > >
> > >
> > > My guess is that you are using glibc before pthread merge into libc.so
> > > which could be alma-8 distro or some such
> > > we do have alma-8 nodes on AB but I guess this escaped building on
> > alma-8 hosts.
> > >
> > > Whats your build distro  and version of glibc on it
> > >
> >
> > In this case we are using a custom distro, and an image based on
> > core-image.
> >
> > For glibc, we use the one from oe-core:
> >
> > $ bitbake-getvar -r virtual/libc --value PN
> > glibc
> > $ bitbake-getvar -r virtual/libc --value PV
> > 2.41+git
> >
> > [...]
> >
> > Best Regards,
> > Hiago
> >

Best Regards,
Hiago.

