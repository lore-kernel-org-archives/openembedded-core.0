Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3E666099
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:17:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 14:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1004,1392192000"; d="scan'208";a="545392447"
Received: from unknown (HELO [10.255.12.194]) ([10.255.12.194])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2014 14:17:52 -0700
Message-ID: <53962480.2070604@linux.intel.com>
Date: Mon, 09 Jun 2014 14:17:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1402347661-28746-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1402347661-28746-1-git-send-email-akuster@mvista.com>
Subject: Re: [PATCH] v3 cups: Shouldn't link against libgcrypt without using gcrypt functions
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
X-List-Received-Date: Mon, 09 Jun 2014 21:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2014 02:01 PM, Armin Kuster wrote:
> [CUPS Ticket #4399] -- http://www.cups.org/str.php?L4399
>
> Upstream-Status: Backport
>
Sorry, I was not clear, this should be in the .patch file itself, not in 
the commit message.  Also the .patch file needs your Signed-off-by (so 
its in 2 places, commit message and .patch file comment area.

Take a look at the wiki:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

for details.


Thanks
Sau!

> Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
>
> This addresses the cryto dependency seen during build.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-extended/cups/cups.inc                |  1 +
>   .../cups/cups/cups-no-gcrypt.patch                 | 40 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index fd88552..3b8027b 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -8,6 +8,7 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
>              file://use_echo_only_in_init.patch \
>              file://0001-don-t-try-to-run-generated-binaries.patch \
>              file://cups_serverbin.patch \
> +           file://cups-no-gcrypt.patch \
>   	  "
>
>   LEAD_SONAME = "libcupsdriver.so"
> diff --git a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
> new file mode 100644
> index 0000000..465d353
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
> @@ -0,0 +1,40 @@
> +Description: Don't build-depend on libgcrypt, as nothing is used from it
> +Author: Didier Raboud <odyx@debian.org>
> +Bug-Debian: https://bugs.debian.org/638416
> +Bug: http://www.cups.org/str.php?L????
> +Last-Update: 2014-04-07
> +--- a/config-scripts/cups-ssl.m4
> ++++ b/config-scripts/cups-ssl.m4
> +@@ -66,7 +66,6 @@
> +     dnl Then look for GNU TLS...
> +     if test $have_ssl = 0 -a "x$enable_gnutls" != "xno" -a "x$PKGCONFIG" != x; then
> +     	AC_PATH_PROG(LIBGNUTLSCONFIG,libgnutls-config)
> +-    	AC_PATH_PROG(LIBGCRYPTCONFIG,libgcrypt-config)
> + 	if $PKGCONFIG --exists gnutls; then
> + 	    have_ssl=1
> + 	    SSLLIBS=`$PKGCONFIG --libs gnutls`
> +@@ -84,14 +83,6 @@
> + 	if test $have_ssl = 1; then
> + 	    CUPS_SERVERCERT="ssl/server.crt"
> + 	    CUPS_SERVERKEY="ssl/server.key"
> +-
> +-            if $PKGCONFIG --exists gcrypt; then
> +-	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
> +-	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
> +-	    elif test "x$LIBGCRYPTCONFIG" != x; then
> +-	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
> +-	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
> +-	    fi
> + 	fi
> +     fi
> +
> +--- a/cups/http-private.h
> ++++ b/cups/http-private.h
> +@@ -80,7 +80,6 @@
> + #  elif defined HAVE_GNUTLS
> + #    include <gnutls/gnutls.h>
> + #    include <gnutls/x509.h>
> +-#    include <gcrypt.h>
> + #  elif defined(HAVE_CDSASSL)
> + #    include <CoreFoundation/CoreFoundation.h>
> + #    include <Security/Security.h>
>

