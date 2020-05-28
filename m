Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.19382.1590692675039552268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 12:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=X+D1kBYD;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=eclz=7k=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Xxvd6X2Dz2Q;
	Thu, 28 May 2020 21:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590692671;
	bh=+2MaGy+TTGn7vSczkhVHcRu0AoPgw8g++ZeH+EGYk6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+D1kBYDpreLlUFJBBt4a1BpaDJ5BeGonqU1si6rYSWqh5jZ33xi99G1SW5VKZV3h
	 uiyXzPP2YxthZI95rvjnZLGnftsZMZEnNtbiZO6/H1hSu83kRStKzuOrRv0thm89nV
	 7LzcM0okmfbVeAF3JAadeeMMTqaL5FDid+UXm/xys9+Y1DpWvJNDT8MtRB9v5C+sSh
	 RXb3amv6mtJT1yWvcINgGxsoY3BWVUztbwZCM9sbNQ7eiNSG5pgxmlWEzwLjaLIJcJ
	 x17ZK5qPZ0q4Tn7kR6BjjFPjVqpsm8Pf3m+2DKtVT7MZYgz9VJVg0tLEn9SwA1WCE0
	 ayxqK3yRIzIh0ZU3xceqsuwQ8a0MepwCEBde8O9d8PuG1qGwotO79jbzKtpPuyROOM
	 rVbqZgjQabvoQYsR/8nXcSiJ2HZdJkfSumXvEt4iTknxD25dU+O5r7dCP7NxmIbYq2
	 iowAyRDOqz2gPFwWfODLRN+sXOMfsm8Ie7S0sXFyLqligjiWV2xzMvezIx53UTBQBP
	 /C7A7wsuZ8LGUgVWbP2EFQwDE5buiZHPm0XibRKTD9vo6XfZnFeTkdrhjuDnE0xi0Y
	 akf4uunOgzzGnTQf7VzQgYVPYyQBMXliL0M7FRLXmwIPIV+iq4xdq8wtwWYJrSrUGd
	 UT9ZlbdNGamolgF2+uIahXNA=
Date: Thu, 28 May 2020 22:04:28 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528190428.GA996@localhost>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost>
 <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 28, 2020 at 10:38:15AM -0700, Andre McCurdy wrote:
> On Thu, May 28, 2020 at 6:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, May 28, 2020 at 02:20:02PM +0100, Richard Purdie wrote:
> > >
> > > Right, external toolchains I can understand having specific version
> > > requirements. What I don't really understand is external toolchains
> > > would come with their own headers in most cases I can think of?
> >
> > What I don't really understand is why kernel 4.1 was mentioned
> > in the submission.
> >
> > At kernel 4.1 times the latest gcc was gcc 5.
> >
> > gcc 5 is not even supported as host gcc in master,
> > and target builds are only tested with gcc 10.
> 
> Is that an argument that users with an older vendor kernel should not
> update to newer versions of OE? Or that OE should provide older
> versions of gcc (in addition to the default) in order to support older
> kernels?

It is an argument that ancient external toolchains will anyway not work.

> And where does it leave OLDEST_KERNEL (currently set to 3.2.0)?

OLDEST_KERNEL is just what is passed to glibc as lowest supported kernel,
other OE components might have higher version requirements.

> If even kernel 4.1 is too old to be used with OE master then
> OLDEST_KERNEL looks like it should be updated to avoid giving users
> with older kernels false hope.

linux-libc-headers are the headers used by the C library in the
toolchain, this is unrelated to the kernel running on the target.

cu
Adrian
