Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrEqd-00053X-P0
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 21:26:08 +0100
Received: by pbaa13 with SMTP id a13so2190688pba.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 12:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=kLv65Tnh+qCxQ+vKR1Jq6te63h/F00FpcENpx5D0+/w=;
	b=KpUk3cQTQXdiDli55XZhGQnENFhkYJoM4YxlpFUROXKwH/vQdHqJRYLIjoIU73IbMP
	dl0AUDE71ws3B1ySRgkZSjVriCqbNUOQiWNeMUfCjMZ6Lpxn6rz5h0c2dBcTxpule3YG
	/lX++tO0LzMHY13iE5jLVgI0Mt3qR9VL5x2/I=
Received: by 10.68.217.66 with SMTP id ow2mr12377036pbc.125.1327781896558;
	Sat, 28 Jan 2012 12:18:16 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id i1sm31603059pbt.19.2012.01.28.12.18.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 12:18:15 -0800 (PST)
Date: Sat, 28 Jan 2012 12:18:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120128201809.GC22106@sakrah.homelinux.org>
References: <1327624433-27864-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1327624433-27864-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] atk: add native support / disable introspection / merge atk.inc -> recipe
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
X-List-Received-Date: Sat, 28 Jan 2012 20:26:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (27/01/12 01:33), Andreas Müller wrote:
> Native support currently is appended in meta-oe. Native build failed with:
> 
> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
> | error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
> | make[3]: *** [Atk-1.0.typelib] Error 1
> 
> build tested in meta-oe / angstrom environment
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-support/atk/atk.inc      |   13 -------------
>  meta/recipes-support/atk/atk_2.2.0.bb |   17 +++++++++++++----
>  2 files changed, 13 insertions(+), 17 deletions(-)
>  delete mode 100644 meta/recipes-support/atk/atk.inc
> 
> diff --git a/meta/recipes-support/atk/atk.inc b/meta/recipes-support/atk/atk.inc
> deleted file mode 100644
> index 6a4fef6..0000000
> --- a/meta/recipes-support/atk/atk.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION = "An accessibility toolkit for GNOME."
> -HOMEPAGE = "http://live.gnome.org/GAP/"
> -BUGTRACKER = "https://bugzilla.gnome.org/"
> -
> -LICENSE = "LGPLv2 & LGPLv2+"
> -
> -SECTION = "x11/libs"
> -
> -DEPENDS = "glib-2.0 gtk-doc-native"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--disable-glibtest"
> diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.2.0.bb
> index 0d657b5..daa7931 100644
> --- a/meta/recipes-support/atk/atk_2.2.0.bb
> +++ b/meta/recipes-support/atk/atk_2.2.0.bb
> @@ -1,14 +1,23 @@
> -require atk.inc
> +DESCRIPTION = "An accessibility toolkit for GNOME."
> +HOMEPAGE = "http://live.gnome.org/GAP/"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +SECTION = "x11/libs"
>  
> -PR = "r1"
> +LICENSE = "LGPLv2 & LGPLv2+"

there was no LGPLv2 only LGPLv2.1 so something like LGPLv2.1+ would be
ok here

>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>                      file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
>                      file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
> +PR = "r2"
>  
> -SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
> +DEPENDS = "glib-2.0 gtk-doc-native"
> +
> +inherit autotools pkgconfig
>  
> +SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] = "4894e9b04f0a9f1c37a624a1e8d6d73f"
>  SRC_URI[sha256sum] = "d201e3f5808aef0b1aec2277bfa61074f68863e405428adb57a73aab5c838450"
>  
> +BBCLASSEXTEND = "native"
>  
> -
> +EXTRA_OECONF = "--disable-glibtest \
> +                --disable-introspection"
> -- 
> 1.7.4.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


