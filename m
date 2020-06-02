Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.1346.1591132526296159072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 14:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jgEFo-0004Ts-CQ; Tue, 02 Jun 2020 23:15:24 +0200
Date: Tue, 2 Jun 2020 23:15:24 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
Message-ID: <20200602211524.GC2207@pbcl.net>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> I understand the concern, I am a little torn on this as adding in too
> many different controls and options complicates the test matrix and
> makes things harder for users.
> 
> You're effectively suggesting a new DISTRO_FEATURE to control this? or
> maybe better, perhaps a glibc PACKAGECONFIG?

Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
outside glibc needs to care.

Here are the scenarios that I think matter, ordered from simplest to
most complex:

1. Immutable filesystem, every library installed in the place where
ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
In this case, we don't want ldconfig (because it can never do anything
useful), we don't want ld.so.cache and we don't want ld.so.conf
because they would cause ld.so to do extra file loads and computation
but end up with the same result that it would anyway.

2. Immutable filesystem but some libraries are in places that ld.so
wouldn't automatically know about.  In this case we do want ld.so.conf
and ld.so.cache, but we still don't want ldconfig.

3. Mutable filesystem where arbitrary binaries can be installed in
arbitrary places.  It's probably debatable whether ldconfig is needed
in all these cases, but clearly it's needed in some and I think at
this point it can be left to a DISTRO decision how exactly they want
to optimize things.

I think right now oe-core supports #1 and #3.  The proposed patch
seems to be aimed at #2, which is a completely valid usecase, but
my concern is that we don't want to pessimize #1 in the process.

There is a whole parallel discussion to be had about the merits
or otherwise of ld.so's hwcaps mechanism.  meta-micro has been
carrying a patch for about a decade to turn all that stuff off,
on the grounds that it's just a loss on any kind of embedded
environment.  Maybe I should make some effort to get it upstream
as an option.

p.

