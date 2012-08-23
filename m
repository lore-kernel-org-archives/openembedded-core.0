Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4OGo-0000ps-UL
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 05:39:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2012 20:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,297,1344236400"; d="scan'208";a="184332738"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2012 20:27:14 -0700
Message-ID: <5035A312.9000903@linux.intel.com>
Date: Wed, 22 Aug 2012 20:27:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <1345592379-8704-1-git-send-email-trini@ti.com>
In-Reply-To: <1345592379-8704-1-git-send-email-trini@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/5] u-boot-mkimage: Correct EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 23 Aug 2012 03:39:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2012 04:39 PM, Tom Rini wrote:
> - HOSTLD has never been used in U-Boot, drop.
> - HOSTSTRIP has been valid for a long time for tools
> - Same for HOSTCFLAGS / HOSTLDFLAGS
>
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  |    4 ++--
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  |    4 ++--
>   .../u-boot/u-boot-mkimage_2012.04.01.bb            |    4 +++-
>   3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
> index 34bae8e..fdbe7c9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>                       file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
>   SECTION = "bootloader"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
>              file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
> @@ -17,7 +17,7 @@ S = "${WORKDIR}/u-boot-${PV}"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>
I know you fixed the quote, but did you do any kind of test build?

Please see the Autobuilder:

http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/243/steps/shell_34/logs/stdio

for additional failures, please let me know what testing you do when you 
submit the next patch set please.



Thanks
	Sau!

>   do_compile () {
>     oe_runmake tools
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
> index 3ca0c2c..c4921d6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>                       file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
>   SECTION = "bootloader"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>
> @@ -15,7 +15,7 @@ S = "${WORKDIR}/u-boot-${PV}"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>
>   do_compile () {
>     oe_runmake tools
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> index aa107fe..c41a2f1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> @@ -3,6 +3,8 @@ LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
>   SECTION = "bootloader"
>
> +PR = "r1"
> +
>   # This is needs to be validated among supported BSP's before we can
>   # make it default
>   DEFAULT_PREFERENCE = "-1"
> @@ -18,7 +20,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>
>   S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>
>   do_compile () {
>     oe_runmake tools
>


