Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id BFAC576B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 02:54:28 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K00GR2YQA3860@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 02 May 2016 21:54:10 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=yrkiwgmsf1kA:10	a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=8jt0XE_w1Ujkz49vxo4A:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 58e37331; Tue, 03 May 2016 02:54:10 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CE0FA161FDC; Mon,
	2 May 2016 22:54:09 -0400 (EDT)
Date: Mon, 02 May 2016 22:54:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@intel.com>
Message-id: <20160503025409.GC27602@denix.org>
References: <1461679103-2828-1-git-send-email-ross.burton@intel.com>
	<1461679103-2828-2-git-send-email-ross.burton@intel.com>
	<20160426144925.GG31113@denix.org>
MIME-version: 1.0
In-reply-to: <20160426144925.GG31113@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] mesa: add PACKAGECONFIG for gbm
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
X-List-Received-Date: Tue, 03 May 2016 02:54:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 26, 2016 at 10:49:25AM -0400, Denys Dmytriyenko wrote:
> On Tue, Apr 26, 2016 at 02:58:23PM +0100, Ross Burton wrote:
> > gbm is an optional library and some environments (for example, mesa-gl where
> > there are separate drivers that provide libgbm) may not want to build it.
> > 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> I was now able to build mesa-gl with TI SGX GLES and own libgbm. Thanks!
> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>

Ross,

I would like to see these 2 patches pushed early, even if virtual/libgbm 
rework isn't ready yet. Thanks.

-- 
Denys


> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index 442479a..a4e5351 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -24,11 +24,13 @@ REQUIRED_DISTRO_FEATURES = "opengl"
> >  
> >  EXTRA_OECONF = "--enable-shared-glapi"
> >  
> > -PACKAGECONFIG ??= "egl gles dri ${MESA_CRYPTO} \
> > +PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
> >  		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
> >  		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
> >  		"
> >  
> > +PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
> > +
> >  X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
> >  PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
> >  PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
> > @@ -37,7 +39,7 @@ PACKAGECONFIG[wayland] = ",,wayland-native wayland"
> >  DRIDRIVERS = "swrast"
> >  DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
> >  DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
> > -PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS} --enable-gbm, --disable-dri, dri2proto libdrm"
> > +PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
> >  PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
> >  
> >  PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
> > -- 
> > 2.8.0.rc3
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

