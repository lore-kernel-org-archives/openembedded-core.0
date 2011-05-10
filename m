Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QJnwQ-0006aX-3g
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:29:38 +0200
Received: by gyf1 with SMTP id 1so2348379gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=MqnqRFqU1A+JpiYRFPNHuh57mkuSIpb9LkfQZXtynbw=;
	b=Ez0NI52cFK5jl0eeDgXbgvf1WXiMenndpgzs630GxDrLq/M03JWYvXy8cq7J1frc2e
	kfhvbsZE26HrAXRkfDgxIt9vbuEI/4pZd0YKKNI2UfPpGMf3aBaoN9ZKZ1wUOU7J0Nm8
	JjVzsVVdeOWztQlholZLysyOmGneimmsriW7M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lZwihK9wSKGpY64gMlsgjneAbbjjk8eUVN4Zd7rhwiaOgiHp52Tk+RCu6Te2xMVc7S
	9tEyEAw9vIadgJ5kNH4TlOHWaiCUPJnOVQVztvZSxsSwlFRyG2UCt5b6QhJ/3wZO6uW5
	EavxpvXn/b5PGpVnLicexC7dFJh7e/rJs9PBA=
MIME-Version: 1.0
Received: by 10.91.201.31 with SMTP id d31mr4595086agq.182.1305037611915; Tue,
	10 May 2011 07:26:51 -0700 (PDT)
Received: by 10.90.32.18 with HTTP; Tue, 10 May 2011 07:26:51 -0700 (PDT)
In-Reply-To: <2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 16:26:51 +0200
Message-ID: <BANLkTimcGCLPFM0ShJPyaDqm+X8PaX1DXQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Tue, 10 May 2011 14:29:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some minor remarks on the default-distrovars.inc contents:

2011/5/10 Richard Purdie <richard.purdie@linuxfoundation.org>
[...]

> diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> new file mode 100644
> index 0000000..ab26a30
> --- /dev/null
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -0,0 +1,43 @@
> +QA_LOGFILE = "${TMPDIR}/qa.log"
>
Should this be here? I would expect the class file that uses this to have
this as default and/or have this in local.conf.sample.
This does not seem too distro specific

> +
> +IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
>
Hm, again something that is probalby not distro related. And why only for
_ext2 and not eg for _ext3 or for _jffs2
Personally I always stuff this in my image recipe

> +
> +OEINCLUDELOGS ?= "yes"
>
in local.conf.sample?

> +KERNEL_CONSOLE ?= "ttyS0"
>
I'm inclined to put this into the machine conf. Is this really a distro
thing?

> +
> +require conf/distro/include/preferred-xorg-versions.inc
> +
> +PCMCIA_MANAGER ?= "pcmciautils"
> +
> +IMAGE_LINGUAS ?= "en-us en-gb"
> +LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
> +ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> +LOCALE_UTF8_ONLY ?= "0"
>
Again something I tend to do in image recipes; then again this might be
because I do not use feeds, only make images.

> +
> +DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi
> nfs zeroconf pci"
>
Is this the complete range? I would expect all features to be enabled by
default (and let MACHINE_FEATURES reduce that set)

> +
> +DISTRO_EXTRA_RDEPENDS += "task-core-boot"
> +DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
> +
> +IMAGE_FEATURES ?= ""
>
Has a var with ?= assignment of an empty string any meaning. Thought an
empty string would be the default.

> +
> +# This is a list of packages that are used by the build system to build
> the distribution, they are not
> +# directly part of the distribution.
> +HOSTTOOLS_WHITELIST_GPLv3 ?= ""
> +WHITELIST_GPLv3 ?= "less"
>
I'm not sure why less is listed in the line above:
the less license is not gpl (at least not less 443)


> +LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc
> gcc-runtime"
> +
> +# This is a list of packages that require a commercial license to ship
> +# product. If shipped as part of an image these packages may have
> +# implications so they are disabled by default
> +COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
> +COMMERCIAL_AUDIO_PLUGINS ?= ""
> +# COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad
> gst-plugins-ugly-mpegaudioparse"
> +COMMERCIAL_VIDEO_PLUGINS ?= ""
> +# COMMERCIAL_VIDEO_PLUGINS ?= "gst-plugins-ugly-mpeg2dec
> gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
> +COMMERCIAL_QT ?= ""
> +# COMMERCIAL_QT ?= "qmmp"
> +# Set of common licenses used for license.bbclass
> +COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
>
maybe the above could be in a separate license.inc file or so.

> +
> +BB_GENERATE_MIRROR_TARBALLS ??= "0"
>
local.conf.sample ?

Enjoy! Frans

