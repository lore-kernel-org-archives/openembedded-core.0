Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.6853.1586431805049830177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 04:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48yf7t2vvkz5tlD;
	Thu,  9 Apr 2020 13:30:02 +0200 (CEST)
Date: Thu, 9 Apr 2020 13:30:01 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cairo: work around multilib issue resulting in improper handling of licenses
Message-ID: <20200409113001.mwpkka6inzq6byfu@qschulz>
References: <20200409110423.11841-1-quentin.schulz@streamunlimited.com>
 <20200409121700.66bffc1c@ub1910>
MIME-Version: 1.0
In-Reply-To: <20200409121700.66bffc1c@ub1910>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Thu, Apr 09, 2020 at 12:17:00PM +0100, Paul Barker wrote:
> On Thu,  9 Apr 2020 13:04:23 +0200
> "Quentin Schulz" <quentin.schulz@streamunlimited.com> wrote:
> 
> > There is currently an issue when a LICENSE for a package is defined
> > differently than how the package is defined in PACKAGES.
> > 
> > See bug tracker: http://bugzilla.yoctoproject.org/show_bug.cgi?id=13865
> > 
> > This results in LICENSE being taken instead of LICENSE_${PN}-gobject
> > because the latter is expanded to LICENSE_lib32-cairo-gobject while the
> > entry in PACKAGES is still cairo-object at the moment of setting
> > LICENSE_EXCLUSION in base.bbclass.
> > 
> > This means that instead of the expected MPL-1.1 | LGPLv2.1 license for
> > lib32-cairo-object, it is (MPL-1.1 | LGPLv2.1) & GPLv3+ which does not
> > work when you have INCOMPATIBLE_LICENSE set to GPLv3.
> > 
> > Same applies to cairo-perf-utils and cairo-script-interpreter.
> > 
> > Let's use ${PN} instead of hardcoded cairo in PACKAGES so that we
> > mitigate the multilib issue on this recipe level.
> > 
> > Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
> > ---
> >  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > index b772c2ece2..e18159e96c 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -72,7 +72,7 @@ do_install_append () {
> >  	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
> >  }
> >  
> > -PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> > +PACKAGES =+ "${PN}-gobject ${PN}-script-interpreter ${PN}-perf-utils"
> >  
> >  SUMMARY_cairo-gobject = "The Cairo library GObject wrapper library"
> >  DESCRIPTION_cairo-gobject = "A GObject wrapper library for the Cairo API."
> 
> Should we also change these entries to `SUMMARY_${PN}-gobject` and
> `DESCRIPTION_${PN}-gobject`? There may be others as well, I'm just looking at
> the diff not the full recipe.
> 

We could for consistency but those aren't impacted by the bug (I checked
in tmp/pkgdata/<machine>/runtime/lib32-cairo-*).

Would you want me to change them anyway?

Quentin
