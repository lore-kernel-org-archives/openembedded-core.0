Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 7325261223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 04:09:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Aug 2013 21:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,815,1367996400"; d="scan'208";a="341655385"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2013 21:09:28 -0700
Message-ID: <51FF2578.5020109@linux.intel.com>
Date: Sun, 04 Aug 2013 21:09:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1375521469-1654-1-git-send-email-lpapp@kde.org>
In-Reply-To: <1375521469-1654-1-git-send-email-lpapp@kde.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Mon, 05 Aug 2013 04:09:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2013 02:17 AM, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 26 +++++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27 ++++++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 25 ++++++++++++++++++++
>   3 files changed, 78 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> new file mode 100644
> index 0000000..8d13151
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"

During a local build, I found that the md5 is not matching the file, can 
you please confirm you have the correct section and checksum.

> ERROR: Task 5440 (/srv/hdd/poky/meta/recipes-devtools/python/python3-jinja_1.2.bb, do_compile) failed with exit code '1'
> ERROR: u-boot-fw-utils: md5 data is not matching for file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90
> ERROR: u-boot-fw-utils: The new md5 checksum is 78b195c11cb6ef63e6985140db7d7bab
> ERROR: u-boot-fw-utils: Check if the license information has changed in
> ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
> ERROR: Function failed: do_qa_configure


Thank for the contribution.

Sau!


> +SECTION = "bootloader"
> +
> +DEPENDS = "mtd-utils"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
> +SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> +
> +do_compile () {
> +  oe_runmake env
> +}
> +
> +do_install () {
> +  install -d ${D}${base_sbindir}
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> +}
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> new file mode 100644
> index 0000000..0108e00
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "U-boot bootloader mkimage tool"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +SECTION = "bootloader"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
> +SRC_URI[sha256sum] = "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> +
> +do_compile () {
> +  oe_runmake tools
> +}
> +
> +do_install () {
> +  install -d ${D}${bindir}
> +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +}
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> new file mode 100644
> index 0000000..8e05558
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -0,0 +1,25 @@
> +require u-boot.inc
> +
> +# To build u-boot for your machine, provide the following lines in your machine
> +# config, replacing the assignments as appropriate for your machine.
> +# UBOOT_MACHINE = "omap3_beagle_config"
> +# UBOOT_ENTRYPOINT = "0x80008000"
> +# UBOOT_LOADADDRESS = "0x80008000"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +
> +FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the repo during parse
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>

