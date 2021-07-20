Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.77.1626801116823328092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 10:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE23840BEB;
	Tue, 20 Jul 2021 17:11:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xf9Yxn7jjAR; Tue, 20 Jul 2021 17:11:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B958F40951;
	Tue, 20 Jul 2021 17:11:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3063217463D; Tue, 20 Jul 2021 13:11:53 -0400 (EDT)
Date: Tue, 20 Jul 2021 13:11:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/21] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
Message-ID: <20210720171153.GH1528@denix.org>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-2-alex.kanavin@gmail.com>
 <7304a1fd6d1ccfb9da17ec47125de68035094256.camel@linuxfoundation.org>
 <CANNYZj8hsgF9fkYinpzPdn6gsjhDXWB1YqTFEANGLNhg1vmn7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8hsgF9fkYinpzPdn6gsjhDXWB1YqTFEANGLNhg1vmn7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 14, 2021 at 03:40:03PM +0200, Alexander Kanavin wrote:
> On Wed, 14 Jul 2021 at 14:55, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > At the very least the GCC variable is well used in other layers as it is
> > hard to
> > remember all the different bits of gcc that are listed here so I think
> > that
> > should stay. Some of these can probably be removed but I'm not sure how far
> > we could/should go. glibc's list of recipes isn't trivial either...
> >
> 
> I used layerindex to check. Alternative gcc versions are provided by
> multiple layers (mostly arm-related), but an alternative older glibc is
> only in meta-debian and that is using neither PREFERRED_VERSION directly
> nor the *LIBCVERSION convenience (so not sure how it's meant to be used). I
> will send a v2 with gcc added back.

Reusing those variables is common in layers dealing with multiple toolchains, 
such as external binary toolchains and such. Might be good to keep them in 
OE-Core for consistency:

GCCVERSION ?= "9.%"
SDKGCCVERSION ?= "${GCCVERSION}"
BINUVERSION ?= "2.34%"
GDBVERSION ?= "9.%"
GLIBCVERSION ?= "2.31%"
LINUXLIBCVERSION ?= "5.4%"


> Anyone else should probably just copy the PREFERRED_VERSION lines for what
> they want to adjust into the layers directly. But let's see what Khem says
> - I do think getting help from AUH/devtool in doing the updates fully, or
> at least using 'devtool upgrade' locally to prepare the git trees for
> manual patch rebasing is valuable.
> 
> Alex

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
