Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
	[209.85.219.171])
	by mail.openembedded.org (Postfix) with ESMTP id 87B927C065
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:53 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id x9so8561038ybj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=po0AFk24n8E0WFaNV7K8vwbBMSmjK1yvcibYquZ+DWQ=;
	b=uLvq9ytN1pFGH3nZ9vsVh9VNJypq7sw3WI8xV76wK9RJcgAOkHPv9aFiIgLWfXXovp
	kEdjn7b5hhDVTi3LJ8y5d+PfUar1MmEEwknxUXFAPfftd9VWPtWADmiXzrfEOepG3agx
	2DfNhwMY7nX2lII8NGLqGORMltv8b6mb4FgmO2XkD2Ny2OI90PVqAnjDzgRVGXr8ylZd
	oJHmAdyAb3bwbnrakgK06772ceAVYV+5DyKWwbhSknfPooTCfHaRScC2yniNzj1f8OV4
	3vdVBLYxD2HtMFAupAEt8xV+fEpdaAmtkbcD6QeCTOZBHGk8kSa74p5sNPTcsRFnrPAn
	SyGw==
X-Gm-Message-State: AJcUukdZ3JdgGwHfSBHYjyrNdxg6YW5PI+BMENyDnKIwL8YGddgWEGpY
	JvMlZ8x9MA1Q4cexrvAs+5ijJARI
X-Google-Smtp-Source: ALg8bN5CM19XpSTuyW1XJBNRKdDNE8WdukvbcvxXAeoqdnUMxcbGFIOmPXWHmsLSvnidNDfPXxcSjw==
X-Received: by 2002:a25:7ec5:: with SMTP id
	z188mr23613785ybc.282.1547470614245; 
	Mon, 14 Jan 2019 04:56:54 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:53 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:32 +0000
Message-Id: <20190114125632.4780-13-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 12/12] utils-linux: final cleanup
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

* use ${PN} instead of util-linux
* use PACKAGESPLITFUNCS for creating util-linux-lib* packages
  rather than an _append OVERRIDE
* sort ALTERNATIVE_LINK_NAME alphabetically

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 131 +++++++++-----------
 1 file changed, 58 insertions(+), 73 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e25ff17098..aad95791e3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -28,8 +28,8 @@ MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
-PACKAGES =+ "util-linux-swaponoff"
-PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
+PACKAGES =+ "${PN}-swaponoff"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
 
 python apply_update_alternative_renames_prepend () {
     def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
@@ -43,13 +43,22 @@ python apply_update_alternative_renames_prepend () {
         d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
         pkg_hook(f, pkg, file_regex, output_pattern, modulename)
 
-    do_split_packages(d, root='${base_sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
-    do_split_packages(d, root='${base_bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook, extra_depends='', prepend=True)
-    do_split_packages(d, root='${sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
-    do_split_packages(d, root='${bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='util-linux %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+    do_split_packages(d, root='${base_sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='${PN} %s', hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${base_bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='${PN} %s', hook=pkg_hook, extra_depends='', prepend=True)
+    do_split_packages(d, root='${sbindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='${PN} %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
+    do_split_packages(d, root='${bindir}', file_regex='(.*)', output_pattern='${BPN}-%s', description='${PN} %s', hook=pkg_hook_with_recommends, extra_depends='', prepend=True)
 }
 
-PACKAGES_DYNAMIC = "^util-linux-.*"
+python util_linux_libpackages() {
+    do_split_packages(d, '${base_libdir}', '^lib(.*)\.so\..*$',
+                      output_pattern='${PN}-lib%s',
+                      description='${PN} lib%s',
+                      extra_depends='', prepend=True, allow_links=True)
+}
+
+PACKAGESPLITFUNCS_prepend = "util_linux_libpackages "
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
 
 SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-makeinstall-chown \
@@ -84,21 +93,21 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_${PN}-last = "${bindir}/lastb"
-FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
-FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
-                               ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
-                               ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
+FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
 
 FILES_${PN}-setarch = "${bindir}/linux32 ${bindir}/linux64 ${bindir}/uname26"
 
 # Util-linux' blkid replaces the e2fsprogs one
-RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
-RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
+RCONFLICTS_${PN}-blkid = "e2fsprogs-blkid"
+RREPLACES_${PN}-blkid = "e2fsprogs-blkid"
 
-RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin util-linux-lsblk"
-RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
+RDEPENDS_${PN} = "${PN}-umount ${PN}-swaponoff ${PN}-losetup ${PN}-sulogin ${PN}-lsblk"
+RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PN}-runuser ${PN}-su', '', d)}"
 
 RRECOMMENDS_${PN} += "${PN}-blockdev ${PN}-cfdisk ${PN}-ctrlaltdel ${PN}-fdisk ${PN}-mkswap ${PN}-nologin ${PN}-pivot-root ${PN}-switch-root"
 RRECOMMENDS_${PN} += "${PN}-dmesg ${PN}-kill ${PN}-more ${PN}-mount ${PN}-mountpoint"
@@ -108,8 +117,10 @@ RRECOMMENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
-RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
+RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
+RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which ${PN}-blkid ${PN}-fsck btrfs-tools"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
@@ -183,32 +194,54 @@ do_install_append_class-native () {
 
 ALTERNATIVE_PRIORITY = "80"
 
-ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
-ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
-ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
-ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
 ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
+ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
 ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
+ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
+ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
+ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
+ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
+ALTERNATIVE_${PN}-agetty = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
 ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
+ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
+ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
 ALTERNATIVE_${PN}-last = "last lastb"
 ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
 ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
 ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
+ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
+ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
+ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
+ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
+ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
+ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
+ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
+ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
+ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
-ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
-ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3 eject.1 logger.1"
 ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
@@ -232,57 +265,9 @@ ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
 ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
 
-ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
-
-ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
-
-ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
-
-ALTERNATIVE_util-linux-agetty = "getty"
-ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
-ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
-
-ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
-ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
-
-ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
-
-ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
-
-ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
-ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
-
-ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
-
-ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
-
-ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-
-ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-
-ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
-
-ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
-
-ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
-
-ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
-
-ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 
 BBCLASSEXTEND = "native nativesdk"
 
-python populate_packages_prepend() {
-    do_split_packages(d, '${base_libdir}', '^lib(.*)\.so\..*$',
-                      output_pattern='util-linux-lib%s',
-                      description='util-linux lib%s',
-                      extra_depends='', prepend=True, allow_links=True)
-}
-
-RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
-
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
 }
-- 
2.20.1


