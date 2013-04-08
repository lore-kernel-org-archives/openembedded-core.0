Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1UPBO3-00082I-0v
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 14:41:27 +0200
Received: from sangmingze-mail.local (91-65-247-145-dynip.superkabel.de
	[91.65.247.145])
	by mail.sysmocom.de (Postfix) with ESMTPSA id B00C72543409;
	Mon,  8 Apr 2013 12:25:32 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1UPB7J-0001Cu-6i; Mon, 08 Apr 2013 14:24:09 +0200
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 14:23:39 +0200
Message-Id: <1365423819-4549-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <32F909C0-00C8-4E10-9A11-11003C80FE1B@dominion.thruhere.net>
References: <32F909C0-00C8-4E10-9A11-11003C80FE1B@dominion.thruhere.net>
Cc: Holger Hans Peter Freyther <zecke@selfish.org>
Subject: [PATCH] systemd: Set the default firmware path to enable firmware loading in udev
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
X-List-Received-Date: Mon, 08 Apr 2013 12:41:32 -0000

From: Holger Hans Peter Freyther <zecke@selfish.org>

After some breakage in udev the kernel gained direct firmware loading.
For older kernels (e.g. 3.2 in my case) udev still needs to load the
firmware. Firmware loading is enabled once a default firmware path is
set. Apply a compile fix from the upstream project.
---
 .../systemd/systemd/199-firmware.patch             |   98 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_199.bb           |    3 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch

diff --git a/meta/recipes-core/systemd/systemd/199-firmware.patch b/meta/recipes-core/systemd/systemd/199-firmware.patch
new file mode 100644
index 0000000..aaab59b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/199-firmware.patch
@@ -0,0 +1,98 @@
+Upstream-Status: Backport
+http://cgit.freedesktop.org/systemd/systemd/patch/?id=d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff
+
+From d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 2001
+From: Kay Sievers <kay@vrfy.org>
+Date: Thu, 28 Mar 2013 14:28:10 +0000
+Subject: build-sys: fix HAVE/ENABLE_FIRMWARE
+
+https://bugs.freedesktop.org/show_bug.cgi?id=62864
+---
+diff --git a/configure.ac b/configure.ac
+index 5b88bcf..e73cd5c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -728,6 +728,7 @@ for i in $with_firmware_path; do
+ done
+ IFS=$OLD_IFS
+ AC_SUBST(FIRMWARE_PATH)
++AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
+ AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
+ 
+ # ------------------------------------------------------------------------------
+@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],
+        [], [enable_gudev=yes])
+ AS_IF([test "x$enable_gudev" = "xyes"], [ PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0 gio-2.0]) ])
+ AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" = "xyes"])
+-
+ AS_IF([test "x$enable_gudev" = "xyes"], [ AC_DEFINE(HAVE_GLIB, 1, [Define if glib is available]) ])
+ 
+ # ------------------------------------------------------------------------------
+diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
+index 13922d3..c7d4319 100644
+--- a/src/udev/udev-builtin.c
++++ b/src/udev/udev-builtin.c
+@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] = {
+         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
+ #endif
+         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+         [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
+ #endif
+         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
+diff --git a/src/udev/udev.h b/src/udev/udev.h
+index aa2edbe..906dfba 100644
+--- a/src/udev/udev.h
++++ b/src/udev/udev.h
+@@ -140,7 +140,7 @@ enum udev_builtin_cmd {
+         UDEV_BUILTIN_BLKID,
+ #endif
+         UDEV_BUILTIN_BTRFS,
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+         UDEV_BUILTIN_FIRMWARE,
+ #endif
+         UDEV_BUILTIN_HWDB,
+@@ -169,7 +169,7 @@ struct udev_builtin {
+ extern const struct udev_builtin udev_builtin_blkid;
+ #endif
+ extern const struct udev_builtin udev_builtin_btrfs;
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+ extern const struct udev_builtin udev_builtin_firmware;
+ #endif
+ extern const struct udev_builtin udev_builtin_hwdb;
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c
+index b30bedf..2ad7388 100644
+--- a/src/udev/udevd.c
++++ b/src/udev/udevd.c
+@@ -98,7 +98,7 @@ struct event {
+         dev_t devnum;
+         int ifindex;
+         bool is_block;
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+         bool nodelay;
+ #endif
+ };
+@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *dev)
+         event->devnum = udev_device_get_devnum(dev);
+         event->is_block = streq("block", udev_device_get_subsystem(dev));
+         event->ifindex = udev_device_get_ifindex(dev);
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+         if (streq(udev_device_get_subsystem(dev), "firmware"))
+                 event->nodelay = true;
+ #endif
+@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)
+                         return true;
+                 }
+ 
+-#ifdef ENABLE_FIRMWARE
++#ifdef HAVE_FIRMWARE
+                 /* allow to bypass the dependency tracking */
+                 if (event->nodelay)
+                         continue;
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index e574548..2464b83 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
+PR = "r2"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -26,6 +27,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0002-readahead-chunk-on-spinning-media.patch \
            file://0003-readahead-cleanups.patch \
            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
+           file://199-firmware.patch \
            file://init \
           "
 SRC_URI[md5sum] = "4bb13f84ce211e93f0141774a90a2322"
@@ -67,6 +69,7 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-microhttpd \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
+                 --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
                "
 # uclibc does not have NSS
-- 
1.7.10.4



