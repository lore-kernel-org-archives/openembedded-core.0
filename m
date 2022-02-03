Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <febeb35d45e5847746693437c62e822cc7fc8bcf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 03 Feb 2022 22:21:21 +0000
In-Reply-To: <CAMKF1sr8jxeNZk2svzkLYD+4HF8ehXUg2tm86X5X_dKkTU6+Hg@mail.gmail.com>
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
	 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
	 <CAMKF1sr8jxeNZk2svzkLYD+4HF8ehXUg2tm86X5X_dKkTU6+Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org

On Thu, 2022-02-03 at 14:11 -0800, Khem Raj wrote:
> 
> 
> On Thu, Feb 3, 2022 at 1:59 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2022-02-03 at 18:26 +0100, Enrico Scholz via lists.openembedded.org
> > wrote:
> > > gcc-10+ supports zstd compression of LTO bytecode.  Install the
> > > corresponding package to enable this feature in a deterministic way.
> > > 
> > > NOTE: previously built LTO object files (without this compression)
> > > must be regenerated; gcc will fail else with
> > > 
> > >    | lto1: internal compiler error: original not compressed with zstd
> > > 
> > > in this case.
> > > 
> > > NOTE: it seems to be possible that zstd support is enabled non
> > > deterministically (perhaps by host system pollution).
> > > 
> > > I had the problem that the SDK gcc was built with zstd while the
> > > cross gcc was built without it.  Libraries (built by cross gcc and
> > > uncompressed hence) could not be used with the SDK gcc.
> > > 
> > > Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > > ---
> > >   meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-
> > devtools/gcc/gcc-11.2.inc
> > > index f07a5be507b3..62db035760aa 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> > > @@ -11,7 +11,7 @@ BINV = "11.2.0"
> > >   FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> > >   
> > >   DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> > > -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-
> > > native"
> > > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-
> > > native
> > zstd-native"
> > >   
> > >   LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > >   
> > 
> > Should we be passing some flag to gcc explicitly to configure this
> > deterministicly?
> > 
> 
> 
> Perhaps use —with-zstd configure switch maybe via package config but it’s
> better to enable it always 
> 

Agreed, I'm fine with enabling it, I'd just like to be explicit about what we're
doing.

Cheers,

Richard



