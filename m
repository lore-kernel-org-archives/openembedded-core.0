Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D3B3273231
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 13:16:50 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so73404780pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=7a6ZneIKKQE4xeLW4N+TI6PWlnEYlBR7CKwzTJP6WuE=;
	b=MM4CGHP3Aolo8Enhc7/LvYcQa7qS/+K5i3ZWbrFT8kMwW/MtQOoA9tA0uNbpxj7VOL
	R//PJKqZW2+6TNqMX+spnDe8UORLJ+ySPOMuPt/7Ivaji/7YvPemjov2WDM4kRimny98
	AD+oE5zmsFokdyw0fe8B+CIC3Kps0n9Ve57cxXC69m8/UQnR944jYONFQw+ou593fs0p
	UTR+pV1B0BFcq7/0CMlWMsk7w3MEXyTJ0X7WpizmaS8ElLUwMgdut7JYcDCVSURUeN/k
	kphcEkEs8/EQVGRXcdD7DChBvoLFajnO4ZazcmzFGTXNzwiMNL13OcKQUCKUo+2rzRFM
	eLSw==
X-Received: by 10.66.55.105 with SMTP id r9mr23889249pap.143.1432991811606;
	Sat, 30 May 2015 06:16:51 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:d91c:b099:fd46:1c1?
	([2601:c:a700:3ba7:d91c:b099:fd46:1c1])
	by mx.google.com with ESMTPSA id fh9sm8746926pdb.17.2015.05.30.06.16.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 May 2015 06:16:50 -0700 (PDT)
Message-ID: <5569B837.1040408@gmail.com>
Date: Sat, 30 May 2015 06:16:39 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1432752530-20335-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1432752530-20335-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH 1/2] gnutls: use pkg-config to locate zlib
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
X-List-Received-Date: Sat, 30 May 2015 13:16:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I am updating to latest gnutls and I will include your patches when I 
submit.

- armin

On 05/27/2015 11:48 AM, Andre McCurdy wrote:
> AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
> robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
> instead.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   .../gnutls/use-pkg-config-to-locate-zlib.patch     | 67 ++++++++++++++++++++++
>   meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  1 +
>   2 files changed, 68 insertions(+)
>   create mode 100644 meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
> new file mode 100644
> index 0000000..0e1b7c8
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/use-pkg-config-to-locate-zlib.patch
> @@ -0,0 +1,67 @@
> +From cee80af1fe93f5b76765afeebfcc3b902768f5d6 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Tue, 26 May 2015 21:41:24 -0700
> +Subject: [PATCH] use pkg-config to locate zlib
> +
> +AC_LIB_HAVE_LINKFLAGS can sometimes find host libs and is therefore not
> +robust when cross-compiling. Remove it for zlib and use PKG_CHECK_MODULES
> +instead.
> +
> +Removing AC_LIB_HAVE_LINKFLAGS for zlib also removes the --with-libz-prefix
> +configure option. If zlib support is enabled, then failure to find zlib via
> +pkg-config is now treated as a fatal error.
> +
> +Change based on ChromeOS gnutls 2.12.23 cross-compile fixes patch:
> +
> +  https://chromium-review.googlesource.com/#/c/271661/
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + configure.ac | 24 ++++++++++--------------
> + 1 file changed, 10 insertions(+), 14 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 1b561d5..0c787dc 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -508,25 +508,21 @@ AC_ARG_WITH(zlib, AS_HELP_STRING([--without-zlib],
> + AC_MSG_CHECKING([whether to include zlib compression support])
> + if test x$ac_zlib != xno; then
> +  AC_MSG_RESULT(yes)
> +- AC_LIB_HAVE_LINKFLAGS(z,, [#include <zlib.h>], [compress (0, 0, 0, 0);])
> +- if test x$ac_cv_libz != xyes; then
> +-   AC_MSG_WARN(
> +-***
> +-*** ZLIB was not found. You will not be able to use ZLIB compression.)
> +- fi
> + else
> +  AC_MSG_RESULT(no)
> + fi
> +
> +-PKG_CHECK_EXISTS(zlib, ZLIB_HAS_PKGCONFIG=y, ZLIB_HAS_PKGCONFIG=n)
> +-
> + if test x$ac_zlib != xno; then
> +-  if test "$ZLIB_HAS_PKGCONFIG" = "y" ; then
> +-    if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
> +-      GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
> +-    else
> +-      GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
> +-    fi
> ++  PKG_CHECK_MODULES(ZLIB, zlib)
> ++  HAVE_LIBZ=yes
> ++  AC_DEFINE([HAVE_LIBZ], [1], [zlib is enabled])
> ++  AC_SUBST(HAVE_LIBZ)
> ++  LTLIBZ=$ZLIB_LIBS
> ++  AC_SUBST(LTLIBZ)
> ++  if test "x$GNUTLS_REQUIRES_PRIVATE" = x; then
> ++    GNUTLS_REQUIRES_PRIVATE="Requires.private: zlib"
> ++  else
> ++    GNUTLS_REQUIRES_PRIVATE="$GNUTLS_REQUIRES_PRIVATE, zlib"
> +   fi
> + fi
> + AC_SUBST(GNUTLS_REQUIRES_PRIVATE)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> index 89057ba..f41d183 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
> @@ -2,6 +2,7 @@ require gnutls.inc
>
>   SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
>               file://configure.ac-fix-sed-command.patch \
> +            file://use-pkg-config-to-locate-zlib.patch \
>              "
>   SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
>   SRC_URI[sha256sum] = "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
>

