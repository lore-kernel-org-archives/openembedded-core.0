Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3D0E78D51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 22:29:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6UMTKjh014021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 30 Jul 2018 23:29:22 +0100
Message-ID: <8caafb085ff549a7979806bd748f51d290546a49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 23:29:20 +0100
In-Reply-To: <1532917949-207205-1-git-send-email-changqing.li@windriver.com>
References: <1532917949-207205-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] curl: support multilib installation
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
X-List-Received-Date: Mon, 30 Jul 2018 22:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-30 at 10:32 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> curl-config is generated to displays information about
> the curl and libcurl installation. So the content is different
> for 32bit and 64bit package. eg: maybe for 32bit, use
> i686-linux-gnu-gcc, and for 64bit, use x86-64-linux-gnu-gcc.
> 
> Use update-alternatives to add base_libdir as suffix to create
> seperate curl-config, so user can check both info of 32/64 bit
> curl.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/curl/curl_7.61.0.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> index cc983fd..1841c50 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> @@ -13,7 +13,7 @@ SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
>  SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
>  
>  CVE_PRODUCT = "libcurl"
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig multilib_header update-alternatives
>  
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver verbose zlib"
>  PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
> @@ -48,6 +48,17 @@ PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threade
>  PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>  
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +ALTERNATIVE_${PN}-dev = "curl-config"
> +ALTERNATIVE_LINK_NAME[curl-config] = "${bindir}/curl-config"
> +ALTERNATIVE_TARGET[curl-config] = "${bindir}/curl-config-${MULTILIB_SUFFIX}"
> +
> +PACKAGE_PREPROCESS_FUNCS += "alternative_rename"
> +
> +alternative_rename() {
> +        mv ${PKGD}${bindir}/curl-config ${PKGD}${bindir}/curl-config-${MULTILIB_SUFFIX}
> +}
> +
>  EXTRA_OECONF = " \
>      --disable-libcurl-option \
>      --disable-ntlm-wb \

We're going to keep having this problem with other files and I really
don't want to impact non-multilib systems with the problems multilib
causes.

I started writing a reply suggesting we create multilib_script.bbclass
and then realised it would also solve my libtool issue with multilib
and kernel-devsrc.

I've therefore written a patch which I've just sent out which fixes
this kind of issue in libtool. You should be able to use the same
mechanism for curl.

That said, is it not possible to just patch curl-config to use pkg-
config instead and remove the differences between the two multilib
cases, thereby solving this problem in a better way?

Cheers,

Richard

