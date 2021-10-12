Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38E0C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 13:39:50 +0000 (UTC)
Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web08.13947.1634045978700177479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Yl3NWfWT;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id aI07m89NjdY2SaI09mHRo3; Tue, 12 Oct 2021 14:39:36 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=NP5OB3yg c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=3UfQUwHXLeejV29ZwNwA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=oc0y83QM/R3EvYJ6N1SqKBE10XNh7dG4b/b6G038c48=; b=Yl3NW
	fWTaTw0PUQnKykCp5GteXZJGRxOvRXRFdxZgwHkFmH6CvWUKWngGppZWVGGowqfIOjHyzTAS8apZR
	2lpfKOadG0OuWQpj8jzi/CjlSyl/2o7tEpNeMlWOu9St1fJ5/PhDLIh5uy5NfXQ3/Xjq9rTzZOrrS
	quWueUg247rWjZhpgxngh6DX330EsWAAa7NDH/wl1WgMDJQusW+XFT+0gdxlGsYfht3VgyUPgGpFI
	caVPC1YH2h82NbXMNrKTZRujJQ+9xTS1QiLggWzFH9gaM5/DCRAM1kmzFUNASka1SADaj7cqxp6Kb
	zhSRzefRoulY6e7sXZqp3mObiROIQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1maI07-0005WA-Kz; Tue, 12 Oct 2021 14:39:27 +0100
Date: Tue, 12 Oct 2021 14:39:27 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] license: Allow treating missing license as
 error
Message-ID: <YWWQDxSojtJScQOn@mcrowe.com>
References: <20211010172038.206959-1-mac@mcrowe.com>
 <c0e3bd5fdde8c109fab6cbd6c6ce2162883128d6.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <c0e3bd5fdde8c109fab6cbd6c6ce2162883128d6.camel@linuxfoundation.org>
X-CMAE-Envelope: 
 MS4wfAwmSubvsOvvBNhjHWI0Ztz9H0GenKwAqsK9gSwyv4/MA0G3n8yL7UBPZ/kKRRs1YGY0tetP/ptXis5xipe7MCRNpAjX+LTxB+6Uar8+Ww2gEj/xGuIt
 k9y9SaEnz6ik0AZEse4RHd/iDHb8DHhlyIbQVM1ZQhrq/8uZn78k5XXrQO/L6jGl1BDqSt3XX1/SQg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 13:39:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156878

On Tuesday 12 October 2021 at 14:21:05 +0100, Richard Purdie wrote:
> On Sun, 2021-10-10 at 18:20 +0100, Mike Crowe via lists.openembedded.org wrote:
> > Use mechanism inspired by insane.bbclass to allow individual recipes or
> > other configuration to determine whether a missing licence should be
> > treated as a warning (as it is now) or as an error. This is controlled
> > by whether the error class is in WARN_LICENSE or ERROR_LICENSE.
> > 
> > Use bb.fatal in the error case to ensure that the task really fails. If
> > only bb.error is used then do_populate_lic isn't re-run on subsequent
> > builds which could lead to the error being missed.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/classes/license.bbclass | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 45d912741d..f0a6c0c20e 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -12,6 +12,23 @@ LICENSE_CREATE_PACKAGE ??= "0"
> >  LICENSE_PACKAGE_SUFFIX ??= "-lic"
> >  LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
> >  
> > +# Elect whether a given type of error is a warning or error, they may
> > +# have been set by other files.
> > +WARN_LICENSE ?= "no-license"
> > +ERROR_LICENSE ?= ""
> > +WARN_LICENSE[doc] = "Space-separated list of license problems that should be reported only as warnings"
> > +ERROR_LICENSE[doc] = "Space-separated list of license problems that should be reported as errors"
> > +
> > +def package_license_handle_error(error_class, error_msg, d):
> > +    if error_class in (d.getVar("ERROR_LICENSE") or "").split():
> > +        package_qa_write_error(error_class, error_msg, d)
> > +        bb.fatal("License Issue: %s [%s]" % (error_msg, error_class))
> > +    elif error_class in (d.getVar("WARN_LICENSE") or "").split():
> > +        package_qa_write_error(error_class, error_msg, d)
> > +        bb.warn("License Issue: %s [%s]" % (error_msg, error_class))
> > +    else:
> > +        bb.note("License Issue: %s [%s]" % (error_msg, error_class))
> > +
> >  addtask populate_lic after do_patch before do_build
> >  do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
> >  do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
> > @@ -190,7 +207,7 @@ def find_license_files(d):
> >              # Add explicity avoid of CLOSED license because this isn't generic
> >              if license_type != 'CLOSED':
> >                  # And here is where we warn people that their licenses are lousy
> > -                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> > +                package_license_handle_error("no-license", "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
> >              pass
> >  
> >      if not generic_directory:
> 
> I'm a little torn on this and whether we should make it use the same variables
> as the other QA checks? Is there a reason the user would want to configure this
> sanity check separately from the other sanity checks?

I modelled this on the QA checks in insane.bbclass because that appeared to
be the most likely to be an acceptable way to do it. I'd be happy to use
the same variables, although that does raise the question of whether
license.bbclass needs to inherit from insane.bbclass or those variables
need moving somewhere else (see below).

> I'm not sure I can see a long list of different license checks we'd want to add
> here?

There are many other warnings reported by license.bbclass. Many of them
feel like errors to me. I'd be happy to have a single switch that converted
them all to errors, but I haven't tried to do so to see what problems we'd
run into.

> The current sanity checks in insane.bbclass could do with some cleanup and
> refactoring so perhaps this could be come a common function (and common variable
> to control all the QA checks)?

Where would be the best place to put this function? A new qa.bbclass that
can be inherited by both license.bbclass and insane.bbclass?

Did you have any particular cleanups and refactorings in mind? I must admit
that I was surprised by the long list in a single variable assigned with
?=. It means that anyone overriding the variable won't benefit from
newly-added checks automatically.

The only alternative mechanism I came up with was something like:

 QA_CHECK[libdir] = "warn"
 QA_CHECK[dev-so] = "error"
 QA_CHECK[mime] = "ignore"

and then let recipes and configurations override individual checks as they
wish.

Thanks.

Mike.

