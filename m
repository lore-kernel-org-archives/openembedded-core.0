Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D55D73111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v28HS8iN003482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 09:28:08 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 09:28:07 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <982f2830-f150-faa5-eebf-ff5ccb7972c5@windriver.com>
Date: Wed, 8 Mar 2017 11:28:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 17:28:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/8/17 10:57 AM, Ross Burton wrote:
> Cryptodev is a way for userspace to access the kernel crypto drivers (and so,
> hardware crypto).

If the BSP does not support crypto dev, what is the harm in this?  It should
fall back to standard behaviors.

> Not all hardware supports cryptodev so this is something that should be enabled
> in a BSP layer instead of in oe-core.

This would make the package be machine specific, which I'm not sure is good for
a package like openssl.  (Distro specific, I'm fine with -- machine I've got
concerns.)

--Mark

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc       | 2 ++
>  meta/recipes-connectivity/openssl/openssl_1.0.2k.bb | 5 -----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 9afa5bd..03dee0e 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -15,7 +15,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>            "
>  S = "${WORKDIR}/openssl-${PV}"
>  
> +PACKAGECONFIG ??= ""
>  PACKAGECONFIG[perl] = ",,,"
> +PACKAGECONFIG[cryptodev] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,-UHAVE_CRYPTODEV,cryptodev-linux"
>  
>  AR_append = " r"
>  TERMIO_libc-musl = "-DTERMIOS"
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> index 1973f81..4436ba3 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> @@ -1,10 +1,5 @@
>  require openssl.inc
>  
> -# For target side versions of openssl enable support for OCF Linux driver
> -# if they are available.
> -DEPENDS += "cryptodev-linux"
> -
> -CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>  CFLAG_append_class-native = " -fPIC"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
> 


