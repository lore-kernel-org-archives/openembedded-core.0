Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBpNp-0006n0-W2 for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:57:14 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96Ew6Zw013646 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:58:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F-oJ3lp44qRA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 15:58:06 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96Ew2BX013640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:58:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:51:25 +0100
In-Reply-To: <20111006142944.GB3485@jama.jama.net>
References: <1317910901.6398.88.camel@ted>
	<20111006142944.GB3485@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317912693.6398.108.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] xserver-xf86: Use PACKAGECONFIG for udev/hal choice and default to udev
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
X-List-Received-Date: Thu, 06 Oct 2011 14:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 16:29 +0200, Martin Jansa wrote:
> On Thu, Oct 06, 2011 at 03:21:33PM +0100, Richard Purdie wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> > index 000aea3..4c8b732 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
> > @@ -35,3 +35,8 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
> >  SRC_URI += "file://macro_tweak.patch"
> >  
> >  EXTRA_OECONF = "--with-fop=no"
> > +
> > +PACKAGECONFIG ??= "udev"
> > +PACKAGECONFIG[hal] = "--enable-config-hal,--disable-config-hal,,hal"
> > +PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,,udev"
> 
> This should probably be 
> +PACKAGECONFIG[hal] = "--enable-config-hal,--disable-config-hal,,hal"
> +PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev,"
> 
> as we don't want udev in RDEPENDS (libudev is enough).

Does it need udev to build? I suspect you're right. I found it a little
odd it didn't seem to need hal as a build dependency.

> And can we apply this after my Xorg patchset? Because I don't want to
> rebase it for 4th time ;).

What I'm trying to avoid is introducing config options which we're not
going to use. Looking at the xserver patches in your xorg series, they
still do too many things in one patch so I think they're going to need
to be split down further. I'm reluctant to ask you to do it so I'm
poking around some of this area myself too...

Cheers,

Richard



