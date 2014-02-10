Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA5D6D89A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 18:04:42 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id c9so11202403qcz.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 10:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=F1vNT7c0LqHTAnRgZUQkooi6emlI83rJuP07onjNCtk=;
	b=hVnc5fLFxzFl5irVJr0J2SrHJsphNByVBJJye1KQCLqYGnurb+ieOWZ2seg4xSEUpo
	lqMSNdaKtsYTFv0m+FEyav3QqlVwgngiXc2V741f5i70v30yOMu3uEnJO/cEZ/SoHuRR
	EoJNM6J3HoYda80l35RVoN4XHivt1i649P5ftiAAOEk4lm5XRGZdVTZJhn2HayymEV3f
	k+CStQqCsbJi7i8gHzPfgNST1BXhZt5v/nm9sCZCY0PTVmAumcEnjdVkqxzYLZY4EbvQ
	znQ6b9hX7kRKQnZZJlVD+zeVLmALjoa6Cc3alEgkQEZfsHyvcozl9j+dRD+4EWD5hgfs
	zy/w==
X-Gm-Message-State: ALoCoQkW+4DMILWxjsxKF0D2Tw0IjhT19HAE954UZwoEGcTE2bcFl3iUqKHoOuSaS1I++XvpB8we
X-Received: by 10.140.81.74 with SMTP id e68mr47000358qgd.99.1392055482483;
	Mon, 10 Feb 2014 10:04:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 10 Feb 2014 10:04:22 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Feb 2014 18:04:22 +0000
Message-ID: <CAJTo0Lay3-E6TYssyTgya16SjyjAYk2MLFFcbOa+P1Mk3SYB8w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: Re: [PATCH][Dora] binconfig: mangle ${base_libdir}
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
X-List-Received-Date: Mon, 10 Feb 2014 18:04:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Can this be considered for Dora?  (the oe-core commit is
ccd9abdccb84d713427541b6ee29a0e217360e74)

Cheers,
Ross


On 6 February 2014 23:17, Ross Burton <ross.burton@intel.com> wrote:
> Some recipes are installing libraries into ${base_libdir} (typically /lib) and
> also use a foo-config binary to identify compile paths, for example
> libusb-compat.  Without mangling ${base_libdir} the ${base_libdir} path is
> passed to the compiler, where it looks like a host path and results in
> compile-host-path QA errors.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/binconfig.bbclass |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
> index 4c42602..848c744 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -5,6 +5,7 @@ def get_binconfig_mangle(d):
>         s = "-e ''"
>         if not bb.data.inherits_class('native', d):
>                 optional_quote = r"\(\"\?\)"
> +               s += " -e 's:=%s${base_libdir}:=\\1OEBASELIBDIR:;'" % optional_quote
>                 s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
>                 s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
>                 s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
> @@ -12,6 +13,7 @@ def get_binconfig_mangle(d):
>                 s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
>                 s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
>                 s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
> +               s += " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
>                 s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
>                 s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
>                 s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
> @@ -31,7 +33,8 @@ PACKAGE_PREPROCESS_FUNCS += "binconfig_package_preprocess"
>  binconfig_package_preprocess () {
>         for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
>                 sed -i \
> -                   -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
> +                   -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
> +                   -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
>                     -e 's:${STAGING_INCDIR}:${includedir}:g;' \
>                     -e 's:${STAGING_DATADIR}:${datadir}:' \
>                     -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
> @@ -39,6 +42,7 @@ binconfig_package_preprocess () {
>         done
>         for lafile in `find ${PKGD} -name "*.la"` ; do
>                 sed -i \
> +                   -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
>                     -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
>                     -e 's:${STAGING_INCDIR}:${includedir}:g;' \
>                     -e 's:${STAGING_DATADIR}:${datadir}:' \
> --
> 1.7.10.4
>

