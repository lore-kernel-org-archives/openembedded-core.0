Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B84BE7E34A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 09:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45W9WP2w71z3Q;
	Sat, 22 Jun 2019 11:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561196385;
	bh=Ql+iClbyMhNxHqnVYsLQVHXXZbcbmhg2Ip6m091rVuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJ2Pdxs0wxVot3UogDJM0bTcD+kJdoOo0H5D6kSbX/tm++amgNTxsNDFYnkO0UfC9
	TxoLyjKKfrFkWsAfS8Mk3170itarlwlxMynmvniDbOGLJB5agTXRB6ZsBMz+zNSQNN
	J9Dh58QPMCRNUdjJc1XT/wKCKnFzZ9sa+QswiF42C+7TkkWJmWW7ZPAkd14sW0Gb1y
	dsKz2ZsBF6cKCF5Yu7MKrp7FAQMghiVVk7J7gXwUVjJaRnravYQ/iaZTRimBhS33vj
	TvWsqywUgIb/1h+gBTzqE9ZEuQF13m7LN9hoxO73XWucpGaXmepJml6+C0ajXiBrjI
	EMh20UaSdy34NXTwVo7agQiM52pAOi23NVSR9Y53dMd37uk8l/ZR7tcuB3PE9ohrgK
	Jt26vPYw9PYMT+ygcn2AJC8lTnNfGWbsdiB4xGD0f3cfFjzRXRs/0NkWF7oegFzkE7
	Gw7zicfqe1YGVJG9Okq4KlEPSZYwWJiD35rU2CdJ5ECsUqajbPMI+u1rl8Pyep7qWQ
	F6N93oymXb7bcAAu7xSEvV0WbjaFf7YRzkJw2xt2J+U5Etnf/z+ynTvodW9xcEVID8
	SeavdMapYcyD8pFnCUNG+DlEz6moGFEVFS5dvdZNtpSQlw3NgCKK2e1B923Xx62Bre
	hj6KCy+2hvF0pFQnx1LpLjmQ=
Date: Sat, 22 Jun 2019 12:39:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190622093943.GC9472@localhost>
References: <20190614072956.13672-1-bunk@stusta.de>
	<34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
	<CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
	<20190620071537.GA27107@localhost>
	<CAMKF1soeQ9YreTazqHFbwh-C4AU6H2sr1H5_jNED6+T6K3TTGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soeQ9YreTazqHFbwh-C4AU6H2sr1H5_jNED6+T6K3TTGw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Jun 2019 09:39:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jun 20, 2019 at 11:09:39AM -0600, Khem Raj wrote:
>...
> musl has provided a lot of good cleanup patches for systemd so this is
> not a wasted
> effort even if upstream systemd does not officially support anything
> besides glibc.
>...

I have yet to see a patch that provides actual benefits for upstream,
and my overall impression of musl support patches is that they do more 
harm than good for everything except making musl build.

Like I have a WTF feeling each time !defined(__GLIBC__) is used instead 
of defined(__MUSL__) for musl-only code - as if there were only two
C libraries in the world.

You already did a lot regarding taking code from gnulib to add glibc
functionality on top of musl, and that's the direction that would
have to be followed for more functionality that is missing in musl
or where musl provides the POSIX version instead of the GNU version
of a function (e.g. strerror_r()).

All this is doable, but it's a lot of hacks and workarounds and
not much in generally useful cleanups.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


