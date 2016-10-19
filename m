Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 22B2671A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F5F4208EE;
	Wed, 19 Oct 2016 20:13:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fuvkn-P79BMN; Wed, 19 Oct 2016 20:13:52 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 575F1200CC;
	Wed, 19 Oct 2016 20:13:50 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id DBF8E162176; Wed, 19 Oct 2016 16:13:49 -0400 (EDT)
Date: Wed, 19 Oct 2016 16:13:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161019201349.GS2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161018215513.2873-1-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] u-boot: Factor out common bits
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
X-List-Received-Date: Wed, 19 Oct 2016 20:13:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 18, 2016 at 11:55:09PM +0200, Marek Vasut wrote:
> The u-boot recipes share a couple of common variables, which makes
> updating of the recipes error prone and a toil. Factor those common
> bits into u-boot-common_${PV}.inc so that they are in one place.
> 
> The u-boot_${PV}.bb now explicitly require u-boot-common_${PV}.inc
> before require u-boot.inc , as doing require u-boot-common_${PV}.inc
> from u-boot.inc would fail due to ${PV} not being set. This is a
> functional change.

Any issues making .inc file version-agnostic and moving SRCREV out to .bb?


> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc  | 16 ++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb | 16 ++--------------
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb  | 17 ++---------------
>  meta/recipes-bsp/u-boot/u-boot.inc                 |  8 --------
>  meta/recipes-bsp/u-boot/u-boot_2016.03.bb          |  8 +-------
>  5 files changed, 21 insertions(+), 44 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
> new file mode 100644
> index 0000000..403e316
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
> @@ -0,0 +1,16 @@
> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
> +SECTION = "bootloaders"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> +
> +# This revision corresponds to the tag "v2016.03"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> +
> +PV = "v2016.03+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> +
> +S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> index 79f1548..f56862c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> @@ -1,20 +1,8 @@
> +require u-boot-common_${PV}.inc
> +
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> -SECTION = "bootloader"
>  DEPENDS = "mtd-utils"
>  
> -# This revision corresponds to the tag "v2016.03"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> -
> -PV = "v2016.03+git${SRCPV}"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> -
> -S = "${WORKDIR}/git"
> -
>  INSANE_SKIP_${PN} = "already-stripped"
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
>  EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> index d5921a0..5025961 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> @@ -1,21 +1,8 @@
> -SUMMARY = "U-Boot bootloader image creation tool"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> -SECTION = "bootloader"
> +require u-boot-common_${PV}.inc
>  
> +SUMMARY = "U-Boot bootloader image creation tool"
>  DEPENDS = "openssl"
>  
> -# This revision corresponds to the tag "v2016.03"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> -
> -PV = "v2016.03+git${SRCPV}"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> -
> -S = "${WORKDIR}/git"
> -
>  EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
>  
>  do_compile () {
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 252aae9..afe3fe9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -1,14 +1,6 @@
>  SUMMARY = "Universal Boot Loader for embedded devices"
> -HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
> -SECTION = "bootloaders"
>  PROVIDES = "virtual/bootloader"
>  
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> -
> -S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> index 836b0ce..dabe709 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> @@ -1,10 +1,4 @@
> +require u-boot-common_${PV}.inc
>  require u-boot.inc
>  
>  DEPENDS += "dtc-native"
> -
> -# This revision corresponds to the tag "v2016.03"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> -
> -PV = "v2016.03+git${SRCPV}"
> -- 
> 2.9.3
> 

