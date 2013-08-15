Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 447D76B7C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:16:16 +0000 (UTC)
Message-ID: <520C9C5D.8070701@communistcode.co.uk>
Date: Thu, 15 Aug 2013 10:16:13 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1376540749-459-1-git-send-email-lpapp@kde.org>
In-Reply-To: <1376540749-459-1-git-send-email-lpapp@kde.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 09:16:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15/08/13 05:25, Laszlo Papp wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 26 +++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27 ++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 25 ++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> new file mode 100644
> index 0000000..a5bbb73
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +SECTION = "bootloader"
> +
> +DEPENDS = "mtd-utils"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
> +SRC_URI[sha256sum] = "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
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

This isn't needed as it is present in u-boot.inc, see
http://patches.openembedded.org/patch/30879/

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

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambrideshire, UK
  http://www.embed.me.uk
--

