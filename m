Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id EBE1B65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 12:20:33 +0000 (UTC)
Received: by ykek76 with SMTP id k76so27715250yke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Nh1PpV/SefN1dFYCqim8eVggHh0rG8XgBqan13ohAX8=;
	b=bnz8JX/45lIv9cHQ/NgqrJdEpYXs554A2jAa/e20+LmOr98qLZ9OdTvEoAaRl+BCkL
	iMr35nE15hNEqsVBXAKUmpzAQDDmEoIpIFTUOW+fnE1XTu4RVNHy4pKmqvHI+TBUYjoW
	6xViqjivB5iTkPWvbAIJ50JreEb7yu0nNqUyl2EOe9X8ZNMl29S1XZ1w7xma/FZFe1Wt
	nYB+wP57u08W1/TdgyHeE3V7pWczgVtek6MpkErOJIARQNq8CcVdoS6zVPAK7x1QtBqq
	NdofOKIx1PwrO5XsOQqNmrcYATdcvMilILZm2KFd4ihv3UQvVus9j4+Q9XytagZ+InoP
	wEfw==
MIME-Version: 1.0
X-Received: by 10.170.219.9 with SMTP id l9mr87235765ykf.105.1426767634559;
	Thu, 19 Mar 2015 05:20:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Thu, 19 Mar 2015 05:20:34 -0700 (PDT)
In-Reply-To: <1426746558-2920-1-git-send-email-armccurdy@gmail.com>
References: <1426746558-2920-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 19 Mar 2015 09:20:34 -0300
X-Google-Sender-Auth: 7N17ZnoPskS_jW0oPViCsR6yEVk
Message-ID: <CAP9ODKo7=Ehs-BOL3NUFXXx8Mjt4tMR6GeKyZtokXfugEnX6BA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-good: fix nondeterministic udev dependency
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
X-List-Received-Date: Thu, 19 Mar 2015 12:20:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 19, 2015 at 3:29 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Make the v4l PACKAGECONFIG option control building of the video4linux2
> plug-in (not use of libv4l, as it did before) and enable by default.
> Add a separate libv4l PACKAGECONFIG to control use of libv4l (disabled
> by default since libv4l is not part of oe-core).
>
> The default config for gst-plugins-good and gstreamer1.0-plugins-good
> is now aligned with regards to v4l, ie:
>
>   v4l support: enabled by default
>   v4l use of libgudev: enabled by default
>   v4l use of libv4l2: disabled by default
>
> This commit fixes the following build-deps QA Warnings:
>
>   WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency? [build-deps]
>   WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index 85f2196..af18281 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>
>  PR = "r8"
>
> -PACKAGECONFIG ?= "jpeg \
> +PACKAGECONFIG ?= "jpeg v4l \

This is not needed.

>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>  "
> @@ -16,7 +16,9 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
>  PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>  PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
> -PACKAGECONFIG[v4l] = "--with-libv4l2,--without-libv4l2,libv4l"
> +PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,udev"
> +# sub-feature of v4l, but control separately since libv4l is not part of oe-core
> +PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
>  PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
>  PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
>  PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

