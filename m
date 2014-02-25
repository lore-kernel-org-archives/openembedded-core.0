Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D298F6EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:33:46 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id ar20so4437243iec.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 21:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vnaZ8kXoX7oyzqoDFb+dQ4fgz3hhs6p1H89+P4H1ZcY=;
	b=E56q7RGpqBNdXN9M75GW8zDnJFWfyT88Z557ZFU6dw2Nd0zI5wsy+RQsPTwfDJoVLq
	rAT1CrmpXAVJkmh4qPRnRNgBJR0Ej7g6qFbM/5cZOejrSDeH8dpXM1rwTnC0fyDFotA7
	LFOupSnALk6V5vz4kKnBLddo1w8PK+R90akcSnGmw9RCn8ZEkfxdPY3wxj4M1EbSCbNM
	W7lrwXAoUB5mOVVxAlgysAP9JQ/SJ5Hgt2y8zzyoo6tBJdQAcrs+fAn/PA+iZTM2vi7p
	2ghua2bxqhZtUErU7Wws3xO4+o6sHR7IGiK+SkQD4gchpNAzSQNltmTJGJg4Mo+aR2P6
	Ty7A==
X-Received: by 10.50.20.100 with SMTP id m4mr1100141ige.17.1393306427205; Mon,
	24 Feb 2014 21:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 24 Feb 2014 21:33:17 -0800 (PST)
In-Reply-To: <1393194057-2364-1-git-send-email-mac@mcrowe.com>
References: <1393194057-2364-1-git-send-email-mac@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 21:33:17 -0800
Message-ID: <CAMKF1speSb1EJmaqZomq6GZ41Zg5WmFd0+e0fXiJBUiGE_WPMQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.35.0
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
X-List-Received-Date: Tue, 25 Feb 2014 05:33:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 23, 2014 at 2:20 PM, Mike Crowe <mac@mcrowe.com> wrote:
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/recipes-support/curl/curl_7.34.0.bb |   63 ------------------------------
>  meta/recipes-support/curl/curl_7.35.0.bb |   61 +++++++++++++++++++++++++++++

can you generate patches with git format-patch -M ? makes renames
detection better
and patches are simple to review

>  2 files changed, 61 insertions(+), 63 deletions(-)
>  delete mode 100644 meta/recipes-support/curl/curl_7.34.0.bb
>  create mode 100644 meta/recipes-support/curl/curl_7.35.0.bb
>
> diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
> deleted file mode 100644
> index aba6649..0000000
> --- a/meta/recipes-support/curl/curl_7.34.0.bb
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -SUMMARY = "Command line tool and library for client-side URL transfers"
> -HOMEPAGE = "http://curl.haxx.se/"
> -BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> -SECTION = "console/network"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
> -
> -DEPENDS = "zlib gnutls"
> -DEPENDS_class-native = "zlib-native openssl-native"
> -DEPENDS_class-nativesdk = "nativesdk-zlib"
> -
> -SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> -           file://pkgconfig_fix.patch \
> -"
> -
> -# curl likes to set -g0 in CFLAGS, so we stop it
> -# from mucking around with debug options
> -#
> -SRC_URI += " file://configure_ac.patch"
> -
> -SRC_URI[md5sum] = "88491df2bb32e9146e776ae6ac2f8327"
> -SRC_URI[sha256sum] = "10beade56b48311499e444783df3413405b22f20a147ed4a1d8a8125f1cc829b"
> -
> -inherit autotools pkgconfig binconfig multilib_header
> -
> -EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
> -                --without-libssh2 \
> -                --with-random=/dev/urandom \
> -                --without-libidn \
> -                --enable-crypto-auth \
> -                --disable-ldap \
> -                --disable-ldaps \
> -                --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> -                ${CURLGNUTLS} \
> -                "
> -
> -CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
> -CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
> -CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
> -
> -do_configure_prepend() {
> -       sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
> -}
> -
> -do_install_append() {
> -       oe_multilib_header curl/curlbuild.h
> -}
> -
> -PACKAGES =+ "libcurl libcurl-dev libcurl-staticdev libcurl-doc"
> -
> -FILES_lib${BPN} = "${libdir}/lib*.so.*"
> -RRECOMMENDS_lib${BPN} += "ca-certificates"
> -FILES_lib${BPN}-dev = "${includedir} \
> -                      ${libdir}/lib*.so \
> -                      ${libdir}/lib*.la \
> -                      ${libdir}/pkgconfig \
> -                      ${datadir}/aclocal \
> -                      ${bindir}/*-config"
> -FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> -FILES_lib${BPN}-doc = "${mandir}/man3 \
> -                      ${mandir}/man1/curl-config.1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/curl/curl_7.35.0.bb b/meta/recipes-support/curl/curl_7.35.0.bb
> new file mode 100644
> index 0000000..ddb0384
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl_7.35.0.bb
> @@ -0,0 +1,61 @@
> +SUMMARY = "Command line tool and library for client-side URL transfers"
> +HOMEPAGE = "http://curl.haxx.se/"
> +BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> +SECTION = "console/network"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
> +
> +DEPENDS = "zlib gnutls"
> +DEPENDS_class-native = "zlib-native openssl-native"
> +DEPENDS_class-nativesdk = "nativesdk-zlib"
> +
> +SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> +           file://pkgconfig_fix.patch \
> +"
> +
> +# curl likes to set -g0 in CFLAGS, so we stop it
> +# from mucking around with debug options
> +#
> +SRC_URI += " file://configure_ac.patch"
> +
> +SRC_URI[md5sum] = "c18fbdd031adb0529ae09fce399f2d10"
> +SRC_URI[sha256sum] = "d774d1701454f1b7d331c2075fc4f6dd972bddc2d171f43645ef3647c7fc0d83"
> +
> +inherit autotools pkgconfig binconfig
> +
> +EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
> +                --without-libssh2 \
> +                --with-random=/dev/urandom \
> +                --without-libidn \
> +                --enable-crypto-auth \
> +                --disable-ldap \
> +                --disable-ldaps \
> +                ${CURLGNUTLS} \
> +                "
> +
> +CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
> +CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
> +CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
> +
> +do_configure_prepend() {
> +       sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
> +}
> +
> +PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
> +
> +FILES_${PN}-certs = "${datadir}/curl/curl-*"
> +PACKAGE_ARCH_${PN}-certs = "all"
> +
> +FILES_lib${BPN} = "${libdir}/lib*.so.*"
> +RRECOMMENDS_lib${BPN} += "${PN}-certs"
> +FILES_lib${BPN}-dev = "${includedir} \
> +                      ${libdir}/lib*.so \
> +                      ${libdir}/lib*.la \
> +                      ${libdir}/pkgconfig \
> +                      ${datadir}/aclocal \
> +                      ${bindir}/*-config"
> +FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> +FILES_lib${BPN}-doc = "${mandir}/man3 \
> +                      ${mandir}/man1/curl-config.1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

