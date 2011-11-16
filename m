Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQcZq-0006et-Qx for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 11:18:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGACMBR003153
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 10:12:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00303-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 10:12:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAGACATX003147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 10:12:14 GMT
Message-ID: <1321438335.26881.232.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 10:12:15 +0000
In-Reply-To: <20111115234557.GD3600@jama.jama.net>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
	<d10d38e320b27bfbbf6d069e820a2b6c013bbbdc.1321028799.git.Martin.Jansa@gmail.com>
	<20111115234557.GD3600@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][oe-core 14/22] libsdl: enable alsa/opengl based on PACKAGECONFIG and respect DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2011 10:18:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-16 at 00:45 +0100, Martin Jansa wrote:
> On Fri, Nov 11, 2011 at 05:28:50PM +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   10 +++++++---
> >  1 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > index 17a3103..2f49f16 100644
> > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> > @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
> >  
> >  PROVIDES = "virtual/libsdl"
> >  
> > -DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
> > +DEPENDS = "virtual/libx11 libxext libxrandr libxrender tslib"
> >  DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
> 
> As Saul reported PACKAGECONFIG adds build time depends not only to
> DEPENDS but they also ends in DEPENDS_virtclass-nativesdk and nothing
> provides virtual/libgl-nativesdk. So I've resend this patch changing
> only alsa handling to PACKAGECONFIG and keeping opengl as it was.
> 
> Cheers,
> 
> >  PR = "r1"
> > @@ -29,17 +29,21 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
> >  inherit autotools binconfig pkgconfig
> >  
> >  EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
> > -                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
> > +                --enable-file --disable-oss --disable-esd --disable-arts \
> >                  --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
> >                  --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
> >                  --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
> >                  --disable-video-xbios --disable-video-gem --disable-video-dummy \
> >                  --enable-input-events --enable-input-tslib --enable-pthreads \
> > -		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
> >  		--disable-video-svga \
> >                  --disable-video-picogui --disable-video-qtopia --enable-dlopen \
> >                  --disable-rpath"
> >  
> > +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
> > +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
> > +PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl,"
> > +

What we could do is have a 
PACKAGECONFIG_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}" 
or something like that.

Cheers,

Richard



