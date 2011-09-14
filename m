Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3u24-0008Fh-1B
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:18:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2011 11:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48442722"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2011 11:12:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Wed, 14 Sep 2011 11:12:47 -0700
In-Reply-To: <1316023313.26879.2569.camel@elmorro>
References: <1316023313.26879.2569.camel@elmorro>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316023968.1058.30.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub2: new recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 14 Sep 2011 18:18:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 13:01 -0500, Tom Zanussi wrote:
> This adds the grub-1.98 from meta-intel while upgrading it to 1.99.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/recipes-bsp/grub/grub-1.99/40_custom          |    9 ++++
>  .../grub/grub-1.99/grub-install.in.patch           |   15 +++++++
>  meta/recipes-bsp/grub/grub_1.99.bb                 |   44 ++++++++++++++++++++
>  3 files changed, 68 insertions(+), 0 deletions(-)
>  create mode 100755 meta/recipes-bsp/grub/grub-1.99/40_custom
>  create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
>  create mode 100644 meta/recipes-bsp/grub/grub_1.99.bb
> 
> diff --git a/meta/recipes-bsp/grub/grub-1.99/40_custom b/meta/recipes-bsp/grub/grub-1.99/40_custom
> new file mode 100755
> index 0000000..0d80854
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub-1.99/40_custom
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +exec tail -n +3 $0
> +# This file provides an easy way to add custom menu entries.  Simply type the
> +# menu entries you want to add after this comment.  Be careful not to change
> +# the 'exec tail' line above.
> +menuentry "Linux" {
> +    set root=(hd0,1)
> +    linux /boot/vmlinuz root=__ROOTFS__ rw __VIDEO_MODE__ __VGA_MODE__ quiet
> +}
> diff --git a/meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch b/meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
> new file mode 100644
> index 0000000..6f6fa30
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
Partiall header, sorry Tom, you need a signed-off-by also!

Sau!

> +Index: grub-1.99/util/grub-install.in
> +===================================================================
> +--- grub-1.99.orig/util/grub-install.in	2011-09-09 22:37:20.093906679 -0500
> ++++ grub-1.99/util/grub-install.in	2011-09-09 22:37:30.854737882 -0500
> +@@ -510,7 +510,7 @@
> + 
> + if [ "x${devabstraction_module}" = "x" ] ; then
> +     if [ x"${install_device}" != x ]; then
> +-      if echo "${install_device}" | grep -qx "(.*)" ; then
> ++      if echo "${install_device}" | grep -q "(.*)" ; then
> +         install_drive="${install_device}"
> +       else
> +         install_drive="`"$grub_probe" --device-map="${device_map}" --target=drive --device "${install_device}"`" || exit 1
> diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
> new file mode 100644
> index 0000000..d9df573
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/grub_1.99.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
> +
> +DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
> +intended to unify bootloading across x86 operating systems. In \
> +addition to loading the Linux kernel, it implements the Multiboot \
> +standard, which allows for flexible loading of multiple boot images."
> +
> +HOMEPAGE = "http://www.gnu.org/software/grub/"
> +SECTION = "bootloaders"
> +PRIORITY = "optional"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +RDEPENDS = "diffutils freetype"
> +PR = "r0"
> +
> +SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> +          file://grub-install.in.patch;apply=yes \
> +          file://40_custom"
> +
> +inherit autotools
> +inherit gettext
> +
> +EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --target=${TARGET_ARCH} --program-prefix="""
> +
> +do_configure() {
> +    oe_runconf
> +}
> +
> +python __anonymous () {
> +    import re
> +    host = bb.data.getVar('HOST_SYS', d, 1)
> +    if not re.match('x86.64.*-linux', host) and not re.match('i.86.*-linux', host):
> +        raise bb.parse.SkipPackage("incompatible with host %s" % host)
> +}
> +
> +do_install_append () {
> +    install -m 0755 ${WORKDIR}/40_custom ${D}${sysconfdir}/grub.d/40_custom
> +}
> +
> +FILES_${PN}-doc = "${datadir}"
> +FILES_${PN} = "/usr /etc"
> +




