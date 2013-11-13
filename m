Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBDB6D71F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:15:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 10:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434742448"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2013 10:15:58 -0800
Message-ID: <5283C1DE.3080507@linux.intel.com>
Date: Wed, 13 Nov 2013 10:15:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1384325244-8730-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1384325244-8730-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V3] systemd: Upgrade 206 -> 208
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
X-List-Received-Date: Wed, 13 Nov 2013 18:15:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 10:47 PM, Khem Raj wrote:
> Remove patches accepted upstream
> Forward-port uclibc patches
> Create additional packages to bundle zsh support files
>

Looks like RP already to v2, so can you make an updated diff against 
master please.

Thanks
	Sau!


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../0001-use-CAP_MKNOD-ConditionCapability.patch   |  32 -----
>   .../systemd/systemd/systemd-pam-fix-msformat.patch | 137 ++++++++++-----------
>   .../systemd/{systemd_206.bb => systemd_208.bb}     |  12 +-
>   3 files changed, 76 insertions(+), 105 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
>   rename meta/recipes-core/systemd/{systemd_206.bb => systemd_208.bb} (97%)
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch b/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
> deleted file mode 100644
> index 4a35c23..0000000
> --- a/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Submitted
> -
> -From cfdd1eb76dced87c73bac8ec22d3a10244c9bbf6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 21 Aug 2013 20:25:19 -0700
> -Subject: [PATCH] use CAP_MKNOD ConditionCapability
> -
> -Fixes errors seen when booting VMs on QEMU like
> -
> -systemd[1]: kmod-static-nodes.service: main process exited, code=exited, status=203/EXEC
> -systemd[1]: Failed to start Create list of required static device nodes for the current kernel.
> -systemd[1]: Unit kmod-static-nodes.service entered failed state.
> -
> -Make sure that mknod capability is available
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - units/kmod-static-nodes.service.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: systemd-206/units/kmod-static-nodes.service.in
> -===================================================================
> ---- systemd-206.orig/units/kmod-static-nodes.service.in	2013-08-21 19:13:02.000000000 -0700
> -+++ systemd-206/units/kmod-static-nodes.service.in	2013-08-21 20:39:13.310689871 -0700
> -@@ -9,6 +9,7 @@
> - Description=Create list of required static device nodes for the current kernel
> - DefaultDependencies=no
> - Before=sysinit.target systemd-tmpfiles-setup-dev.service
> -+ConditionCapability=CAP_MKNOD
> -
> - [Service]
> - Type=oneshot
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> index 77bb305..e8a9144 100644
> --- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> @@ -1,10 +1,10 @@
>   Upstream-Status: Denied [no desire for uclibc support]
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: systemd-204/src/fsck/fsck.c
> +Index: systemd-208/src/fsck/fsck.c
>   ===================================================================
> ---- systemd-204.orig/src/fsck/fsck.c	2013-04-02 05:48:49.000000000 -0700
> -+++ systemd-204/src/fsck/fsck.c	2013-05-23 11:26:51.776345015 -0700
> +--- systemd-208.orig/src/fsck/fsck.c	2013-08-13 13:02:46.000000000 -0700
> ++++ systemd-208/src/fsck/fsck.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -37,6 +37,8 @@
>    #include "virt.h"
>    #include "fileio.h"
> @@ -33,10 +33,10 @@ Index: systemd-204/src/fsck/fsck.c
>
>                    /* Only show one progress counter at max */
>                    if (!locked) {
> -Index: systemd-204/src/core/swap.c
> +Index: systemd-208/src/core/swap.c
>   ===================================================================
> ---- systemd-204.orig/src/core/swap.c	2013-05-06 12:06:04.000000000 -0700
> -+++ systemd-204/src/core/swap.c	2013-05-23 11:26:51.780345015 -0700
> +--- systemd-208.orig/src/core/swap.c	2013-09-26 11:20:30.000000000 -0700
> ++++ systemd-208/src/core/swap.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -41,6 +41,8 @@
>    #include "path-util.h"
>    #include "virt.h"
> @@ -46,15 +46,15 @@ Index: systemd-204/src/core/swap.c
>    static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
>            [SWAP_DEAD] = UNIT_INACTIVE,
>            [SWAP_ACTIVATING] = UNIT_ACTIVATING,
> -@@ -1055,6 +1057,7 @@
> -                 char *dev = NULL, *d;
> +@@ -1041,6 +1043,7 @@
> +                 _cleanup_free_ char *dev = NULL, *d = NULL;
>                    int prio = 0, k;
>
>   +#ifdef HAVE_MSFORMAT
>                    k = fscanf(m->proc_swaps,
>                               "%ms "  /* device/file */
>                               "%*s "  /* type of swap */
> -@@ -1062,6 +1065,16 @@
> +@@ -1048,6 +1051,16 @@
>                               "%*s "  /* used */
>                               "%i\n", /* priority */
>                               &dev, &prio);
> @@ -71,10 +71,10 @@ Index: systemd-204/src/core/swap.c
>                    if (k != 2) {
>                            if (k == EOF)
>                                    break;
> -Index: systemd-204/src/core/mount-setup.c
> +Index: systemd-208/src/core/mount-setup.c
>   ===================================================================
> ---- systemd-204.orig/src/core/mount-setup.c	2013-04-24 06:34:38.000000000 -0700
> -+++ systemd-204/src/core/mount-setup.c	2013-05-23 11:26:51.780345015 -0700
> +--- systemd-208.orig/src/core/mount-setup.c	2013-08-13 13:02:46.000000000 -0700
> ++++ systemd-208/src/core/mount-setup.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -28,6 +28,7 @@
>    #include <assert.h>
>    #include <unistd.h>
> @@ -107,10 +107,10 @@ Index: systemd-204/src/core/mount-setup.c
>                            if (feof(f))
>                                    break;
>
> -Index: systemd-204/src/core/mount.c
> +Index: systemd-208/src/core/mount.c
>   ===================================================================
> ---- systemd-204.orig/src/core/mount.c	2013-05-06 12:06:04.000000000 -0700
> -+++ systemd-204/src/core/mount.c	2013-05-23 11:26:51.780345015 -0700
> +--- systemd-208.orig/src/core/mount.c	2013-09-26 11:20:30.000000000 -0700
> ++++ systemd-208/src/core/mount.c	2013-11-05 22:07:43.784497482 -0800
>   @@ -43,6 +43,8 @@
>    #include "exit-status.h"
>    #include "def.h"
> @@ -120,52 +120,51 @@ Index: systemd-204/src/core/mount.c
>    static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
>            [MOUNT_DEAD] = UNIT_INACTIVE,
>            [MOUNT_MOUNTING] = UNIT_ACTIVATING,
> -@@ -1626,7 +1628,7 @@
> +@@ -1559,6 +1561,7 @@
> +                 _cleanup_free_ char *device = NULL, *path = NULL, *options = NULL, *options2 = NULL, *fstype = NULL, *d = NULL, *p = NULL, *o = NULL;
>                    int k;
>
> -                 device = path = options = options2 = fstype = d = p = o = NULL;
> --
>   +#ifdef HAVE_MSFORMAT
> -                 if ((k = fscanf(m->proc_self_mountinfo,
> -                                 "%*s "       /* (1) mount id */
> -                                 "%*s "       /* (2) parent id */
> -@@ -1645,7 +1647,31 @@
> -                                 &fstype,
> -                                 &device,
> -                                 &options2)) != 5) {
> +                 k = fscanf(m->proc_self_mountinfo,
> +                            "%*s "       /* (1) mount id */
> +                            "%*s "       /* (2) parent id */
> +@@ -1577,7 +1580,31 @@
> +                            &fstype,
> +                            &device,
> +                            &options2);
>   -
>   +#else
> -+		path = malloc(257);
> -+		options = malloc(257);
> -+		fstype = malloc(257);
> -+		device = malloc(257);
> -+		options2 = malloc(257);
> -+                if ((k = fscanf(m->proc_self_mountinfo,
> -+                                "%*s "       /* (1) mount id */
> -+                                "%*s "       /* (2) parent id */
> -+                                "%*s "       /* (3) major:minor */
> -+                                "%*s "       /* (4) root */
> -+                                "%256s "     /* (5) mount point */
> -+                                "%256s"      /* (6) mount options */
> -+                                "%*[^-]"     /* (7) optional fields */
> -+                                "- "         /* (8) separator */
> -+                                "%256s "     /* (9) file system type */
> -+                                "%256s"      /* (10) mount source */
> -+                                "%256s"      /* (11) mount options 2 */
> -+                                "%*[^\n]",   /* some rubbish at the end */
> -+                                path,
> -+                                options,
> -+                                fstype,
> -+                                device,
> -+                                options2)) != 5) {
> ++                path = malloc(257);
> ++                options = malloc(257);
> ++                fstype = malloc(257);
> ++                device = malloc(257);
> ++                options2 = malloc(257);
> ++                k = fscanf(m->proc_self_mountinfo,
> ++                           "%*s "       /* (1) mount id */
> ++                           "%*s "       /* (2) parent id */
> ++                           "%*s "       /* (3) major:minor */
> ++                           "%*s "       /* (4) root */
> ++                           "%256s "     /* (5) mount point */
> ++                           "%256s"      /* (6) mount options */
> ++                           "%*[^-]"     /* (7) optional fields */
> ++                           "- "         /* (8) separator */
> ++                           "%256s "     /* (9) file system type */
> ++                           "%256s"      /* (10) mount source */
> ++                           "%256s"      /* (11) mount options 2 */
> ++                           "%*[^\n]",   /* some rubbish at the end */
> ++                           path,
> ++                           options,
> ++                           fstype,
> ++                           device,
> ++                           options2);
>   +#endif /* HAVE_MSFORMAT */
> -                         if (k == EOF)
> -                                 break;
> +                 if (k == EOF)
> +                         break;
>
> -Index: systemd-204/src/core/umount.c
> +Index: systemd-208/src/core/umount.c
>   ===================================================================
> ---- systemd-204.orig/src/core/umount.c	2013-04-18 08:14:11.000000000 -0700
> -+++ systemd-204/src/core/umount.c	2013-05-23 11:26:51.780345015 -0700
> +--- systemd-208.orig/src/core/umount.c	2013-08-13 13:02:46.000000000 -0700
> ++++ systemd-208/src/core/umount.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -36,6 +36,8 @@
>    #include "util.h"
>    #include "virt.h"
> @@ -235,10 +234,10 @@ Index: systemd-204/src/core/umount.c
>                            if (k == EOF)
>                                    break;
>
> -Index: systemd-204/src/shared/socket-util.c
> +Index: systemd-208/src/shared/socket-util.c
>   ===================================================================
> ---- systemd-204.orig/src/shared/socket-util.c	2013-04-18 08:14:11.000000000 -0700
> -+++ systemd-204/src/shared/socket-util.c	2013-05-23 11:30:53.528348084 -0700
> +--- systemd-208.orig/src/shared/socket-util.c	2013-09-26 11:20:30.000000000 -0700
> ++++ systemd-208/src/shared/socket-util.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -40,6 +40,8 @@
>    #include "missing.h"
>    #include "fileio.h"
> @@ -266,28 +265,28 @@ Index: systemd-204/src/shared/socket-util.c
>
>            family = netlink_family_from_string(sfamily);
>            if (family < 0)
> -Index: systemd-204/src/tmpfiles/tmpfiles.c
> +Index: systemd-208/src/tmpfiles/tmpfiles.c
>   ===================================================================
> ---- systemd-204.orig/src/tmpfiles/tmpfiles.c	2013-04-24 06:34:38.000000000 -0700
> -+++ systemd-204/src/tmpfiles/tmpfiles.c	2013-05-23 11:26:51.784345016 -0700
> -@@ -52,6 +52,8 @@
> - #include "conf-files.h"
> +--- systemd-208.orig/src/tmpfiles/tmpfiles.c	2013-09-17 14:55:37.000000000 -0700
> ++++ systemd-208/src/tmpfiles/tmpfiles.c	2013-11-05 22:01:26.776490078 -0800
> +@@ -53,6 +53,8 @@
>    #include "capability.h"
> + #include "specifier.h"
>
>   +#include "config.h"
>   +
>    /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>     * them in the file system. This is intended to be used to create
>     * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -1029,6 +1031,7 @@
> -         if (!i)
> -                 return log_oom();
> +@@ -1082,6 +1084,7 @@
> +         assert(line >= 1);
> +         assert(buffer);
>
>   +#ifdef HAVE_MSFORMAT
>            r = sscanf(buffer,
>                       "%c %ms %ms %ms %ms %ms %n",
>                       &type,
> -@@ -1038,6 +1041,29 @@
> +@@ -1091,6 +1094,29 @@
>                       &group,
>                       &age,
>                       &n);
> @@ -317,10 +316,10 @@ Index: systemd-204/src/tmpfiles/tmpfiles.c
>            if (r < 2) {
>                    log_error("[%s:%u] Syntax error.", fname, line);
>                    return -EIO;
> -Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
> +Index: systemd-208/src/cryptsetup/cryptsetup-generator.c
>   ===================================================================
> ---- systemd-204.orig/src/cryptsetup/cryptsetup-generator.c	2013-05-06 12:06:04.000000000 -0700
> -+++ systemd-204/src/cryptsetup/cryptsetup-generator.c	2013-05-23 11:26:51.784345016 -0700
> +--- systemd-208.orig/src/cryptsetup/cryptsetup-generator.c	2013-09-30 09:57:04.000000000 -0700
> ++++ systemd-208/src/cryptsetup/cryptsetup-generator.c	2013-11-05 22:01:26.776490078 -0800
>   @@ -31,6 +31,8 @@
>    #include "strv.h"
>    #include "fileio.h"
> @@ -330,7 +329,7 @@ Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
>    static const char *arg_dest = "/tmp";
>    static bool arg_enabled = true;
>    static bool arg_read_crypttab = true;
> -@@ -398,7 +400,16 @@
> +@@ -420,7 +422,16 @@
>                            if (*l == '#' || *l == 0)
>                                    continue;
>
> diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_208.bb
> similarity index 97%
> rename from meta/recipes-core/systemd/systemd_206.bb
> rename to meta/recipes-core/systemd/systemd_208.bb
> index a1a8bd7..25530d0 100644
> --- a/meta/recipes-core/systemd/systemd_206.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -18,7 +18,6 @@ SECTION = "base/shell"
>   inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
>
>   SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
> -           file://0001-use-CAP_MKNOD-ConditionCapability.patch \
>              file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
>              file://binfmt-install.patch \
>              file://touchscreen.rules \
> @@ -27,8 +26,8 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://init \
>              file://run-ptest \
>             "
> -SRC_URI[md5sum] = "89e36f2d3ba963020b72738549954cbc"
> -SRC_URI[sha256sum] = "4c993de071118ea1df7ffc4be26ef0b0d78354ef15b2743a2783d20edfcde9de"
> +SRC_URI[md5sum] = "df64550d92afbffb4f67a434193ee165"
> +SRC_URI[sha256sum] = "aa64fa864466fd5727005c55d61c092828b94b4f857272c0b503695022146390"
>
>   UCLIBCPATCHES = ""
>   UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
> @@ -134,7 +133,8 @@ python populate_packages_prepend (){
>   }
>   PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>
> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros ${PN}-binfmt"
> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-zsh"
>
>   SYSTEMD_PACKAGES = "${PN}-binfmt"
>   SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> @@ -160,6 +160,10 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
>   FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
>                            "
>
> +FILES_${PN}  += "${@base_contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)}"
> +
> +FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
> +
>   FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
>                         ${exec_prefix}/lib/binfmt.d \
>                         ${rootlibexecdir}/systemd/systemd-binfmt \
>

