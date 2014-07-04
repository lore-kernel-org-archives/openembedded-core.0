Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA7365CA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 09:09:15 +0000 (UTC)
Message-ID: <53B66F26.5000800@communistcode.co.uk>
Date: Fri, 04 Jul 2014 10:08:54 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jul 2014 09:09:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16/06/14 11:52, Ross Burton wrote:
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
> 

Ross,

I've just pulled this in today after being on holiday for a while and it
causes a breakage on my system.

| checking for libgnutls... no
| configure: error: --with-ssl=gnutls was given, but GNUTLS is not
available.
| Configure failed. The contents of all config.log files follows to aid
debugging

log: http://ix.io/dfO

I would have expected gnutls to have been pulled in through the depends
but it obviously hasn't, or the system hasn't managed to find it...

Any ideas?

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

