Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <bd33a274ed681346e646d72958989125027d5a5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/5] abi_version/sstate: Bump HASH_VERSION and SSTATE_VERSION
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 03 Oct 2021 11:28:06 +0100
In-Reply-To: <CANPvuRktteqc9ttumqAPR+iPFN=xibHMqoNEzfHKFiOwzGyU2Q@mail.gmail.com>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
	 <20211002221803.2283254-4-richard.purdie@linuxfoundation.org>
	 <CANPvuRktteqc9ttumqAPR+iPFN=xibHMqoNEzfHKFiOwzGyU2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Sun, 2021-10-03 at 10:59 +0100, Jose Quaresma wrote:
> Hi Richard,
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sábado,
> 2/10/2021 à(s) 23:18:
> > At this point the hash equivalence and sstate is 'junk' on the autobuilder
> > unforuntately due to the volume of fixes and also the volume of slighly
> > not quite right patches tested during the development of the fixes.
> > 
> > In order to try and help any remaining sanity I might have, bump the
> > version numbers to start with a clean slate so we're working from a known
> > good baseline rather than risk chasing phantom issues. For those
> > upgrading, there wouldn't be much reuse anyway after the changes.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/sstate.bbclass                          | 2 +-
> >  meta/conf/abi_version.conf                           | 2 +-
> >  meta/recipes-devtools/elfutils/elfutils_0.185.bb     | 1 -
> >  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 1 -
> >  4 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 89e9f561787..06a722c735d 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -1,4 +1,4 @@
> > -SSTATE_VERSION = "3"
> > +SSTATE_VERSION = "4"
> > 
> >  SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
> >  SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-
> > ${PN}"
> > diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> > index 35faef9a368..515a6def405 100644
> > --- a/meta/conf/abi_version.conf
> > +++ b/meta/conf/abi_version.conf
> > @@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
> >  # a reset of the equivalence, for example when reproducibility issues break
> > the
> >  # existing match data. Distros can also append to this value for the same
> > effect.
> >  #
> > -HASHEQUIV_HASH_VERSION  = "5"
> > +HASHEQUIV_HASH_VERSION  = "7"
> > 
> 
> 
> Why is it bumped to 7 instead of 6 ?

I'd already managed to break the 6 namespace in testing on the autobuilder. I
don't have any easy way to remove that namespace from the hash equivalence
server. I could likely do it with a lot of manual work.

Sadly there is some deeper issue going on and current master on the autobuilder
is corrupted and even after these bumps, there is some problem creeping back in
and corrupting[1] builds. I'm trying to narrow it down but it is
proving problematic.

[1] the corruption is bad file timestamps so not something really bad but it
does need to be fixed.

Cheers,

Richard

