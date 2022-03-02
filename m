Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <2b1a5391ad635f2349b56bbb03c94fbee5d2baff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE wildcard handling
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 02 Mar 2022 15:34:16 +0000
In-Reply-To: <7d61dda553234e96b0be45bd550b0918@axis.com>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
	 <20220301234214.247172-4-richard.purdie@linuxfoundation.org>
	 <7d61dda553234e96b0be45bd550b0918@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Wed, 2022-03-02 at 15:09 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 2 mars 2022 00:42
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 4/4] license: Rework INCOMPATIBLE_LICENSE
> > wildcard handling
> > 
> > The current wildcard handling is badly documented and inconsistently
> > used and understood.
> > 
> > Forcing users to have to use "GPL-3.0-only GPL-3.0-or-later" whilst
> > explict is not very user friendly. Equally, using the current wildcards
> > is ambigious. This supports pre-defined expansions only and at least makes
> > it clear what GPL-3.0* means (it doesn't include the exception licenses).
> > 
> > This is hopefully an acceptable compromise between literal meaning and
> > having something usable.
> > 
> > Non-SPDX forms of license in this field have been dropped and errors are
> > shown for unsupported expansions and unsupported old style license terms.
> > 
> > Users need to carefully consider how to migrate to the new syntax but
> > the meaning should be well defined and clear from here forward.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/license.bbclass                  | 41 +++++----
> >  .../oeqa/selftest/cases/incompatible_lic.py   | 86 +++++++++++--------
> >  2 files changed, 70 insertions(+), 57 deletions(-)
> > 
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 68c022248c8..cb1f46983ac 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -277,28 +277,27 @@ AVAILABLE_LICENSES := "${@'
> > '.join(available_licenses(d))}"
> > 
> >  def expand_wildcard_licenses(d, wildcard_licenses):
> >      """
> > -    Return actual spdx format license names if wildcards are used. We
> > expand
> > -    wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
> > +    There are some common wildcard values users may want to use. Support
> > them
> > +    here.
> >      """
> > -    import fnmatch
> > -
> > -    licenses = wildcard_licenses[:]
> > -    spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
> > -    for wld_lic in wildcard_licenses:
> > -        spdxflags = fnmatch.filter(spdxmapkeys, wld_lic)
> > -        licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in
> > spdxflags]
> > -        # Assume that if we are passed "GPL-3.0" or "*GPL-3.0", then it
> > means
> > -        # "-or-later" as well.
> > -        if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
> > -            spdxflags = fnmatch.filter(spdxmapkeys, wld_lic + "+")
> > -            licenses += [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in
> > spdxflags]
> > -
> > -    spdx_lics = d.getVar('AVAILABLE_LICENSES').split()
> > -    for wld_lic in wildcard_licenses:
> > -        licenses += fnmatch.filter(spdx_lics, wld_lic)
> > -
> > -    licenses = list(set(licenses))
> > -    return licenses
> > +    licenses = set(wildcard_licenses)
> > +    mapping = {
> > +        "GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later"],
> > +        "LGPL-3.0*" : ["LGPL-3.0-only", "LGPL-3.0-or-later"],
> 
> If you are adamant about using "*" in these shortcuts (which I 
> still think is a mistake), then you should add these two as well:
> 
>         "AGPL-3.0*" : ["AGPL-3.0-only", "AGPL-3.0-or-later"],
>         "*GPL-3.0*" : ["GPL-3.0-only", "GPL-3.0-or-later", "LGPL-3.0-only",
> "LGPL-3.0-or-later", "AGPL-3.0-only", "AGPL-3.0-or-later"],
> 
> I believe the last one is what most really want to do, i.e., 
> exclude all GPL-3.0 variants.

I don't think I've seen anything under the AGPL. I don't have a strong
preference for adding it here or not, I was tempted to wait for patches and see
if anyone needed it.

The idea is the wildcards added should remove the need for the latter as people
can say "GPL-3.0* LGPL-3.0*" which I think is manageable.

Cheers,

Richard



