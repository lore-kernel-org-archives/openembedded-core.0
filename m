Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXCSd-0004y4-Hk
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 16:22:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 07:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103331130"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 07:12:15 -0700
Message-ID: <4FBCF03F.6030305@linux.intel.com>
Date: Wed, 23 May 2012 07:12:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337761207-14688-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1337761207-14688-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] curl: Update to version 7.25.0
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
X-List-Received-Date: Wed, 23 May 2012 14:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Radu,

You should explain why you are removing a patch, I see from the Curl 
archives they picked up a similar patch.  I also note that this patch 
slips in the following:
-+AC_SUBST(GNUTLS_REQUIRED)

Not sure if you missed that, it might still be needed.

Sau!

On 05/23/2012 01:20 AM, Radu Moisan wrote:
> Signed-off-by: Radu Moisan<radu.moisan@intel.com>
> ---
>   meta/recipes-support/curl/curl/noldlibpath.patch   |   76 --------------------
>   .../curl/{curl_7.24.0.bb =>  curl_7.25.0.bb}        |    5 +-
>   2 files changed, 2 insertions(+), 79 deletions(-)
>   delete mode 100644 meta/recipes-support/curl/curl/noldlibpath.patch
>   rename meta/recipes-support/curl/{curl_7.24.0.bb =>  curl_7.25.0.bb} (90%)
>
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
> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.25.0.bb
> similarity index 90%
> rename from meta/recipes-support/curl/curl_7.24.0.bb
> rename to meta/recipes-support/curl/curl_7.25.0.bb
> index 12e95c9..033f1bc 100644
> --- a/meta/recipes-support/curl/curl_7.24.0.bb
> +++ b/meta/recipes-support/curl/curl_7.25.0.bb
> @@ -11,11 +11,10 @@ DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
>   PR = "r0"
>
>   SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> -           file://noldlibpath.patch \
>              file://pkgconfig_fix.patch"
>
> -SRC_URI[md5sum] = "f912221d75eb8d8fe08900eaf011b023"
> -SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01812c16"
> +SRC_URI[md5sum] = "f0303d47d9d3e6e4f08c2863c6504823"
> +SRC_URI[sha256sum] = "cfb29139dfeb2449bf8a89963c3aed7d87f034013f05564cc0330b435c90b491"
>
>   inherit autotools pkgconfig binconfig
>


