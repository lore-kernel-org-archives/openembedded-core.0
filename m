Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrvyN-0001ct-1N
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:56:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Aug 2011 10:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; 
   d="scan'208";a="6593738"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Aug 2011 10:52:08 -0700
Message-ID: <4E456848.3090804@linux.intel.com>
Date: Fri, 12 Aug 2011 10:52:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313044273-29854-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1313044273-29854-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH v2] tune-ppce5500: Add a set of tune files for PowerPC e5500 core
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
X-List-Received-Date: Fri, 12 Aug 2011 17:56:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2011 11:31 PM, Kumar Gala wrote:
> The PPC e5500 is a 64-bit core so we add both a 32 and 64-bit set of
> tune files to allow for:
>
> * pure 32-bit build
> * pure 64-bit build
> * 32-bit base, 64-bit multilib
> * 64-bit base, 32-bit multilib
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/conf/machine/include/tune-ppce5500-32b.inc |   15 +++++++++++++++
>   meta/conf/machine/include/tune-ppce5500-64b.inc |   15 +++++++++++++++
>   2 files changed, 30 insertions(+), 0 deletions(-)
>   create mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
>   create mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc
>
> diff --git a/meta/conf/machine/include/tune-ppce5500-32b.inc b/meta/conf/machine/include/tune-ppce5500-32b.inc
> new file mode 100644
> index 0000000..7a9e533
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppce5500-32b.inc
> @@ -0,0 +1,15 @@
> +DEFAULTTUNE ?= "ppce5500"
> +
> +require conf/machine/include/powerpc/arch-powerpc64.inc
> +
> +TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
> +TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
> +
> +AVAILTUNES = "ppce5500"
> +TUNE_FEATURES_tune-ppce5500 = "m32 ppce5500"
> +PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc ppce5500"
> +BASE_LIB_tune-ppce5500 = "lib"
> +
> +# glibc configure options to get e5500 specific library (for sqrt)
> +GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "--with-cpu=e5500", "", d)}"
> diff --git a/meta/conf/machine/include/tune-ppce5500-64b.inc b/meta/conf/machine/include/tune-ppce5500-64b.inc
> new file mode 100644
> index 0000000..683d25f
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppce5500-64b.inc
> @@ -0,0 +1,15 @@
> +DEFAULTTUNE ?= "ppc64e5500"
> +
> +require conf/machine/include/powerpc/arch-powerpc64.inc
> +
> +TUNEVALID[ppc64e5500] = "Enable ppc64e5500 specific processor optimizations"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "-mcpu=e5500", "", d)}"
> +TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "ppc64e5500", "${PPCPKGARCH}", d)}"
> +
> +AVAILTUNES = "ppc64e5500"
> +TUNE_FEATURES_tune-ppc64e5500 = "m64 ppc64e5500"
> +PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "powerpc64 ppc64e5500"
> +BASE_LIB_tune-ppc64e5500 = "lib64"
> +
> +# glibc configure options to get e5500 specific library (for sqrt)
> +GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "--with-cpu=e5500", "", d)}"

Merged into OE-Core

Thanks
	Sau!


