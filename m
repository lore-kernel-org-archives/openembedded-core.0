Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 12BD66D7EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:41:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2013 14:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434183921"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 12 Nov 2013 14:41:58 -0800
Message-ID: <5282AEB6.3060706@linux.intel.com>
Date: Tue, 12 Nov 2013 14:41:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1383954150-59537-1-git-send-email-kirgene@gmail.com>
In-Reply-To: <1383954150-59537-1-git-send-email-kirgene@gmail.com>
Subject: Re: [PATCH] curl: build with c-ares library support.
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
X-List-Received-Date: Tue, 12 Nov 2013 22:41:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2013 03:42 PM, Yevhen Kyriukha wrote:
> Also added c-ares library recipe.
>
> In libcurl there is an issue with DNS lookups that cause crash on some platforms:
> http://curl.haxx.se/mail/lib-2008-09/0197.html
> To avoid this issue libcurl has to be built with c-ares name resolver.
>
I am still considering this patch, but need to understand what platforms 
curl is failing on.

> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>   meta/recipes-support/c-ares/c-ares_1.10.0.bb | 22 ++++++++++++++++++++++

Additionally, if adding this to oe-core, it needs to be in it's own 
patch crediting the orignal author / layer, I found a 1.10 version in 
the meta-webos-ports, is this where it came from?

Sau!

>   meta/recipes-support/curl/curl_7.33.0.bb     |  3 ++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb
>
> diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
> new file mode 100644
> index 0000000..27bedf4
> --- /dev/null
> +++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
> +HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
> +
> +inherit autotools
> +inherit pkgconfig
> +
> +SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
> +SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
> +SRC_URI[sha256sum] = "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
> +
> +EXTRA_OECONF = "--enable-shared"
> +
> +# install private headers to ares subdirectory
> +do_install_append() {
> +    install -d ${D}/${includedir}/ares
> +    install -m 0644 ares*.h ${D}/${includedir}/ares/
> +}
> +
> +FILES_${PN}-dev += "${includedir}/ares/*.h"
> diff --git a/meta/recipes-support/curl/curl_7.33.0.bb b/meta/recipes-support/curl/curl_7.33.0.bb
> index 8539fec..1af320e 100644
> --- a/meta/recipes-support/curl/curl_7.33.0.bb
> +++ b/meta/recipes-support/curl/curl_7.33.0.bb
> @@ -5,7 +5,7 @@ SECTION = "console/network"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
>
> -DEPENDS = "zlib gnutls"
> +DEPENDS = "zlib gnutls c-ares"
>   DEPENDS_class-native = "zlib-native openssl-native"
>   DEPENDS_class-nativesdk = "nativesdk-zlib"
>
> @@ -30,6 +30,7 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
>                   --enable-crypto-auth \
>                   --disable-ldap \
>                   --disable-ldaps \
> +                --enable-ares \
>                   ${CURLGNUTLS} \
>                   "
>
>

