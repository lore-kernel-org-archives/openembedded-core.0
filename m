Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.10310.1614942144845115638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 03:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vRkpPTXW;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id o2so1070241wme.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XR1RMRpbrFfSiKFbymLixXFxFoUJpj1/SNLndhJZakc=;
        b=vRkpPTXW0rHPsk2x9imXn4Ba6rcg52278X95LtI67q6QUPEBgHKqftyQHvtvoMbSm1
         bFLxccAV/l7FdmaCtY9uJNExYMkWLNjww2JTsyxBb8Hamuw2RMABU4GzlHfA/gwyoqr+
         muVPGTySrq/tc8iyrckUcIazQU/3HSgQlsWLkpeb1ZqruoJdUlc7CFWCLKlS805zcE83
         gkPFhdrB/VMcXr8yB6DEctlqrHvEkos3y//K87yswU18dE7C9nbXe7+2MD1GJqsg5eAs
         tEYxPvqCOj+nsV0aEWybamOm2chFeXmoZdrEs6nAvaBmMXKyp9Ka6s0afk/HPO0sY77N
         fa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XR1RMRpbrFfSiKFbymLixXFxFoUJpj1/SNLndhJZakc=;
        b=p7Pqh8EqGpJJxEzMbQFLYdf21bXiSu8uq4/snM6UzGy+n4cH7oEnHHX9VdTgtAzAs4
         +v/dm6R3z5EHLc4mFbZJS/N0M2VCoSAxruoJiQAbjFgvOSKjbAmeg9gwtheAhSvEVolS
         Z81tuYaCv3iPfIVVSTCxU0cV3El/55jgz+h4ZrRc70Gqg0EQ741puA1TrWXKyTg5tHe7
         Dc2MJGmoNhle4wU2uGXE5Z75Pkv1ONhBYBdoCdUcJ8/rhs00NWgZdsM6TAWFUNvCRSGi
         RrlJ2Kn9w8nx+NUbwctxVinwkQsuv+Zjma0pRfBYttjIMnNu5tTFNk9FjyyfXDgrJ4/C
         qgog==
X-Gm-Message-State: AOAM532yF0Y9UfqsSgTZsjMyymwoBl+gumK4d8rqHPOMitpwCCQnteeL
	6k5w/sP1BmPxiBWth2nRj4yIr08Qbx0=
X-Google-Smtp-Source: ABdhPJz9ILgNByDCOyge5UW2ziyb3Dd5TOswFDIIeI5G+GzE3hQBF96JbJDXbzDLNyhPgMI8rm73LQ==
X-Received: by 2002:a05:600c:4154:: with SMTP id h20mr762744wmm.149.1614942142886;
        Fri, 05 Mar 2021 03:02:22 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id f7sm3951697wre.78.2021.03.05.03.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 03:02:22 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	bluelightning@bluelightning.org
Subject: [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
Date: Fri,  5 Mar 2021 11:02:18 +0000
Message-Id: <20210305110218.24635-1-luca.boccassi@gmail.com>
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

 .../util-linux/util-linux-uuid_2.36.2.bb      | 22 ++++++++
 meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++
 .../util-linux/util-linux_2.36.2.bb           | 56 +++++--------------
 3 files changed, 77 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux.inc

diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
new file mode 100644
index 0000000000..febbeeb405
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
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
+FILES_util-linux-libuuid-dev = "${libdir}/libuuid.a ${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
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
index 19950a2726..c0f4b603a7 100644
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
@@ -316,6 +283,11 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
+# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
+do_install_append() {
+    rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}/lib/libuuid*
+}
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.29.2

