Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A75D46D1E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 23:21:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2014 15:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,627,1384329600"; d="scan'208";a="463794347"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.165])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2014 15:21:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Wed, 08 Jan 2014 23:21:08 +0000
Message-ID: <3583228.liS9SqzWlO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52CD9CAB.5020501@linaro.org>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 23:21:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 January 2014 13:44:59 Trevor Woerner wrote:
> On 01/08/14 10:56, Paul Eggleton wrote:
> > However, one concern I have always had with Qt being moved out of
> > OE-Core though is that I very much doubt the same will happen with
> > GTK+ and GNOME UI components that we carry, which I think will lead to
> > the (perhaps erroneous, but logical) assumption in new users' minds
> > that we support or recommend these more than we do Qt. Given Qt's
> > popularity in the embedded space I don't think this would be the right
> > message to be sending out. Any concrete ideas on how we would address
> > this perception issue?
> 
> Would it be worthwhile to ask that the OE TSC take on the task of
> defining what is "core" and what is not? Does this definition already exist?

If we can't come up with a consensus here, then yes. The trouble is one 
person's idea of "core" is likely going to be very different to another's. If 
your UI is written using Qt, that's going to be core to what you are doing. If 
your UI is a custom one written using SDL you won't give two hoots about 
recipes for building Qt/GTK+ and everything related. Where do you draw the 
line?

Although it hasn't been rigorously defined since the beginning and there are 
definitely some fuzzy edges, I think the selection of recipes in OE-Core has 
worked reasonably well. We should stop from time to time to evaluate it, but 
equally we should think carefully before we pull the whole thing to pieces.
 
> From the moment OE chose to adopt a layered strategy, people started
> questioning how to define a layer and what recipes should be part of one
> layer versus another. But it doesn't seem as though there's been much
> interest in setting any definite rules or definitions in this regard.
> Maybe it would be worth the effort to at least try?

We should certainly have the discussion, yes.

> In my opinion...
> 
> Personally I would be in favour of removing GTK+ and the GNOME UI from
> the core and putting them in their own layer for all the same reasons I
> think Qt should be in its own layer:
> - a "basic" image doesn't need them
> - we can have different layers to track separate major releases (as with
> qt3, qt4, and qt5)

The trouble is, if you have no toolkit at all, how do you test that X still 
works properly? The selection we have provides a single unit allowing us to 
test the entire stack reasonably well without having to add anything else. I 
think that's a valuable thing to have.

> There are so many ways to do GUI "things" on top of a Linux system.
> Frankly I'm not even in a position where I could enumerate all of them,
> or even sort them out:
> - x11, wayland, mir, (directfb)
> (http://en.wikipedia.org/wiki/Display_server)
> - qt, gtk+, wxwidgets, tcl/tk, fltk
> (http://en.wikipedia.org/wiki/List_of_widget_toolkits)
> - xlib, xcb (client libraries implementing x11 protocol)
> - weston, mutter, kwin, clayland (display servers implementing the
> wayland display server protocol)
> - opengl, opengles, egl, ...

Don't forget EFL, SDL (and now SDL2), cogl, framebuffer (w/o DirectFB) although 
apart from EFL these don't really bring much in the way of large numbers of 
associated recipes. To be fair, within OE-Core we have picked a fairly small 
selection of toolkits/frameworks that are commonly used and that make use of a 
broad range of system functionality.

> Maybe if there are significant competing projects which do the same
> thing, then they should be implemented in their own layer:
> - meta-python
> - meta-perl

We have meta-perl in the meta-openembedded repository (with not much in it, 
but there are numbers of recipes "in the pipeline"). I'm also in favour of 
creating a meta-python there as well. In both cases though I wouldn't expect 
to move anything that's currently in OE-Core to there, because generally that 
stuff is in OE-Core to support other items in OE-Core (unless the latter 
changes, of course.)

> And if there are completing projects which do the same thing but which
> aren't significantly large projects on their own (e.g.
> http://en.wikipedia.org/wiki/Comparison_of_lightweight_web_servers) then
> they should form a layer together of their own:
> - meta-apache-httpd
> - meta-http-servers
>   - boa
>   - cherokee
>   - lighttpd
>   - nginx
>
> Or maybe all projects which do the same thing different ways should be
> in their own layer? That way we don't have to distinguish between
> "significant" and "lightweight" projects"
> - meta-scripting-languages
>   - python
>   - perl
>   - ruby
> - meta-http-servers
>   - apache
>   - boa
>   - cherokee
>   - lighttpd
>   - nginx
> 
> And maybe "core" should be just enough to get a console-based image working?

We already have meta-webserver in the meta-openembedded repository - that's 
currently covering all of the web servers except boa and lighttpd (there is no 
recipe for boa, and lighttpd is in OE-Core, but I'm not entirely sure why) 
plus PHP recipes (though not standalone PHP, should probably fix that), and 
standalone web admin UIs. We had a similar discussion around the time meta-
webserver was created; there was speculation (on my part IIRC) that we might 
have a significant growth e.g. in the number of PHP recipes that would warrant 
a specific PHP layer; in the end we decided not to create that layer 
preemptively however, and it's probably a good thing since that growth hasn't 
happened.

To me, the major criteria for creating additional layers is pretty much this:

1) Can you collect a significant number of related recipes together for the 
layer that doesn't really fit well into an existing layer? Splitting out one or 
two existing recipes to a separate layer just adds overhead (both for 
maintainers and for users) without much in the way of benefit.

2) Is there someone (or a small group of people) who will step up and agree to 
maintain the layer?

3) What does it mean in terms of the dependencies between layers?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

