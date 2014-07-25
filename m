Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id A58FD60703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:23:06 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so3960879ieb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N9TP3yUtSZIqkv0O42ZwimBNZRHwm3SqV7jIK39x4Ck=;
	b=RFXAAYliGRH8BpzfzK6AQW2wOzETDCNBF+M0KzDCVxq88gd1mfLoQCNmceD0dFvVG6
	1fXdognsPS/xMNCh49G5Cmvwm4Z6GacsmRoLRrKhwT/9iNJCRQrgujilT7+Q5Y60ctPn
	5IANoDkPEI7NCDVKn4hPQb8zz6Go8R1ThKAuyuIA8RVqpG/dmlbyN0DYpUl6w89dtVYh
	TlucmtZ2yyeKsBCELfasX9ClK5EFneEC5SbUoJeXSfFYuMMpDnnkjz+2r50hY2F/ZIeW
	Fy2UMOk3WH2+0RmWbgzOSgii9KWGHQoAwAAGyu7eQCrEC3ko/B21x+a2FVUnTYR92fK2
	Eg1w==
X-Received: by 10.50.13.102 with SMTP id g6mr7292379igc.20.1406305387078; Fri,
	25 Jul 2014 09:23:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 25 Jul 2014 09:22:36 -0700 (PDT)
In-Reply-To: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2014 09:22:36 -0700
Message-ID: <CAMKF1so3=BnFtOS988XY9pNmGZCx9Cgg7sALnomE=bvoYOZv=Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Fri, 25 Jul 2014 16:23:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 16, 2014 at 3:52 AM, Ross Burton <ross.burton@intel.com> wrote:
> OpenSSL has license complications and GnuTLS is preferred, so although the
> license complications don't impact wget use GnuTLS for consistency.
>
> Also add a recommendation on ca-certificates so that https: URLs work.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/wget/wget.inc |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> index a778bca..642d502 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -3,15 +3,16 @@ HOMEPAGE = "https://www.gnu.org/software/wget/"
>  SECTION = "console/network"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -DEPENDS = "openssl zlib libpcre"
> +DEPENDS = "gnutls zlib libpcre"

it would be nice if this was either virtual/ssh or some sort of
PACKAGECONFIG so folks who
have ssl on the system dont need to pull gnutls as well.

>
>  INC_PR = "r16"
>
>  inherit autotools gettext texinfo update-alternatives
>
> -EXTRA_OECONF = "--enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} \
> -                --with-ssl=openssl --disable-rpath --disable-iri \
> +EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
>                  ac_cv_header_uuid_uuid_h=no"
>
>  ALTERNATIVE_${PN} = "wget"
>  ALTERNATIVE_PRIORITY = "100"
> +
> +RRECOMMENDS_${PN} += "ca-certificates"
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

