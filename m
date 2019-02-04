Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id DDE587C208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:05:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h15so10711934edb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+0ZT1RVyKtvt+aj64mV+fWdAF0my9Oib8c7XMHuktqk=;
	b=r9hZ4A1uv8T8LWgUpTp3mhdgtXOsvFat+NhlEJtHmEozBRA8btvnYBnQ7VGM845uvY
	DpsqYO7BfouPIiKUT7PhuCG5c0Z2j1I77/PICYnhvrHBUIOKP7nR693LayGV1OrzaaNm
	bZv50ncYCD+ZqQ1HShhV0bY2QGwSd9IdHRvFs/XYvSQYkgeonbP3i55cDHiIn78S1WoR
	ZDOACHjYuTkqskb2XEgSgrTRRgEtG9DMjYxCk0xbsO8cL9HiknhLo0SCRvXYn4/txymG
	VDGLzzbIJ5Zxqj440UMwfHtZXTdAuQpNb1vx2WvG9dRgY6QW1UkkJ7dA/l/H3IzLv/K2
	gO3g==
X-Gm-Message-State: AJcUukePJFYibuHSm8UUzqfiiqURclIZPTo869HOK4s+U4O1ZoWhw2b7
	nD7G9GfKO80VGJvPn5ONp9tbXOMm
X-Google-Smtp-Source: ALg8bN60Hwp2cCRYD5PgEF5wKNdZv58rQ2sKd97Ikxd3yZnOkqX4LZedfkTL2y+Ed3YIaQgamJlcmg==
X-Received: by 2002:a50:951a:: with SMTP id u26mr50267008eda.4.1549274760118; 
	Mon, 04 Feb 2019 02:06:00 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.05.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:05:59 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:44 +0000
Message-Id: <20190204100552.25880-4-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 03/11] util-linux: one package per binary (pt 1: base_sbindir)
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Now that we have required infrastructure in place, we
can start creating one package per binary.

To make this process easier to follow, this is done
in steps, starting with binaries from base_sbindir.

Existing packages (and current dependency by main package):
* agetty
* blkid
* cfdisk <- RRECOMMENDS
* fdisk <- RRECOMMENDS
* fsck
* fstrim
* losetup <- RDEPENDS
* hwclock
* sulogin <- RDEPENDS
* swaponoff <- RDEPENDS
* switch-root <- RRECOMMENDS

New packages:
* blockdev
* ctrlaltdel
* mkswap
* nologin
* pivot-root
* swapon
* swapoff

swaponoff is empty now and simply depends on swapon swapoff

To avoid breaking existing users, all the new packages
are added to the main package as RRECOMMENDS_${PN}, so
they are pulled into existing images etc.

The existing RDEPENDS_${PN} will need some further
clean-up in the future, as it appears a bit random which
packages the main package depends on vs. recommends.
Existing packages that aren't in RDEPENDS / RRECOMMENDS
haven't been added to RRECOMMENDS for that reason.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v5: * reduce duplication in util_linux_binpackages() using
      a for loop
v3: * convert to PACKAGE_PREPROCESS_FUNCS rather than using
      apply_update_alternative_renames_prepend
v2: * Fix handling of escape characters in regexs and hence fix python
      Deprecation warnings which will be problematic in python 3.8.
    * use PN for package name prefix, not BPN
---
 meta/recipes-core/util-linux/util-linux.inc | 65 +++++++++++----------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4a72e3d40e..b8b3298239 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,19 +28,36 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
-             util-linux-swaponoff util-linux-losetup util-linux-umount \
+PACKAGES =+ "util-linux-blkdiscard util-linux-sfdisk \
+             util-linux-swaponoff util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-uuidd \
-             util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \
-             util-linux-blkid util-linux-mkfs util-linux-mcookie util-linux-rfkill \
-             util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
-             util-linux-partx util-linux-hwclock util-linux-mountpoint \
-             util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit \
-             util-linux-ionice util-linux-switch-root util-linux-unshare"
+             util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs \
+             util-linux-mkfs util-linux-mcookie util-linux-rfkill \
+             util-linux-lsblk util-linux-mkfs.cramfs \
+             util-linux-partx util-linux-mountpoint \
+             util-linux-findfs util-linux-getopt util-linux-prlimit \
+             util-linux-ionice util-linux-unshare"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-PACKAGES_DYNAMIC = "^util-linux-lib.*"
+python util_linux_binpackages () {
+    def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
+        if d.getVar('ALTERNATIVE_' + pkg):
+            return
+        if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
+            d.setVar('ALTERNATIVE_' + pkg, modulename)
+
+    for dir in [ '${base_sbindir}' ]:
+        do_split_packages(d, root=dir,
+                          file_regex=r'(.*)', output_pattern='${PN}-%s',
+                          description='${PN} %s',
+                          hook=pkg_hook, extra_depends='', prepend=True)
+}
+
+# we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
+PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
+
+PACKAGES_DYNAMIC = "^util-linux-.*"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -74,14 +91,8 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
-FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
-FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
-FILES_util-linux-fstrim = "${base_sbindir}/fstrim.${BPN}"
-FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
 FILES_util-linux-sfdisk = "${sbindir}/sfdisk"
-FILES_util-linux-swaponoff = "${base_sbindir}/swapon.${BPN} ${base_sbindir}/swapoff.${BPN}"
-FILES_util-linux-losetup = "${base_sbindir}/losetup.${BPN}"
 FILES_util-linux-mount = "${base_bindir}/mount.${BPN}"
 FILES_util-linux-mcookie = "${bindir}/mcookie"
 FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
@@ -90,7 +101,6 @@ FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
 FILES_util-linux-rfkill = "${sbindir}/rfkill.${BPN}"
 FILES_util-linux-partx = "${sbindir}/partx"
-FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
@@ -106,27 +116,24 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
 FILES_util-linux-lsblk = "${bindir}/lsblk"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-fsck = "${base_sbindir}/fsck.${BPN}"
 FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
-FILES_util-linux-sulogin = "${base_sbindir}/sulogin.${BPN}"
 FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
 
-FILES_util-linux-switch-root = "${base_sbindir}/switch_root.${BPN}"
 FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
-FILES_util-linux-blkid = "${base_sbindir}/blkid.${BPN}"
 RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
 RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
 
 RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
-RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-switch-root"
+RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-ionice"
+RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 
 RRECOMMENDS_${PN}_class-native = ""
 RRECOMMENDS_${PN}_class-nativesdk = ""
@@ -135,6 +142,9 @@ RDEPENDS_${PN}_class-nativesdk = ""
 
 RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
 
+RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
+ALLOW_EMPTY_${PN}-swaponoff = "1"
+
 #SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
 SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
@@ -206,9 +216,9 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = " \
-    dmesg kill more mkswap blockdev pivot_root \
+    dmesg kill more \
     hexdump last lastb logger mesg renice wall \
-    setsid chrt flock utmpdump eject nologin taskset fallocate \
+    setsid chrt flock utmpdump eject taskset fallocate \
     fsfreeze nsenter cal rev \
 "
 
@@ -247,13 +257,10 @@ ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
 ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
 
-ALTERNATIVE_util-linux-hwclock = "hwclock"
 ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
 
-ALTERNATIVE_util-linux-fdisk = "fdisk"
 ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 
-ALTERNATIVE_util-linux-fstrim = "fstrim"
 ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
 
 ALTERNATIVE_util-linux-agetty = "getty"
@@ -272,17 +279,13 @@ ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 ALTERNATIVE_util-linux-readprofile = "readprofile"
 ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 
-ALTERNATIVE_util-linux-losetup = "losetup"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 
-ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
 ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
 ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
 
-ALTERNATIVE_util-linux-fsck = "fsck"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
-ALTERNATIVE_util-linux-blkid = "blkid"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
 ALTERNATIVE_util-linux-rfkill = "rfkill"
@@ -291,7 +294,6 @@ ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
 
-ALTERNATIVE_util-linux-sulogin = "sulogin"
 ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 
 ALTERNATIVE_util-linux-mountpoint = "mountpoint"
@@ -303,7 +305,6 @@ ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_util-linux-ionice = "ionice"
 ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
 
-ALTERNATIVE_util-linux-switch-root = "switch_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


