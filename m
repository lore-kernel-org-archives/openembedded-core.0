Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QPNay-0007Cm-Id
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:34:32 +0200
Received: by fxm19 with SMTP id 19so314136fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 16:31:29 -0700 (PDT)
Received: by 10.223.14.137 with SMTP id g9mr220141faa.8.1306366289668;
	Wed, 25 May 2011 16:31:29 -0700 (PDT)
Received: from mail-fx0-f47.google.com (mail-fx0-f47.google.com
	[209.85.161.47])
	by mx.google.com with ESMTPS id e16sm56209fak.17.2011.05.25.16.31.28
	(version=SSLv3 cipher=OTHER); Wed, 25 May 2011 16:31:28 -0700 (PDT)
Received: by fxm19 with SMTP id 19so314097fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2011 16:31:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.205.82.199 with SMTP id ad7mr65357bkc.152.1306366287550; Wed,
	25 May 2011 16:31:27 -0700 (PDT)
Received: by 10.204.83.222 with HTTP; Wed, 25 May 2011 16:31:27 -0700 (PDT)
In-Reply-To: <1306360265.27470.71.camel@rex>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
	<1306360265.27470.71.camel@rex>
Date: Wed, 25 May 2011 19:31:27 -0400
Message-ID: <BANLkTimH3Dp_kec8RdHTzicHS5jn5iGG7w@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2011 23:34:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

This thread got pretty long pretty fast, but I am imagining there is some
place still here for me to chime in and build my own understanding of what
we are doing...

On Wed, May 25, 2011 at 5:51 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2011-05-25 at 09:36 -0700, Khem Raj wrote:
> > On Wed, May 25, 2011 at 8:51 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > I did a little research and I'd like to try and help us move forward.
> > >
> > > The "problem" at the moment is both oe-core and meta-ti have u-boot
> > > recipes. If Yocto were to merge in the meta-ti recipe to meta-yocto it
> > > would overshadow the oe-core recipe. I believe Yocto wants to encourage
> > > sharing a core on codebases like u-boot which are receptive and working
> > > to facilitate collaboration (not unlike Yocto itself).
>

I like the bootloader living in the BSP layer, but if the mainline recipe is
something we can all build upon in a reasonable fashion, I can see value in
having it in oe-core.  It would seem an ugly duplicate to put it in
meta-yocto and I'm still quite confused on what is meant to live there.
What is done across the other ISAs?  Are they all living in meta-yocto or do
they pull in from their own BSP layers?

> >
> > > Valid questions are therefore:
> > >
> > > a) What can we do to the u-boot recipe in core to make it customisable
> > > from layers like meta-ti
>

To confirm, this means that building Yocto for BeagleBoard including meta-ti
is *not* an issue outside of the conflicting recipes?  This was something
we'd have needed to resolve anyway, no?


> > >
> > > b) Is it possible for the u-boot recipe in meta-ti to be a .bbappend
> > > rather than a recipe which overwrites the default.
>

You said this recipe is an unpatched mainline, correct?  Creating BSPs with
.bbappend on top of mainline recipes in oe-core seems like a nice approach
from my perspective.  Is that what is being suggested here?  Will all 4
non-qemu BSPs in Yocto's core validation take this approach?


> > >
> > > For a), I know Darren has some patches which drop the
> COMPATIBLE_MACHINE
> > > usage for example and instead raise the skip parsing exception when
> > > UBOOT_MACHINE isn't set which is a step in the right direction. If we
> > > find other issues, lets fix them.
> > >
> > > For b), I talked to Koen and he's going to see how feasible this is
> > > although as always with this kind of issue there are various
> > > complicating factors.
>
> >
> > > Hopefully if we work both sides of the problem we can get this
> resolved.
> > > Darren, if you could send out some of your patches so far (e.g. for
> > > COMPATIBLE_MACHINE) that might be helpful.
> > >
> > > If the ultimate answer is that no, meta-ti has so many changes or
> > > specific requirements that mean it needs to stay a .bb file then lets
> > > cross that bridge if we come to it but I think this discussion makes
> > > sense before reaching that conclusion. Its possible the last release of
> > > u-boot has sufficient beagle support for yocto's needs and we could use
> > > that instead.
>

The mainline u-boot works pretty well for Beagle, as Darren has confirmed,
but I think there are a few useful patches as part of the validation image
for BeagleBoard that have yet to make it upstream due to their platform
specificity.  I am working those as I have time, but I think it is
reasonable to have an approach BSP-specific patches temporarily, no?  I'd
hate to get in a situation where we cannot produce the BeagleBoard
experience that we want.


> > >
> > > Just on a more general note, the agreement on resolving the beagleboard
> > > issue stands as is. The plan is to make beagleboard support in
> > > meta-yocto as near a copy of the meta-ti pieces as possible with the
> > > exception of the kernel where linux-yocto will import the needed
> patches
> > > to demo the kernel tooling functionality. The layer tooling under
> > > development will automate the process of syncing those pieces. I think
> > > everyone is happy with the agreement and we just need to address some
> > > corner cases like u-boot.
> > >
> >
> > so is it just a question of beagleboard support or a broader support
> > for all machines ?
>
> I'm hoping there are some machines out there which have merged support
> into the upstream so simply setting UBOOT_MACHINE = "xxx" in the machine
> config file is enough to get them working.
>

I've used mainline with the BeagleBoard, but I'd prefer if we kept control
over the experience on our platforms and welcome regular encouragement to
eliminate patches.


>
> Basing the system on the premise that every bootloader needs to be
> custom isn't really where we want to be :/.
>

Agreed, but what is "the system" in this respect?  I believe "the system" is
meant to simplify creation of BSPs for every new platform under the sun, so
having a way to work with these customizations seems to be a critical part
of what the system should be.  That said, I take it seriously that after all
this time there are still out-of-tree patches to u-boot that we are using to
support the BeagleBoard and that needs to be resolved ASAP.


>
> > I know various boards use very different versions
> > of u-boot so is oe-core going to bring that support
> > to u-boot in oe-core and maintain that ?
>
> No, the idea would be to make it easy to add missing pieces in
> a .bbappend though.
>
> > IMO keeping oe-core relatively free of machine dependent stuff would be
> better.
>
> I'm still in agreement with this.
>

What confuses me is that this seemed more directed at using meta-yocto or
meta-ti for support of the BeagleBoard, not if we wanted to put
board-dependent stuff in oe-core where I think we all agreed we want to keep
it clean of machine dependent stuff, unless I missed something.  I still
wonder if BeagleBoard doesn't belong in a less vendor-specific repository to
make sure that community developers can adjust it as necessary outside of
TI.  Though, as long as Koen is happy with it living in meta-ti for
Angstrom, it seems suitable to me.


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

