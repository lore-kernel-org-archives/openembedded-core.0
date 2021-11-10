Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3e515dd10b0cf1fdda6a1291d289c6804628389c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mirrors: Add uninative mirror on kernel.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Nov 2021 20:54:36 +0000
In-Reply-To: <93b2df22824c47ff9c08365792a805d2@axis.com>
References: <20211109132131.3789773-1-richard.purdie@linuxfoundation.org>
	 <93b2df22824c47ff9c08365792a805d2@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Wed, 2021-11-10 at 20:44 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 9 november 2021 14:22
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] mirrors: Add uninative mirror on kernel.org
> > 
> > At the last nas outage, we realised that we don't have good mirrors of the
> > uninative tarball if our main system can't be accessed. kernel.org mirrors
> > some Yocto Project data so we've ensured uninative is there. Add the
> > appropriate
> > mirror url to make use of that.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/mirrors.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> > index ba325a658bc..75eb86a7243 100644
> > --- a/meta/classes/mirrors.bbclass
> > +++ b/meta/classes/mirrors.bbclass
> > @@ -62,6 +62,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
> >  npm://.*/?.*    http://sources.openembedded.org/ \n \
> >  ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
> >  ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
> > +https?$://downloads.yoctoproject.org/releases/uninative/
> > https://mirrors.kernel.org/yocto/uninative/ \n \
> 
> The above looked very odd to me, having that dollar sign in the middle of 
> the regular expression. It wasn't until I was deep into the fetcher's code 
> that I realized that it is not actually one regular expression above, but 
> three, formatted as a URL...

It is all a bit crazy. This format is from the days of the fetcher before my
involvement and before it was the fetcher.

> However, based on the code in bitbake/lib/bb/fetch2/__init__.py:uri_replace(),
> AFAICT, the dollar sign should not be needed above, as it will be added for 
> the URI type regexp automatically. The same goes for the other two URLs in 
> mirrors.bbclass that use that formatting.

Right, I think I remember added the anchoring fix. We haven't cleaned up all the
urls out in the wild and I was being consistent with the other entries in this
case.

> While investigating this, I also tried to look in the bitbake documentation 
> for a description of the format used for the PREMIRRORS and MIRRORS variables,
> but I could not find any. There is only a simple example, without any 
> explanation for the actual format that is being used.

That doesn't surprise me, I still have trouble remembering all the
idiosyncrasies when trying to fix the mirror url code too. It would be good to
document it if anyone fancies trying.

Cheers,

Richard

