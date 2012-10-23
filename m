Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjgG-0005ci-Ja
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 20:58:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Oct 2012 11:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="208096066"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by azsmga001.ch.intel.com with ESMTP; 23 Oct 2012 11:44:56 -0700
Message-ID: <5086E5A8.3010804@linux.intel.com>
Date: Tue, 23 Oct 2012 11:44:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Aristov Maxim <aristovmax@gmail.com>
References: <1350701827-10385-1-git-send-email-m@ximilian.ru>
In-Reply-To: <1350701827-10385-1-git-send-email-m@ximilian.ru>
Cc: Aristov Maxim <m@ximilian.ru>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uClibc: Resolve conflicting options when building for mips32
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
X-List-Received-Date: Tue, 23 Oct 2012 18:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2012 07:57 PM, Aristov Maxim wrote:
> Signed-off-by: Aristov Maxim <m@ximilian.ru>
> ---
>   .../uclibc/uclibc-0.9.33/mips/uClibc.machine           |   16 ----------------
>   .../recipes-core/uclibc/uclibc-git/mips/uClibc.machine |   16 ----------------
>   meta/recipes-core/uclibc/uclibc.inc                    |   10 ++++++++++
>   3 files changed, 10 insertions(+), 32 deletions(-)
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
>

Merged into OE-Core

Thanks
	Sua!

> diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
> deleted file mode 100644
> index 7d7ab3f..0000000
> --- a/meta/recipes-core/uclibc/uclibc-0.9.33/mips/uClibc.machine
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# in OE we use TARGET_CC_ARCH="-march=mips32" but by
> -# default uclibc uses mips1 ISA for o32 ABI which ends
> -# up with conflicting march options to gcc. Here we
> -# ask for MIPS32 ISA to match the OE defaults
> -
> -CONFIG_MIPS_ISA_MIPS32=y
> -
> -# Below options are exact copy of general
> -# uClibc.machine file
> -#
> -FORCE_OPTIONS_FOR_ARCH=y
> -ARCH_HAS_MMU=y
> -ARCH_USE_MMU=y
> -KERNEL_HEADERS="/usr/include"
> -HAVE_DOT_CONFIG=y
> -
> diff --git a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
> deleted file mode 100644
> index 7d7ab3f..0000000
> --- a/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -# in OE we use TARGET_CC_ARCH="-march=mips32" but by
> -# default uclibc uses mips1 ISA for o32 ABI which ends
> -# up with conflicting march options to gcc. Here we
> -# ask for MIPS32 ISA to match the OE defaults
> -
> -CONFIG_MIPS_ISA_MIPS32=y
> -
> -# Below options are exact copy of general
> -# uClibc.machine file
> -#
> -FORCE_OPTIONS_FOR_ARCH=y
> -ARCH_HAS_MMU=y
> -ARCH_USE_MMU=y
> -KERNEL_HEADERS="/usr/include"
> -HAVE_DOT_CONFIG=y
> -
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index 6c98090..707b14e 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -85,6 +85,15 @@ OE_DEL      := "${@features_to_uclibc_del(d)}"
>   python () {
>       if "${OE_DEL}":
>           d.setVar('configmangle_append', "${OE_DEL}" + "\n")
> +
> +    # by default uclibc uses mips1 ISA for o32 ABI
> +    # if we use TARGET_CC_ARCH="-march=mips32" we end up
> +    # with conflicting march options to gcc. Here we
> +    # ask for MIPS32 ISA to match the chosen arch
> +
> +    if "mips32" in d.getVar("TUNE_FEATURES",True):
> +        d.setVar('configmangle_append',
> +                 "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_MIPS32=y\n\n")
>       if "${OE_FEATURES}":
>           d.setVar('configmangle_append',
>                      "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
> @@ -133,6 +142,7 @@ do_configure() {
>           echo "### FPU" >>${S}/merged.config
>           echo "### ABI" >>${S}/merged.config
>           echo "### DISTRO FEATURES" >>${S}/merged.config
> +        echo "### MIPS32_CHECK" >>${S}/merged.config
>
>           # Mangle the resulting .config depending on OE variables
>           sed -i -e '${configmangle}' ${S}/merged.config
>


