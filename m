Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.34688.1606138113384179258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 05:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oGHTT6ku;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l1so18566491wrb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a/oB8l/a4qMXX2zH7m/+aHG2zItJDDGYZKhhwyo3mfU=;
        b=oGHTT6kuFJ+AtP9sLjHXimdo72YTcTbvC7XGOu2ubUbGeEZbCv8mkIFrMVB0DMMGpw
         dEbtJ7ToKV3UjQTk7S2PXbg+CvTUrnULYjrmB1EQ5llQQeuUp/HHtmIYL6x0ycNMRfvD
         JdhRolMTcrMqw7Otvh5j48TqxP7X8WvV+7xaxETN4NdW1NTGW0UJUYqqFDCxiW4AL0mI
         27niKLb61OimctyaEnyO0j6QBOnoChUA4nnkvAvCVYwPqKNGB3/m4SsikvQ+kwZx3UsC
         2eSSNCb5qirI2n1ExQIX6stPjF2vGY7W5lYBXCiA4m8apzwbS0SXclCGMenBIU/a/ziw
         KXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/oB8l/a4qMXX2zH7m/+aHG2zItJDDGYZKhhwyo3mfU=;
        b=iXsSWIFVBZ+gnNrq20Hx22nXls80RK55Lro3c2zbjXZW/FoSylIy4NvDCgNqEChaQ/
         dfu4J9OTGJrijhR2qblhxRIk/nKHOFIoEw+b9FdXxCHp9MPakcAcV8fzvn0FoDiCikYl
         1H6b4JHmJ7fCmFXmHbOClZvDURBw51Idxyy10uWufrQLs8XCcrybnF2VNDBu8YoeEcwJ
         roo8CczalAMlXS5dbEDN0aTDn/NtU1rA09spfehcQZXj1RiUFW8iEnQbUCp4S10QqRex
         WhMkycy2HicVR6wjwN1vl18eiZNlh+3PvvYnjn5Co6vt7XyePYtQwE4486jtpriHK60l
         /CRA==
X-Gm-Message-State: AOAM532exXAYzaLHnkUY+MjrQmbHW54t9ZXwCpwQXD04U7mhThADYb5M
	3mjts5cJkoRoSyqLu0xO0J3Q+xQhan2cQg==
X-Google-Smtp-Source: ABdhPJw77ka1DkkdZZWBnBmLoaVOR7YNNBmvxiCN2tGZ8c0kt2MVZVRqtCaUpAb5uEZN3yakh1dLig==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr31560417wrc.269.1606138110785;
        Mon, 23 Nov 2020 05:28:30 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id d13sm21460873wrb.39.2020.11.23.05.28.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 05:28:29 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] util-linux: split uuid in separate recipe to allow bootstrapping
Date: Mon, 23 Nov 2020 13:28:23 +0000
Message-Id: <20201123132823.3996355-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20191209162419.4343-1-luca.boccassi@gmail.com>
References: <20191209162419.4343-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

In v2.35 util-linux  gained an (optional) build
dependency on libcryptsetup. But libcryptsetup build-depends on
util-linux for blkid (optional, can be disabled) and uuid (mandatory).
Split out util-linux-uuid in a different recipe to break the cycle.

Add a packageconfig switch (disabled by default) to allow using the
new dependency.

https://github.com/karelzak/util-linux/pull/898

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
    underway as I'm not sure if this is the best approach or if there are
    alternatives. Suggestions and comments very welcome. Thanks!
v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
    and leave uuid build enable in main recipe to allow for uuidgen build to happen,
    as it does not have its own autoconf switch. Delete the library manualy from
    the main recipe after build instead, and add dependency.
    Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
    only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
v3: rebased and refactored to have a common util-linux.inc file


 .../nfs-utils/nfs-utils_2.5.1.bb              |  2 +-
 meta/recipes-core/udev/eudev_3.2.9.bb         |  2 +-
 .../util-linux/util-linux-uuid_2.36.bb        | 22 +++++++++
 meta/recipes-core/util-linux/util-linux.inc   | 40 ++++++++++++++++
 .../util-linux/util-linux_2.36.bb             | 48 ++++---------------
 .../btrfs-tools/btrfs-tools_5.7.bb            |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb |  2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
 meta/recipes-devtools/python/python3_3.9.0.bb |  2 +-
 .../syslinux/syslinux_6.04-pre2.bb            |  2 +-
 .../tcf-agent/tcf-agent_git.bb                |  2 +-
 meta/recipes-extended/mc/mc_4.8.25.bb         |  2 +-
 meta/recipes-extended/parted/parted_3.3.bb    |  2 +-
 meta/recipes-extended/wget/wget.inc           |  2 +-
 .../fontconfig/fontconfig_2.13.1.bb           |  2 +-
 meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb |  2 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.3.bb |  2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb |  2 +-
 .../lttng/lttng-tools_2.12.2.bb               |  2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb |  2 +-
 .../gstreamer1.0-plugins-base_1.18.0.bb       |  2 +-
 meta/recipes-support/apr/apr_1.7.0.bb         |  2 +-
 meta/recipes-support/serf/serf_1.3.9.bb       |  2 +-
 24 files changed, 92 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux.inc

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
index b8ad23a0d8..7bf3f1d898 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libevent util-linux sqlite3 libtirpc"
+DEPENDS = "libcap libevent util-linux util-linux-uuid sqlite3 libtirpc"
 RDEPENDS_${PN} = "${PN}-client"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-core/udev/eudev_3.2.9.bb
index f96f8cbe78..4332ca9b7c 100644
--- a/meta/recipes-core/udev/eudev_3.2.9.bb
+++ b/meta/recipes-core/udev/eudev_3.2.9.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2.0+ & LGPL-2.1+"
 LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
+DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux util-linux-uuid"
 
 PROVIDES = "udev"
 
diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.bb
new file mode 100644
index 0000000000..ffb2c87270
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.bb
@@ -0,0 +1,22 @@
+# To allow util-linux to optionally build-depend on cryptsetup, libuuid is
+# split out of the main recipe, as it's needed by cryptsetup
+
+require util-linux.inc
+
+inherit autotools gettext pkgconfig
+
+S = "${WORKDIR}/util-linux-${PV}"
+EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
+DEBIAN_NOAUTONAME_util-linux-libuuid = "1"
+DEBIAN_NOAUTONAME_util-linux-libuuid-dev = "1"
+DEBIAN_NOAUTONAME_util-linux-libuuid-dbg = "1"
+PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
+FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
+FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
+FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
+
+do_install_append() {
+	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
new file mode 100644
index 0000000000..c0634082cd
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -0,0 +1,40 @@
+SUMMARY = "A suite of basic system administration utilities"
+HOMEPAGE = "https://en.wikipedia.org/wiki/Util-linux"
+DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
+commonly found on most Linux systems.  Some of the more important utilities include \
+disk partitioning, kernel message management, filesystem creation, and system login."
+
+SECTION = "base"
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE_${PN}-libblkid = "LGPLv2.1+"
+LICENSE_${PN}-libfdisk = "LGPLv2.1+"
+LICENSE_${PN}-libmount = "LGPLv2.1+"
+LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
+LICENSE_${PN}-libuuid = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
+                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
+                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
+                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
+"
+
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${MAJOR_VERSION}.tar.xz \
+           file://configure-sbindir.patch \
+           file://runuser.pamd \
+           file://runuser-l.pamd \
+           file://ptest.patch \
+           file://run-ptest \
+           file://display_testname_for_subtest.patch \
+           file://avoid_parallel_tests.patch \
+           "
+SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 474f1e188c..5b721187e1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -1,47 +1,9 @@
-SUMMARY = "A suite of basic system administration utilities"
-HOMEPAGE = "https://en.wikipedia.org/wiki/Util-linux"
-DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
-commonly found on most Linux systems.  Some of the more important utilities include \
-disk partitioning, kernel message management, filesystem creation, and system login."
-
-SECTION = "base"
-
-LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE_${PN}-libblkid = "LGPLv2.1+"
-LICENSE_${PN}-libfdisk = "LGPLv2.1+"
-LICENSE_${PN}-libmount = "LGPLv2.1+"
-LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
-LICENSE_${PN}-libuuid = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
-                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
-                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
-                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
-                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
-"
+require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
 
-MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
-           file://configure-sbindir.patch \
-           file://runuser.pamd \
-           file://runuser-l.pamd \
-           file://ptest.patch \
-           file://run-ptest \
-           file://display_testname_for_subtest.patch \
-           file://avoid_parallel_tests.patch \
-           "
-SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
-
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
 
@@ -141,6 +103,7 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 # PCRE support in hardlink
 PACKAGECONFIG[pcre2] = ",,libpcre2"
+PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
@@ -316,6 +279,13 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
+# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
+do_install_append() {
+    rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}/lib/libuuid*
+}
+PACKAGES_remove = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
+
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
index e61ea9bf89..abb579d608 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl"
+DEPENDS = "util-linux util-linux-uuid attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 009f5ed807..0452d32699 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "util-linux attr"
+DEPENDS = "util-linux util-linux-uuid attr"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
index c7850f03ca..dbbe6f21db 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fd
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "util-linux"
+DEPENDS = "util-linux util-linux-uuid"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d6bbfca3f..1a5111ea23 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 inherit autotools pkgconfig update-alternatives
 
-DEPENDS = "zlib e2fsprogs util-linux"
+DEPENDS = "zlib e2fsprogs util-linux util-linux-uuid"
 RDEPENDS_mtd-utils-tests += "bash"
 
 PV = "2.1.2"
diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index 6402760a1b..09f1a5daee 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -63,7 +63,7 @@ ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux util-linux-uuid libtirpc libnsl2"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 3e7eef3a75..9ed5b8dc22 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
-DEPENDS = "nasm-native util-linux e2fsprogs"
+DEPENDS = "nasm-native util-linux util-linux-uuid e2fsprogs"
 PV = "6.04-pre2"
 
 SRC_URI = "https://www.zytor.com/pub/syslinux/Testing/6.04/syslinux-${PV}.tar.xz \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ed14fe66b1..174b9c0a5e 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
            file://tcf-agent.service \
           "
 
-DEPENDS = "util-linux openssl"
+DEPENDS = "util-linux util-linux-uuid openssl"
 RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/git/agent"
diff --git a/meta/recipes-extended/mc/mc_4.8.25.bb b/meta/recipes-extended/mc/mc_4.8.25.bb
index 83c8a6ecf6..78565c9a9a 100644
--- a/meta/recipes-extended/mc/mc_4.8.25.bb
+++ b/meta/recipes-extended/mc/mc_4.8.25.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.midnight-commander.org/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
-DEPENDS = "ncurses glib-2.0 util-linux"
+DEPENDS = "ncurses glib-2.0 util-linux util-linux-uuid"
 RDEPENDS_${PN} = "ncurses-terminfo-base"
 RRECOMMENDS_${PN} = "ncurses-terminfo"
 
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index a1fd3ef07b..f06cdc18e6 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "ncurses readline util-linux virtual/libiconv"
+DEPENDS = "ncurses readline util-linux util-linux-uuid virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 2338328216..7b7a3fae7a 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -32,7 +32,7 @@ PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
 PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
-PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux-uuid"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
index d0da419ce0..c9edf8dee6 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
 
 SECTION = "libs"
 
-DEPENDS = "expat freetype zlib gperf-native util-linux"
+DEPENDS = "expat freetype zlib gperf-native util-linux util-linux-uuid"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
index 54384521c8..ab8c4215d3 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
@@ -15,7 +15,7 @@ require xorg-lib-common.inc
 LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d55cea4d27ca1a09a5d23378b3ecf8"
 
-DEPENDS += "util-linux libxcb libsm virtual/libx11 xorgproto libxdmcp"
+DEPENDS += "util-linux util-linux-uuid libxcb libsm virtual/libx11 xorgproto libxdmcp"
 PROVIDES = "xt"
 
 PE = "1"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
index c65882581d..952cba0977 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+DEPENDS = "glib-2.0 util-linux util-linux-uuid popt bison-native flex-native"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
            file://run-ptest \
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index 9e5d3a7a97..e618f1cf98 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
 LICENSE = "MIT & GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
-DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+DEPENDS = "glib-2.0 util-linux util-linux-uuid popt bison-native flex-native"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
 	   file://run-ptest \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index 0787e04d19..e645bc4743 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
 
 include lttng-platforms.inc
 
-DEPENDS = "liburcu popt libxml2 util-linux"
+DEPENDS = "liburcu popt libxml2 util-linux util-linux-uuid"
 RDEPENDS_${PN} = "libgcc"
 RRECOMMENDS_${PN} += "${LTTNGMODULES}"
 RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
index 67a4307c7b..d477528db5 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
@@ -19,7 +19,7 @@ include lttng-platforms.inc
 
 EXTRA_OECONF = "--disable-numa"
 
-DEPENDS = "liburcu util-linux"
+DEPENDS = "liburcu util-linux util-linux-uuid"
 RDEPENDS_${PN}-bin = "python3-core"
 
 # For backwards compatibility after rename
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index a04af186f6..b42b62799e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823c
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-DEPENDS += "iso-codes util-linux zlib"
+DEPENDS += "iso-codes util-linux util-linux-uuid zlib"
 
 inherit gobject-introspection
 
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 7073af8c98..ed0b9a0903 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Apache Portable Runtime (APR) library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
-DEPENDS = "util-linux"
+DEPENDS = "util-linux util-linux-uuid"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4dfd4cd216828c8cae5de5a12f3844c8 \
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 6a27f12102..c2800c69cc 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit scons
 
-DEPENDS += " openssl apr apr-util util-linux expat"
+DEPENDS += " openssl apr apr-util util-linux util-linux-uuid expat"
 
 EXTRA_OESCONS = " \
                   LIBDIR=${libdir} \
-- 
2.27.0

