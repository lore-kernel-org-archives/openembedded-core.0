Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHnz-0006op-6v
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:31:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2012 10:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120409248"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 10:20:16 -0700
Message-ID: <4FFB12D0.8040906@linux.intel.com>
Date: Mon, 09 Jul 2012 10:20:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341387078-25060-1-git-send-email-alexandru.damian@intel.com>
	<1341387078-25060-2-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1341387078-25060-2-git-send-email-alexandru.damian@intel.com>
Subject: Re: [PATCH 2/2] curl: upgrade to 7.26.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 17:31:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 12:31 AM, alexandru.damian@intel.com wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> Config system changed from 7.24.0 and the noldlibpatch
> is no longer needed, thus deleted.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-support/curl/curl/noldlibpath.patch |   76 ----------------------
>   meta/recipes-support/curl/curl_7.24.0.bb         |   55 ----------------
>   meta/recipes-support/curl/curl_7.26.0.bb         |   54 +++++++++++++++
>   3 files changed, 54 insertions(+), 131 deletions(-)
>   delete mode 100644 meta/recipes-support/curl/curl/noldlibpath.patch
>   delete mode 100644 meta/recipes-support/curl/curl_7.24.0.bb
>   create mode 100644 meta/recipes-support/curl/curl_7.26.0.bb
>
Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-support/curl/curl/noldlibpath.patch b/meta/recipes-support/curl/curl/noldlibpath.patch
> deleted file mode 100644
> index f4c72a1..0000000
> --- a/meta/recipes-support/curl/curl/noldlibpath.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Manipulating LD_LIBRARY_PATH can totally break builds when cross compiling.
> -Since we never run compiled binaries for the target, we should *never* need
> -to change LD_LIBRARY_PATH.
> -
> -RP 9/6/2010
> -
> -Index: curl-7.20.0/configure.ac
> -===================================================================
> ---- curl-7.20.0.orig/configure.ac	2010-06-09 11:06:30.000000000 +0100
> -+++ curl-7.20.0/configure.ac	2010-06-09 11:04:25.000000000 +0100
> -@@ -1461,9 +1461,10 @@
> -        dnl linker doesn't search through, we need to add it to LD_LIBRARY_PATH
> -        dnl to prevent further configure tests to fail due to this
> -
> --       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
> --       export LD_LIBRARY_PATH
> --       AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
> -+       #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
> -+       #export LD_LIBRARY_PATH
> -+       #AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
> -+       :
> -     fi
> -   fi
> -
> -@@ -1684,9 +1686,10 @@
> -           dnl LD_LIBRARY_PATH to prevent further configure tests to fail
> -           dnl due to this
> -
> --          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
> --          export LD_LIBRARY_PATH
> --          AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
> -+          #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
> -+          #export LD_LIBRARY_PATH
> -+          #AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
> -+          :
> -         fi
> -       fi
> -
> -@@ -1696,6 +1699,8 @@
> -
> - fi dnl OPENSSL != 1
> -
> -+AC_SUBST(GNUTLS_REQUIRED)
> -+
> - dnl ----------------------------------------------------
> - dnl NSS. Only check if GnuTLS and OpenSSL are not enabled
> - dnl ----------------------------------------------------
> -@@ -1781,9 +1786,10 @@
> -         dnl LD_LIBRARY_PATH to prevent further configure tests to fail
> -         dnl due to this
> -
> --        LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$nssprefix/lib$libsuff"
> --        export LD_LIBRARY_PATH
> --        AC_MSG_NOTICE([Added $nssprefix/lib$libsuff to LD_LIBRARY_PATH])
> -+        #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$nssprefix/lib$libsuff"
> -+        #export LD_LIBRARY_PATH
> -+        #AC_MSG_NOTICE([Added $nssprefix/lib$libsuff to LD_LIBRARY_PATH])
> -+        :
> -       fi
> -
> -     fi
> -@@ -1881,9 +1887,9 @@
> -        dnl libssh2_version is a post 1.0 addition
> -        AC_CHECK_FUNCS( libssh2_version )
> -
> --       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR_SSH2"
> --       export LD_LIBRARY_PATH
> --       AC_MSG_NOTICE([Added $DIR_SSH2 to LD_LIBRARY_PATH])
> -+       #LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$DIR_SSH2"
> -+       #export LD_LIBRARY_PATH
> -+       #AC_MSG_NOTICE([Added $DIR_SSH2 to LD_LIBRARY_PATH])
> -     fi
> -   else
> -     dnl no libssh2, revert back to clean variables
> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
> deleted file mode 100644
> index 832254f..0000000
> --- a/meta/recipes-support/curl/curl_7.24.0.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -DESCRIPTION = "Command line tool and library for client-side URL transfers."
> -HOMEPAGE = "http://curl.haxx.se/"
> -BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> -SECTION = "console/network"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
> -
> -DEPENDS = "zlib gnutls"
> -DEPENDS_virtclass-native = "zlib-native openssl-native"
> -DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
> -PR = "r3"
> -
> -SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> -           file://noldlibpath.patch \
> -           file://pkgconfig_fix.patch"
> -
> -SRC_URI[md5sum] = "f912221d75eb8d8fe08900eaf011b023"
> -SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01812c16"
> -
> -inherit autotools pkgconfig binconfig
> -
> -EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
> -                --without-libssh2 \
> -		--with-random=/dev/urandom \
> -		--without-libidn \
> -		--enable-crypto-auth \
> -                ${CURLGNUTLS} \
> -		"
> -
> -CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
> -CURLGNUTLS_virtclass-native = "--without-gnutls --with-ssl"
> -CURLGNUTLS_virtclass-nativesdk = "--without-gnutls --without-ssl"
> -
> -do_configure_prepend() {
> -	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
> -}
> -
> -PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
> -
> -FILES_${PN}-certs = "${datadir}/curl/curl-*"
> -PACKAGE_ARCH_${PN}-certs = "all"
> -
> -FILES_lib${BPN} = "${libdir}/lib*.so.*"
> -RRECOMMENDS_lib${BPN} += "${PN}-certs"
> -FILES_lib${BPN}-dev = "${includedir} \
> -                      ${libdir}/lib*.so \
> -                      ${libdir}/lib*.la \
> -                      ${libdir}/pkgconfig \
> -                      ${datadir}/aclocal \
> -                      ${bindir}/*-config"
> -FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> -FILES_lib${BPN}-doc = "${mandir}/man3 \
> -                      ${mandir}/man1/curl-config.1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
> new file mode 100644
> index 0000000..f04b400
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl_7.26.0.bb
> @@ -0,0 +1,54 @@
> +DESCRIPTION = "Command line tool and library for client-side URL transfers."
> +HOMEPAGE = "http://curl.haxx.se/"
> +BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> +SECTION = "console/network"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
> +
> +DEPENDS = "zlib gnutls"
> +DEPENDS_virtclass-native = "zlib-native openssl-native"
> +DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
> +PR = "r0"
> +
> +SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> +           file://pkgconfig_fix.patch"
> +
> +SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
> +SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
> +
> +inherit autotools pkgconfig binconfig
> +
> +EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
> +                --without-libssh2 \
> +		--with-random=/dev/urandom \
> +		--without-libidn \
> +		--enable-crypto-auth \
> +                ${CURLGNUTLS} \
> +		"
> +
> +CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
> +CURLGNUTLS_virtclass-native = "--without-gnutls --with-ssl"
> +CURLGNUTLS_virtclass-nativesdk = "--without-gnutls --without-ssl"
> +
> +do_configure_prepend() {
> +	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
> +}
> +
> +PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
> +
> +FILES_${PN}-certs = "${datadir}/curl/curl-*"
> +PACKAGE_ARCH_${PN}-certs = "all"
> +
> +FILES_lib${BPN} = "${libdir}/lib*.so.*"
> +RRECOMMENDS_lib${BPN} += "${PN}-certs"
> +FILES_lib${BPN}-dev = "${includedir} \
> +                      ${libdir}/lib*.so \
> +                      ${libdir}/lib*.la \
> +                      ${libdir}/pkgconfig \
> +                      ${datadir}/aclocal \
> +                      ${bindir}/*-config"
> +FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> +FILES_lib${BPN}-doc = "${mandir}/man3 \
> +                      ${mandir}/man1/curl-config.1"
> +
> +BBCLASSEXTEND = "native nativesdk"
>



