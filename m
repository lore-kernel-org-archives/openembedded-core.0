Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ccc03e4c8ed10bb855908a2595e0185412a3fb52.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Oct 2021 15:29:34 +0100
In-Reply-To: <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <16A68880435BB472.28512@lists.openembedded.org>
	 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
	 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
	 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
	 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
	 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
	 <CA+chaQctdc_sUpmvs-vN0RatkOx=JoMnVZCqY+WjxGfXOYX0fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

On Mon, 2021-10-18 at 16:12 +0200, Martin Jansa wrote:
> On Mon, Oct 18, 2021 at 1:50 AM Andreas Müller <schnitzeltony@gmail.com>
> wrote:
> > On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > 
> > > FWIW: I've fixed some bigger layers where pkgconfig was causing quite a
> > > few
> > build failures,
> > > 
> > Had an off-oe time due to  heavy work load.
> > Think this one is the reason for the pkgconfig patch flood. You are
> > aware that there are packages not failing at build time for missing
> > pkgconfig but build output is different and bugs will pop up at
> > runtime.
> > 
> > To avoid responsible maintainers have to go through EVERY recipe (and
> > combination of PACKAGECONFIGs) and check if builds are still as
> > expected - Can't believe it!
> > 
> 
> 
> Not sure why this seems targeted to me.
> 
> Yes I've tried to fix whatever issues this change caused in my world builds
> and I'm partially responsible for pkgconfig patch flood, because I wanted
> layers like meta-ros/*, meta-qt5, meta-qt6, meta-webosose/* to stay compatible
> with oe-core whenever this change from RP is merged to master.
> 
> I've also tried to compare buildhistory and image content (for ros-image-world
> with ros1-melodic) to see if I can spot more cases of non-fatal build output
> changes as in collada-dom and unfortunately there is a lot of noise in
> buildhistory (due to many recipes included in this image not really build-
> reproducible), so I've used mostly installed-package-sizes.txt file to spot 2
> more recipes where the size was different (but both don't seem to be caused by
> pkgconfig-native in the end).
> 
> I did both builds from scratch without sstate, so I would assume that it will
> catch all possible cases, but surprisingly just yesterday I've caught another
> missing pkgconfig-native in one of meta-ros1-melodic recipes (caught in
> kirkstone based build - while before I was testing on top of a bit older
> honister with this change cherry-picked just for test - to prepare recipes to
> be future-proof for kirkstone).

I take responsibility for merging the pkgconfig-native change in behaviour. I
did wait until after honister and only merged to master.

It does highlight a real world problem with recipe dependencies since if some of
these recipes are only indirectly depending upon it, changes in those other
recipes could silently break the recipe in a similar way to the gperf breakage
we just saw (which thankfully shows an error). I therefore do think this is
worth fixing.

Cheers,

Richard




