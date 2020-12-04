Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web12.12447.1607079103498331388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 02:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1kl8gf-0001U1-3i; Fri, 04 Dec 2020 11:51:41 +0100
Date: Fri, 4 Dec 2020 11:51:41 +0100
From: "Phil Blundell" <pb@pbcl.net>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
Message-ID: <20201204105141.GU30831@pbcl.net>
References: <20201203133526.2075-1-twoerner@gmail.com>
 <036904F4-E7CE-4A5D-B940-DF360F2AAED9@pbcl.net>
 <CAHUNapRs_1Dz6ARBfgLk7i3DXx0HHbRgC5u7U=3njQb3ht4cbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapRs_1Dz6ARBfgLk7i3DXx0HHbRgC5u7U=3njQb3ht4cbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 05:35:23PM -0500, Trevor Woerner wrote:
> On Thu, Dec 3, 2020 at 5:25 PM Phil Blundell <pb@pbcl.net> wrote:
> 
> > If we're talking about OpenGLES applications, wouldn't you already have
> > opengl in DISTRO_FEATURES?
> >
> 
> Not necessarily.
> 
> Adding opengl to DISTRO_FEATURES really means "enable a bunch of
> PACKAGECONFIGs all over the place because I need x11 and mesa with all the
> bells and whistles".

It sounds like there are a few things that have gone wrong here then.
Firstly, "opengl" in DISTRO_FEATURES isn't supposed to imply anything
about x11.  If it does, that's just a bug.  It should indeed enable opengl
support in other recipes, though.  Can you give an example of the sort
of thing that's getting enabled there that you don't want?

But secondly, thinking about it again, there's no reason for mesa itself
to require opengl in DISTRO_FEATURES anyway.  Mesa itself is what provides
the GL API so it clearly doesn't depend on it.  I think that existing
DISTRO_FEATURE check in mesa is just bogus and should be removed entirely.

> As I mentioned to Khem, I added this patch in order to support the changes
> I made to the recipe for glmark2 in meta-openembedded. If those can be done
> in a bbappend in the BSP layer then I'd be happy to re-asses, but I don't
> think they can.

It's a bit hard to say anything intelligent about that without knowing what
the changes are.  Can you summarise what the issue is?

> Maybe a better question is: does adding this DISTRO_FEATURE hurt anything
> in oe-core?

Clearly it doesn't actually break anything, but it's going to be a bit of
a maintenance burden because it won't be very obvious to anybody else
working on the recipes what it's supposed to mean.

p.

