Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1328.1618510599548439712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 186AC38C13D1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.57.2 FAILED
Message-ID: <MADEUP.16761AD0E713C8DD.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150514
Content-Type: multipart/mixed; boundary="===============4447532086311709626=="

--===============4447532086311709626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.57.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.57.1-0.57.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4447532086311709626==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.57.1-0.57.2.patch"

From c7e188a67eb4216bb37d24b3992f22d87bae86f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 05:23:18 +0000
Subject: [PATCH] meson: upgrade 0.57.1 -> 0.57.2

---
 meta/recipes-devtools/meson/meson.inc         |  4 +--
 .../0001-Make-CPU-family-warnings-fatal.patch |  2 +-
 ...ectly-set-uid-gid-of-installed-files.patch | 28 -------------------
 ...pport-building-allarch-recipes-again.patch |  2 +-
 .../{meson_0.57.1.bb => meson_0.57.2.bb}      |  0
 5 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
 rename meta/recipes-devtools/meson/{meson_0.57.1.bb => meson_0.57.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index e186dede92..149d06637f 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,10 +14,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://0001-minstall-Correctly-set-uid-gid-of-installed-files.patch \
            file://gi-target-dep.patch \
            "
-SRC_URI[sha256sum] = "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6"
+SRC_URI[sha256sum] = "3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
@@ -25,7 +24,6 @@ SRC_URI_append_class-native = " \
 "
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 0808891a27..9285347bfa 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 76934bcbf2cfa7304e8864e28c51f58adda0392f Mon Sep 17 00:00:00 2001
+From 6dcb5c501f7ef695b56b5a8b902303315a96458d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
diff --git a/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch b/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
deleted file mode 100644
index d55b7cc7c7..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-minstall-Correctly-set-uid-gid-of-installed-files.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3f6f4964dc79ae986f44afe1687922381f237edd Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Wed, 3 Mar 2021 12:47:28 +0100
-Subject: [PATCH] minstall: Correctly set uid/gid of installed files
-
-In commit caab4d3d, the uid and gid arguments passed to os.chown() by
-set_chown() were accidentally swapped, causing files to end up with
-incorrect owner/group if the owner and group are not the same.
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6226ac26ef63335bfb817db02b3f295c78214a82]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- mesonbuild/minstall.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 785ff5869..07da408aa 100644
---- a/mesonbuild/minstall.py
-+++ b/mesonbuild/minstall.py
-@@ -148,7 +148,7 @@ def set_chown(path: str, user: T.Optional[str] = None, group: T.Optional[str] =
-         Use a real function rather than a lambda to help mypy out. Also real
-         functions are faster.
-         """
--        real_os_chown(path, gid, uid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
-+        real_os_chown(path, uid, gid, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
- 
-     try:
-         os.chown = chown
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ddc34c2f49..68b0157cde 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6efb6114836fd4a1e012aa03b37f3beeeb22b466 Mon Sep 17 00:00:00 2001
+From c51dc6d4f0a18248a6e80c2a42b6087efcf241ed Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_0.57.1.bb b/meta/recipes-devtools/meson/meson_0.57.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.57.1.bb
rename to meta/recipes-devtools/meson/meson_0.57.2.bb
-- 
2.27.0


--===============4447532086311709626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (812 cached, 2 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0db26c56b65fce507f541b5ae5267204f0508fbe"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 258 Local 177 Network 0 Missed 81 Current 418 (68% match, 88% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 17 stale sstate objects for arch qemux86...done.
Removing 20 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 458 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: Running setscene task 470 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_setscene)
NOTE: Running setscene task 473 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 612 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 660 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 671 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 775 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 803 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: Running task 804 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_fetch)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 821 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: Running task 822 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_write_config)
NOTE: Running task 826 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 827 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 828 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 861 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: Running task 862 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 864 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_fetch)
NOTE: Running task 866 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_fetch)
NOTE: Running task 867 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 878 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 902 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: Running task 905 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Started
NOTE: recipe meson-native-0.57.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 967 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_unpack)
NOTE: recipe meson-native-0.57.2-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_fetch: Started
NOTE: Running task 979 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_unpack)
NOTE: Running task 980 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1004 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_unpack)
NOTE: Running task 1014 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1015 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: Running task 1040 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_unpack)
NOTE: Running task 1041 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1042 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_unpack)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: Running task 1058 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_write_config)
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: Running task 1069 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_warn_musl)
NOTE: Running task 1070 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_write_config)
NOTE: Running task 1091 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: Running task 1094 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: Running task 1128 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Started
NOTE: Running setscene task 672 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1181 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe meson-native-0.57.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1293 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_fetch)
NOTE: Running task 1295 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: Running setscene task 673 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running task 1352 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: Running task 1361 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1362 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 1364 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_fetch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_247.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_warn_musl: Succeeded
NOTE: Running task 1437 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1524 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe meson-0.57.2-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1588 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1601 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Started
NOTE: Running task 1615 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe systemd-1_247.4-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: Running task 1684 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_patch)
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1813 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: Running task 1822 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe meson-0.57.2-r0: task do_fetch: Succeeded
NOTE: Running task 1823 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1824 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe procps-3.3.17-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: Running task 1825 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: Running task 1827 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe meson-0.57.2-r0: task do_unpack: Started
NOTE: recipe meson-native-0.57.2-r0: task do_unpack: Succeeded
NOTE: Running task 1830 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_patch)
NOTE: recipe procps-3.3.17-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1832 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_patch)
NOTE: recipe meson-0.57.2-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_patch)
NOTE: recipe meson-0.57.2-r0: task do_patch: Started
NOTE: recipe procps-3.3.17-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libx11-1_1.7.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 674 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe meson-native-0.57.2-r0: task do_patch: Succeeded
NOTE: Running task 1848 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-0.57.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-0.57.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1855 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: recipe meson-0.57.2-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: Running task 1857 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1858 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_populate_lic)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 1859 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-0.57.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-0.57.2-r0: task do_populate_lic: Started
NOTE: recipe meson-native-0.57.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe meson-native-0.57.2-r0: task do_configure: Succeeded
NOTE: Running task 1860 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1944 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_patch: Started
NOTE: recipe meson-0.57.2-r0: task do_populate_lic: Succeeded
NOTE: recipe meson-0.57.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_compile: Started
NOTE: recipe meson-0.57.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1972 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_patch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Started
NOTE: recipe meson-native-0.57.2-r0: task do_compile: Succeeded
NOTE: Running task 1973 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_install)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_install: Started
NOTE: recipe meson-0.57.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1975 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_configure)
NOTE: recipe meson-0.57.2-r0: task do_configure: Started
NOTE: recipe meson-0.57.2-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_compile)
NOTE: recipe meson-0.57.2-r0: task do_compile: Started
NOTE: recipe systemd-1_247.4-r0: task do_unpack: Succeeded
NOTE: Running task 1977 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_patch)
NOTE: recipe systemd-1_247.4-r0: task do_patch: Started
NOTE: recipe meson-0.57.2-r0: task do_compile: Succeeded
NOTE: Running task 1978 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_install)
NOTE: recipe meson-0.57.2-r0: task do_install: Started
NOTE: recipe systemd-1_247.4-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_install: Succeeded
NOTE: Running task 1980 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_populate_sysroot)
NOTE: recipe meson-native-0.57.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_patch: Succeeded
NOTE: recipe meson-native-0.57.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1983 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1985 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1986 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-native-2020.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1987 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe xorgproto-native-2020.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1988 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1989 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_configure)
NOTE: recipe wayland-native-1.19.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_configure)
NOTE: recipe xorgproto-native-2020.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_configure: Started
NOTE: recipe meson-0.57.2-r0: task do_install: Succeeded
NOTE: Running task 1991 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_package)
NOTE: Running task 1992 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_populate_sysroot)
NOTE: recipe meson-0.57.2-r0: task do_package: Started
NOTE: recipe meson-0.57.2-r0: task do_populate_sysroot: Started
NOTE: recipe meson-0.57.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Succeeded
NOTE: Running task 1993 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_compile)
NOTE: recipe xorgproto-native-2020.1-r0: task do_configure: Succeeded
NOTE: Running task 1994 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_compile)
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Started
NOTE: recipe xorgproto-native-2020.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Succeeded
NOTE: Running task 1995 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_install)
NOTE: recipe xorgproto-native-2020.1-r0: task do_compile: Succeeded
NOTE: Running task 1996 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_install)
NOTE: recipe xorgproto-2020.1-r0: task do_install: Started
NOTE: recipe xorgproto-native-2020.1-r0: task do_install: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1997 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: recipe meson-0.57.2-r0: task do_package: Succeeded
NOTE: Running task 1998 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_packagedata)
NOTE: recipe wayland-native-1.19.0-r0: task do_compile: Started
NOTE: recipe meson-0.57.2-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot)
NOTE: Running task 2000 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: recipe xorgproto-native-2020.1-r0: task do_install: Succeeded
NOTE: Running task 2001 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: recipe meson-0.57.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2002 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_package_write_rpm)
NOTE: Running task 2003 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_package_qa)
NOTE: recipe xorgproto-native-2020.1-r0: task do_populate_sysroot: Started
NOTE: recipe meson-0.57.2-r0: task do_package_write_rpm: Started
NOTE: recipe meson-0.57.2-r0: task do_package_qa: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot unihash changed to b1a9da192de0a70c5d90d12782ec2e357deb2b5a85534edd71939a1ae96edebf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: recipe wayland-native-1.19.0-r0: task do_compile: Succeeded
NOTE: Running setscene task 704 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running task 2004 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe xorgproto-native-2020.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot unihash changed to 99be49b759d9dd2d3d12973b28213c416608675b7dc416e29b1da47eac02140b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 746 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-0.57.2-r0: task do_package_qa: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2005 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2007 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-native-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe wayland-native-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2012 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata unihash changed to 47a1b8761702039a977d4c770783d3913a22fd33880a3aa2d65b18fb1fe70303
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Running setscene task 777 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 778 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 779 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 780 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 781 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 782 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 784 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 785 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2013 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-native-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_setscene: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to 27ac3881a0946e3f385f38a28ae19199d4394d4af9905d25cf17cad567b1c95d
NOTE: Running task 2014 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 836 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 837 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 840 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 841 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm unihash changed to 0ea79019a8c2a88ec4f88eba8b03121f0385aecc59110f396fcbcf6cd494e713
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2015 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure: Started
NOTE: recipe meson-0.57.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2016 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2017 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: recipe wayland-1.19.0-r0: task do_compile: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2018 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2019 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2020 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2021 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to 5f528b8b051e8d7735cdbcf188917f44c3c6aed89b2733772d30058e240c7455
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_configure: Succeeded
NOTE: Running task 2023 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_compile)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_compile: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2024 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 46828785b6c71c9d2d4de345cefd8f714b6b9306beb433ce39fd9086d4f6d5c4
NOTE: Setscene tasks completed
NOTE: Running task 2025 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: Running task 2040 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to 3ce16b7608b1eac0e5b1556c746330855869b0a70c1efa1ad469f865b711d4b4
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2069 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_configure)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_compile: Succeeded
NOTE: Running task 2070 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_install)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2071 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2072 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_install)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 2073 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot)
NOTE: Running task 2074 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_install: Succeeded
NOTE: Running task 2075 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot unihash changed to 7cc2ebb2353ccd4f9fa2eeea9279dda61b229b7433ad0d582a654a0de78dcf3b
NOTE: Setscene tasks completed
NOTE: Running task 2076 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot unihash changed to a97479271fc4d2cf0c55dfea8ea74a6654241dd3937ce21ac2b3244bea248fdc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.2.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 948 of 676 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2077 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemu-native-5.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-native-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-native-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2078 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-native-2.1-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2079 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata unihash changed to b26fc9bd9178f9d08259cc1959b75dcd07e9104e259ce49fcb5813d063c35903
NOTE: recipe qemu-native-5.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2080 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_configure)
NOTE: Running task 2086 of 2156 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-native-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2087 of 2156 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-native-2.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm unihash changed to fcd67432a7cc8dba728f161695f8bad394e94fe751b588068a21ad6e4572e0a9
ERROR: systemd-1_247.4-r0 do_configure: meson failed
ERROR: systemd-1_247.4-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065' failed with exit code 1:
The Meson build system
Version: 0.57.2
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build
Build type: cross build
Project name: systemd
Project version: 247
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-79
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Program tools/add-git-hook.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/add-git-hook.sh)
Message: Activated pre-commit hook
Program tools/check-compilation.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/check-compilation.sh)
Program tools/meson-build.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-build.sh)
C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C++ linker for the build machine: g++ ld.bfd 2.30-79
C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
Compiler for C supports arguments -Wno-unused-parameter: YES 
Compiler for C supports arguments -Wno-missing-field-initializers: YES 
Compiler for C supports arguments -Wno-unused-result: YES 
Compiler for C supports arguments -Wno-format-signedness: YES 
Compiler for C supports arguments -Werror=undef: YES 
Compiler for C supports arguments -Wlogical-op: YES 
Compiler for C supports arguments -Wmissing-include-dirs: YES 
Compiler for C supports arguments -Wold-style-definition: YES 
Compiler for C supports arguments -Wpointer-arith: YES 
Compiler for C supports arguments -Winit-self: YES 
Compiler for C supports arguments -Wfloat-equal: YES 
Compiler for C supports arguments -Wsuggest-attribute=noreturn: YES 
Compiler for C supports arguments -Werror=missing-prototypes: YES 
Compiler for C supports arguments -Werror=implicit-function-declaration: YES 
Compiler for C supports arguments -Werror=missing-declarations: YES 
Compiler for C supports arguments -Werror=return-type: YES 
Compiler for C supports arguments -Werror=incompatible-pointer-types: YES 
Compiler for C supports arguments -Werror=format=2: YES 
Compiler for C supports arguments -Wstrict-prototypes: YES 
Compiler for C supports arguments -Wredundant-decls: YES 
Compiler for C supports arguments -Wmissing-noreturn: YES 
Compiler for C supports arguments -Wimplicit-fallthrough=5: YES 
Compiler for C supports arguments -Wshadow: YES 
Compiler for C supports arguments -Wendif-labels: YES 
Compiler for C supports arguments -Wstrict-aliasing=2: YES 
Compiler for C supports arguments -Wwrite-strings: YES 
Compiler for C supports arguments -Werror=overflow: YES 
Compiler for C supports arguments -Werror=shift-count-overflow: YES 
Compiler for C supports arguments -Werror=shift-overflow=2: YES 
Compiler for C supports arguments -Wdate-time: YES 
Compiler for C supports arguments -Wnested-externs: YES 
Compiler for C supports arguments -Wno-error=#warnings: NO 
Compiler for C supports arguments -Wno-string-plus-int: NO 
Compiler for C supports arguments -Wno-maybe-uninitialized: YES 
Compiler for C supports arguments -ffast-math: YES 
Compiler for C supports arguments -fno-common: YES 
Compiler for C supports arguments -fdiagnostics-show-option: YES 
Compiler for C supports arguments -fno-strict-aliasing: YES 
Compiler for C supports arguments -fvisibility=hidden: YES 
Compiler for C supports arguments -fstack-protector: YES 
Compiler for C supports arguments -fstack-protector-strong: YES 
Compiler for C supports arguments --param=ssp-buffer-size=4: YES 
Compiler for C supports arguments -ffunction-sections: YES 
Compiler for C supports arguments -fdata-sections: YES 
Compiler for C supports link arguments -Wl,-z,relro: YES 
Compiler for C supports link arguments -Wl,-z,now: YES 
Compiler for C supports link arguments -fstack-protector: YES 
Compiler for C supports link arguments -Wl,--gc-sections: YES 
Compiler for C supports arguments -Wzero-length-bounds: YES 
Checking if "-Werror=shadow with local shadowing" compiles: YES 
Compiler for C++ supports arguments -Wno-unused-parameter: YES 
Compiler for C++ supports arguments -Wno-missing-field-initializers: YES 
Compiler for C++ supports arguments -Wno-unused-result: YES 
Compiler for C++ supports arguments -Wno-format-signedness: YES 
Compiler for C supports arguments -Wstringop-truncation: YES 
Checking for size of "dev_t" : 8
Checking for size of "ino_t" : 8
Checking for size of "time_t" : 4
Checking for size of "rlim_t" : 8
Checking for size of "char16_t" : 2
Checking for size of "char32_t" : 4
Checking for size of "struct statx" : 256
Checking for function "secure_getenv" : YES 
Checking for function "__secure_getenv" : NO 
Checking for function "memfd_create" : YES 
Checking for function "gettid" : YES 
Checking for function "pivot_root" : NO 
Checking for function "name_to_handle_at" : YES 
Checking for function "setns" : YES 
Checking for function "renameat2" : YES 
Checking for function "kcmp" : NO 
Checking for function "keyctl" : NO 
Checking for function "copy_file_range" : YES 
Checking for function "bpf" : NO 
Checking for function "statx" : YES 
Checking for function "explicit_bzero" : YES 
Checking for function "reallocarray" : YES 
Checking for function "set_mempolicy" : NO 
Checking for function "get_mempolicy" : NO 
Checking for function "pidfd_send_signal" : NO 
Checking for function "pidfd_open" : NO 
Checking for function "rt_sigqueueinfo" : NO 
Checking for function "mallinfo" : YES 
Checking for function "close_range" : NO 
Checking for function "getrandom" : YES 
Program sed found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sed)
Program awk found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/awk)
Program m4 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/m4)
Program stat found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/stat)
Program git found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/git)
Program env found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/env)
Program perl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/perl-native/perl)
Program test/test-efi-create-disk.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-efi-create-disk.sh)
Message: Using /usr/sbin/quotaon for quotaon
Message: Using /usr/sbin/quotacheck for quotacheck
Message: Using /bin/kmod for kmod
Message: Using /usr/sbin/kexec for kexec
Message: Using /sbin/sulogin for sulogin
Message: Using /bin/mount for mount
Message: Using /bin/umount for umount
Program loadkeys /usr/sbin/loadkeys /sbin/loadkeys found: NO
Program setfont /usr/sbin/setfont /sbin/setfont found: NO
Message: Using /sbin/nologin for nologin
Program gperf found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/gperf)
Message: gperf len type is size_t
Has header "sys/capability.h" : YES 
Has header "crypt.h" : YES 
Has header "linux/memfd.h" : YES 
Has header "linux/vm_sockets.h" : YES 
Has header "sys/auxv.h" : YES 
Has header "valgrind/memcheck.h" : NO 
Has header "valgrind/valgrind.h" : NO 
Run-time dependency threads found: YES
Library rt found: YES
Library m found: YES
Library dl found: YES
Library crypt found: YES
Checking for function "crypt_ra" with dependency -lcrypt: YES 
Checking for function "crypt_preferred_method" with dependency -lcrypt: YES 
Checking for function "crypt_gensalt_ra" with dependency -lcrypt: YES 
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Run-time dependency libcap found: YES 2.48
Run-time dependency mount found: YES 2.36.2
Run-time dependency fdisk found: YES 2.36.2
Found CMake: NO
Run-time dependency pwquality found: NO (tried pkgconfig and cmake)
Run-time dependency libapparmor found: NO (tried pkgconfig and cmake)
Library acl found: YES
Run-time dependency blkid found: YES 2.36.2
Run-time dependency libkmod found: YES 28
Library pam found: YES
Library pam_misc found: YES
Run-time dependency p11-kit-1 found: NO (tried pkgconfig and cmake)
Run-time dependency libfido2 found: NO (tried pkgconfig and cmake)
Run-time dependency liblzma found: YES 5.2.5
Run-time dependency libzstd found: NO (tried pkgconfig and cmake)
Run-time dependency xkbcommon found: YES 1.0.3
Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
Run-time dependency gobject-2.0 found: NO (tried pkgconfig and cmake)
Run-time dependency gio-2.0 found: NO (tried pkgconfig and cmake)
Message: default-dnssec cannot be set to yes or allow-downgrade when gcrypt is disabled. Setting default-dnssec to no.
Configuring config.h using configuration
Program tools/meson-apply-m4.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-apply-m4.sh)
Program tools/generate-gperfs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/generate-gperfs.py)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Configuring libudev.pc using configuration
Compiler for C supports arguments -std=iso9899:2017: YES 
Compiler for C++ supports arguments -std=c++14: YES 
Compiler for C++ supports arguments -std=c++17: YES 
Compiler for C++ supports arguments -std=c++20: YES 
Program generate-af-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-af-list.sh)
Program generate-arphrd-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-arphrd-list.sh)
Program generate-cap-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-cap-list.sh)
Program generate-errno-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-errno-list.sh)
Configuring libsystemd.pc using configuration
Program generate-audit_type-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/journal/generate-audit_type-list.sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Configuring logind.conf using configuration
Configuring 71-seat.rules using configuration
Program tools/autosuspend-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/autosuspend-update.sh)
Program tools/hwdb-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/hwdb-update.sh)
Program tools/make-autosuspend-rules.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-autosuspend-rules.py)
Program tools/make-directive-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-directive-index.py)
Program tools/make-man-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-man-index.py)
Program tools/syscall-names-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/syscall-names-update.sh)
Program tools/xml_helper.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/xml_helper.py)
Program tools/update-dbus-docs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/update-dbus-docs.py)
Program generate-syscall-list.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-syscall-list.py)
Program generate-ip-protocol-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-ip-protocol-list.sh)
Configuring macros.systemd using configuration
Configuring system.conf using configuration
Configuring user.conf using configuration
Configuring systemd.pc using configuration
Configuring triggers.systemd using configuration
Configuring org.freedesktop.systemd1.policy using configuration
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program generate-keyboard-keys-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-list.sh)
Program generate-keyboard-keys-gperf.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-gperf.sh)
Configuring udev.pc using configuration
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program test-repart.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/partition/test-repart.sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program generate-dns_type-gperf.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/resolve/generate-dns_type-gperf.py)
Configuring resolved.conf using configuration
Configuring timesyncd.conf using configuration
Configuring 90-vconsole.rules using configuration
Program generate-sym-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/generate-sym-test.py)
Program test-systemd-tmpfiles.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/test-systemd-tmpfiles.py)
Configuring 50-udev-default.rules using configuration
Configuring 64-btrfs.rules using configuration
Configuring 99-systemd.rules using configuration
Program test-network-generator-conversion.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-network-generator-conversion.sh)
Configuring test-sysusers.sh using configuration
Program rule-syntax-check.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/rule-syntax-check.py)
Program sysv-generator-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sysv-generator-test.py)
Program sys-script.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sys-script.py)
Program udev-test.pl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/udev-test.pl)
Program hwdb-test.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/hwdb-test.sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
Program test-sysusers.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/test/test-sysusers.sh)
Message: Not compiling test-coredump-vacuum because ENABLE_COREDUMP is not true
Message: Not compiling test-qcow2 because HAVE_ZLIB is not true
Message: test-patch-uid is a manual test
Message: test-dnssec-complex is a manual test
Message: test-ns is a manual test
Message: test-nscd-flush is a manual test
Message: test-hostname is an unsafe test
Message: Not compiling test-boot-timestamps because ENABLE_EFI is not true
Message: Not compiling test-seccomp because HAVE_SECCOMP is not true
Message: test-ask-password-api is a manual test
Message: test-ipcrm is an unsafe test
Message: test-btrfs is a manual test
Message: Not compiling test-firewall-util because HAVE_LIBIPTC is not true
Message: test-netlink-manual is a manual test
Message: test-chase-symlinks is a manual test
Message: test-install is a manual test
Message: test-udev is a manual test
Message: Not compiling test-gcrypt-util because HAVE_GCRYPT is not true
Message: test-nss is a manual test
Message: test-bus-benchmark is a manual test
Message: test-ipv4ll-manual is a manual test
Message: test-acd is a manual test
Message: test-inhibit is a manual test
Program true found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/true)
Checking for size of "long" : 4
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Configuring basic.conf using configuration
Message: Not installing tmpfiles.d/portables.conf because ENABLE_PORTABLED is 0
Configuring static-nodes-permissions.conf using configuration
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program parse_hwdb.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/hwdb.d/parse_hwdb.py)
Configuring debug-shell.service.tmp using configuration
Configuring emergency.service.tmp using configuration
Configuring kmod-static-nodes.service.tmp using configuration
Program meson-add-wants.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/units/meson-add-wants.sh)
Configuring quotaon.service.tmp using configuration
Configuring rc-local.service.tmp using configuration
Configuring rescue.service.tmp using configuration
Configuring systemd-backlight@.service.tmp using configuration
Configuring systemd-binfmt.service.tmp using configuration
Configuring systemd-bless-boot.service.tmp using configuration
Configuring systemd-boot-check-no-failures.service.tmp using configuration
Configuring systemd-coredump@.service.tmp using configuration
Configuring systemd-pstore.service.tmp using configuration
Configuring systemd-fsck-root.service.tmp using configuration
Configuring systemd-fsck@.service.tmp using configuration
Configuring systemd-hibernate-resume@.service.tmp using configuration
Configuring systemd-hibernate.service.tmp using configuration
Configuring systemd-hybrid-sleep.service.tmp using configuration
Configuring systemd-suspend-then-hibernate.service.tmp using configuration
Configuring systemd-hostnamed.service.tmp using configuration
Configuring systemd-hwdb-update.service.tmp using configuration
Configuring systemd-importd.service.tmp using configuration
Configuring systemd-initctl.service.tmp using configuration
Configuring systemd-journal-gatewayd.service.tmp using configuration
Configuring systemd-journal-remote.service.tmp using configuration
Configuring systemd-journal-upload.service.tmp using configuration
Configuring systemd-journald.service.tmp using configuration
Configuring systemd-journald@.service.tmp using configuration
Configuring systemd-localed.service.tmp using configuration
Configuring systemd-logind.service.tmp using configuration
Configuring systemd-machined.service.tmp using configuration
Configuring systemd-modules-load.service.tmp using configuration
Configuring systemd-network-generator.service.tmp using configuration
Configuring systemd-networkd.service.tmp using configuration
Configuring systemd-networkd-wait-online.service.tmp using configuration
Configuring systemd-nspawn@.service.tmp using configuration
Configuring systemd-oomd.service.tmp using configuration
Configuring systemd-portabled.service.tmp using configuration
Configuring systemd-userdbd.service.tmp using configuration
Configuring systemd-homed.service.tmp using configuration
Configuring systemd-quotacheck.service.tmp using configuration
Configuring systemd-random-seed.service.tmp using configuration
Configuring systemd-remount-fs.service.tmp using configuration
Configuring systemd-resolved.service.tmp using configuration
Configuring systemd-rfkill.service.tmp using configuration
Configuring systemd-suspend.service.tmp using configuration
Configuring systemd-sysctl.service.tmp using configuration
Configuring systemd-timedated.service.tmp using configuration
Configuring systemd-timesyncd.service.tmp using configuration
Configuring systemd-time-wait-sync.service.tmp using configuration
Configuring systemd-udevd.service.tmp using configuration
Configuring systemd-update-done.service.tmp using configuration
Configuring systemd-update-utmp-runlevel.service.tmp using configuration
Configuring systemd-update-utmp.service.tmp using configuration
Configuring systemd-user-sessions.service.tmp using configuration
Configuring systemd-vconsole-setup.service.tmp using configuration
Configuring systemd-volatile-root.service.tmp using configuration
Configuring systemd-repart.service.tmp using configuration
Configuring user-runtime-dir@.service.tmp using configuration
Configuring user@.service.tmp using configuration
Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
Program xsltproc found: NO
Configuring custom-entities.ent using configuration
Message: python-lxml not available, not making man page indices
Program rsync found: NO

../git/man/meson.build:187:0: ERROR: Program 'rsync' not found

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065:177 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 177
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 166
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 152
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 190

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 160
	#3: do_configure, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/log.do_configure.2899065
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ge
 ttext/gettext_0.21.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/re
 cipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-suppo
 rt/libcap/libcap_2.48.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['shadow-sysroot', 'gcc-runtime', 'util-linux', 'initscripts', 'intltool-native', 'quilt-native', 'patch-native', 'gettext-native', 'shadow', 'bash-completion', 'pkgconfig-native', 'gperf-native', 'xz', 'libxkbcommon', 'opkg-utils', 'python3-native', 'pseudo-native', 'kmod', 'glibc', 'shadow-native', 'systemd-systemctl-native', 'base-files', 'meson-native', 'libcap', 'acl', 'ninja-native', 'perl-native', 'base-passwd', 'libpam', 'update-rc.d', 'gcc-cross-i686', 'linux-libc-headers', 'libgcc', 'util-linux-libuuid', 'ncurses', 'libxcrypt', 'libcap-ng', 'zlib', 'libxml-parser-perl-native', 'automake-native', 'libtool-native', 'autoconf-native', 'attr-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'attr', 'wayland-protocols', 'xkeyboard-config', 'libxcb', 'wayland', 'util-macros', 'zlib-native', 'libtirpc-native', 'util-linux-native', 'openssl-native', 'xz-native', 'gdbm-native', 'libnsl2-native', 'libffi-native', 'sqlite3-native
 ', 'bzip2-native', 'readline-native', 'python3-setuptools-native', 're2c-native', 'db-native', 'flex', 'cracklib', 'flex-native', 'gmp-native', 'mpfr-native', 'gnu-config-native', 'binutils-cross-i686', 'libmpc-native', 'expat-native', 'm4-native', 'xorgproto', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'libxau', 'expat', 'libxml2', 'libffi', 'libpcre2-native', 'ncurses-native', 'util-linux-libuuid-native', 'libcap-ng-native', 'cmake-native', 'python3', 'curl-native', 'sqlite3', 'libtirpc', 'libnsl2', 'gdbm', 'openssl', 'bzip2', 'readline']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dlink-udev-shared=false -Dnobody-user=nobody -Dnobody-group=nobody -Drootlibdir=/lib -Drootprefix= -Ddefault-locale=C -Dmode=release -Dsystem-alloc-uid-min=101 -Dsystem-uid-max=999 -Dsystem-alloc-gid-min=101 -Dsystem-gid-max=999 -Dkexec-path=/usr/sbin/kexec -Dkmod-path=/bin/kmod -Dmount-path=/bin/mount -Dquotacheck-path=/usr/sbin/quotacheck -Dquotaon-path=/usr/sbin/quotaon -Dsulogin-path=/sbin/sulogin -Dnologin-path=/sbin/nologin -Dumount-path=/bin/umount -Dacl=true -Daudit=false -Dbacklight=true -Dbinfmt=true -Dbzip2=false -Ddefault-hierarchy=hybrid -Dcoredump=false -Dlibcryptsetup=false -Ddbus=false -Defi=false -Delfutils=false -Dfirstboot=false -Dgcrypt=false -Dgnu-efi=false -Dgnutls=false -Dgshadow=true -Dhibernate=true -Dhostnamed=true -Didn=true -Dima=true -Dimportd=false -Dlibiptc=false -Dlibcurl=false -Dkmod=true -Dldconfig=true -Dlibidn=false -Dlibidn2=false -Dlocaled=true -Dlogind=true -Dlz4=false -Dmachined=true -Dman=false -Dmicrohttpd=false -Dnss
 -myhostname=true -Dnetworkd=true -Dnss-systemd=true -Dnss-mymachines=true -Dnss-resolve=true -Doomd=false -Dopenssl=false -Dpam=true -Dpcre2=false -Dpolkit=false -Dportabled=false -Dqrencode=false -Dquotacheck=true -Drandomseed=true -Dresolve=true -Drfkill=true -Dsplit-bin=true -Dseccomp=false -Dselinux=false -Dtime-epoch=1615570067 -Dsmack=false -Dsysusers=true -Dsysvinit-path=/etc/init.d -Dsysvrcnd-path=/etc -Dtimedated=true -Dtimesyncd=true -Duserdb=true -Dsplit-usr=true -Dutmp=true -Dvconsole=true -Dxdg-autostart=false -Dxkbcommon=true -Dxz=true -Dzlib=false...
| The Meson build system
| Version: 0.57.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build
| Build type: cross build
| Project name: systemd
| Project version: 247
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-79
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Program tools/add-git-hook.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/add-git-hook.sh)
| Message: Activated pre-commit hook
| Program tools/check-compilation.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/check-compilation.sh)
| Program tools/meson-build.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-build.sh)
| C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C++ linker for the build machine: g++ ld.bfd 2.30-79
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-result: YES
| Compiler for C supports arguments -Wno-format-signedness: YES
| Compiler for C supports arguments -Werror=undef: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wfloat-equal: YES
| Compiler for C supports arguments -Wsuggest-attribute=noreturn: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=format=2: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=5: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wendif-labels: YES
| Compiler for C supports arguments -Wstrict-aliasing=2: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Werror=overflow: YES
| Compiler for C supports arguments -Werror=shift-count-overflow: YES
| Compiler for C supports arguments -Werror=shift-overflow=2: YES
| Compiler for C supports arguments -Wdate-time: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wno-error=#warnings: NO
| Compiler for C supports arguments -Wno-string-plus-int: NO
| Compiler for C supports arguments -Wno-maybe-uninitialized: YES
| Compiler for C supports arguments -ffast-math: YES
| Compiler for C supports arguments -fno-common: YES
| Compiler for C supports arguments -fdiagnostics-show-option: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fstack-protector: YES
| Compiler for C supports arguments -fstack-protector-strong: YES
| Compiler for C supports arguments --param=ssp-buffer-size=4: YES
| Compiler for C supports arguments -ffunction-sections: YES
| Compiler for C supports arguments -fdata-sections: YES
| Compiler for C supports link arguments -Wl,-z,relro: YES
| Compiler for C supports link arguments -Wl,-z,now: YES
| Compiler for C supports link arguments -fstack-protector: YES
| Compiler for C supports link arguments -Wl,--gc-sections: YES
| Compiler for C supports arguments -Wzero-length-bounds: YES
| Checking if "-Werror=shadow with local shadowing" compiles: YES
| Compiler for C++ supports arguments -Wno-unused-parameter: YES
| Compiler for C++ supports arguments -Wno-missing-field-initializers: YES
| Compiler for C++ supports arguments -Wno-unused-result: YES
| Compiler for C++ supports arguments -Wno-format-signedness: YES
| Compiler for C supports arguments -Wstringop-truncation: YES
| Checking for size of "dev_t" : 8
| Checking for size of "ino_t" : 8
| Checking for size of "time_t" : 4
| Checking for size of "rlim_t" : 8
| Checking for size of "char16_t" : 2
| Checking for size of "char32_t" : 4
| Checking for size of "struct statx" : 256
| Checking for function "secure_getenv" : YES
| Checking for function "__secure_getenv" : NO
| Checking for function "memfd_create" : YES
| Checking for function "gettid" : YES
| Checking for function "pivot_root" : NO
| Checking for function "name_to_handle_at" : YES
| Checking for function "setns" : YES
| Checking for function "renameat2" : YES
| Checking for function "kcmp" : NO
| Checking for function "keyctl" : NO
| Checking for function "copy_file_range" : YES
| Checking for function "bpf" : NO
| Checking for function "statx" : YES
| Checking for function "explicit_bzero" : YES
| Checking for function "reallocarray" : YES
| Checking for function "set_mempolicy" : NO
| Checking for function "get_mempolicy" : NO
| Checking for function "pidfd_send_signal" : NO
| Checking for function "pidfd_open" : NO
| Checking for function "rt_sigqueueinfo" : NO
| Checking for function "mallinfo" : YES
| Checking for function "close_range" : NO
| Checking for function "getrandom" : YES
| Program sed found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sed)
| Program awk found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/awk)
| Program m4 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/m4)
| Program stat found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/stat)
| Program git found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/git)
| Program env found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/env)
| Program perl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/perl-native/perl)
| Program test/test-efi-create-disk.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-efi-create-disk.sh)
| Message: Using /usr/sbin/quotaon for quotaon
| Message: Using /usr/sbin/quotacheck for quotacheck
| Message: Using /bin/kmod for kmod
| Message: Using /usr/sbin/kexec for kexec
| Message: Using /sbin/sulogin for sulogin
| Message: Using /bin/mount for mount
| Message: Using /bin/umount for umount
| Program loadkeys /usr/sbin/loadkeys /sbin/loadkeys found: NO
| Program setfont /usr/sbin/setfont /sbin/setfont found: NO
| Message: Using /sbin/nologin for nologin
| Program gperf found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/gperf)
| Message: gperf len type is size_t
| Has header "sys/capability.h" : YES
| Has header "crypt.h" : YES
| Has header "linux/memfd.h" : YES
| Has header "linux/vm_sockets.h" : YES
| Has header "sys/auxv.h" : YES
| Has header "valgrind/memcheck.h" : NO
| Has header "valgrind/valgrind.h" : NO
| Run-time dependency threads found: YES
| Library rt found: YES
| Library m found: YES
| Library dl found: YES
| Library crypt found: YES
| Checking for function "crypt_ra" with dependency -lcrypt: YES
| Checking for function "crypt_preferred_method" with dependency -lcrypt: YES
| Checking for function "crypt_gensalt_ra" with dependency -lcrypt: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libcap found: YES 2.48
| Run-time dependency mount found: YES 2.36.2
| Run-time dependency fdisk found: YES 2.36.2
| Found CMake: NO
| Run-time dependency pwquality found: NO (tried pkgconfig and cmake)
| Run-time dependency libapparmor found: NO (tried pkgconfig and cmake)
| Library acl found: YES
| Run-time dependency blkid found: YES 2.36.2
| Run-time dependency libkmod found: YES 28
| Library pam found: YES
| Library pam_misc found: YES
| Run-time dependency p11-kit-1 found: NO (tried pkgconfig and cmake)
| Run-time dependency libfido2 found: NO (tried pkgconfig and cmake)
| Run-time dependency liblzma found: YES 5.2.5
| Run-time dependency libzstd found: NO (tried pkgconfig and cmake)
| Run-time dependency xkbcommon found: YES 1.0.3
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Run-time dependency gobject-2.0 found: NO (tried pkgconfig and cmake)
| Run-time dependency gio-2.0 found: NO (tried pkgconfig and cmake)
| Message: default-dnssec cannot be set to yes or allow-downgrade when gcrypt is disabled. Setting default-dnssec to no.
| Configuring config.h using configuration
| Program tools/meson-apply-m4.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-apply-m4.sh)
| Program tools/generate-gperfs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/generate-gperfs.py)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring libudev.pc using configuration
| Compiler for C supports arguments -std=iso9899:2017: YES
| Compiler for C++ supports arguments -std=c++14: YES
| Compiler for C++ supports arguments -std=c++17: YES
| Compiler for C++ supports arguments -std=c++20: YES
| Program generate-af-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-af-list.sh)
| Program generate-arphrd-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-arphrd-list.sh)
| Program generate-cap-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-cap-list.sh)
| Program generate-errno-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-errno-list.sh)
| Configuring libsystemd.pc using configuration
| Program generate-audit_type-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/journal/generate-audit_type-list.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring logind.conf using configuration
| Configuring 71-seat.rules using configuration
| Program tools/autosuspend-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/autosuspend-update.sh)
| Program tools/hwdb-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/hwdb-update.sh)
| Program tools/make-autosuspend-rules.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-autosuspend-rules.py)
| Program tools/make-directive-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-directive-index.py)
| Program tools/make-man-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-man-index.py)
| Program tools/syscall-names-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/syscall-names-update.sh)
| Program tools/xml_helper.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/xml_helper.py)
| Program tools/update-dbus-docs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/update-dbus-docs.py)
| Program generate-syscall-list.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-syscall-list.py)
| Program generate-ip-protocol-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-ip-protocol-list.sh)
| Configuring macros.systemd using configuration
| Configuring system.conf using configuration
| Configuring user.conf using configuration
| Configuring systemd.pc using configuration
| Configuring triggers.systemd using configuration
| Configuring org.freedesktop.systemd1.policy using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program generate-keyboard-keys-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-list.sh)
| Program generate-keyboard-keys-gperf.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-gperf.sh)
| Configuring udev.pc using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program test-repart.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/partition/test-repart.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program generate-dns_type-gperf.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/resolve/generate-dns_type-gperf.py)
| Configuring resolved.conf using configuration
| Configuring timesyncd.conf using configuration
| Configuring 90-vconsole.rules using configuration
| Program generate-sym-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/generate-sym-test.py)
| Program test-systemd-tmpfiles.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/test-systemd-tmpfiles.py)
| Configuring 50-udev-default.rules using configuration
| Configuring 64-btrfs.rules using configuration
| Configuring 99-systemd.rules using configuration
| Program test-network-generator-conversion.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-network-generator-conversion.sh)
| Configuring test-sysusers.sh using configuration
| Program rule-syntax-check.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/rule-syntax-check.py)
| Program sysv-generator-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sysv-generator-test.py)
| Program sys-script.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sys-script.py)
| Program udev-test.pl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/udev-test.pl)
| Program hwdb-test.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/hwdb-test.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
| Program test-sysusers.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/test/test-sysusers.sh)
| Message: Not compiling test-coredump-vacuum because ENABLE_COREDUMP is not true
| Message: Not compiling test-qcow2 because HAVE_ZLIB is not true
| Message: test-patch-uid is a manual test
| Message: test-dnssec-complex is a manual test
| Message: test-ns is a manual test
| Message: test-nscd-flush is a manual test
| Message: test-hostname is an unsafe test
| Message: Not compiling test-boot-timestamps because ENABLE_EFI is not true
| Message: Not compiling test-seccomp because HAVE_SECCOMP is not true
| Message: test-ask-password-api is a manual test
| Message: test-ipcrm is an unsafe test
| Message: test-btrfs is a manual test
| Message: Not compiling test-firewall-util because HAVE_LIBIPTC is not true
| Message: test-netlink-manual is a manual test
| Message: test-chase-symlinks is a manual test
| Message: test-install is a manual test
| Message: test-udev is a manual test
| Message: Not compiling test-gcrypt-util because HAVE_GCRYPT is not true
| Message: test-nss is a manual test
| Message: test-bus-benchmark is a manual test
| Message: test-ipv4ll-manual is a manual test
| Message: test-acd is a manual test
| Message: test-inhibit is a manual test
| Program true found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/true)
| Checking for size of "long" : 4
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring basic.conf using configuration
| Message: Not installing tmpfiles.d/portables.conf because ENABLE_PORTABLED is 0
| Configuring static-nodes-permissions.conf using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program parse_hwdb.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/hwdb.d/parse_hwdb.py)
| Configuring debug-shell.service.tmp using configuration
| Configuring emergency.service.tmp using configuration
| Configuring kmod-static-nodes.service.tmp using configuration
| Program meson-add-wants.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/units/meson-add-wants.sh)
| Configuring quotaon.service.tmp using configuration
| Configuring rc-local.service.tmp using configuration
| Configuring rescue.service.tmp using configuration
| Configuring systemd-backlight@.service.tmp using configuration
| Configuring systemd-binfmt.service.tmp using configuration
| Configuring systemd-bless-boot.service.tmp using configuration
| Configuring systemd-boot-check-no-failures.service.tmp using configuration
| Configuring systemd-coredump@.service.tmp using configuration
| Configuring systemd-pstore.service.tmp using configuration
| Configuring systemd-fsck-root.service.tmp using configuration
| Configuring systemd-fsck@.service.tmp using configuration
| Configuring systemd-hibernate-resume@.service.tmp using configuration
| Configuring systemd-hibernate.service.tmp using configuration
| Configuring systemd-hybrid-sleep.service.tmp using configuration
| Configuring systemd-suspend-then-hibernate.service.tmp using configuration
| Configuring systemd-hostnamed.service.tmp using configuration
| Configuring systemd-hwdb-update.service.tmp using configuration
| Configuring systemd-importd.service.tmp using configuration
| Configuring systemd-initctl.service.tmp using configuration
| Configuring systemd-journal-gatewayd.service.tmp using configuration
| Configuring systemd-journal-remote.service.tmp using configuration
| Configuring systemd-journal-upload.service.tmp using configuration
| Configuring systemd-journald.service.tmp using configuration
| Configuring systemd-journald@.service.tmp using configuration
| Configuring systemd-localed.service.tmp using configuration
| Configuring systemd-logind.service.tmp using configuration
| Configuring systemd-machined.service.tmp using configuration
| Configuring systemd-modules-load.service.tmp using configuration
| Configuring systemd-network-generator.service.tmp using configuration
| Configuring systemd-networkd.service.tmp using configuration
| Configuring systemd-networkd-wait-online.service.tmp using configuration
| Configuring systemd-nspawn@.service.tmp using configuration
| Configuring systemd-oomd.service.tmp using configuration
| Configuring systemd-portabled.service.tmp using configuration
| Configuring systemd-userdbd.service.tmp using configuration
| Configuring systemd-homed.service.tmp using configuration
| Configuring systemd-quotacheck.service.tmp using configuration
| Configuring systemd-random-seed.service.tmp using configuration
| Configuring systemd-remount-fs.service.tmp using configuration
| Configuring systemd-resolved.service.tmp using configuration
| Configuring systemd-rfkill.service.tmp using configuration
| Configuring systemd-suspend.service.tmp using configuration
| Configuring systemd-sysctl.service.tmp using configuration
| Configuring systemd-timedated.service.tmp using configuration
| Configuring systemd-timesyncd.service.tmp using configuration
| Configuring systemd-time-wait-sync.service.tmp using configuration
| Configuring systemd-udevd.service.tmp using configuration
| Configuring systemd-update-done.service.tmp using configuration
| Configuring systemd-update-utmp-runlevel.service.tmp using configuration
| Configuring systemd-update-utmp.service.tmp using configuration
| Configuring systemd-user-sessions.service.tmp using configuration
| Configuring systemd-vconsole-setup.service.tmp using configuration
| Configuring systemd-volatile-root.service.tmp using configuration
| Configuring systemd-repart.service.tmp using configuration
| Configuring user-runtime-dir@.service.tmp using configuration
| Configuring user@.service.tmp using configuration
| Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program xsltproc found: NO
| Configuring custom-entities.ent using configuration
| Message: python-lxml not available, not making man page indices
| Program rsync found: NO
| 
| ../git/man/meson.build:187:0: ERROR: Program 'rsync' not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 190
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065' failed with exit code 1:
| The Meson build system
| Version: 0.57.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build
| Build type: cross build
| Project name: systemd
| Project version: 247
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-79
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Program tools/add-git-hook.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/add-git-hook.sh)
| Message: Activated pre-commit hook
| Program tools/check-compilation.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/check-compilation.sh)
| Program tools/meson-build.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-build.sh)
| C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C++ linker for the build machine: g++ ld.bfd 2.30-79
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-result: YES
| Compiler for C supports arguments -Wno-format-signedness: YES
| Compiler for C supports arguments -Werror=undef: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wfloat-equal: YES
| Compiler for C supports arguments -Wsuggest-attribute=noreturn: YES
| Compiler for C supports arguments -Werror=missing-prototypes: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Werror=missing-declarations: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=incompatible-pointer-types: YES
| Compiler for C supports arguments -Werror=format=2: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=5: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wendif-labels: YES
| Compiler for C supports arguments -Wstrict-aliasing=2: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Werror=overflow: YES
| Compiler for C supports arguments -Werror=shift-count-overflow: YES
| Compiler for C supports arguments -Werror=shift-overflow=2: YES
| Compiler for C supports arguments -Wdate-time: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wno-error=#warnings: NO
| Compiler for C supports arguments -Wno-string-plus-int: NO
| Compiler for C supports arguments -Wno-maybe-uninitialized: YES
| Compiler for C supports arguments -ffast-math: YES
| Compiler for C supports arguments -fno-common: YES
| Compiler for C supports arguments -fdiagnostics-show-option: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fstack-protector: YES
| Compiler for C supports arguments -fstack-protector-strong: YES
| Compiler for C supports arguments --param=ssp-buffer-size=4: YES
| Compiler for C supports arguments -ffunction-sections: YES
| Compiler for C supports arguments -fdata-sections: YES
| Compiler for C supports link arguments -Wl,-z,relro: YES
| Compiler for C supports link arguments -Wl,-z,now: YES
| Compiler for C supports link arguments -fstack-protector: YES
| Compiler for C supports link arguments -Wl,--gc-sections: YES
| Compiler for C supports arguments -Wzero-length-bounds: YES
| Checking if "-Werror=shadow with local shadowing" compiles: YES
| Compiler for C++ supports arguments -Wno-unused-parameter: YES
| Compiler for C++ supports arguments -Wno-missing-field-initializers: YES
| Compiler for C++ supports arguments -Wno-unused-result: YES
| Compiler for C++ supports arguments -Wno-format-signedness: YES
| Compiler for C supports arguments -Wstringop-truncation: YES
| Checking for size of "dev_t" : 8
| Checking for size of "ino_t" : 8
| Checking for size of "time_t" : 4
| Checking for size of "rlim_t" : 8
| Checking for size of "char16_t" : 2
| Checking for size of "char32_t" : 4
| Checking for size of "struct statx" : 256
| Checking for function "secure_getenv" : YES
| Checking for function "__secure_getenv" : NO
| Checking for function "memfd_create" : YES
| Checking for function "gettid" : YES
| Checking for function "pivot_root" : NO
| Checking for function "name_to_handle_at" : YES
| Checking for function "setns" : YES
| Checking for function "renameat2" : YES
| Checking for function "kcmp" : NO
| Checking for function "keyctl" : NO
| Checking for function "copy_file_range" : YES
| Checking for function "bpf" : NO
| Checking for function "statx" : YES
| Checking for function "explicit_bzero" : YES
| Checking for function "reallocarray" : YES
| Checking for function "set_mempolicy" : NO
| Checking for function "get_mempolicy" : NO
| Checking for function "pidfd_send_signal" : NO
| Checking for function "pidfd_open" : NO
| Checking for function "rt_sigqueueinfo" : NO
| Checking for function "mallinfo" : YES
| Checking for function "close_range" : NO
| Checking for function "getrandom" : YES
| Program sed found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sed)
| Program awk found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/awk)
| Program m4 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/m4)
| Program stat found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/stat)
| Program git found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/git)
| Program env found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/env)
| Program perl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/perl-native/perl)
| Program test/test-efi-create-disk.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-efi-create-disk.sh)
| Message: Using /usr/sbin/quotaon for quotaon
| Message: Using /usr/sbin/quotacheck for quotacheck
| Message: Using /bin/kmod for kmod
| Message: Using /usr/sbin/kexec for kexec
| Message: Using /sbin/sulogin for sulogin
| Message: Using /bin/mount for mount
| Message: Using /bin/umount for umount
| Program loadkeys /usr/sbin/loadkeys /sbin/loadkeys found: NO
| Program setfont /usr/sbin/setfont /sbin/setfont found: NO
| Message: Using /sbin/nologin for nologin
| Program gperf found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/gperf)
| Message: gperf len type is size_t
| Has header "sys/capability.h" : YES
| Has header "crypt.h" : YES
| Has header "linux/memfd.h" : YES
| Has header "linux/vm_sockets.h" : YES
| Has header "sys/auxv.h" : YES
| Has header "valgrind/memcheck.h" : NO
| Has header "valgrind/valgrind.h" : NO
| Run-time dependency threads found: YES
| Library rt found: YES
| Library m found: YES
| Library dl found: YES
| Library crypt found: YES
| Checking for function "crypt_ra" with dependency -lcrypt: YES
| Checking for function "crypt_preferred_method" with dependency -lcrypt: YES
| Checking for function "crypt_gensalt_ra" with dependency -lcrypt: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libcap found: YES 2.48
| Run-time dependency mount found: YES 2.36.2
| Run-time dependency fdisk found: YES 2.36.2
| Found CMake: NO
| Run-time dependency pwquality found: NO (tried pkgconfig and cmake)
| Run-time dependency libapparmor found: NO (tried pkgconfig and cmake)
| Library acl found: YES
| Run-time dependency blkid found: YES 2.36.2
| Run-time dependency libkmod found: YES 28
| Library pam found: YES
| Library pam_misc found: YES
| Run-time dependency p11-kit-1 found: NO (tried pkgconfig and cmake)
| Run-time dependency libfido2 found: NO (tried pkgconfig and cmake)
| Run-time dependency liblzma found: YES 5.2.5
| Run-time dependency libzstd found: NO (tried pkgconfig and cmake)
| Run-time dependency xkbcommon found: YES 1.0.3
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Run-time dependency gobject-2.0 found: NO (tried pkgconfig and cmake)
| Run-time dependency gio-2.0 found: NO (tried pkgconfig and cmake)
| Message: default-dnssec cannot be set to yes or allow-downgrade when gcrypt is disabled. Setting default-dnssec to no.
| Configuring config.h using configuration
| Program tools/meson-apply-m4.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-apply-m4.sh)
| Program tools/generate-gperfs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/generate-gperfs.py)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring libudev.pc using configuration
| Compiler for C supports arguments -std=iso9899:2017: YES
| Compiler for C++ supports arguments -std=c++14: YES
| Compiler for C++ supports arguments -std=c++17: YES
| Compiler for C++ supports arguments -std=c++20: YES
| Program generate-af-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-af-list.sh)
| Program generate-arphrd-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-arphrd-list.sh)
| Program generate-cap-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-cap-list.sh)
| Program generate-errno-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/basic/generate-errno-list.sh)
| Configuring libsystemd.pc using configuration
| Program generate-audit_type-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/journal/generate-audit_type-list.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring logind.conf using configuration
| Configuring 71-seat.rules using configuration
| Program tools/autosuspend-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/autosuspend-update.sh)
| Program tools/hwdb-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/hwdb-update.sh)
| Program tools/make-autosuspend-rules.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-autosuspend-rules.py)
| Program tools/make-directive-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-directive-index.py)
| Program tools/make-man-index.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/make-man-index.py)
| Program tools/syscall-names-update.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/syscall-names-update.sh)
| Program tools/xml_helper.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/xml_helper.py)
| Program tools/update-dbus-docs.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/update-dbus-docs.py)
| Program generate-syscall-list.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-syscall-list.py)
| Program generate-ip-protocol-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/shared/generate-ip-protocol-list.sh)
| Configuring macros.systemd using configuration
| Configuring system.conf using configuration
| Configuring user.conf using configuration
| Configuring systemd.pc using configuration
| Configuring triggers.systemd using configuration
| Configuring org.freedesktop.systemd1.policy using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program generate-keyboard-keys-list.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-list.sh)
| Program generate-keyboard-keys-gperf.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/udev/generate-keyboard-keys-gperf.sh)
| Configuring udev.pc using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program test-repart.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/partition/test-repart.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program generate-dns_type-gperf.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/resolve/generate-dns_type-gperf.py)
| Configuring resolved.conf using configuration
| Configuring timesyncd.conf using configuration
| Configuring 90-vconsole.rules using configuration
| Program generate-sym-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/generate-sym-test.py)
| Program test-systemd-tmpfiles.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/src/test/test-systemd-tmpfiles.py)
| Configuring 50-udev-default.rules using configuration
| Configuring 64-btrfs.rules using configuration
| Configuring 99-systemd.rules using configuration
| Program test-network-generator-conversion.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/test-network-generator-conversion.sh)
| Configuring test-sysusers.sh using configuration
| Program rule-syntax-check.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/rule-syntax-check.py)
| Program sysv-generator-test.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sysv-generator-test.py)
| Program sys-script.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/sys-script.py)
| Program udev-test.pl found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/udev-test.pl)
| Program hwdb-test.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/test/hwdb-test.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
| Program test-sysusers.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/test/test-sysusers.sh)
| Message: Not compiling test-coredump-vacuum because ENABLE_COREDUMP is not true
| Message: Not compiling test-qcow2 because HAVE_ZLIB is not true
| Message: test-patch-uid is a manual test
| Message: test-dnssec-complex is a manual test
| Message: test-ns is a manual test
| Message: test-nscd-flush is a manual test
| Message: test-hostname is an unsafe test
| Message: Not compiling test-boot-timestamps because ENABLE_EFI is not true
| Message: Not compiling test-seccomp because HAVE_SECCOMP is not true
| Message: test-ask-password-api is a manual test
| Message: test-ipcrm is an unsafe test
| Message: test-btrfs is a manual test
| Message: Not compiling test-firewall-util because HAVE_LIBIPTC is not true
| Message: test-netlink-manual is a manual test
| Message: test-chase-symlinks is a manual test
| Message: test-install is a manual test
| Message: test-udev is a manual test
| Message: Not compiling test-gcrypt-util because HAVE_GCRYPT is not true
| Message: test-nss is a manual test
| Message: test-bus-benchmark is a manual test
| Message: test-ipv4ll-manual is a manual test
| Message: test-acd is a manual test
| Message: test-inhibit is a manual test
| Program true found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/true)
| Checking for size of "long" : 4
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Configuring basic.conf using configuration
| Message: Not installing tmpfiles.d/portables.conf because ENABLE_PORTABLED is 0
| Configuring static-nodes-permissions.conf using configuration
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program parse_hwdb.py found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/hwdb.d/parse_hwdb.py)
| Configuring debug-shell.service.tmp using configuration
| Configuring emergency.service.tmp using configuration
| Configuring kmod-static-nodes.service.tmp using configuration
| Program meson-add-wants.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/units/meson-add-wants.sh)
| Configuring quotaon.service.tmp using configuration
| Configuring rc-local.service.tmp using configuration
| Configuring rescue.service.tmp using configuration
| Configuring systemd-backlight@.service.tmp using configuration
| Configuring systemd-binfmt.service.tmp using configuration
| Configuring systemd-bless-boot.service.tmp using configuration
| Configuring systemd-boot-check-no-failures.service.tmp using configuration
| Configuring systemd-coredump@.service.tmp using configuration
| Configuring systemd-pstore.service.tmp using configuration
| Configuring systemd-fsck-root.service.tmp using configuration
| Configuring systemd-fsck@.service.tmp using configuration
| Configuring systemd-hibernate-resume@.service.tmp using configuration
| Configuring systemd-hibernate.service.tmp using configuration
| Configuring systemd-hybrid-sleep.service.tmp using configuration
| Configuring systemd-suspend-then-hibernate.service.tmp using configuration
| Configuring systemd-hostnamed.service.tmp using configuration
| Configuring systemd-hwdb-update.service.tmp using configuration
| Configuring systemd-importd.service.tmp using configuration
| Configuring systemd-initctl.service.tmp using configuration
| Configuring systemd-journal-gatewayd.service.tmp using configuration
| Configuring systemd-journal-remote.service.tmp using configuration
| Configuring systemd-journal-upload.service.tmp using configuration
| Configuring systemd-journald.service.tmp using configuration
| Configuring systemd-journald@.service.tmp using configuration
| Configuring systemd-localed.service.tmp using configuration
| Configuring systemd-logind.service.tmp using configuration
| Configuring systemd-machined.service.tmp using configuration
| Configuring systemd-modules-load.service.tmp using configuration
| Configuring systemd-network-generator.service.tmp using configuration
| Configuring systemd-networkd.service.tmp using configuration
| Configuring systemd-networkd-wait-online.service.tmp using configuration
| Configuring systemd-nspawn@.service.tmp using configuration
| Configuring systemd-oomd.service.tmp using configuration
| Configuring systemd-portabled.service.tmp using configuration
| Configuring systemd-userdbd.service.tmp using configuration
| Configuring systemd-homed.service.tmp using configuration
| Configuring systemd-quotacheck.service.tmp using configuration
| Configuring systemd-random-seed.service.tmp using configuration
| Configuring systemd-remount-fs.service.tmp using configuration
| Configuring systemd-resolved.service.tmp using configuration
| Configuring systemd-rfkill.service.tmp using configuration
| Configuring systemd-suspend.service.tmp using configuration
| Configuring systemd-sysctl.service.tmp using configuration
| Configuring systemd-timedated.service.tmp using configuration
| Configuring systemd-timesyncd.service.tmp using configuration
| Configuring systemd-time-wait-sync.service.tmp using configuration
| Configuring systemd-udevd.service.tmp using configuration
| Configuring systemd-update-done.service.tmp using configuration
| Configuring systemd-update-utmp-runlevel.service.tmp using configuration
| Configuring systemd-update-utmp.service.tmp using configuration
| Configuring systemd-user-sessions.service.tmp using configuration
| Configuring systemd-vconsole-setup.service.tmp using configuration
| Configuring systemd-volatile-root.service.tmp using configuration
| Configuring systemd-repart.service.tmp using configuration
| Configuring user-runtime-dir@.service.tmp using configuration
| Configuring user@.service.tmp using configuration
| Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/git/tools/meson-make-symlink.sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program sh found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/sh)
| Program xsltproc found: NO
| Configuring custom-entities.ent using configuration
| Message: python-lxml not available, not making man page indices
| Program rsync found: NO
| 
| ../git/man/meson.build:187:0: ERROR: Program 'rsync' not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 177
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/systemd/1_247.4-r0/temp/run.do_configure.2899065, line 190
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 160
| 	#3: do_configure, autogenerated, line 2
NOTE: recipe systemd-1_247.4-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_configure) failed with exit code '1'
NOTE: recipe shared-mime-info-native-2.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2087 tasks of which 1949 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4447532086311709626==--
