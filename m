Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <419808b5ff897fc36da87a91143370bda43e3cdf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] mirrors: Switch glibc and binutils to use shallow mirror tarballs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Mar 2022 15:16:21 +0100
In-Reply-To: <5ad842968691474f8671615154122c87@axis.com>
References: <20220330122344.1507091-1-richard.purdie@linuxfoundation.org>
	 <5ad842968691474f8671615154122c87@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Thu, 2022-03-31 at 14:09 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 30 mars 2022 14:24
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH RFC] mirrors: Switch glibc and binutils to use
> > shallow mirror tarballs
> > 
> > These two repositories are large and overload our downloads server as a
> > premirror but the recipes are easier to maintain as git urls. Compromise
> > and use shallow clones for them.
> > 
> > In order to be effective, we need premirror entries on where to find
> > the shallow mirror tarballs.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/mirrors.bbclass | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> > index 37dc449ade7..ffdccff5fb4 100644
> > --- a/meta/classes/mirrors.bbclass
> > +++ b/meta/classes/mirrors.bbclass
> > @@ -76,3 +76,14 @@ git://git.gnome.org/.*
> > git://gitlab.gnome.org/GNOME/PATH;protocol=https \
> >  git://.*/.*                   git://HOST/PATH;protocol=https \
> >  git://.*/.*                   git://HOST/git/PATH;protocol=https \
> >  "
> > +
> > +# Switch glibc and binutils recipes to use shallow clones as they're large
> > and this
> > +# improves user experience whilst allowing the flexibility of git urls in
> > the recipes
> > +BB_GIT_SHALLOW:pn-binutils = "1"
> > +BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
> > +BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
> > +BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
> > +BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
> > +BB_GIT_SHALLOW:pn-glibc = "1"
> > +PREMIRRORS += "git://sourceware.org/git/glibc.git
> > https://downloads.yoctoproject.org/mirror/sources/ \
> > +              git://sourceware.org/git/binutils-gdb.git
> > https://downloads.yoctoproject.org/mirror/sources/"
> 
> Please use PREMIRRORS:append here, or you will wipe away any 
> default configuration of PREMIRRORS defined using "?=".

No, I'm not using append here since I do want users to be able to reset this. We
should change the default to "=" if that is causing an issue.

Cheers,

Richard

