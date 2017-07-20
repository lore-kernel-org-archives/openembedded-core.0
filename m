Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67866781FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 09:52:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t3so1908174wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kf8tp3SyPoyiN3Ujd/cAXy0FX04D/QBnKWhWLKNMIvc=;
	b=noGjqVVqp0WrGxLm3wsbuRy3QrBkeb62GmAn7/SSWBy4TuuXEwBNh6BfmuCJj8uVCl
	vZFx6s3Ah8M/H7DHw9TBkpN8PxoK3BAJuujFEbjEec74sYvSaaJhJNAsAnla5+1gSMox
	+8xLyCpKV2D8EGi1YqlX25l8XIh02vUmrNGd+Qng5tvo3JM6fFZdSE6jgrBgbp7AFFLs
	j1bp7MABE0giqrttlH1JWtRJRbcDqOL2MoZwiCNRKce9doHggLzTvN7oC4h9UGo/pAid
	SBXWBq4WJ+njkTrGkx4pTJhEavxnjtxLmHixnyd93H5p6fu5kfZSML/cj3wTRQtBxVLS
	V2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kf8tp3SyPoyiN3Ujd/cAXy0FX04D/QBnKWhWLKNMIvc=;
	b=AyAz3v7sT0grjeCGH6aKyq3jCc9Ojcu2DrgzsInaElRVcdiBRAIWhVRcojeniU17Mi
	tdysYxjKgKDhvMiv63a3DFfEl24AXNQ4cKZ8VNqy3X+zsE+nvwUnFZKmxUqeITrP5w5Y
	PN2ebKl8L9Xi6GKaiRC1AoRe1G9B7SpSB1BrwKf6FvticKDDEketaF9oz88NBG1W8S3P
	ECILmBXjZAQ2TE+PTlVm0c6hCAuwGbavCIX+j5TZBN4BnJgxcQVuPvdxZJO1bCh3TP3V
	I9UL7QdFenXks1g2CbGV6M4lLCNADUcPm+JY5W3Opk6IixpDaKG/fZThjD3uj+4Kpjnh
	buFQ==
X-Gm-Message-State: AIVw112tyEoHZAc4/uzPmtupLWLX/VxzjMqmogqQgdtKVlvmw0jKhUoV
	GdVzTub5cVhXVUs+
X-Received: by 10.80.164.72 with SMTP id v8mr2378866edb.49.1500544363059;
	Thu, 20 Jul 2017 02:52:43 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124]) by smtp.gmail.com with ESMTPSA id
	e28sm1409199ede.14.2017.07.20.02.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 02:52:42 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 11:52:25 +0200
Message-Id: <1500544345-7341-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Thu, 20 Jul 2017 09:52:43 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Quite a few such compiling issues were found when I was building with
following configs:
...
MACHINE = "beaglebone"
TCLIBC = "musl"
DISTRO_FEATURES_append = " ld-is-gold"
...

There is already a workaround fixed a same issue but only for libunwind:
commit 482733bae05bdc7b149e515fb209c3266f459a53:
[ libunwind: fix build by linking with bfd instead of gold ]

it also works for other recipes per test, so make a bfd-binding-now
bbclass letting all recipes having this issue to inherit it.

[YOCTO #11679]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/bfd-binding-now.bbclass                | 4 ++++
 meta/recipes-connectivity/connman/connman.inc       | 2 +-
 meta/recipes-core/coreutils/coreutils_8.27.bb       | 2 +-
 meta/recipes-core/gettext/gettext_0.19.8.1.bb       | 2 +-
 meta/recipes-core/glib-2.0/glib.inc                 | 2 +-
 meta/recipes-core/udev/eudev_3.2.1.bb               | 2 +-
 meta/recipes-core/util-linux/util-linux.inc         | 2 +-
 meta/recipes-devtools/m4/m4.inc                     | 2 +-
 meta/recipes-extended/diffutils/diffutils.inc       | 2 +-
 meta/recipes-extended/grep/grep_3.1.bb              | 2 +-
 meta/recipes-extended/iptables/iptables_1.6.1.bb    | 2 +-
 meta/recipes-extended/procps/procps_3.3.12.bb       | 2 +-
 meta/recipes-extended/xz/xz_5.2.3.bb                | 2 +-
 meta/recipes-graphics/wayland/libinput_1.7.3.bb     | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 meta/recipes-kernel/kmod/kmod.inc                   | 2 +-
 meta/recipes-support/libevdev/libevdev_1.5.7.bb     | 2 +-
 meta/recipes-support/libunwind/libunwind.inc        | 2 +-
 meta/recipes-support/libunwind/libunwind_1.2.bb     | 2 --
 19 files changed, 21 insertions(+), 19 deletions(-)
 create mode 100644 meta/classes/bfd-binding-now.bbclass

diff --git a/meta/classes/bfd-binding-now.bbclass b/meta/classes/bfd-binding-now.bbclass
new file mode 100644
index 0000000..6c2667d
--- /dev/null
+++ b/meta/classes/bfd-binding-now.bbclass
@@ -0,0 +1,4 @@
+# Workaround for some ARCHs do not support bfd lazy binding well
+# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
+
+TARGET_LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -Wl,-z,relro,-z,now -fuse-ld=bfd ', '', d)}"
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6c8f405..dca894f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
-inherit autotools pkgconfig systemd update-rc.d bluetooth update-alternatives
+inherit autotools pkgconfig systemd update-rc.d bluetooth update-alternatives bfd-binding-now
 
 DEPENDS  = "dbus glib-2.0 ppp readline"
 
diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
index ea8740a..6412324 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo bfd-binding-now
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            http://distfiles.gentoo.org/distfiles/${BP}-man.tar.xz;name=manpages \
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index c2059e6..3e8e46d 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
 
-inherit autotools texinfo
+inherit autotools texinfo bfd-binding-now
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 4a145ae..eee9d84 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -26,7 +26,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache python3native manpages
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache python3native manpages bfd-binding-now
 
 S = "${WORKDIR}/glib-${PV}"
 
diff --git a/meta/recipes-core/udev/eudev_3.2.1.bb b/meta/recipes-core/udev/eudev_3.2.1.bb
index bdfb544..1a94c9f 100644
--- a/meta/recipes-core/udev/eudev_3.2.1.bb
+++ b/meta/recipes-core/udev/eudev_3.2.1.bb
@@ -26,7 +26,7 @@ UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 SRC_URI[md5sum] = "a2aae16bc432eac0e71c1267c384e295"
 SRC_URI[sha256sum] = "88f530c1540750e6daa91b5eaeebf88e761e6f0c86515c1c28eedfd871f027c6"
 
-inherit autotools update-rc.d qemu pkgconfig
+inherit autotools update-rc.d qemu pkgconfig bfd-binding-now
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 47c2839..ce2f58b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext pkgconfig systemd update-alternatives python3-dir bash-completion ptest bfd-binding-now
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index 75d8bbe..236a01e 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro process
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 
-inherit autotools texinfo
+inherit autotools texinfo bfd-binding-now
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index c81348b..34c61e1 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -4,7 +4,7 @@ sdiff, and cmp utilities. These programs are usually \
 used for creating patch files."
 SECTION = "base"
 
-inherit autotools texinfo update-alternatives gettext
+inherit autotools texinfo update-alternatives gettext bfd-binding-now
 
 ALTERNATIVE_${PN} = "diff cmp"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/grep/grep_3.1.bb b/meta/recipes-extended/grep/grep_3.1.bb
index 05b6b93..9cb2361 100644
--- a/meta/recipes-extended/grep/grep_3.1.bb
+++ b/meta/recipes-extended/grep/grep_3.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
 SRC_URI[md5sum] = "feca7b3e7c7f4aab2b42ecbfc513b070"
 SRC_URI[sha256sum] = "db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e"
 
-inherit autotools gettext texinfo pkgconfig
+inherit autotools gettext texinfo pkgconfig bfd-binding-now
 
 EXTRA_OECONF = "--disable-perl-regexp"
 
diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index b37c55a..46d80eb 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
 SRC_URI[sha256sum] = "0fc2d7bd5d7be11311726466789d4c65fb4c8e096c9182b56ce97440864f0cf5"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bfd-binding-now
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                "
diff --git a/meta/recipes-extended/procps/procps_3.3.12.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
index adabd75..447065f 100644
--- a/meta/recipes-extended/procps/procps_3.3.12.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "ncurses"
 
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives bfd-binding-now
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
diff --git a/meta/recipes-extended/xz/xz_5.2.3.bb b/meta/recipes-extended/xz/xz_5.2.3.bb
index c0f8b82..f8bcb4a 100644
--- a/meta/recipes-extended/xz/xz_5.2.3.bb
+++ b/meta/recipes-extended/xz/xz_5.2.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "ef68674fb47a8b8e741b34e429d86e9d"
 SRC_URI[sha256sum] = "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb"
 
-inherit autotools gettext
+inherit autotools gettext bfd-binding-now
 
 PACKAGES =+ "liblzma"
 
diff --git a/meta/recipes-graphics/wayland/libinput_1.7.3.bb b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
index 6194fba..bc45a12 100644
--- a/meta/recipes-graphics/wayland/libinput_1.7.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
 SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff3729e6233511ab373808644cc2dd5affcb1d"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bfd-binding-now
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 1650c79..e80e8aa 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -21,7 +21,7 @@ SRC_URI += "file://macro_tweak.patch"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bfd-binding-now
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 7fb10b5..8b4d233 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -12,7 +12,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
-inherit autotools gtk-doc pkgconfig manpages
+inherit autotools gtk-doc pkgconfig manpages bfd-binding-now
 
 SRCREV = "ef4257b59c4307b8c627d89f3c7f1feedb32582f"
 # Lookout for PV bump too when SRCREV is changed
diff --git a/meta/recipes-support/libevdev/libevdev_1.5.7.bb b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
index f740da2..fbf1446 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
@@ -11,4 +11,4 @@ SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
 SRC_URI[sha256sum] = "a1e59e37a2f0d397ffd7e83b73af0e638db83b8dd08902ef0f651a21cc1dd422"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bfd-binding-now
diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index fc33786..1c41b5f 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=3;md5=3fced11d6df719b47505837a51c16ae5"
 DEPENDS += "libatomic-ops"
 
-inherit autotools
+inherit autotools bfd-binding-now
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
diff --git a/meta/recipes-support/libunwind/libunwind_1.2.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
index c6312f2..cdfe305 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -20,5 +20,3 @@ EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
 # http://errors.yoctoproject.org/Errors/Details/20487/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-
-LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.7.4


