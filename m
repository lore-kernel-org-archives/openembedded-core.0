Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <bf445a1a2a0e84add6c6b3b07535a0816f6bfb23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: Tweak for mips n64
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 10 Dec 2021 16:02:40 +0000
In-Reply-To: <CAMKF1spkNvS0BXqXd2r_RMjFnEUKYz4jP-mqPb58tVp1efSkfQ@mail.gmail.com>
References: <20211210120524.670148-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1spkNvS0BXqXd2r_RMjFnEUKYz4jP-mqPb58tVp1efSkfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org

On Fri, 2021-12-10 at 07:56 -0800, Khem Raj wrote:
> 
> 
> On Fri, Dec 10, 2021 at 4:05 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > With the changes to binutils, perf's direct calls to ld break for mips n64.
> > We already have tweaks for n32 so match those with the ones for n64.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > kernel/perf/perf.bb
> > index 7bbc1ad70c5..ec0c6efe15f 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -125,9 +125,11 @@ PERF_SRC ?= "Makefile \
> > 
> >  PERF_EXTRA_LDFLAGS = ""
> > 
> > -# MIPS N32
> > +# MIPS N32/N64
> >  PERF_EXTRA_LDFLAGS:mipsarchn32eb = "-m elf32btsmipn32"
> >  PERF_EXTRA_LDFLAGS:mipsarchn32el = "-m elf32ltsmipn32"
> > +PERF_EXTRA_LDFLAGS:mipsarchn64eb = "-m elf64btsmip"
> > +PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
> > 
> 
> 
> Hmm this tells me that the default is not really changed in binutils to use
> n64 abi with out the patch to binutils configure 
> 
> N32 patch above is perhaps fine because that’s not our default 
> 
> Perhaps we need to check a bit more here as to what’s going on

In the x86 case, ld looks at the existing object files and sets it's emulation
mode accordingly if none were specified. It seems mips lacks this and there was
a binutils patch which changed the default which I have dropped in -next. The
N32 case is another example of it which we never patched. Unlike the gcc case,
there is no option to change the default when compiling binutils.

Most of the time we don't need that patch as programs use CC/CCLD for linking
and the correct flags are specified there through the gcc driver, perf is the
only one in core which seems to use ld directly like this.

We could start to try and fix the autodetection for mips in the compiler but for
an architecture which has minimal mindshare, I'm not sure it is worth the
effort. Using the same approach as we already have for N32 and dropping the
patch seemed like the reasonable course of action?

Cheers,

Richard



