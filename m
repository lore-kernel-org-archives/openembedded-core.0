Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A00DE6041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 18:10:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2013 11:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,752,1367996400"; d="scan'208";a="337455238"
Received: from unknown (HELO [10.255.14.38]) ([10.255.14.38])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2013 11:10:37 -0700
Message-ID: <51F2BB9D.7030900@linux.intel.com>
Date: Fri, 26 Jul 2013 11:10:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1374038143-5807-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1374038143-5807-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix multilib header conflict - opensslconf.h
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
X-List-Received-Date: Fri, 26 Jul 2013 18:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 10:15 PM, Ming Liu wrote:
> opensslconf.h conflicts between 32-bit and 64-bit versions.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index f5b2432..267eb89 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -5,7 +5,7 @@ BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
>   SECTION = "libs/network"
>
>   # Big Jump for OpenSSL 1.0 support with meta-oe
> -INC_PR = "r15"
> +INC_PR = "r16"
>
No PR Bump needed

Sorry I missed this patch.

Sau!

>   # "openssl | SSLeay" dual license
>   LICENSE = "openssl"
> @@ -31,7 +31,7 @@ export DIRS = "crypto ssl apps"
>   export EX_LIBS = "-lgcc -ldl"
>   export AS = "${CC} -c"
>
> -inherit pkgconfig siteinfo
> +inherit pkgconfig siteinfo multilib_header
>
>   PACKAGES =+ "libcrypto libssl ${PN}-misc"
>   FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
> @@ -145,6 +145,7 @@ do_install () {
>   	cp --dereference -R include/openssl ${D}${includedir}
>   	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
>
> +	oe_multilib_header openssl/opensslconf.h
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
>

