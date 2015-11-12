Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id DE3C0771BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:00:52 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so37179210igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 01:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vbJG00bgX7wY6PmXXDrQYgcsLxMFlb5Brk36z5pk9mk=;
	b=kze/Jj+vJvyLkrxXCUXbiUR6rD7aFfMaD9rNv+13HcxtPx7dNYdVo2RYCmZNboeLUN
	nNKC+31jB/kF6DuHjLJ19YUd0pZGiOeWmk9Y8ls1UhOraiaXCwnWw8g5Jga6o9yLqLww
	Agu/b82eKbi28DmKwSAv9W+0ja+P7hyaKPqPYeHzFl6QzqTh4+rJgpjNg2gYa6ZrXIY/
	xOm14eYdcyA5gwaOFOuQLtxNKRH5vqRHyc8jCCPGSKLFC7EPIcQUbNGGnjQZ6NEQjy1Z
	o2PUUwajr/q9pzAz0mpj30y/Xvg4yVWadXqcZtyzqX9Ju8+ZNkwmt7/EmxmZAcdLhZ5R
	TILA==
MIME-Version: 1.0
X-Received: by 10.50.43.161 with SMTP id x1mr33587851igl.64.1447318852809;
	Thu, 12 Nov 2015 01:00:52 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 12 Nov 2015 01:00:52 -0800 (PST)
In-Reply-To: <8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
Date: Thu, 12 Nov 2015 10:00:52 +0100
Message-ID: <CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Thu, 12 Nov 2015 09:00:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 9:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fix dangling dependns on gudev, and systemd doesn't provide libgudev, so
> it can't be enabled when systemd either.
>
> Fixed:
> libtool: error: cannot find the library 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la' or unhandled argument
> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
>  .../0001-configure.ac-add-enable-gudev.patch       |   45 ++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch
>
> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> index d4fed71..c29bc7a 100644
> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
> @@ -4,7 +4,12 @@ LICENSE = "LGPLv2+"
>
>  inherit clutter
>
> -SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
> +SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch \
> +            file://0001-configure.ac-add-enable-gudev.patch \
> +            "
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gudev] = "--enable-gudev,--disable-gudev,udev"
>
>  DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
>  RDEPENDS_${PN} += "gstreamer1.0-meta-base"
> @@ -12,6 +17,14 @@ PACKAGES  =+ "${PN}-examples"
>
>  EXTRA_OECONF += "--disable-introspection"
>
> +python () {
> +    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, False, d) and \
> +        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
> +            bb.warn("%s: gudev can't be enabled since systemd doesn't provide libgudev" % \
> +                    d.getVar("PN", True))
> +            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
> +}
> +
I think this part of the patch is wrong: You have to replace udev by
gudev in DEPENDS part of packageconfig above and skip python function
complete.

Andreas

