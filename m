Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 113FB6059E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 18:55:35 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y5so2346687pff.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 10:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lIJq4LoxgJxxEC8Njd+lfr+j5qymSs0Fz8HgPI7mxnI=;
	b=CIMDW3jJpVPCpketpzcdPN3yC4JyVrv9+ahP5YlakIoapazg9vYkqflyU2Jgt+t0yS
	S53YYgvL9MVCvWzdRk+MM7H0JkPKfR/xs3JJ3CwettzgD0RY0kTB030+P3yRq0zAJybJ
	YN27mQaX0/oKP5YU/5/+hV/2K9WOhSZFTgZTbeRzCeE/DI1KHdsgoXce2+3xVWvr74bm
	fGlE3aOE/rXiGL1JJ3dpos6idUF2fb4KpZoIGZC32XCQFeFnube908j6c44qiT65n0tc
	oca8ipEEB6vwnWX6jo88Pe+do/5+Bj4ijqgc635kVLjtT4L+Qk12gYNmMLdG57CrnYk/
	CGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lIJq4LoxgJxxEC8Njd+lfr+j5qymSs0Fz8HgPI7mxnI=;
	b=p4W3KMbo4iB38QW6X4Ja7V3bDemk9I8ndUkSUb5rCAbcsjhawZ5UH93AcrrOpq72Ww
	aMc2R8uQWynD/iUS3ifhemPHh8+fG8tBpOuJUCovnjE2KyEeYzYZk/ncBnriLwX0B+1n
	Pns4j5+Oolg9+LIYHNctH3irZ7OIa6DS/1zqK/yaiCeVTm+ozYRcfpbWU8iZv154yxva
	OLolFoSTJVHIkM9aIznRiJaU4deeYNpEMzq0aal/1KM79L5XTTpr2gZ91LZqoBOEj4Ip
	JWfA4aqOOlATq38U4k347MPfYVjA6NweUxIz7+VaxCINaVXnyC6K+oCoeQ0rvxaiWgbj
	YPaA==
X-Gm-Message-State: AKGB3mJF0LigIEneALdN40nc1dq7BjNdJi12DF/5FO1CsLYXOA3EGIOg
	472QNaKVgkFHvstS7oiQYBPk3h1LuqyRLR9UKAo=
X-Google-Smtp-Source: ACJfBotFmjt/1dDpX7Gf9u8Vs4pKvYSsrgBTOwpZ7sRKiK6rFK0RQtYCMBBXiDU+Oc4iSIaRTYP6MYWejiP+znlnuuI=
X-Received: by 10.159.196.133 with SMTP id c5mr22431497plo.99.1515696937369;
	Thu, 11 Jan 2018 10:55:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 11 Jan 2018 10:55:06 -0800 (PST)
In-Reply-To: <20180110172858.22739-2-ross.burton@intel.com>
References: <20180110172858.22739-1-ross.burton@intel.com>
	<20180110172858.22739-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2018 10:55:06 -0800
Message-ID: <CAMKF1sqDR_SYOQ0Wg4Vr=XeQDKrEwNh3g7F5-_3nURphFbo1Lw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gettext: rationalise optional dependencies
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
X-List-Received-Date: Thu, 11 Jan 2018 18:55:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 10, 2018 at 9:28 AM, Ross Burton <ross.burton@intel.com> wrote:
> gettext has optional dependencies on libxml2, glib, libcroco and libunistring.
> If they're not available then gettext will use internal copies, but it can also
> use system libraries.
>
> For gettext-native and nativesdk-gettext continue to use the internal copies to
> reduce the dependencies, but for target use the system shared libraries.
>

Do we get any reduction in size ? if yes how much, not sure whats the defaults
generally used by other distributions but it would nice to be using
the default config
options for best results.

> Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build
> dependency on expat.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index c2059e608b1..97083c0da2d 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -8,7 +8,7 @@ SECTION = "libs"
>  LICENSE = "GPLv3+ & LGPL-2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -DEPENDS = "gettext-native virtual/libiconv expat"
> +DEPENDS = "gettext-native virtual/libiconv"
>  DEPENDS_class-native = "gettext-minimal-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
>  PROVIDES_class-native = "virtual/gettext-native"
> @@ -22,8 +22,6 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>  SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
>  SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
>
> -PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
> -
>  inherit autotools texinfo
>
>  EXTRA_OECONF += "--without-lispdir \
> @@ -33,18 +31,24 @@ EXTRA_OECONF += "--without-lispdir \
>                   --disable-native-java \
>                   --disable-openmp \
>                   --disable-acl \
> -                 --with-included-glib \
>                   --without-emacs \
>                   --without-cvs \
>                   --without-git \
> -                 --with-included-libxml \
> -                 --with-included-libcroco \
> -                 --with-included-libunistring \
>                  "
>  EXTRA_OECONF_append_class-target = " \
>                   --with-bisonlocaledir=${datadir}/locale \
>  "
>
> +PACKAGECONFIG ??= "croco glib libxml libunistring"
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[croco] = "--without-included-libcroco,--with-included-libcroco,libcroco"
> +PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
> +PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
> +PACKAGECONFIG[libunistring] = "--without-included-libunistring,--with-included-libunistring,libunistring"
> +PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
> +
>  acpaths = '-I ${S}/gettext-runtime/m4 \
>             -I ${S}/gettext-tools/m4'
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

