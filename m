Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <5c3d0456bf1845e2f2b95daa0dbe7ca54621a467.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] create-spdx: Use function rather than AVAILABLE_LICENSES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 15 Mar 2022 17:58:43 +0000
In-Reply-To: <f39762f2fc464c619aa3035abd66321e@axis.com>
References: <20220315173310.889973-1-richard.purdie@linuxfoundation.org>
	 <f39762f2fc464c619aa3035abd66321e@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Tue, 2022-03-15 at 17:48 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 15 mars 2022 18:33
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/2] create-spdx: Use function rather than
> > AVAILABLE_LICENSES
> > 
> > We can directly call the function rather than using the variable
> > indirection.
> > As this is the last user of the variable, it then allows removal of it in a
> > followup patch.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/create-spdx.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-
> > spdx.bbclass
> > index daf99ca676c..1a4804a7c50 100644
> > --- a/meta/classes/create-spdx.bbclass
> > +++ b/meta/classes/create-spdx.bbclass
> > @@ -94,7 +94,7 @@ def convert_license_to_spdx(lic, document, d,
> > existing={}):
> >      from pathlib import Path
> >      import oe.spdx
> > 
> > -    available_licenses = d.getVar("AVAILABLE_LICENSES").split()
> > +    avail_licenses = available_licenses(d)
> 
> Doesn't this mean that the available licenses will be calculated once 
> per recipe? Or isn't it a problem since the time will not be spent 
> during recipe parsing, but rather during task execution where no one 
> will notice if the create-spdx task for all recipes takes a little 
> longer?

It will be in a different process so it will already run once per recipe during
task execution anyway. So yes, this just allows us to move execution overhead
away from parsing.

> That said, if I remember correctly from the last time I looked at this 
> function, it should be possible to rewrite it to not rely on 
> available_licenses() without any real loss in functionality.

Patches very welcome. Now we're moving to SPDX identifiers only, this need to
this is likely reduced too. I needed to start unwinding the pieces somewhere
though...

Cheers,

Richard

