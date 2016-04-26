Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id E54DE73176
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:49:40 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6800CT3X6EVB60@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 09:49:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=V0IbOGlxgwdGvxh1dlsA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 57793dfe; Tue, 26 Apr 2016 14:49:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C6511161FC7; Tue,
	26 Apr 2016 10:49:25 -0400 (EDT)
Date: Tue, 26 Apr 2016 10:49:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@intel.com>
Message-id: <20160426144925.GG31113@denix.org>
References: <1461679103-2828-1-git-send-email-ross.burton@intel.com>
	<1461679103-2828-2-git-send-email-ross.burton@intel.com>
MIME-version: 1.0
In-reply-to: <1461679103-2828-2-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 26 Apr 2016 14:49:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 26, 2016 at 02:58:23PM +0100, Ross Burton wrote:
> gbm is an optional library and some environments (for example, mesa-gl where
> there are separate drivers that provide libgbm) may not want to build it.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

I was now able to build mesa-gl with TI SGX GLES and own libgbm. Thanks!

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-graphics/mesa/mesa.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 442479a..a4e5351 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -24,11 +24,13 @@ REQUIRED_DISTRO_FEATURES = "opengl"
>  
>  EXTRA_OECONF = "--enable-shared-glapi"
>  
> -PACKAGECONFIG ??= "egl gles dri ${MESA_CRYPTO} \
> +PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
>  		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
>  		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
>  		"
>  
> +PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
> +
>  X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
>  PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
>  PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
> @@ -37,7 +39,7 @@ PACKAGECONFIG[wayland] = ",,wayland-native wayland"
>  DRIDRIVERS = "swrast"
>  DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
>  DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
> -PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS} --enable-gbm, --disable-dri, dri2proto libdrm"
> +PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
>  PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
>  
>  PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
> -- 
> 2.8.0.rc3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

