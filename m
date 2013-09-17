Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF1E60A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 23:47:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2013 16:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,926,1371106800"; d="scan'208";a="403303065"
Received: from unknown (HELO [10.255.15.100]) ([10.255.15.100])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2013 16:47:25 -0700
Message-ID: <5238EA0D.2010108@linux.intel.com>
Date: Tue, 17 Sep 2013 16:47:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Anders Darander <anders@chargestorm.se>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1379100075.git.anders@chargestorm.se>
	<a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
In-Reply-To: <a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] u-boot-fw-utils: reinstate target recipe for fw_printenv
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
X-List-Received-Date: Tue, 17 Sep 2013 23:47:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/13/2013 12:21 PM, Anders Darander wrote:
> The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, which
> removed the on-target fw_printenv (and fw_setenv).
>
> Re-create the updated version of the u-boot-fw-utils recipe.
>
> U-Boot does try to strip the fw_printenv binary by default now. To avoid
> this, without patching the Makefile, we add HOSTSTRIP=true to EXTRA_OEMAKE.
>
> The new U-Boot do also require us to configure the build for a specific
> machine, thus we change the package arch.§
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> new file mode 100644
> index 0000000..f97df71
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +SECTION = "bootloader"
> +DEPENDS = "mtd-utils"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
> +
> +do_compile () {
> +  oe_runmake ${UBOOT_MACHINE}
> +  oe_runmake env
> +}
> +
> +do_install () {
> +  install -d ${D}${base_sbindir}
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>

I think this might need a COMPATIBLE_MACHINE or some check for correct 
systems
> ERROR: Function failed: do_compile (log file is located at /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+gitAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+gitAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 HOSTCC=i586-pokymllib32-linux-gcc  -m32 --sysroot=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/sysroots/lib32-qemux86 HOSTSTRIP=true
> | System not configured - see README
> | make: *** [all] Error 1
> | ERROR: oe_runmake failed
> | WARNING: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+gitAUTOINC+62c175fbb8-r0/temp/run.do_compile.4727:1 exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+gitAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727)
> NOTE: recipe lib32-u-boot-fw-utils-v2013.07+gitAUTOINC+62c175fbb8-r0: task do_compile: Failed

Sau!



