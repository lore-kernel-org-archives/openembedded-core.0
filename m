Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0B294731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 22:17:36 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so39656438wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 14:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UamCUZRDtEAIyetP8c/sFzbbmDPXZrsrBJwksu/xfIo=;
	b=BTgJCGFWph1tNrMJl8VCLS4zLhGtYVKzzv9HwW4/VS0htZ5j+gHNgYbBhSVGm7OAph
	TVN7nY8sc4+UrZ+5IJlsLefmSYXZ2afgKmW7KDmZORFD6GlBkPWG2k7DF1K2G2JStJ/s
	rRKJK0YG5mI4zNWuh+NyUFSdiSWWpAh8BO3iLHfBFAzhwcwbOKrJpkSW9SCaWp2sttKz
	smAW+W9OEDBk/Drqv3pIgGQJP7eRaWea9R1F0lGqVXeqBaWuHyygkP6lpRXibeLvppyb
	WJzGn0qi1A+/uFyjVxrrJRtLnBkK+LqBJ1GS4yWogvrwA2E84oAPFeyxtIOE3NMheGnf
	6lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=UamCUZRDtEAIyetP8c/sFzbbmDPXZrsrBJwksu/xfIo=;
	b=jxLgZNUglldGszjwJXLlXD7nkhYAoX/ShJhowDLFnPtNDysvNVUDvmB1wyq7FlU/he
	fseyNwvDUSzGjKKWbE+aaxw4Mh84oeXVSmnfyABynefdfr+uc7cANE+H08P+eyA7fgXT
	fBoX4XVfMnIfzcIkm/PhFZMtYthwS+ZRIoEYBxv7txL6bByy53ZguWmsd+7WzwB/6mxz
	BnjlWLk4kueVCQSMAynhN9rVLoM4vL6Rj2xu4WT8DVdnE+MtgojSqxtQc4VFHdikzFZg
	umkKDveSkFjCuU8tCsT2p4g71Ovb9tjmNARMn1bH0KWlMQ7bf3GW+0t9O2dRg7F74dw0
	sddA==
X-Gm-Message-State: AG10YOTwz3cyHwQEXxR+BsFUK7iSt00XOV+1bJKrTXwD5Qc89T6Sq2wUZMKUum+00DFCf3toL4k2KTPhtTz8RA==
MIME-Version: 1.0
X-Received: by 10.28.146.8 with SMTP id u8mr140349wmd.72.1455315457378; Fri,
	12 Feb 2016 14:17:37 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 12 Feb 2016 14:17:37 -0800 (PST)
In-Reply-To: <1455278061.16142.278.camel@linuxfoundation.org>
References: <1455278061.16142.278.camel@linuxfoundation.org>
Date: Fri, 12 Feb 2016 14:17:37 -0800
Message-ID: <CAJ86T=U=e5qD67vCCVJRXQonHbv5qHx6SOTw5dLD=uFc0MAdWA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-meta-base: Don't use COMBINED_FEATURES
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
X-List-Received-Date: Fri, 12 Feb 2016 22:17:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 12, 2016 at 3:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> http://git.openembedded.org/openembedded-core/commit/?id=948165dce7475b815a344fd3c3d58165e6865d48
> makes gstreamer1.0-plugins-base-alsa depend on COMBINED_FEATURES.
>
> This is an allarch recipe so this only works if all your machines
> have the same MACHINE_FEATURES and not all do.

Good point. The recipe should set PACKAGE_ARCH = "${MACHINE_ARCH}" (as
packagegroup-base.bb does).

> Instead make this an unconditional RRECOMMEND, its a PACKAGES_DYNAMIC so
> this should all work out for everyone's use cases.

I have some machines which need the alsa plug-in and some machines
where it must not be installed. The alsa DISTRO feature alone is not
fine grained enough to handle that.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> index ecfd082..9d1b9dc 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> @@ -26,7 +26,6 @@ RDEPENDS_gstreamer1.0-meta-base = "\
>      gstreamer1.0 \
>      gstreamer1.0-plugins-base-playback \
>      gstreamer1.0-plugins-base-gio \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'gstreamer1.0-plugins-base-alsa', '',d)} \
>      gstreamer1.0-plugins-base-volume \
>      gstreamer1.0-plugins-base-audioconvert \
>      gstreamer1.0-plugins-base-audioresample \
> @@ -36,6 +35,10 @@ RDEPENDS_gstreamer1.0-meta-base = "\
>      gstreamer1.0-plugins-good-autodetect \
>      gstreamer1.0-plugins-good-souphttpsrc"
>
> +RRECOMMENDS_gstreamer1.0-meta-base = "\
> +    gstreamer1.0-plugins-base-alsa \
> +"
> +
>  RRECOMMENDS_gstreamer1.0-meta-x11-base = "\
>      gstreamer1.0-plugins-base-ximagesink \
>      gstreamer1.0-plugins-base-xvimagesink"
>
>

