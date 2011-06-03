Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSHyV-0007jo-DP
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:10:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 17:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; d="scan'208";a="11157850"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 17:07:38 -0700
Message-ID: <4DE825CA.7040308@linux.intel.com>
Date: Thu, 02 Jun 2011 17:07:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306756909-18466-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1306756909-18466-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] u-boot: package up u-boot.bin for field upgrades
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
X-List-Received-Date: Fri, 03 Jun 2011 00:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/30/2011 05:01 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-bsp/uboot/u-boot.inc        |   11 +++++++++++
>   meta/recipes-bsp/uboot/u-boot_2011.03.bb |    2 +-
>   2 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
> index 83dfb6f..2be9fc9 100644
> --- a/meta/recipes-bsp/uboot/u-boot.inc
> +++ b/meta/recipes-bsp/uboot/u-boot.inc
> @@ -21,6 +21,7 @@ python () {
>   }
>
>   UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
> +UBOOT_BINARY ?= "u-boot.bin"
>   UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
>   UBOOT_MAKE_TARGET ?= "all"
>
> @@ -32,6 +33,16 @@ do_compile () {
>   	oe_runmake ${UBOOT_MAKE_TARGET}
>   }
>
> +do_install () {
> +    install -d ${D}/boot
> +    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +FILES_${PN} = "/boot"
> +# no gnu_hash in uboot.bin, by design, so skip QA
> +INSANE_SKIP_${PN} = True
> +
>   do_deploy () {
>   	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
>
> diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> index 0fbb9ba..07f0609 100644
> --- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> @@ -14,7 +14,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE
>
>   SRCREV = "v2011.03"
>   PV = "v2011.03+git${SRCPV}"
> -PR="r3"
> +PR="r4"
>
>   SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>

Merged into oe-core, thanks for your patience US was on holiday on Monday

Thanks
	Sau!


