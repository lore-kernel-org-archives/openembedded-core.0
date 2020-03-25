Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.24533.1585172899862167191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 14:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2CD8040B37;
	Wed, 25 Mar 2020 21:48:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuZ9flZNupS1; Wed, 25 Mar 2020 21:48:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1666F409DE;
	Wed, 25 Mar 2020 21:48:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 053D31718E8; Wed, 25 Mar 2020 17:48:13 -0400 (EDT)
Date: Wed, 25 Mar 2020 17:48:12 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>,
	Ross Burton <ross.burton@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
Message-ID: <20200325214812.GE1578@denix.org>
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
 <CAHtQpK7OJdEQCSY1wsKGKLoz1nQZ7SHCsj9ke_BjC=VWrYfX5Q@mail.gmail.com>
 <6502.149.199.62.130.1585168558.squirrel@gate.crashing.org>
 <CAHtQpK7im-SixCXD-eUF3Q6z7_GNnopeAKme7hetXca-Umd7RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHtQpK7im-SixCXD-eUF3Q6z7_GNnopeAKme7hetXca-Umd7RA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2020 at 10:37:55PM +0100, Andrey Zhizhikin wrote:
> On Wed, Mar 25, 2020 at 9:36 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> >
> > > On Wed, Mar 25, 2020 at 7:15 PM Mark Hatle
> > > <mark.hatle@kernel.crashing.org> wrote:
> > >>
> > >> Trying to build mesa-gl without X11 enabled, results in numerous errors
> > >> about being incorrectly configured, such as:
> > >>
> > >>   ERROR: Problem encountered: building dri drivers require at least one
> > >> windowing system or classic osmesa
> > >
> > > I believe I was fighting similar issue in meta-freescale layer for
> > > imx8mm derivative [1], where the status of GPU support was not know at
> > > the time. What I did back then is set the default configuration to
> > > osmesa and used swrast in order to be able to use mesa on that
> > > derivative. After that, when GPU support has been added into Mesa -
> > > those modifications were reverted.
> >
> > Do you have a pointer to that anywhere?  I'm curious if any of it might
> > still apply.. but I know nothing about mesa and what configurations are
> > even possible.
> 
> I've included the link to my commit in meta-freescale layer, where the
> PACKAGECONFIG is set to use 'classic' OSMesa and adds swrast to
> DRIDRIVERS. This should turn the rendering to be performed in the SW,
> effectively working for all backends (at the obvious performance
> penalty). It took me quite some digging to figure this combination
> out, as I also cannot claim myself an expert in mesa...

FWIW, we also expect SW rendering for GL, while SGX/RGX cores in our SoCs 
accelerate EGL/GLES.

But, like Mark, I also don't know much about Mesa. Similar to what he 
mentioned about Mali, we used to require a custom libdrm years ago. But 
since then, everything has been upstreamed into main libdrm-omap driver.

-- 
Denys


> > > I guess turning to swrast in case if someone would decide _not_ to use
> > > X11 - is not a bad option here, rather than enforcing the X11 for
> > > distros which are using this recipe. Any thoughts?
> >
> > I don't know any any reasons we couldn't do this.. but like I said.. I'm a
> > newbie when it comes to mesa.
> 
> Maybe something like this could be used (warning: untested):
> PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', 'osmesa',d)}"
> DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> '', ' swrast',d)}"
> 
> >
> > --Mark
> >
> > >>
> > >> After consulting with the author of this recipe, it was clear that it
> > >> was only intended for the X11 use-case, so requring X11 should avoid the
> > >> error message above.
> > >>
> > >> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > >> ---
> > >>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
> > >>  1 file changed, 4 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> > >> b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> > >> index d4b1c1c454..5674c6b1fe 100644
> > >> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> > >> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> > >> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
> > >>
> > >>  S = "${WORKDIR}/mesa-${PV}"
> > >>
> > >> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> > >> 'x11', d)}"
> > >> -PACKAGECONFIG_class-target = "opengl dri
> > >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> > >> +REQUIRED_DISTRO_FEATURE = "x11"
> > >> +
> > >> +PACKAGECONFIG ??= "opengl dri x11"
> > >> +PACKAGECONFIG_class-target = "opengl dri x11"
> > >> --
> > >> 2.17.1
> > >>
> > >>
> > >
> > > --
> > > Regards,
> > > Andrey.
> > >
> > > [1]:
> > > https://github.com/Freescale/meta-freescale/commit/9a2210d9ec707531436dc4b56ce655c0bf50a8a8
> > > 
> > >
> >
> 
> 
> --
> Regards,
> Andrey.

> 

