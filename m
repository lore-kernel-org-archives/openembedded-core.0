Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9237E65EB1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 12:45:59 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so8906756qga.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 05:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PAR8EHzOgKA0WB5x+rkBLtGRoKHTly4L8SWImgvhC2s=;
	b=GnznlcTrRNmhbsmnrha7+Kp/UWep7ie+2Kxpf/sSpdH5NGdJpQUT3v3y4iX/nkbMrp
	YpKVAxMXCi2aj5fgipW3b494wRCvAlmLJ9FLONektzXK2sgI8/Z0gLR2X5FyQmk2SyxA
	Uz4Ang4G8iIc+P3w5UQsfZBktiJJeenMRdXqFpQtK4jemJV/auesQSp7Nza/rLJcC+dZ
	QByxvbnZPmQfkRIWB4hMuxsrlu4JGT0ptusRrC+4OTtdwYT1fsr9u5m7yWo+tS9ABuxw
	9YX7En7HlSb5pbqs8QaRlZrTCNHFmvpvURpVHS9KbaiTHnuymwgDylnFfxsL9dfuC2Gw
	Nx2Q==
X-Gm-Message-State: ALoCoQmRbp0Ey8o1Rz/KVNDxQc0sDGeDnbEttZQ6iWTpsOlPvdBfUpY6Nl3sIB/KQ+5oksrDQYm+
X-Received: by 10.140.109.70 with SMTP id k64mr30486233qgf.92.1402317960202;
	Mon, 09 Jun 2014 05:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Mon, 9 Jun 2014 05:45:38 -0700 (PDT)
In-Reply-To: <1402068711-10161-1-git-send-email-valentin.popa@intel.com>
References: <1402068711-10161-1-git-send-email-valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jun 2014 13:45:38 +0100
Message-ID: <CAJTo0LYO1cuV0db7fkunTGBTMTGp2Hx11EHQj+V7ie4kOPxu8w@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-xserver: enable dri3 by default
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
X-List-Received-Date: Mon, 09 Jun 2014 12:46:02 -0000
Content-Type: text/plain; charset=UTF-8

After chatting with some colleagues in the graphics team I've decided
that we should have support for DRI3, but not enable it by default
(there's presently regressions compared to DRI2).

Ross

On 6 June 2014 16:31, Valentin Popa <valentin.popa@intel.com> wrote:
> Don't let xorg-xserver to automatically enable/disable
> dri3.
>
> [YOCTO #6402]
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 2e83d53..e4eaaa6 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -116,10 +116,11 @@ EXTRA_OECONF += "--with-fop=no \
>                   ac_cv_file__usr_share_sgml_X11_defs_ent=no \
>  "
>
> -PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
> +PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 dri3 glx', '', d)}"
>  PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
>  PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
>  PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
> +PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto libxshmfence"
>  PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
>
>  do_install_append () {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

