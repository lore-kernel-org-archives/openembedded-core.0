Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RbGwn-0000d2-0U
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 20:26:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2011 11:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96644408"
Received: from unknown (HELO [10.255.12.229]) ([10.255.12.229])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 11:19:29 -0800
Message-ID: <4EEA4841.6000204@linux.intel.com>
Date: Thu, 15 Dec 2011 11:19:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323853725-7979-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1323853725-7979-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] cross-recipes: Disable nls in gettext bbclass
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
X-List-Received-Date: Thu, 15 Dec 2011 19:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/2011 01:08 AM, Khem Raj wrote:
> Right now for cross recipes e.g. gcc-cross and binutils-cross
> we specify --disable-nls .... --enable-nls on configure cmdline
> the --enable-nls coming from gettext bbclass.
>
> So we disable nls for all cross inheriting recipes in gettext
> bbclass and then we remove the extra --disable-nls in gcc-cross
> and binutils-cross
>
> This patch needs testing. Please help
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/classes/gettext.bbclass                       |    6 +++---
>   meta/recipes-devtools/binutils/binutils-cross.inc  |    1 -
>   meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    1 -
>   meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 -
>   .../gcc/gcc-cross-intermediate.inc                 |    1 -
>   5 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index 1793748..89faa30 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -3,15 +3,15 @@ def gettext_dependencies(d):
>           return ""
>       if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
>           return ""
> -    if oe.utils.inherits(d, 'native'):
> +    if oe.utils.inherits(d, 'native', 'cross'):
>           return "gettext-minimal-native"
>       return d.getVar('DEPENDS_GETTEXT', False)
>
>   def gettext_oeconf(d):
> -    if oe.utils.inherits(d, 'native'):
> +    if oe.utils.inherits(d, 'native', 'cross'):
>           return '--disable-nls'
>       # Remove the NLS bits if USE_NLS is no.
> -    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'cross-canadian'):
> +    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'nativesdk', 'cross-canadian'):
>           return '--disable-nls'
>       return "--enable-nls"
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
> index f07907e..80152a9 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -8,7 +8,6 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
>                   --program-prefix=${TARGET_PREFIX} \
>                   --disable-install-libbfd \
>                   --disable-werror \
> -                --disable-nls \
>                   --enable-poison-system-directories \
>                   ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
>                   ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
> index 5816768..774dadb 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
> @@ -4,7 +4,6 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
>
>   EXTRA_OECONF += " --enable-poison-system-directories \
>   		  --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
> -                  --disable-nls \
>   		"
>
>   INHIBIT_DEFAULT_DEPS = "1"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> index d58bf70..f0e7810 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> @@ -14,7 +14,6 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>   		--without-headers \
>   		--disable-shared \
>   		--disable-threads \
> -		--disable-nls \
>   		--disable-multilib \
>   		--disable-__cxa_atexit \
>   		--enable-languages=c \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index f368ae9..ea105e6 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -16,7 +16,6 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
>   # preferred linker.
>   EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
>   		--enable-shared \
> -		--disable-nls \
>   		--disable-multilib \
>   		--disable-threads \
>   		--enable-languages=c \

Merged into OE-Core

Thanks
	Sau!


