Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F38C6D98D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 16:35:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 08:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434685495"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2013 08:35:30 -0800
Message-ID: <5283AA52.4090102@linux.intel.com>
Date: Wed, 13 Nov 2013 08:35:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
In-Reply-To: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 16:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 06:51 AM, Yevhen Kyriukha wrote:
> Also added c-ares library recipe.
>
> In libcurl there is an issue with DNS lookups that cause crash on some platforms:
> http://curl.haxx.se/mail/lib-2008-09/0197.html
> To avoid this issue libcurl has to be built with c-ares name resolver.
>
This still does not fully explain why this is needed. Nor credits to 
origin of the c-ares recipe.

You also did not address Phil Blundell's comment about causing other 
issues, and possibibly using the existing libcurl internal threaded 
resolver.

Can you test with the internal resolver to see if it address your 
issues, before we add a new recipe.

> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>   meta/recipes-support/c-ares/c-ares_1.10.0.bb | 24 ++++++++++++++++++++++++
>   meta/recipes-support/curl/curl_7.33.0.bb     |  2 ++
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb
>

This still needs to be split into 2 distict patches, one adding the 
c-ares recipe and a second one to use the PACKAGECONFIG.

Sau!

> diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
> new file mode 100644
> index 0000000..23b3d0e
> --- /dev/null
> +++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
> @@ -0,0 +1,24 @@
> +# Copyright (c) 2012-2013 LG Electronics, Inc.
> +
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
> index 8539fec..717c4f9 100644
> --- a/meta/recipes-support/curl/curl_7.33.0.bb
> +++ b/meta/recipes-support/curl/curl_7.33.0.bb
> @@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "0afde4cd949e2658eddc3cda675b19b165eea1af48ac5f3e1ec1607922
>
>   inherit autotools pkgconfig binconfig
>
> +PACKAGECONFIG[c-ares] = "--enable-ares,--disable-ares,c-ares"
> +
>   EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
>                   --without-libssh2 \
>                   --with-random=/dev/urandom \
>

