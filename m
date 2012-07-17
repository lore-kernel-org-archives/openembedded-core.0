Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sr98c-0007da-Lm
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 16:52:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2012 07:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123466097"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jul 2012 07:41:13 -0700
Message-ID: <50057989.7030008@linux.intel.com>
Date: Tue, 17 Jul 2012 07:41:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1342519612-24566-1-git-send-email-alexandru.damian@intel.com>
Subject: Re: [PATCH] udev: upgrade to 182
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
X-List-Received-Date: Tue, 17 Jul 2012 14:52:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 03:06 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This is the final upgrade of udev. Futher upgrades will only
> come in conjunction with systemd.
>
> The v4l1 removal patch is deprecated as the bug is fixed inside udev.
> There is a new patch fixing the path for default sh interpreter.
> New debug binaries are generated, and udev.inc is modified to package
> those correctly.
> The install locations changed for udevd and udevadm, so the scripts
> are updated accordingly.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   .../initscripts/initscripts-1.0/volatiles          |    2 +-
>   meta/recipes-core/udev/udev.inc                    |   13 +++--
>   ...yboard_force_release.sh-shell-script-path.patch |   30 ++++++++++++
>   meta/recipes-core/udev/udev/init                   |   14 +++---
>   meta/recipes-core/udev/udev/udev-166-v4l1-1.patch  |   50 --------------------
>   meta/recipes-core/udev/udev/udev-cache             |    2 +-
>   meta/recipes-core/udev/udev_164.bb                 |    8 ----
>   meta/recipes-core/udev/udev_182.bb                 |    9 ++++
>   8 files changed, 57 insertions(+), 71 deletions(-)
>   create mode 100644 meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
>   delete mode 100644 meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
>   delete mode 100644 meta/recipes-core/udev/udev_164.bb
>   create mode 100644 meta/recipes-core/udev/udev_182.bb
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index b2ae279..e0741aa 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -36,4 +36,4 @@ f root root 0664 /var/log/wtmp none
>   f root root 0664 /var/run/utmp none
>   l root root 0644 /etc/resolv.conf /var/run/resolv.conf
>   f root root 0644 /var/run/resolv.conf none
> -
> +l root root 0755 /run /var/run
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 3e72515..ebd760b 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -6,9 +6,10 @@ LICENSE = "GPLv2.0+ & LGPLv2.1+"
>   LICENSE_${PN} = "GPLv2.0+"
>   LICENSE_libudev = "LGPLv2.1+"
>   LICENSE_libgudev = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> -                    file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
> +                    file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
> +
>
>   DEPENDS = "acl glib-2.0 libusb usbutils pciutils gperf-native libxslt-native"
>   RPROVIDES_${PN} = "hotplug"
> @@ -16,6 +17,7 @@ RRECOMMENDS_${PN} += "udev-extraconf usbutils-ids pciutils-ids"
>   RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
>
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
> +           file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
>              file://run.rules \
>              file://udev.rules \
>              file://devfs-udev.rules \
> @@ -32,7 +34,8 @@ inherit autotools pkgconfig update-rc.d
>
>   # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
>   sbindir = "${base_sbindir}"
> -libexecdir = "${base_libdir}/udev"
> +#adamian - now udev appends the /udev for itself
> +libexecdir = "${base_libdir}"
>   EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
>                   --with-pci-ids-path=${datadir}/pci.ids"
>
> @@ -50,6 +53,8 @@ FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
>   RRECOMMENDS_${PN} += "udev-utils"
>
>   FILES_${PN}-dbg += "${libexecdir}/.debug"
> +FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
> +FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
>   FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
>   FILES_libudev = "${base_libdir}/libudev.so.*"
>   FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
> diff --git a/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> new file mode 100644
> index 0000000..cbd807f
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
> @@ -0,0 +1,30 @@
> +From 0f8290c943da298abd269ca60fd8375dfb219971 Mon Sep 17 00:00:00 2001
> +From: Alexandru DAMIAN <alexandru.damian@intel.com>
> +Date: Thu, 12 Jul 2012 12:54:48 +0300
> +Subject: [PATCH] Fixing keyboard_force_release.sh shell script path
> +
> +With the introduction of rootprefix, the keyboard-force-release.sh.in
> +was modified to be executed with @rootprefix@/bin/sh, which is wrong
> +because @rootprefix@ defaults to /usr (which is correct), but the
> +shell is always at /bin/sh (IEEE Std 1003.2-1992).
> +
> +Therefore the interpreter for shell scripts needs to be /bin/sh at all times.
> +
This patch also needs an Upstream-Status: added as well.

Otherwise, I agree with Koen, have you checked the meta-oe version as I 
suggested when you first mentioned looking at udev?

Sau!

> +Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> +---
> + src/keymap/keyboard-force-release.sh.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/keymap/keyboard-force-release.sh.in b/src/keymap/keyboard-force-release.sh.in
> +index dd040ce..597a3a6 100755
> +--- a/src/keymap/keyboard-force-release.sh.in
> ++++ b/src/keymap/keyboard-force-release.sh.in
> +@@ -1,4 +1,4 @@
> +-#!@rootprefix@/bin/sh -e
> ++#!/bin/sh -e
> + # read list of scancodes, convert hex to decimal and
> + # append to the atkbd force_release sysfs attribute
> + # $1 sysfs devpath for serioX
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index d521685..ca02abb 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -13,7 +13,7 @@ export TZ=/etc/localtime
>
>   [ -d /sys/class ] || exit 1
>   [ -r /proc/mounts ] || exit 1
> -[ -x /sbin/udevd ] || exit 1
> +[ -x /lib/udev/udevd ] || exit 1
>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>   [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
>
> @@ -70,15 +70,15 @@ kill_udevd > "/dev/null" 2>&1
>
>   # trigger the sorted events
>   echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
> -/sbin/udevd -d
> +/lib/udev/udevd -d
>
> -/sbin/udevadm control --env=STARTUP=1
> +/usr/bin/udevadm control --env=STARTUP=1
>   if [ "$not_first_boot" != "" ];then
> -	/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
> -	(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
> +	/usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
> +	(/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
>   else
> -	/sbin/udevadm trigger --action=add
> -	/sbin/udevadm settle
> +	/usr/bin/udevadm trigger --action=add
> +	/usr/bin/udevadm settle
>   fi
>
>   exit 0
> diff --git a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch b/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> deleted file mode 100644
> index 2086fe1..0000000
> --- a/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Upstream-Status: Backport
> -
> -Submitted By:            Matt Burgess <matthew_at_linuxfromscratch_dot_org>
> -Date:                    2011-03-26
> -Initial Package Version: 166
> -Upstream Status:         From upstream
> -Origin:                  http://git.kernel.org/?p=linux/hotplug/udev.git;a=commitdiff;h=4ace8a43ac2cbbd4d6f5c29fc461c3caa8f8545b
> -Description:             Fixes a compilation error caused by the removal of the
> -                         Video for Linux 1 API from Linux kernels from 2.6.38
> -                         onwards.
> -
> -diff -Naur udev-166.orig/extras/v4l_id/v4l_id.c udev-166/extras/v4l_id/v4l_id.c
> ---- udev-166.orig/extras/v4l_id/v4l_id.c	2009-12-03 12:45:03.000000000 +0000
> -+++ udev-166/extras/v4l_id/v4l_id.c	2011-03-25 20:26:33.000000000 +0000
> -@@ -28,7 +28,6 @@
> - #include <sys/types.h>
> - #include <sys/time.h>
> - #include <sys/ioctl.h>
> --#include <linux/videodev.h>
> - #include <linux/videodev2.h>
> -
> - int main (int argc, char *argv[])
> -@@ -39,7 +38,6 @@
> - 	};
> - 	int fd;
> - 	char *device;
> --	struct video_capability v1cap;
> - 	struct v4l2_capability v2cap;
> -
> - 	while (1) {
> -@@ -82,19 +80,6 @@
> - 		if ((v2cap.capabilities & V4L2_CAP_RADIO) > 0)
> - 			printf("radio:");
> - 		printf("\n");
> --	} else if (ioctl (fd, VIDIOCGCAP, &v1cap) == 0) {
> --		printf("ID_V4L_VERSION=1\n");
> --		printf("ID_V4L_PRODUCT=%s\n", v1cap.name);
> --		printf("ID_V4L_CAPABILITIES=:");
> --		if ((v1cap.type & VID_TYPE_CAPTURE) > 0)
> --			printf("capture:");
> --		if ((v1cap.type & VID_TYPE_OVERLAY) > 0)
> --			printf("video_overlay:");
> --		if (v1cap.audios > 0)
> --			printf("audio:");
> --		if ((v1cap.type & VID_TYPE_TUNER) > 0)
> --			printf("tuner:");
> --		printf("\n");
> - 	}
> -
> - 	close (fd);
> diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
> index 9c24e76..0f3d7cd 100644
> --- a/meta/recipes-core/udev/udev/udev-cache
> +++ b/meta/recipes-core/udev/udev/udev-cache
> @@ -12,7 +12,7 @@
>   export TZ=/etc/localtime
>
>   [ -r /proc/mounts ] || exit 1
> -[ -x /sbin/udevd ] || exit 1
> +[ -x /lib/udev/udevd ] || exit 1
>   [ -d /sys/class ] || exit 1
>
>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> deleted file mode 100644
> index c5813ec..0000000
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -include udev.inc
> -
> -PR = "r13"
> -
> -SRC_URI += "file://udev-166-v4l1-1.patch"
> -
> -SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
> -SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
> diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
> new file mode 100644
> index 0000000..6678fe1
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev_182.bb
> @@ -0,0 +1,9 @@
> +include udev.inc
> +
> +PR = "r0"
> +
> +# module-init-tools from kmod_git will provide libkmod runtime
> +DEPENDS = "module-init-tools"
> +
> +SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
> +SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
>



