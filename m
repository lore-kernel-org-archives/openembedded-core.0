Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 856F671B14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 20:52:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r144so37538541wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nFs9/BVxQ4m+gD1YBTt7/kExTa7THXF5mCcFw6VDMJs=;
	b=CnxkZrhGKgpRRDwePx6cZWHAoF3aJgVW7lgMIEqvNmsAzpBSVUBDvrOcieBvRwmSyL
	6MWEvusnYm1kuBw62HVlRHKQFJZztKvSm8mehuTTvbHow1u1ZolvtOZpy8Vvprjg+MgM
	qIrUnhwBPjRnfbEtNBydyBSNBN1H0x/MsyyNjR7te+Qjgimr46BO7Mzd3SGCYYZbbVxX
	EzIsrKdwrX+HWIcO8l8dxqhY5yl/Fyj8JMOxKeSljgRLog2BZL1uWhOAYolSfqdO9+sx
	ZP/MaHfyt6Ow+Lb3OArypytesv10l8CxMRjscqTqgL6XM5ewD5nG7KWyABdNowcmyICo
	5MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nFs9/BVxQ4m+gD1YBTt7/kExTa7THXF5mCcFw6VDMJs=;
	b=lPBXzdP7hrCWHbz8Q5u80FuseGKXGu8KYSJPbJRhhKuYhe7UDGzET/QAaE9+OXeBR9
	97UeiK+jxRzMHT2Kfvh8YbbdxAxubQgqnG0wX/hTmva8mHXdEQ0zsAaq5lpeo+o5qKbo
	06q8KpxbDJCdY+mYtinp10DBKVDFpPHtLYeufthqDzIT4LQz6P+d5bcLc3buhj2XGuGF
	IwmUnuMpVl+7/NfN+yUd1nuumDcoUJmiKqy1iyhPLbl48SfjsSVUx4uFVV0uXTfyNXBi
	pxVidV4CLofAzbwRYAMcke/0Pbfb5Mulr+6l8fp/zkH/JF/UYKxL3um5N3yMOlveBrez
	1eeQ==
X-Gm-Message-State: AIkVDXLUA3PtkOqd48y5N9UAjx669Q+8r3/675o72wCO+2OvuEJsOWD4RDX68s+UZVU0gBrSuBFWxeKjLJpTAg==
X-Received: by 10.28.191.208 with SMTP id o77mr18877517wmi.117.1485291123114; 
	Tue, 24 Jan 2017 12:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Tue, 24 Jan 2017 12:52:02 -0800 (PST)
In-Reply-To: <1485288900-19603-1-git-send-email-jslater@windriver.com>
References: <1485288900-19603-1-git-send-email-jslater@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Jan 2017 12:52:02 -0800
Message-ID: <CAJ86T=WEmxqwL-8FGqs52hJHHbOi2h383fnCqsiHpy2+HmsUPg@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gnutls: avoid accidentally using libseccomp
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
X-List-Received-Date: Tue, 24 Jan 2017 20:52:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2017 at 12:15 PM, Joe Slater <jslater@windriver.com> wrote:
> Specify whether to use libseccomp or not.  Do not
> just let configure check for it.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 003dc55..14fcdca 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -21,6 +21,17 @@ SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
>
>  inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
>
> +# We cannot use PACKAGECONFIG for this since there is no controlling
> +# configure option.

A configure option is not a requirement for using PACKAGECONFIG. e.g.

  meta/recipes-devtools/apt/apt_1.2.12.bb:PACKAGECONFIG[lzma] =
"ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
  meta/recipes-devtools/apt/apt_1.2.12.bb:PACKAGECONFIG[bz2] =
"ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
  meta/recipes-devtools/apt/apt_1.2.12.bb:PACKAGECONFIG[lz4] =
"ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
  meta/recipes-devtools/mtools/mtools_3.9.9.bb:PACKAGECONFIG[libbsd] =
"ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
  meta/recipes-devtools/mtools/mtools_4.0.18.bb:PACKAGECONFIG[libbsd]
= "ac_cv_lib_bsd_main=yes,ac_cv_lib_bsd_main=no,libbsd"
  meta/recipes-devtools/strace/strace_4.14.bb:PACKAGECONFIG[bluez] =
"ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
  meta/recipes-extended/screen/screen_4.4.0.bb:PACKAGECONFIG[utempter]
= "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
  meta/recipes-graphics/xorg-lib/libice_1.0.9.bb:PACKAGECONFIG[arc4] =
"ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
  meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb:PACKAGECONFIG[arc4]
= "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"

> +# To use seccomp, uncomment the two variables.  You must also
> +# have CONFIG_SECCOMP enabled in the kernel.
> +#
> +#DEPENDS_append_class-target = " libseccomp"
> +#lcl_LIBSECCOMP_class-target = "ac_cv_libseccomp=yes"
> +
> +lcl_LIBSECCOMP ?= "ac_cv_libseccomp=no"
> +
>  PACKAGECONFIG ??= "libidn zlib"
>
>  PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
> @@ -38,6 +49,7 @@ EXTRA_OECONF = " \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
>      --without-libunistring-prefix \
> +    ${lcl_LIBSECCOMP} \
>  "
>
>  LDFLAGS_append_libc-musl = " -largp"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

