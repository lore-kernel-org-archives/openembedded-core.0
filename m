Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 557BD6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 22:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MMGr7q029182; Fri, 22 Jul 2016 23:16:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T3WkKBym1zlJ; Fri, 22 Jul 2016 23:16:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6MMGpeQ029173
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Jul 2016 23:16:52 +0100
Message-ID: <1469225811.23580.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2016 23:16:51 +0100
In-Reply-To: <D060F23D-DAE1-4A6B-8842-D3E177B7B76C@gmail.com>
References: <1469197543.23580.65.camel@linuxfoundation.org>
	<CAMKF1srw4bVtAHrq6uOVU__WueXjoNwKRsvxLNLudt_zFyzrzQ@mail.gmail.com>
	<CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
	<CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
	<1469202930.23580.73.camel@linuxfoundation.org>
	<D060F23D-DAE1-4A6B-8842-D3E177B7B76C@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add mechanism to extend siteinfo information from BSP layer
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
X-List-Received-Date: Fri, 22 Jul 2016 22:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-22 at 11:20 -0700, Khem Raj wrote:
> > On Jul 22, 2016, at 8:55 AM, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2016-07-22 at 08:47 -0700, Khem Raj wrote:
> > > Whats the motivation here. This looks like a backdoor for bsps.
> > > To
> > > user it will make inconsistent behaviour. Even now its quite hard
> > > to
> > > root cause errors due to siteinfo
> > 
> > Right now if you have some new target, your only option is to
> > either
> > patch OE-Core, or copy the class into your new BSP.
> 
> May be we can make an exception and accept patches for these changes
> into release branches
> via master ofcourse

That isn't really helping people doing development work though. Sure,
eventually these changes can be ready for master but I've worked on
things where master never really made sense for various reasons.

> > This is
> > particularly problematic if you're working on hardware that isn't
> > supported by core OE or that is in active development.
> > 
> > Having hooks to allow you to write a new BSP without having to make
> > changes to the core would seem to be a good thing.
> 
> This seems to be fair, however, they will surely keep these fragments
> and supply their BSP to users. who will now have to chase different
> places for finding siteinfo details.

The code is pretty good about printing a list of the siteinfo files its
using so it should be clear if a siteinfo file is coming from a
different layer and which siteinfo files are in use.

> > I'm not expecting users to regularly use this, just those writing
> > more
> > exotic BSPs or doing baremetal work for example.
> > 
> > I can sympathise with the problem as I've run into it several times
> > now
> > myself. We can't really demand that every time this happens, people
> > send a patch for OE-Core (although if something is commonly used
> > we'd
> > obviously then encourage it).
> 
> This could also mean that I can override a definition e.g. size of
> off_t
> for arm in my BSP layer and inject it into a MultiBSP setups where
> others will
> get it too ?

In theory you could. There are an awful lot of things you can do with
the build system which aren't really recommended though. I'm not sure
I'd single this one out as being something we should enforce as not
being good.

Let me put this another way.

The principle is that you can add new hardware support to OE in a BSP
layer. Juro and I tried that and we ran into problems where we could
not make this work without hacking OE-Core meaning the principle
failed.

We made a list and there were three places there were problems. I've
sent patches for two of them, I've proposed a different approach for
the third in the bug entry.

I do feel pretty strongly that OE should have good support of
independent BSP layers and if there are barriers to this, we should
have mechanisms to cope with that.

Yes, there is a risk of abuse but the whole system is so flexible we
always have that. We can document when these things should be used and
also name/shame anyone abusing them.

Cheers,

Richard

