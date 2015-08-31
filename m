Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id ABDB174197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:10:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 2D3F0207DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 08:10:18 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute6.internal (MEProxy); Mon, 31 Aug 2015 08:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=uwoLw2vRMgPbCyc
	odidAYrNjGDk=; b=tF0stut6c+4EqDo9P580mkz/z46ffyvjENMPtFDl1nNxL8q
	RHIG/MbcqH/8NJaX1HLRdX9JhMJnP16u5EeWFONHdUMmNQQt4RnbJsWctNCOM2wM
	Zm2gFofhdAtlo4vv1S+XfMaRwZyQVZj4VlFYOhQzmFQUH/AIUuOYvFbAPYKs=
X-Sasl-enc: 9eAy1lBeROCxRuBp4A61MdCNf3uKax7efypG/n29pZOH 1441023017
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8457EC00013;
	Mon, 31 Aug 2015 08:10:17 -0400 (EDT)
Message-ID: <1441023016.3248.1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 15:10:16 +0300
In-Reply-To: <1440778036-31624-1-git-send-email-Martin.Jansa@gmail.com>
References: <1440778036-31624-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.3-1 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH] pulseaudio: improve PACKAGECONFIG for dbus/consolekit dependencies
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
X-List-Received-Date: Mon, 31 Aug 2015 12:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 18:07 +0200, Martin Jansa wrote:
> * the problem is that consolekit module is built whenever dbus is 
> enabled
>   and consolekit is available only in distributions with x11 in 
> DISTRO_FEATURES
> * many distributions want to enable dbus support (required for bluez 
> support),
>   but without consolekit because they aren't using x11
> * allow to completely disable dbus (and consolekit)
> * add consolekit runtime dependency only for x11 in DISTRO_FEATURES
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Looks good to me.

-- Tanu


> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc 
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 3389ec9..a2b4446 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "
> file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>  
>  DEPENDS = "libatomics-ops liboil libsndfile1 libtool"
>  # optional
> -DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
> +DEPENDS += "udev alsa-lib glib-2.0 gconf"
>  DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
>  
>  inherit autotools pkgconfig useradd gettext perlnative bluetooth 
> systemd
> @@ -37,8 +37,10 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FE
> ATURES', 'bluetooth', '${BLUEZ
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 
> 'x11', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', '3g', 
> 'ofono', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 
> 'systemd', 'systemd', '', d)} \
> +                   dbus \
>                     "
>  
> +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
>  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 
> sbc"
>  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 
> sbc"
>  PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable
> -bluez5-ofono-headset,ofono"
> @@ -75,7 +77,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home 
> /var/run/pulse \
>  # adding the console-kit module to an image, we also get the 
> necessary
>  # consolekit package produced.
>  PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple 
> libpulse-mainloop-glib \
> -             pulseaudio-server pulseaudio-misc ${@bb.utils.contains(
> 'PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
> +             pulseaudio-server pulseaudio-misc ${@bb.utils.contains(
> 'PACKAGECONFIG', 'dbus', 'pulseaudio-module-console-kit', '', d)}"
>  
>  #upgrade path:
>  RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
> @@ -157,7 +159,9 @@ RDEPENDS_pulseaudio-server = " \
>  # that makes the PulseAudio plugin the default ALSA device.
>  RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
>  
> -RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
> +# pulseaudio-module-console-kit is built whenever dbus is enabled by 
> PACKAGECONFIG
> +# but consolekit depends on libx11 and is available only for DISTRO 
> with x11 in DISTRO_FEATURES
> +RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DIS
> TRO_FEATURES', 'x11', 'consolekit', '', d)}"
>  RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
>  
>  FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
> -- 
> 2.5.0
> 

