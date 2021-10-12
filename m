Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a8f1695ea7c270184bab45968011ac50481a4c10.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] license: Allow treating missing license as error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Oct 2021 15:08:00 +0100
In-Reply-To: <YWWQDxSojtJScQOn@mcrowe.com>
References: <20211010172038.206959-1-mac@mcrowe.com>
	 <c0e3bd5fdde8c109fab6cbd6c6ce2162883128d6.camel@linuxfoundation.org>
	 <YWWQDxSojtJScQOn@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org

On Tue, 2021-10-12 at 14:39 +0100, Mike Crowe wrote:
> On Tuesday 12 October 2021 at 14:21:05 +0100, Richard Purdie wrote:
> > On Sun, 2021-10-10 at 18:20 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > Use mechanism inspired by insane.bbclass to allow individual recipes or
> > > other configuration to determine whether a missing licence should be
> > > treated as a warning (as it is now) or as an error. This is controlled
> > > by whether the error class is in WARN_LICENSE or ERROR_LICENSE.
> > > 
> > > Use bb.fatal in the error case to ensure that the task really fails. If
> > > only bb.error is used then do_populate_lic isn't re-run on subsequent
> > > builds which could lead to the error being missed.
> > > 
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  meta/classes/license.bbclass | 19 ++++++++++++++++++-
> > >  1 file changed, 18 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > > index 45d912741d..f0a6c0c20e 100644
> > > --- a/meta/classes/license.bbclass
> > > +++ b/meta/classes/license.bbclass
> > > @@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??= "0"
> > >  LICENSE_PACKAGE_SUFFIX ??= "-lic"
> > >  LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
> > >  
> > > +# Elect whether a given type of error is a warning or error, they may
> > > +# have been set by other files.
> > > +WARN_LICENSE ?= "no-license"
> > > +ERROR_LICENSE ?= ""
> > > +WARN_LICENSE[doc] = "Space-separated list of license problems that should be reported only as warnings"
> > > +ERROR_LICENSE[doc] = "Space-separated list of license problems that should be reported as errors"
> > > +
> > > +def package_license_handle_error(error_class, error_msg, d):
> > > +    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
> > > +        package_qa_write_error(error_class, error_msg, d)
> > > +        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
> > > +    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
> > > +        package_qa_write_error(error_class, error_msg, d)
> > > +        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
> > > +    else:
> > > +        bb.note("License Issue: %s [%s]" % (error_msg, error_class))
> > > +
> > >  addtask populate_lic after do_patch before do_build
> > >  do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
> > >  do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
> > > @@ -190,7 +207,7 @@ def find_license_files(d):
> > >              # Add explicity avoid of CLOSED license because this isn't generic
> > >              if license_type != 'CLOSED':
> > >                  # And here is where we warn people that their licenses are lousy
> > > -                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> > > +                package_license_handle_error("no-license", "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
> > >              pass
> > >  
> > >      if not generic_directory:
> > 
> > I'm a little torn on this and whether we should make it use the same variables
> > as the other QA checks? Is there a reason the user would want to configure this
> > sanity check separately from the other sanity checks?
> 
> I modelled this on the QA checks in insane.bbclass because that appeared to
> be the most likely to be an acceptable way to do it. I'd be happy to use
> the same variables, although that does raise the question of whether
> license.bbclass needs to inherit from insane.bbclass or those variables
> need moving somewhere else (see below).

package.bbclass inherits insane so basically they are available everywhere.

We could do with a bit of a cleanup of some of the core variable definitions and
moving some of the core functions into function libraries instead of class code.

> > I'm not sure I can see a long list of different license checks we'd want to add
> > here?
> 
> There are many other warnings reported by license.bbclass. Many of them
> feel like errors to me. I'd be happy to have a single switch that converted
> them all to errors, but I haven't tried to do so to see what problems we'd
> run into.

At least for OE-Core, we'd see warnings on the autobuilder and those would raise
bugs so any of those warnings should already be fixed. Other layers may vary.

I'd be ok with having these controlled by some license-XXX flags to the standard
QA warnings/errors mechanism.

> > The current sanity checks in insane.bbclass could do with some cleanup and
> > refactoring so perhaps this could be come a common function (and common variable
> > to control all the QA checks)?
> 
> Where would be the best place to put this function? A new qa.bbclass that
> can be inherited by both license.bbclass and insane.bbclass?

Would somewhere in meta/lib/oe/ be a better place for functions?

> Did you have any particular cleanups and refactorings in mind? 

Basically moving functions to a function library and trying to standardise
things a bit more. I'd have to look at the code again to remember what other
things I was thinking.

> I must admit
> that I was surprised by the long list in a single variable assigned with
> ?=. It means that anyone overriding the variable won't benefit from
> newly-added checks automatically.

Default assignments and changes over time is a hard problem and I think we have
to keep that as a tangential issue to preserve our sanity. I wish we had a good
solution for this.

> The only alternative mechanism I came up with was something like:
> 
>  QA_CHECK[libdir] = "warn"
>  QA_CHECK[dev-so] = "error"
>  QA_CHECK[mime] = "ignore"
> 
> and then let recipes and configurations override individual checks as they
> wish.

Effectively we allow recipes to markup specific checks that should be skipped.
The warn/error policy is left to the distro config. Poky used to have more
errors set but I think the defaults have now mostly moved to the same levels
poky has.

Cheers,

Richard


