Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.7504.1615475403829994400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CPSC75yr;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so13422758wml.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvYs4kGxDH73ZwOrFYGFZKnDVfi4GVJSMutw1sx1KAM=;
        b=CPSC75yrvluYYQF+v+8heZ79Vu3imiiapzAa38Irc1IbpoX9skkMHhi/i/Be6amHu4
         JAscRZcUalDku7tbDV+jBvlWkhotlj5eS0hhwb8kkybeCaI/VffVh3PiAl51oNBThsjH
         0fXM0DxlvaLc4zoYWiEOlE3z9wrY/p5fOp6zjjWP7XPhkhD8ObRqZ8SkVzP5YdU62gZb
         k09eFdRPlCohG9zdSHzMLv6QYGV+lZ63hE7ZGgFhYYY7m9gDzuAc7NbYo0VaxqHn9zzD
         J+R2z4ariNUHhe6ypHiO+dkKBtCSZWkObYvfG/uwFDC/bzGgtphhPG+LhKrXpIDH8HU1
         Pbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvYs4kGxDH73ZwOrFYGFZKnDVfi4GVJSMutw1sx1KAM=;
        b=T+J3TpdbHXpB9rmUp1OBwCMawwdo7IQJBfnWpN0NusMqqhdTdJRdvAbZoNqLcQNsEC
         AZeGe0utW7c+h/9CmFWzPCuqjQslbrKmUGtGi1akh/rpN3ANN4nlLjkpG/rEe2uuswWw
         QXeMWsnDh375eR4WFhlFP0YGIC0JqOnrEbl5didaLYeO+KjgwhQ9O1M9gFL8y/5tJg8c
         sa4tHOpAnoZYHRYY+hvZ2AmrMlcRORSsbbfOT2e7P071LBFX3HNXFxVyo+fKtop/SK6h
         8FETIDRrwlReuiwHM34xDnAPsIfAcFQg3QB7RB1nJ52zRcxsa/uxXK4/0pG0mNBgjHrr
         SdYw==
X-Gm-Message-State: AOAM531DIhiIKRda22xF86OrdjHFUW2+yGWwnPzOdvPKmZTUxxn452v4
	niVY1OcMP6EkBzaDcLEmaKLBLHA+Sxg=
X-Google-Smtp-Source: ABdhPJwRUHWz5U+/ahEqw2h6IvUHEIGrGlqtRApP4UECeW2q/Db4uWN44Cjgr4ZuDFRh4Bqgkiv0MQ==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr8733311wmd.78.1615475401758;
        Thu, 11 Mar 2021 07:10:01 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id n66sm3956800wmn.25.2021.03.11.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:10:01 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	bluelightning@bluelightning.org
Subject: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
Date: Thu, 11 Mar 2021 15:09:59 +0000
Message-Id: <20210311150959.782186-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210184632.3448265-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Recently util-linux gained an (optional) build dependency on libcryptsetup.
But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
and uuid (mandatory).
Split out util-linux-uuid in a different recipe to break the cycle.

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
v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warnings
v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid.
    Removed PACKAGES_remove and instead filter out libuuid via the package generation
    regex.
    Rebased on util-linux 2.36.2.
v6: install libuuid.a in libuuid-dev
    change rdepends on uuid to use binary package rather than source
    add rdepends on uuid-dev to libuuid-dev
    remove rprovides of libuuid-dev from uuid-dev
v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLASSEXTEND, use
    simply '+='
v8: added missing libuuid-staticdev package
    remove libx32/libuuid* too
v9: set RECIPE_MAINTAINER_pn-util-linux-uuid, same value as RECIPE_MAINTAINER_pn-util-linux
v10: removed DEBIAN_NOAUTONAME
     remove lib64/libuuid* too
v11: use ${D}${base_libdir}/libuuid* instead of manually specifying /lib|/libx32|/lib64

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../util-linux/util-linux-uuid_2.36.2.bb      | 20 +++++++
 meta/recipes-core/util-linux/util-linux.inc   | 41 +++++++++++++
 .../util-linux/util-linux_2.36.2.bb           | 57 +++++--------------
 4 files changed, 77 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux.inc

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3d8e3d5de0..c6a97bc280 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -720,6 +720,7 @@ RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-util-linux-uuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
new file mode 100644
index 0000000000..65e4d23b7e
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
@@ -0,0 +1,20 @@
+# To allow util-linux to optionally build-depend on cryptsetup, libuuid is
+# split out of the main recipe, as it's needed by cryptsetup
+
+require util-linux.inc
+
+inherit autotools gettext pkgconfig
+
+S = "${WORKDIR}/util-linux-${PV}"
+EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
+PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticdev util-linux-libuuid-dbg"
+FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
+FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
+FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
+FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
+
+do_install_append() {
+	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
new file mode 100644
index 0000000000..b4f817ed82
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -0,0 +1,41 @@
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
+FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+BPN = "util-linux"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
+           file://configure-sbindir.patch \
+           file://runuser.pamd \
+           file://runuser-l.pamd \
+           file://ptest.patch \
+           file://run-ptest \
+           file://display_testname_for_subtest.patch \
+           file://avoid_parallel_tests.patch \
+           "
+SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
index 19950a2726..50a70cd452 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -1,46 +1,8 @@
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
-DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
-
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
-SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
+DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"
 
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
@@ -87,8 +49,9 @@ python util_linux_binpackages () {
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
 PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
 
+# skip libuuid as it will be packaged by the util-linux-uuid recipe
 python util_linux_libpackages() {
-    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(.*)\.so\..*$',
+    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(?!uuid)(.*)\.so\..*$',
                       output_pattern='${PN}-lib%s',
                       description='${PN} lib%s',
                       extra_depends='', prepend=True, allow_links=True)
@@ -141,6 +104,7 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 # PCRE support in hardlink
 PACKAGECONFIG[pcre2] = ",,libpcre2"
+PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
@@ -165,7 +129,10 @@ RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
-RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
+RDEPENDS_${PN} += " util-linux-libuuid"
+RDEPENDS_${PN}-dev += " util-linux-libuuid-dev"
+
+RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
 RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
@@ -234,6 +201,12 @@ do_install_append_class-native () {
 	rm -f ${D}${base_bindir}/kill
 }
 
+# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
+# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
+do_install_append () {
+	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}${base_libdir}/libuuid*
+}
+
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
-- 
2.29.2

