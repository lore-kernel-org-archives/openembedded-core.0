Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6DC7F282
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 04:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 890F740BF9;
	Tue,  1 Oct 2019 04:48:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SlHEu_qCbQGA; Tue,  1 Oct 2019 04:48:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6082640BF0;
	Tue,  1 Oct 2019 04:48:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 161B9174275; Tue,  1 Oct 2019 00:48:25 -0400 (EDT)
Date: Tue, 1 Oct 2019 00:48:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20191001044824.GB30018@denix.org>
References: <20190917131053.32411-1-afd@ti.com>
	<20190917131053.32411-4-afd@ti.com>
	<2be09d9daa44612fd8c52483dc73131e@agner.ch>
MIME-Version: 1.0
In-Reply-To: <2be09d9daa44612fd8c52483dc73131e@agner.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/4] weston: Set depends to the virtual needed not explicitly on Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 04:48:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 26, 2019 at 10:19:12AM +0200, Stefan Agner wrote:
> On 2019-09-17 15:10, Andrew F. Davis via Openembedded-core wrote:
> > The dependency is for EGL and GLES2 libraries. On some systems these
> > are not provided by Mesa, list what is actually needed so the system
> > can choose the correct provider.
> 
> Unfortunately I saw that a bit late, but this is breaking our use case.
> 
> Weston works perfectly fine on non-GPU systems without EGL/OpenGL ES
> using pixman renderer. Currently libgbm is still a compile time
> dependency, but I have a merge request pending which should drop this
> dependency, then the DRM backend can be compiled fine with only KMS
> support.

Hi, Stefan,

Can you please provide Weston configuration logs when it gets built with 
pixman and w/o EGL/GLES? Thanks.

-- 
Denys


> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > 
> > Changes from v1:
> >  - s/gles2/libgles2
> > 
> >  meta/recipes-graphics/wayland/weston_7.0.0.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> > b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> > index 5d2a9336f3..f9efdbd20a 100644
> > --- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
> > +++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
> > @@ -36,9 +36,9 @@ PACKAGECONFIG ??=
> > "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
> >  # Compositor choices
> >  #
> >  # Weston on KMS
> > -PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev
> > virtual/mesa virtual/libgbm mtdev"
> > +PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev
> > virtual/egl virtual/libgles2 virtual/libgbm mtdev"
> >  # Weston on Wayland (nested Weston)
> > -PACKAGECONFIG[wayland] =
> > "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/mesa"
> > +PACKAGECONFIG[wayland] =
> > "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl
> > virtual/libgles2"
> >  # Weston on X11
> >  PACKAGECONFIG[x11] =
> > "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb
> > libxcursor cairo"
> >  # Headless Weston
> > -- 
> > 2.17.1
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

