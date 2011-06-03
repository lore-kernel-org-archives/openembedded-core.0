Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSPhp-00032l-LB for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 10:26:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538MsV3002605;
	Fri, 3 Jun 2011 09:22:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02232-07; Fri,  3 Jun 2011 09:22:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538Mm97002599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 3 Jun 2011 09:22:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>
References: <cover.1307083232.git.kai.kang@windriver.com>
	<adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>
Date: Fri, 03 Jun 2011 09:22:26 +0100
Message-ID: <1307089346.27470.624.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Kang@smtp1.linux-foundation.org, poky@yoctoproject.org
Subject: Re: [PATCH 1/1] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 03 Jun 2011 08:26:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
> From: Kang Kai <kai.kang@windriver.com>
> 
> Migrate configurability from oe, try to shrink minimal image size
> 
> The switch is in local.conf.sample, uncomment the line
> DISTRO_FEATURES_EGLIBC = ""
> and write what options you want to enable.
> 
> If want to disable locale-code charsets or locales, you have to uncomment
> PACKAGE_NO_GCONV = 1
> Because without this, it fails on package_do_split_gconvs in libc-package.bbclass

I have some comments:

a) I think these should become flags in DISTRO_FEATURES with an
"eglibc-" prefix so something like "spawn" would become "eglibc-spawn"

b) I think we need to create a local.conf.sample.extended which has
information about more advanced settings a user can configure. I don't
want every setting in local.conf as standard as it gives the user the
impression they have to change them which they don't. Some existing data
in local.conf.sample can be moved over.

c) The code triggered by PACKAGE_NO_GCONV should also trigger if you set
the appropriate eglibc- feature flags automatically. Having two
variables you have to keep track of the combinations of is just plain
wrong. They should be controlled by one flag only. If there is generic
packaging code that handles these we might not need the "eglibc-" prefix
for those options.

Cheers,

Richard

> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta-yocto/conf/local.conf.sample                  |    9 +++
>  .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 +++++++
>  meta/recipes-core/eglibc/eglibc-options.inc        |   55 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc.inc                |   13 +++++
>  meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
>  5 files changed, 100 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
> 
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
> index 359e510..f68e80a 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -87,6 +87,15 @@ PACKAGE_CLASSES ?= "package_rpm package_ipk"
>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>  USER_CLASSES ?= "image-mklibs image-prelink"
>  
> +# eglibc configurability is used to reduce minimal images's size.
> +# PACKAGE_NO_GCONV should be set to 1, or locale-code posix-clang-wchar
> +# charsets locales need to be include in DISTRO_FEATURES_EGLIBC, please check
> +# package_do_split_gconvs in libc-package.bbclass for detail
> +#PACKAGE_NO_GCONV = 1
> +
> +# if you want to enable any option listed below, please uncomment next line and copy it here
> +#DISTRO_FEATURES_EGLIBC = ""
> +
>  # POKYMODE controls the characteristics of the generated packages/images by
>  # telling poky which type of toolchain to use.
>  #
> diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
> new file mode 100644
> index 0000000..dffc648
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
> @@ -0,0 +1,20 @@
> +When disable OPTION_EGLIBC_RTLD_DEBUG, compilation fails.
> +Created on Jun 1, 2011 by Kang Kai <kai.kang@windriver.com>
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +Index: libc/elf/dl-lookup.c
> +===================================================================
> +--- libc/elf/dl-lookup.c	(revision 13356)
> ++++ libc/elf/dl-lookup.c	(working copy)
> +@@ -423,7 +423,9 @@
> + 		     hash table.  */
> + 		  if (__builtin_expect (tab->size, 0))
> + 		    {
> ++              #if __OPTION_EGLIBC_RTLD_DEBUG
> + 		      assert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
> ++              #endif
> + 		      __rtld_lock_unlock_recursive (tab->lock);
> + 		      goto success;
> + 		    }
> diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
> new file mode 100644
> index 0000000..7cd0287
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-options.inc
> @@ -0,0 +1,55 @@
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
> +        distro_features = (bb.data.getVar('DISTRO_FEATURES_EGLIBC', d, True) or '').split()
> +        eglibc_cfg('ipv6',      distro_features, 'OPTION_EGLIBC_ADVANCED_INET6', cnf)
> +        eglibc_cfg('backtrace',      distro_features, 'OPTION_EGLIBC_BACKTRACE', cnf)
> +        eglibc_cfg('big-macros',      distro_features, 'OPTION_EGLIBC_BIG_MACROS', cnf)
> +        eglibc_cfg('bsd',      distro_features, 'OPTION_EGLIBC_BSD', cnf)
> +        eglibc_cfg('cxx-tests',      distro_features, 'OPTION_EGLIBC_CXX_TESTS', cnf)
> +        eglibc_cfg('catgets',      distro_features, 'OPTION_EGLIBC_CATGETS', cnf)
> +        eglibc_cfg('charsets',      distro_features, 'OPTION_EGLIBC_CHARSETS', cnf)
> +        eglibc_cfg('crypt',      distro_features, 'OPTION_EGLIBC_CRYPT', cnf)
> +        eglibc_cfg('crypt-ufc',      distro_features, 'OPTION_EGLIBC_CRYPT_UFC', cnf)
> +        eglibc_cfg('db-aliases',      distro_features, 'OPTION_EGLIBC_DB_ALIASES', cnf)
> +        eglibc_cfg('envz',      distro_features, 'OPTION_EGLIBC_ENVZ', cnf)
> +        eglibc_cfg('fcvt',      distro_features, 'OPTION_EGLIBC_FCVT', cnf)
> +        eglibc_cfg('fmtmsg',      distro_features, 'OPTION_EGLIBC_FMTMSG', cnf)
> +        eglibc_cfg('fstab',      distro_features, 'OPTION_EGLIBC_FSTAB', cnf)
> +        eglibc_cfg('ftraverse',      distro_features, 'OPTION_EGLIBC_FTRAVERSE', cnf)
> +        eglibc_cfg('getlogin',      distro_features, 'OPTION_EGLIBC_GETLOGIN', cnf)
> +        eglibc_cfg('idn',      distro_features, 'OPTION_EGLIBC_IDN', cnf)
> +        eglibc_cfg('inet',      distro_features, 'OPTION_EGLIBC_INET', cnf)
> +        eglibc_cfg('inet-anl',      distro_features, 'OPTION_EGLIBC_INET_ANL', cnf)
> +        eglibc_cfg('libm',      distro_features, 'OPTION_EGLIBC_LIBM', cnf)
> +        eglibc_cfg('libm-big',      distro_features, 'OPTION_EGLIBC_LIBM_BIG', cnf)
> +        eglibc_cfg('locales',      distro_features, 'OPTION_EGLIBC_LOCALES', cnf)
> +        eglibc_cfg('locale-code',      distro_features, 'OPTION_EGLIBC_LOCALE_CODE', cnf)
> +        eglibc_cfg('memusage',      distro_features, 'OPTION_EGLIBC_MEMUSAGE', cnf)
> +        eglibc_cfg('nis',      distro_features, 'OPTION_EGLIBC_NIS', cnf)
> +        eglibc_cfg('nsswitch',      distro_features, 'OPTION_EGLIBC_NSSWITCH', cnf)
> +        eglibc_cfg('rcmd',      distro_features, 'OPTION_EGLIBC_RCMD', cnf)
> +        eglibc_cfg('rtld-debug',      distro_features, 'OPTION_EGLIBC_RTLD_DEBUG', cnf)
> +        eglibc_cfg('spawn',      distro_features, 'OPTION_EGLIBC_SPAWN', cnf)
> +        eglibc_cfg('streams',      distro_features, 'OPTION_EGLIBC_STREAMS', cnf)
> +        eglibc_cfg('sunrpc',      distro_features, 'OPTION_EGLIBC_SUNRPC', cnf)
> +        eglibc_cfg('utmp',      distro_features, 'OPTION_EGLIBC_UTMP', cnf)
> +        eglibc_cfg('utmpx',      distro_features, 'OPTION_EGLIBC_UTMPX', cnf)
> +        eglibc_cfg('wordexp',      distro_features, 'OPTION_EGLIBC_WORDEXP', cnf)
> +        eglibc_cfg('posix-clang-wchar',      distro_features, 'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
> +        eglibc_cfg('posix-regexp',      distro_features, 'OPTION_POSIX_REGEXP', cnf)
> +        eglibc_cfg('posix-regexp-glibc',      distro_features, 'OPTION_POSIX_REGEXP_GLIBC', cnf)
> +        eglibc_cfg('posix-wchar-io',      distro_features, 'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
> +        return "\n".join(cnf)
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 46ffa82..2d05d53 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -28,6 +28,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
>  inherit autotools
> +require eglibc-options.inc
>  
>  LEAD_SONAME = "libc.so"
>  
> @@ -43,3 +44,15 @@ EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
>  PARALLEL_MAKE = ""
>  
>  PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> +
> +DISTRO_FEATURES_EGLIBC ??= "ipv6 backtrace big-macros bsd cxx-tests catgets charsets \
> +                          crypt crypt-ufc db-aliases envz fcvt fmtmsg fstab ftraverse \
> +                          getlogin idn inet inet-anl libm libm-big locales locale-code \
> +                          memusage nis nsswitch rcmd rtld-debug spawn streams sunrpc utmp \
> +                          utmpx wordexp posix-clang-wchar posix-regexp posix-regexp-glibc \
> +                          posix-wchar-io "
> +
> +OE_FEATURES = "${@features_to_eglibc_settings(d)}"
> +do_configure_prepend() {
> +	echo '${OE_FEATURES}' > ${B}/option-groups.config
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
> index 398da69..894eb88 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -4,7 +4,7 @@ SRCREV = "13356"
>  
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
> -PR = "r0"
> +PR = "r1"
>  PR_append = "+svnr${SRCPV}"
>  
>  EGLIBC_BRANCH="eglibc-2_13"
> @@ -16,7 +16,9 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>             file://stack-protector-test.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
> +           file://eglibc-2.13-fix-macro-RTLD_DEBUG.patch \
>  	   "
> +
>  LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \




