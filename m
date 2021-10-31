Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f8a5b173df2c92c044cc6dcd1d99c7ef591d07b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libgfortran: Set GFORTRAN
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 31 Oct 2021 17:39:21 +0000
In-Reply-To: <CAMKF1sq6C0OOCH+9ff_ebp4Wqd9diA0x3c=fAJ_1D=64nX06jw@mail.gmail.com>
References: <20211031172946.3481648-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sq6C0OOCH+9ff_ebp4Wqd9diA0x3c=fAJ_1D=64nX06jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org

On Sun, 2021-10-31 at 10:38 -0700, Khem Raj wrote:
> 
> 
> On Sun, Oct 31, 2021 at 10:29 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The libgfortran configure sets FC to be $GFORTRAN. We did used to patch
> > that out but rather than carry a patch to gcc, just set GFORTRAN as
> > needed.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/gcc/libgfortran.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-
> > devtools/gcc/libgfortran.inc
> > index 344ec5e21ef..e810146d4d1 100644
> > --- a/meta/recipes-devtools/gcc/libgfortran.inc
> > +++ b/meta/recipes-devtools/gcc/libgfortran.inc
> > @@ -5,6 +5,11 @@ EXTRA_OECONF_PATHS = "\
> >      --with-build-sysroot=${STAGING_DIR_TARGET} \
> >  "
> > 
> > +# An arm hard float target like raspberrypi4 won't build
> > +# as CFLAGS don't make it to the fortran compiler otherwise
> > +# (the configure script sets FC to $GFORTRAN unconditionally)
> > +export GFORTRAN = "${FC}"
> > +
> > 
> 
> 
> Is this something we will need for general Fortran programs too now ?
> 

No, it is specific to the ligfortran configure script.

Cheers,

Richard


