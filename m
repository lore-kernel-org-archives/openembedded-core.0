Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiDYi-0005iG-G3
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 01:18:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2012 16:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="262128809"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2012 16:04:19 -0800
Message-ID: <50C67883.2090705@linux.intel.com>
Date: Mon, 10 Dec 2012 16:04:19 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1353007070-29984-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1353007070-29984-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: eliminate forced setting of -g0 when compiling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 00:18:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2012 11:17 AM, Joe Slater wrote:
> Do not invoke CURL_SET_COMPILER_DEBUG_OPTS in configure.ac.
> This will allow debug options set in our CFLAGS to be
> used.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   meta/recipes-support/curl/curl/configure_ac.patch |   11 +++++++++++
>   meta/recipes-support/curl/curl_7.26.0.bb          |    7 ++++++-
>   2 files changed, 17 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/curl/curl/configure_ac.patch
>
> diff --git a/meta/recipes-support/curl/curl/configure_ac.patch b/meta/recipes-support/curl/curl/configure_ac.patch
> new file mode 100644
> index 0000000..98d8387
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/configure_ac.patch

This patch slipped in without me catching it needed a header.

Please add Upstream-Status and Signed-off-by

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> @@ -0,0 +1,11 @@
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -281,7 +281,7 @@ dnl ************************************
> +
> + CURL_CHECK_COMPILER
> + CURL_SET_COMPILER_BASIC_OPTS
> +-CURL_SET_COMPILER_DEBUG_OPTS
> ++dnl CURL_SET_COMPILER_DEBUG_OPTS
> + CURL_SET_COMPILER_OPTIMIZE_OPTS
> + CURL_SET_COMPILER_WARNING_OPTS
> +
> diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
> index 9a0e7ce..fef247c 100644
> --- a/meta/recipes-support/curl/curl_7.26.0.bb
> +++ b/meta/recipes-support/curl/curl_7.26.0.bb
> @@ -8,11 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
>   DEPENDS = "zlib gnutls"
>   DEPENDS_class-native = "zlib-native openssl-native"
>   DEPENDS_class-nativesdk = "nativesdk-zlib"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>              file://pkgconfig_fix.patch"
>
> +# curl likes to set -g0 in CFLAGS, so we stop it
> +# from mucking around with debug options
> +#
> +SRC_URI += " file://configure_ac.patch"
> +
>   SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
>   SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
>
>


