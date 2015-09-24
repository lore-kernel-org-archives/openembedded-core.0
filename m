Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22E07734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 18:37:07 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so33361350qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ym0xVay+5gVY3NgpGAaa5pqEYFtcPiYUV4vxN1UaZRU=;
	b=kJjcrdtsH4alSlnLlqSX5aZZdVUKW/usrN3ZzWNOUCMKWHv25X62dAzmhxca+ixZuj
	87DRu4sb9g1OQ7XEIt1pYg6LjRGbMJDS3PD+ms4eSaFMugVOsLLV82gEFxt0WWcJa1Ij
	a7hW8iSPW2XFdP2X5DURlaL6RzH5/hjRHd+L51YXdmRz63UUuY4jjdml/ixfQj+Tpwli
	kC/Ac8BrG9zsJaGvfwJLOT0NWv1sxYGkyIQEcAfT0O37fDHYOmNtz3HTDWMVpHpl/Mcw
	dKKxjSqI9V2gBZgbSnBMSCNiZnTHwP3ngXLjJf1FiWHgFthFtZ3vAzwuVSOafDb43OTJ
	BkDQ==
X-Gm-Message-State: ALoCoQnEbEmi7iHq0bLuHav+KpUxUUsTKNMZN2ddWH2WK+WstSec9acOsth+5bewKwnQBRjvAt53
X-Received: by 10.55.198.9 with SMTP id b9mr1435543qkj.97.1443119827553; Thu,
	24 Sep 2015 11:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Thu, 24 Sep 2015 11:36:48 -0700 (PDT)
In-Reply-To: <1443077455.19044.55.camel@linuxfoundation.org>
References: <CAP71WjyWRXrvUyi1HvdusRkKLb5Gf3H2gzCNPKkUDAstA4M55A@mail.gmail.com>
	<1443077455.19044.55.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 24 Sep 2015 11:36:48 -0700
Message-ID: <CAP71WjzeJhjGNeYq8nKtR7BHPesdhcmyCb+1A+BeHhsp8Gh=tw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Thu, 24 Sep 2015 18:37:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 11:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The idea was that the machine config can nominate the "X11" config it
> needs by indicating the drivers that make sense for this piece of
> hardware. The XSERVER variable is then used to decide which pieces of X
> to pull in and pulling in the right mesa pieces at the same time made
> sense then.


right.

>
>
> We could split the mesa pieces out into a separate MESADRIVERS variable
> and the wayland/weston could just pull those in? Ultimately its still
> the machine config which has the knowledge of which drivers make sense
> for a given platform. Exactly which piece of the system would pull in
> MESADRIVERS is a good question but I've not looked at the metadata just
> thinking out loud.

it looks like it's either libGL (when using X/GLX) or libEGL that
would dynamically load the libary. So we might be able to do something
along these lines:

--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -5,12 +5,14 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"

 XSERVER ?= "xserver-xorg \
-            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
'mesa-driver-swrast', '', d)} \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
             xf86-input-keyboard"

+RDEPENDS_libgl-mesa = "${@bb.utils.contains('DISTRO_FEATURES',
'opengl', 'mesa-driver-swrast', '', d)}"
+RDEPENDS_libegl-mesa = "${@bb.utils.contains('DISTRO_FEATURES',
'opengl', 'mesa-driver-swrast', '', d)}"
+
 MACHINE_FEATURES = "alsa bluetooth usbgadget screen"

 MACHINEOVERRIDES =. "qemuall:"

-------

how does that look like?

It's untested for now, btw.

