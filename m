Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUsD2-0002vd-Jt
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 05:16:35 +0200
Received: by pzk36 with SMTP id 36so1104211pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 20:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pA2DvO2hwnzyv8SwqjIqMuCO2RH0FJwwoJDWoj+ZzG4=;
	b=BvWDAtiyndihljEwBxSGLJET4SYzBbDJwNOSdY6D+kUtZZlhm0L2T6o/vGYDlzn+mN
	BDVPXC7NE7kr2xDdGGMmhinssFr9O8Zwq62loxIALc6Ds5g3TEu10CogBKVURLVH8rrI
	l0M0JRxVCX7dTrFwrSNlWlT+QTYnZGaU3eg5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=StOvQa4TgMkrYsOCwhxuaHCFrKNnQxUKc6GIWNRdODgdB/maGLvP4WZw9E+BwFIh7G
	OWyTKoSsd3iyMePnBCOjHpU34X7HGrCeDMlaeSr2WOvSUnz2lb7AOrqJxEcWEN98abS3
	2yRWfr9qE7A6Dg/kECC/FXNFoCjkmErqrQce4=
Received: by 10.142.225.11 with SMTP id x11mr253748wfg.389.1307675591430;
	Thu, 09 Jun 2011 20:13:11 -0700 (PDT)
Received: from [172.23.8.101] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id z7sm2378935wff.5.2011.06.09.20.13.09
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 20:13:10 -0700 (PDT)
Message-ID: <4DF18BC3.4070509@gmail.com>
Date: Thu, 09 Jun 2011 20:13:07 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307510707.git.kai.kang@windriver.com>
	<225ae89d0031ff0b0c7ca35751d36802b50069e5.1307510707.git.kai.kang@windriver.com>
In-Reply-To: <225ae89d0031ff0b0c7ca35751d36802b50069e5.1307510707.git.kai.kang@windriver.com>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 10 Jun 2011 03:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2011 10:56 PM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Migrate configurability from oe, try to shrink minimal image size
>
> Update to get eglibc configuration options from DISTRO_FEATURES and enable them. All
> the options are enabled by default.
>
> Uncomment the line in conf/local.extended.conf to define DISTRO_FEATURES, so put
> what options you want to enable there.
>
> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc    |    8 ++-
>   .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
>   meta/recipes-core/eglibc/eglibc-options.inc        |   62 ++++++++++++++++++++
>   meta/recipes-core/eglibc/eglibc.inc                |    6 ++
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
>   5 files changed, 98 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 4b68a0a..052f9e6 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
>   ENABLE_BINARY_LOCALE_GENERATION ?= "1"
>   LOCALE_UTF8_ONLY ?= "0"
>
> -DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
> +DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci \
> +		ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> +		libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> +		libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
> +		libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> +		libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> +		libc-posix-wchar-io"
>
>   IMAGE_FEATURES ?= ""
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
> new file mode 100644
> index 0000000..dffc648
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
> @@ -0,0 +1,20 @@
> +When disable OPTION_EGLIBC_RTLD_DEBUG, compilation fails.
> +Created on Jun 1, 2011 by Kang Kai<kai.kang@windriver.com>
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Kang Kai<kai.kang@windriver.com>
> +Index: libc/elf/dl-lookup.c
> +===================================================================
> +--- libc/elf/dl-lookup.c	(revision 13356)
> ++++ libc/elf/dl-lookup.c	(working copy)
> +@@ -423,7 +423,9 @@
> + 		     hash table.  */
> + 		  if (__builtin_expect (tab->size, 0))
> + 		    {
> ++              #if __OPTION_EGLIBC_RTLD_DEBUG
> + 		      assert (GLRO(dl_debug_mask)&  DL_DEBUG_PRELINK);
> ++              #endif
> + 		      __rtld_lock_unlock_recursive (tab->lock);
> + 		      goto success;
> + 		    }


this patch does not seem correct to me. It should be using 
GLRO_dl_debug_mask instead here

> diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
> new file mode 100644
> index 0000000..119ceef
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-options.inc
> @@ -0,0 +1,62 @@
> +def eglibc_cfg(feature, features, tokens, cnf):
> +	if type(tokens) == type(""):
> +		tokens = [tokens]
> +	if type(features) == type([]) and feature in features:
> +		cnf.extend([token + ' = y' for token in tokens])
> +	else:
> +		for token in tokens:
> +			cnf.extend([token + ' = n'])
> +			if token == 'OPTION_EGLIBC_NSSWITCH':
> +				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
> +				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
> +
> +# Map distro features to eglibc options settings
> +def features_to_eglibc_settings(d):
> +        cnf = ([])
> +        distro_features = (bb.data.getVar('DISTRO_FEATURES', d, True) or '').split()
> +        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
> +        eglibc_cfg('libc-backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
> +        eglibc_cfg('libc-big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
> +        eglibc_cfg('libc-bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
> +        eglibc_cfg('libc-cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
> +        eglibc_cfg('libc-catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
> +        eglibc_cfg('libc-charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
> +        eglibc_cfg('libc-crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
> +        eglibc_cfg('libc-crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
> +        eglibc_cfg('libc-db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
> +        eglibc_cfg('libc-envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
> +        eglibc_cfg('libc-fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
> +        eglibc_cfg('libc-fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
> +        eglibc_cfg('libc-fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
> +        eglibc_cfg('libc-ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
> +        eglibc_cfg('libc-getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
> +        eglibc_cfg('libc-idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
> +        eglibc_cfg('libc-inet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
> +        eglibc_cfg('libc-inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
> +        eglibc_cfg('libc-libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
> +        eglibc_cfg('libc-libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
> +        eglibc_cfg('libc-locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
> +        eglibc_cfg('libc-locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
> +        eglibc_cfg('libc-memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
> +        eglibc_cfg('libc-nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
> +        eglibc_cfg('libc-nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
> +        eglibc_cfg('libc-rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
> +        eglibc_cfg('libc-rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
> +        eglibc_cfg('libc-spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
> +        eglibc_cfg('libc-streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
> +        eglibc_cfg('libc-sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
> +        eglibc_cfg('libc-utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
> +        eglibc_cfg('libc-utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
> +        eglibc_cfg('libc-wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
> +        eglibc_cfg('libc-posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
> +        eglibc_cfg('libc-posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
> +        eglibc_cfg('libc-posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
> +        eglibc_cfg('libc-posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
> +
> +        # try to fix disable charsets/locales/locale-code compile fail
> +        if 'libc-charsets' in distro_features and 'libc-locales' in distro_features and 'libc-locale-code' in distro_features:
> +            bb.data.setVar('PACKAGE_NO_GCONV', '0', d)
> +        else:
> +            bb.data.setVar('PACKAGE_NO_GCONV', '1', d)
> +
> +        return "\n".join(cnf)
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 46ffa82..616f1af 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -28,6 +28,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>   PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>   PROVIDES += "virtual/libintl virtual/libiconv"
>   inherit autotools
> +require eglibc-options.inc
>
>   LEAD_SONAME = "libc.so"
>
> @@ -43,3 +44,8 @@ EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
>   PARALLEL_MAKE = ""
>
>   PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> +
> +OE_FEATURES = "${@features_to_eglibc_settings(d)}"
> +do_configure_prepend() {
> +	echo '${OE_FEATURES}'>  ${B}/option-groups.config
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index 398da69..894eb88 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV = "13356"
>
>   DEPENDS += "gperf-native"
>   FILESPATHPKG =. "eglibc-svn:"
> -PR = "r0"
> +PR = "r1"
>   PR_append = "+svnr${SRCPV}"
>
>   EGLIBC_BRANCH="eglibc-2_13"
> @@ -16,7 +16,9 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>              file://stack-protector-test.patch \
>              file://etc/ld.so.conf \
>              file://generate-supported.mk \
> +           file://eglibc-2.13-fix-macro-RTLD_DEBUG.patch \
>   	   "
> +
>   LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>         file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \



