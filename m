Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web11.20240.1611098897574114471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 15:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.230.112])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 48D8DA25E6;
	Wed, 20 Jan 2021 12:28:15 +1300 (NZDT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: luca.boccassi@gmail.com
Subject: Re: [OE-core] [PATCH v4] util-linux: split uuid in separate recipe to allow bootstrapping
Date: Wed, 20 Jan 2021 12:28:14 +1300
Message-ID: <1814214.taCxCBeP46@linc>
In-Reply-To: <45331765fb689a78bb52363d4fc8f5970693c763.camel@linuxfoundation.org>
References: <20201123132823.3996355-1-luca.boccassi@gmail.com> <2056926.Mh6RI2rZIc@linc> <45331765fb689a78bb52363d4fc8f5970693c763.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 20 January 2021 12:23:34 NZDT Richard Purdie wrote:
> On Wed, 2021-01-20 at 12:13 +1300, Paul Eggleton wrote:
> > On Wednesday, 20 January 2021 09:52:41 NZDT Richard Purdie wrote:
> > > I think the one remaining issue here is the need to change the DEPENDS
> > > of so many other recipes, likely not just here in this patch but in
> > > other layers. I think if util-linux DEPENDS on util-linux-uuid that
> > > might remove the need for those changes? That should still allow you to
> > > break the circular dependency problem?
> > 
> > I have to admit to a gap in my own knowledge of how our build system
> > handles transitive dependencies. Of course the recipe sysroot should
> > still get everything it needs in it even if the dependency is only
> > indirectly included, in the back of my mind I have the impression that
> > there are expectations that all dependencies are explicitly called out
> > and there are subtle issues if they aren't, but that could be a mistaken
> > impression on my part.
> 
> I do wonder a little about that as well. As you say, sysroot
> dependencies should handle this. Anything linking against libuuid
> should also establish an package level runtime dependency through the
> linkage so I think this should work.
> 
> We definitely don't explicitly list every dependency in every recipe.
> 
> If this can work, it makes the migration path for people easier so I
> think its at least worth investigating/testing.

OK, sure thing.

> Just while I'm thinking, the PACKAGES_remove also bothers me a little.
> Can we rearrange the variables so libuuid is only added in the libuuid
> recipe variant?
> 
> [the idea being that since we control the metadata in oe-core, we
> shouldn't need to use _remove and can restructure so we don't need to,
> they're hard to undo. I know we do use it in places sadly even in core]

Yes, that is a good point. We should be able to avoid using _remove and I 
don't like using it either given how heavy a hammer it is.

> > I agree that it would be better being separate, FWIW.
> > 
> > > I am also worried this is going to break AUH and mean we have to
> > > manually handle this recipe but again, I suspect there is little to be
> > > done and we just have to deal with it.
> > 
> > Could we perhaps fix the AUH to handle this properly? Do we need some kind
> > of mechanism to get it to always upgrade the two recipes together or is
> > that only part of the issue?
> 
> I don't know for sure that AUH won't handle it, I just worry about it.
> If it doesn't it definitely could be something we could fix there. I
> just don't know of anyone with the time to spend on what is a marginal
> corner case if it doesn't work.

Well, on the other hand if we're "causing" a problem with the AUH with this 
change it does behoove us to try to resolve that. It is something I'd be 
prepared to look into at least.

Cheers
Paul



