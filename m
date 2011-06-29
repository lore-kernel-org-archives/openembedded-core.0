Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc4Pb-0003Z1-53
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 01:43:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2011 16:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="20597541"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 16:39:29 -0700
Message-ID: <4E0BB7B1.4030007@linux.intel.com>
Date: Wed, 29 Jun 2011 16:39:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309263666-27781-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1309263666-27781-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] eglibc-locale: add missing 2.12 version
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
X-List-Received-Date: Wed, 29 Jun 2011 23:43:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 05:21 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-core/eglibc/eglibc-locale_2.12.bb |   58 ++++++++++++++++++++++++
>   1 files changed, 58 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.12.bb
>
> diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.12.bb b/meta/recipes-core/eglibc/eglibc-locale_2.12.bb
> new file mode 100644
> index 0000000..ed6c099
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-locale_2.12.bb
> @@ -0,0 +1,58 @@
> +INHIBIT_DEFAULT_DEPS = "1"
> +LICENSE = "LGPL"
> +
> +BPN = "eglibc"
> +
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
> +# is set. The idea is to avoid running localedef on the target (at first boot)
> +# to decrease initial boot time and avoid localedef being killed by the OOM
> +# killer which used to effectively break i18n on machines with<  128MB RAM.
> +
> +# default to disabled
> +ENABLE_BINARY_LOCALE_GENERATION ?= "0"
> +ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk = "0"
> +
> +#enable locale generation on these arches
> +# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
> +
> +# set "1" to use cross-localedef for locale generation
> +# set "0" for qemu emulation of native localedef for locale generation
> +LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
> +
> +PR = "r0"
> +
> +PKGSUFFIX = ""
> +PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
> +
> +PACKAGES = "eglibc-locale localedef${PKGSUFFIX}"
> +
> +PACKAGES_DYNAMIC = "locale-base-* \
> +                    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
> +                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
> +
> +PROVIDES = "virtual/libc-locale${PKGSUFFIX}"
> +
> +RPROVIDES_eglibc-locale = "glibc-locale"
> +
> +FILES_eglibc-gconv = "${libdir}/gconv/*"
> +FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
> +
> +do_install () {
> +	cp -fpPR ${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}/* ${D}
> +	cp -fpPR ${D}/SUPPORTED ${WORKDIR}
> +}
> +
> +DESCRIPTION_localedef = "eglibc: compile locale definition files"
> +
> +inherit libc-package
> +
> +do_install[depends] += "virtual/libc${PKGSUFFIX}:do_populate_sysroot"
> +
> +BBCLASSEXTEND = "nativesdk"

Richard merged a variation of this.

Thanks
Sau!


