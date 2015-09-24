Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABD12734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 20:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8OKHmd8009632; Thu, 24 Sep 2015 21:17:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yxO7oWBQumVa; Thu, 24 Sep 2015 21:17:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8OKHWkd009623
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Sep 2015 21:17:43 +0100
Message-ID: <1443125852.19044.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 24 Sep 2015 21:17:32 +0100
In-Reply-To: <CAP71WjzeJhjGNeYq8nKtR7BHPesdhcmyCb+1A+BeHhsp8Gh=tw@mail.gmail.com>
References: <CAP71WjyWRXrvUyi1HvdusRkKLb5Gf3H2gzCNPKkUDAstA4M55A@mail.gmail.com>
	<1443077455.19044.55.camel@linuxfoundation.org>
	<CAP71WjzeJhjGNeYq8nKtR7BHPesdhcmyCb+1A+BeHhsp8Gh=tw@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Including machine specific mesa-driver
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
X-List-Received-Date: Thu, 24 Sep 2015 20:17:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-24 at 11:36 -0700, Nicolas Dechesne wrote:
> On Wed, Sep 23, 2015 at 11:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > The idea was that the machine config can nominate the "X11" config it
> > needs by indicating the drivers that make sense for this piece of
> > hardware. The XSERVER variable is then used to decide which pieces of X
> > to pull in and pulling in the right mesa pieces at the same time made
> > sense then.
> 
> 
> right.
> 
> >
> >
> > We could split the mesa pieces out into a separate MESADRIVERS variable
> > and the wayland/weston could just pull those in? Ultimately its still
> > the machine config which has the knowledge of which drivers make sense
> > for a given platform. Exactly which piece of the system would pull in
> > MESADRIVERS is a good question but I've not looked at the metadata just
> > thinking out loud.
> 
> it looks like it's either libGL (when using X/GLX) or libEGL that
> would dynamically load the libary. So we might be able to do something
> along these lines:
> 
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -5,12 +5,14 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> 
>  XSERVER ?= "xserver-xorg \
> -            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'mesa-driver-swrast', '', d)} \
>              xf86-input-evdev \
>              xf86-input-mouse \
>              xf86-video-fbdev \
>              xf86-input-keyboard"
> 
> +RDEPENDS_libgl-mesa = "${@bb.utils.contains('DISTRO_FEATURES',
> 'opengl', 'mesa-driver-swrast', '', d)}"
> +RDEPENDS_libegl-mesa = "${@bb.utils.contains('DISTRO_FEATURES',
> 'opengl', 'mesa-driver-swrast', '', d)}"
> +
>  MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
> 
>  MACHINEOVERRIDES =. "qemuall:"
> 
> -------
> 
> how does that look like?
> 
> It's untested for now, btw.

It would make mesa machine specific which probably isn't what we
want :/.

Cheers,

Richard




