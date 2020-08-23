Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.180996.1598214072588437367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNdl3TiP;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id b17so983952ejq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Ch7HV7VIzAsmHry1lUmu+jiJu+ZtdYiUUiOiZi3jRo=;
        b=LNdl3TiP+F66q91jjeM24moJFrOmVntBk04z/V3iGChq5X+i1XTXx+34xOrX4Cilar
         +dg53a+5902n3asozsUL3HVlIP5FwzclXv3+J/IrFq01fe38DeEoTtD3CTskcyZVqT8L
         Xw0y2Y6KLNqDeRu1HyyjlO8II7Typx6kIenzZvB1VOPGBn8mnhIhR1jMnJABrtze+4OD
         GeYat0AhzPG251vp8h6Saf/u6TYqsU2XfprcQUrkii1BuXbeGH7j8kyKcdMjRJVkBJNH
         m27lKrtDilGULmS//Me/WTO/5uhNnG1qWeADsJDRyEa97srj9JJlFhtrwCBVCbtn8xM/
         uKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Ch7HV7VIzAsmHry1lUmu+jiJu+ZtdYiUUiOiZi3jRo=;
        b=IjYyCLhyhYXmrg4zA8K/YIp40FpFBTehpNosqAtgBU1oCioBEayMnpeWnSCyB2fbS2
         o+tQV3zdYKFFVhD/NssAZcQsVwRfmODQBQ1kWp0o+21aauaHDfXuHBreiwmE7hHUJUBa
         HHg7jdvJLT8aahkGQ7M42r+gG0Op2J5PeOT4pXjE0aPRdyCEwQJ8KFTdxi3TQz9RHdbW
         aWcdOMbni0wSlOrLj4n2zjk7VBU/igRizyiOr3GE4Rna+cynkc1E3WeRZE38+eAScvQL
         hPg62dYhLYuqThy676eHPO2bkb9C+7ots/kq6jhg+iDZ/VW/I9vxxHU0dezQSwIhr12W
         CC8A==
X-Gm-Message-State: AOAM533oeyYkqhf9yA+7pMqqyyjwYwhlsc+t8z1JSEY8NT0P4FhKIaby
	UhdGOiGgJNkfMq2OfoDWDcdC3uKFIJw=
X-Google-Smtp-Source: ABdhPJxOYb6kWZ4PJfARAvkcbMieGPXLeeIs+KDcLFh+v9sCyqVizgZjO34aVGctZHWFH/uEZgnCtQ==
X-Received: by 2002:a17:906:f24c:: with SMTP id gy12mr2596479ejb.275.1598214070135;
        Sun, 23 Aug 2020 13:21:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/37] util-linux: merge .inc into .bb
Date: Sun, 23 Aug 2020 22:20:00 +0200
Message-Id: <20200823202031.24686-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   | 348 ------------------
 .../util-linux/util-linux_2.36.bb             | 348 +++++++++++++++++-
 2 files changed, 346 insertions(+), 350 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux.inc

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
deleted file mode 100644
index 06fbf7a229..0000000000
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ /dev/null
@@ -1,348 +0,0 @@
-SUMMARY = "A suite of basic system administration utilities"
-HOMEPAGE = "http://userweb.kernel.org/~kzak/util-linux/"
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
-
-#gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
-DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
-
-MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
-           "
-
-PACKAGES =+ "${PN}-swaponoff"
-PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
-
-python util_linux_binpackages () {
-    def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
-        pn = d.getVar('PN')
-        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
-
-        if d.getVar('ALTERNATIVE_' + pkg):
-            return
-        if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
-            d.setVar('ALTERNATIVE_' + pkg, modulename)
-
-    bindirs = sorted(list(set(d.expand("${base_sbindir} ${base_bindir} ${sbindir} ${bindir}").split())))
-    for dir in bindirs:
-        do_split_packages(d, root=dir,
-                          file_regex=r'(.*)', output_pattern='${PN}-%s',
-                          description='${PN} %s',
-                          hook=pkg_hook, extra_depends='')
-
-    # There are some symlinks for some binaries which we have ignored
-    # above. Add them to the package owning the binary they are
-    # pointing to
-    extras = {}
-    dvar = d.getVar('PKGD')
-    for root in bindirs:
-        for walkroot, dirs, files in os.walk(dvar + root):
-            for f in files:
-                file = os.path.join(walkroot, f)
-                if not os.path.islink(file):
-                    continue
-
-                pkg = os.path.basename(os.readlink(file))
-                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
-
-    pn = d.getVar('PN')
-    for pkg, links in extras.items():
-        of = d.getVar('FILES_' + pn + '-' + pkg)
-        links = of + links
-        d.setVar('FILES_' + pn + '-' + pkg, links)
-}
-
-# we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
-PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
-
-python util_linux_libpackages() {
-    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(.*)\.so\..*$',
-                      output_pattern='${PN}-lib%s',
-                      description='${PN} lib%s',
-                      extra_depends='', prepend=True, allow_links=True)
-}
-
-PACKAGESPLITFUNCS =+ "util_linux_libpackages"
-
-PACKAGES_DYNAMIC = "^${PN}-.*"
-
-CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
-UTIL_LINUX_LIBDIR = "${libdir}"
-UTIL_LINUX_LIBDIR_class-target = "${base_libdir}"
-EXTRA_OECONF = "\
-    --enable-libuuid --enable-libblkid \
-    \
-    --enable-fsck --enable-kill --enable-last --enable-mesg \
-    --enable-mount --enable-partx --enable-raw --enable-rfkill \
-    --enable-unshare --enable-write \
-    \
-    --disable-bfs --disable-chfn-chsh --disable-login \
-    --disable-makeinstall-chown --disable-minix --disable-newgrp \
-    --disable-use-tty-group --disable-vipw \
-    \
-    --without-udev \
-    \
-    usrsbin_execdir='${sbindir}' \
-    --libdir='${UTIL_LINUX_LIBDIR}' \
-"
-
-EXTRA_OECONF_append_class-target = " --enable-setpriv"
-EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
-EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
-EXTRA_OECONF_append = " --disable-hwclock-gplv3"
-
-# enable pcre2 for native/nativesdk to match host distros
-# this helps to keep same expectations when using the SDK or
-# build host versions during development
-#
-PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-# inherit manpages requires this to be present, however util-linux does not have 
-# configuration options, and installs manpages always
-PACKAGECONFIG[manpages] = ""
-PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
-# Respect the systemd feature for uuidd
-PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
-# Build python bindings for libmount
-PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
-# Readline support
-PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-# PCRE support in hardlink
-PACKAGECONFIG[pcre2] = ",,libpcre2"
-
-EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
-
-ALLOW_EMPTY_${PN} = "1"
-FILES_${PN} = ""
-FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
-FILES_${PN}-mount = "${sysconfdir}/default/mountall"
-FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
-FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
-CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
-FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
-                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
-                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
-
-# Util-linux' blkid replaces the e2fsprogs one
-RCONFLICTS_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
-RREPLACES_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
-
-RRECOMMENDS_${PN}_class-native = ""
-RRECOMMENDS_${PN}_class-nativesdk = ""
-RDEPENDS_${PN}_class-native = ""
-RDEPENDS_${PN}_class-nativesdk = ""
-
-RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
-
-RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
-RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug"
-RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
-ALLOW_EMPTY_${PN}-swaponoff = "1"
-
-#SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
-SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
-SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
-SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
-SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
-
-do_install () {
-	# with ccache the timestamps on compiled files may
-	# end up earlier than on their inputs, this allows
-	# for the resultant compilation in the install step.
-	oe_runmake 'CC=${CC}' 'LD=${LD}' \
-		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-
-	mkdir -p ${D}${base_bindir}
-
-        sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
-        binprogs_a="dmesg getopt kill more umount mount login su mountpoint"
-
-        if [ "${base_sbindir}" != "${sbindir}" ]; then
-        	mkdir -p ${D}${base_sbindir}
-                for p in $sbinprogs $sbinprogs_a; do
-                        if [ -f "${D}${sbindir}/$p" ]; then
-                                mv "${D}${sbindir}/$p" "${D}${base_sbindir}/$p"
-                        fi
-                done
-        fi
-
-        if [ "${base_bindir}" != "${bindir}" ]; then
-        	mkdir -p ${D}${base_bindir}
-                for p in $binprogs_a; do
-                        if [ -f "${D}${bindir}/$p" ]; then
-                                mv "${D}${bindir}/$p" "${D}${base_bindir}/$p"
-                        fi
-                done
-        fi
-
-	install -d ${D}${sysconfdir}/default/
-	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
-
-	rm -f ${D}${bindir}/chkdupexe
-}
-
-do_install_append_class-target () {
-	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
-		install -d ${D}${sysconfdir}/pam.d
-		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
-		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
-		# Required for "su -" aka "su --login" because
-		# otherwise it uses "other", which has "auth pam_deny.so"
-		# and thus prevents the operation.
-		ln -s su ${D}${sysconfdir}/pam.d/su-l
-	fi
-}
-# nologin causes a conflict with shadow-native
-# kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
-do_install_append_class-native () {
-	rm -f ${D}${base_sbindir}/nologin
-	rm -f ${D}${base_bindir}/kill
-}
-
-ALTERNATIVE_PRIORITY = "80"
-
-ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
-ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
-ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
-ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
-ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
-ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
-ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
-ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
-ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
-ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
-ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
-ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
-ALTERNATIVE_${PN}-agetty = "getty"
-ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
-ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
-ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
-ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
-ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
-ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
-ALTERNATIVE_${PN}-last = "last lastb"
-ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
-ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
-ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
-ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
-ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
-ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
-ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
-ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
-ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
-ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
-ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
-ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
-ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
-ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
-ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
-ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-ALTERNATIVE_LINK_NAME[rtcwake] = "${sbindir}/rtcwake"
-ALTERNATIVE_LINK_NAME[setpriv] = "${bindir}/setpriv"
-ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
-ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
-ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
-ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
-ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
-ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
-ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
-ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
-ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
-ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
-
-ALTERNATIVE_${PN}-doc = "\
-blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
-mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
-"
-ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
-
-ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
-ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
-ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
-ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
-ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
-ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
-ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
-ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
-ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
-ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
-ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
-ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
-ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
-ALTERNATIVE_LINK_NAME[setpriv.1] = "${mandir}/man1/setpriv.1"
-ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
-ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
-ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
-ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
-ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
-
-
-BBCLASSEXTEND = "native nativesdk"
-
-PTEST_BINDIR = "1"
-do_compile_ptest() {
-    oe_runmake buildtest-TESTS
-}
-
-do_install_ptest() {
-    mkdir -p ${D}${PTEST_PATH}/tests/ts
-    find . -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
-    find ./.libs -name 'sample*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
-    find ./.libs -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
-
-    cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
-    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
-    cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
-    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
-
-    # The original paths of executables to be tested point to a local folder containing
-    # the executables. We want to test the installed executables, not the local copies.
-    # So strip the paths, the executables will be located via "which"
-    sed  -i \
-         -e '/^TS_CMD/ s|$top_builddir/||g' \
-         -e '/^TS_HELPER/ s|$top_builddir|${PTEST_PATH}|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-    # Change 'if [ ! -x "$1" ]' to 'if [ ! -x "`which $1 2>/dev/null`"]'
-    sed -i -e \
-        '/^\tif[[:space:]]\[[[:space:]]![[:space:]]-x[[:space:]]"$1"/s|$1|`which $1 2>/dev/null`|g' \
-         ${D}${PTEST_PATH}/tests/functions.sh
-
-    # Running "kill" without the the complete path would use the shell's built-in kill
-    sed -i -e \
-         '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
-         ${D}${PTEST_PATH}/tests/commands.sh
-
-
-    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/run-ptest
-
-}
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
index 9feb717f00..2fac9793a2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -1,6 +1,37 @@
-require util-linux.inc
+SUMMARY = "A suite of basic system administration utilities"
+HOMEPAGE = "http://userweb.kernel.org/~kzak/util-linux/"
+DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
+commonly found on most Linux systems.  Some of the more important utilities include \
+disk partitioning, kernel message management, filesystem creation, and system login."
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
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
+#gtk-doc is not enabled as it requires xmlto which requires util-linux
+inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
+
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            file://configure-sbindir.patch \
            file://runuser.pamd \
            file://runuser-l.pamd \
@@ -10,3 +41,316 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.x
            file://avoid_parallel_tests.patch \
            "
 SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
+
+PACKAGES =+ "${PN}-swaponoff"
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
+
+python util_linux_binpackages () {
+    def pkg_hook(f, pkg, file_regex, output_pattern, modulename):
+        pn = d.getVar('PN')
+        d.appendVar('RRECOMMENDS_%s' % pn, ' %s' % pkg)
+
+        if d.getVar('ALTERNATIVE_' + pkg):
+            return
+        if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):
+            d.setVar('ALTERNATIVE_' + pkg, modulename)
+
+    bindirs = sorted(list(set(d.expand("${base_sbindir} ${base_bindir} ${sbindir} ${bindir}").split())))
+    for dir in bindirs:
+        do_split_packages(d, root=dir,
+                          file_regex=r'(.*)', output_pattern='${PN}-%s',
+                          description='${PN} %s',
+                          hook=pkg_hook, extra_depends='')
+
+    # There are some symlinks for some binaries which we have ignored
+    # above. Add them to the package owning the binary they are
+    # pointing to
+    extras = {}
+    dvar = d.getVar('PKGD')
+    for root in bindirs:
+        for walkroot, dirs, files in os.walk(dvar + root):
+            for f in files:
+                file = os.path.join(walkroot, f)
+                if not os.path.islink(file):
+                    continue
+
+                pkg = os.path.basename(os.readlink(file))
+                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
+
+    pn = d.getVar('PN')
+    for pkg, links in extras.items():
+        of = d.getVar('FILES_' + pn + '-' + pkg)
+        links = of + links
+        d.setVar('FILES_' + pn + '-' + pkg, links)
+}
+
+# we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
+PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
+
+python util_linux_libpackages() {
+    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(.*)\.so\..*$',
+                      output_pattern='${PN}-lib%s',
+                      description='${PN} lib%s',
+                      extra_depends='', prepend=True, allow_links=True)
+}
+
+PACKAGESPLITFUNCS =+ "util_linux_libpackages"
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
+
+CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
+UTIL_LINUX_LIBDIR = "${libdir}"
+UTIL_LINUX_LIBDIR_class-target = "${base_libdir}"
+EXTRA_OECONF = "\
+    --enable-libuuid --enable-libblkid \
+    \
+    --enable-fsck --enable-kill --enable-last --enable-mesg \
+    --enable-mount --enable-partx --enable-raw --enable-rfkill \
+    --enable-unshare --enable-write \
+    \
+    --disable-bfs --disable-chfn-chsh --disable-login \
+    --disable-makeinstall-chown --disable-minix --disable-newgrp \
+    --disable-use-tty-group --disable-vipw \
+    \
+    --without-udev \
+    \
+    usrsbin_execdir='${sbindir}' \
+    --libdir='${UTIL_LINUX_LIBDIR}' \
+"
+
+EXTRA_OECONF_append_class-target = " --enable-setpriv"
+EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF_append = " --disable-hwclock-gplv3"
+
+# enable pcre2 for native/nativesdk to match host distros
+# this helps to keep same expectations when using the SDK or
+# build host versions during development
+#
+PACKAGECONFIG ?= "pcre2"
+PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+# inherit manpages requires this to be present, however util-linux does not have 
+# configuration options, and installs manpages always
+PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
+# Respect the systemd feature for uuidd
+PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}, --without-systemd --without-systemdsystemunitdir,systemd"
+# Build python bindings for libmount
+PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
+# Readline support
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+# PCRE support in hardlink
+PACKAGECONFIG[pcre2] = ",,libpcre2"
+
+EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
+FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
+FILES_${PN}-mount = "${sysconfdir}/default/mountall"
+FILES_${PN}-runuser = "${sysconfdir}/pam.d/runuser*"
+FILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+CONFFILES_${PN}-su = "${sysconfdir}/pam.d/su-l"
+FILES_${PN}-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.* \
+                          ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
+
+# Util-linux' blkid replaces the e2fsprogs one
+RCONFLICTS_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
+RREPLACES_${PN}-blkid = "${MLPREFIX}e2fsprogs-blkid"
+
+RRECOMMENDS_${PN}_class-native = ""
+RRECOMMENDS_${PN}_class-nativesdk = ""
+RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
+
+RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
+
+RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
+RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug"
+RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
+ALLOW_EMPTY_${PN}-swaponoff = "1"
+
+#SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
+SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
+SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
+SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
+SYSTEMD_AUTO_ENABLE_${PN}-fstrim = "disable"
+
+do_install () {
+	# with ccache the timestamps on compiled files may
+	# end up earlier than on their inputs, this allows
+	# for the resultant compilation in the install step.
+	oe_runmake 'CC=${CC}' 'LD=${LD}' \
+		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
+
+	mkdir -p ${D}${base_bindir}
+
+        sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
+        sbinprogs_a="pivot_root hwclock mkswap losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
+        binprogs_a="dmesg getopt kill more umount mount login su mountpoint"
+
+        if [ "${base_sbindir}" != "${sbindir}" ]; then
+        	mkdir -p ${D}${base_sbindir}
+                for p in $sbinprogs $sbinprogs_a; do
+                        if [ -f "${D}${sbindir}/$p" ]; then
+                                mv "${D}${sbindir}/$p" "${D}${base_sbindir}/$p"
+                        fi
+                done
+        fi
+
+        if [ "${base_bindir}" != "${bindir}" ]; then
+        	mkdir -p ${D}${base_bindir}
+                for p in $binprogs_a; do
+                        if [ -f "${D}${bindir}/$p" ]; then
+                                mv "${D}${bindir}/$p" "${D}${base_bindir}/$p"
+                        fi
+                done
+        fi
+
+	install -d ${D}${sysconfdir}/default/
+	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
+
+	rm -f ${D}${bindir}/chkdupexe
+}
+
+do_install_append_class-target () {
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
+		install -d ${D}${sysconfdir}/pam.d
+		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
+		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
+		# Required for "su -" aka "su --login" because
+		# otherwise it uses "other", which has "auth pam_deny.so"
+		# and thus prevents the operation.
+		ln -s su ${D}${sysconfdir}/pam.d/su-l
+	fi
+}
+# nologin causes a conflict with shadow-native
+# kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
+do_install_append_class-native () {
+	rm -f ${D}${base_sbindir}/nologin
+	rm -f ${D}${base_bindir}/kill
+}
+
+ALTERNATIVE_PRIORITY = "80"
+
+ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
+ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
+ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
+ALTERNATIVE_LINK_NAME[chrt] = "${bindir}/chrt"
+ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
+ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[fdisk] = "${base_sbindir}/fdisk"
+ALTERNATIVE_LINK_NAME[flock] = "${bindir}/flock"
+ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
+ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
+ALTERNATIVE_LINK_NAME[fstrim] = "${base_sbindir}/fstrim"
+ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
+ALTERNATIVE_${PN}-agetty = "getty"
+ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
+ALTERNATIVE_TARGET[getty] = "${base_sbindir}/agetty"
+ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
+ALTERNATIVE_LINK_NAME[hwclock] = "${base_sbindir}/hwclock"
+ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
+ALTERNATIVE_${PN}-last = "last lastb"
+ALTERNATIVE_LINK_NAME[last] = "${bindir}/last"
+ALTERNATIVE_LINK_NAME[lastb] = "${bindir}/lastb"
+ALTERNATIVE_LINK_NAME[logger] = "${bindir}/logger"
+ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
+ALTERNATIVE_LINK_NAME[mesg] = "${bindir}/mesg"
+ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
+ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
+ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
+ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
+ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
+ALTERNATIVE_LINK_NAME[nsenter] = "${bindir}/nsenter"
+ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
+ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
+ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
+ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
+ALTERNATIVE_LINK_NAME[rtcwake] = "${sbindir}/rtcwake"
+ALTERNATIVE_LINK_NAME[setpriv] = "${bindir}/setpriv"
+ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
+ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
+ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
+ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
+ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
+ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
+ALTERNATIVE_LINK_NAME[taskset] = "${bindir}/taskset"
+ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
+ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
+ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
+
+ALTERNATIVE_${PN}-doc = "\
+blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
+mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
+"
+ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
+
+ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
+ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
+ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
+ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
+ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
+ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
+ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
+ALTERNATIVE_LINK_NAME[rfkill.8] = "${mandir}/man8/rfkill.8"
+ALTERNATIVE_LINK_NAME[setpriv.1] = "${mandir}/man1/setpriv.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
+ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
+ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
+ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
+
+
+BBCLASSEXTEND = "native nativesdk"
+
+PTEST_BINDIR = "1"
+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests/ts
+    find . -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+    find ./.libs -name 'sample*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+    find ./.libs -name 'test*' -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+
+    cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
+    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
+    cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
+    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
+
+    # The original paths of executables to be tested point to a local folder containing
+    # the executables. We want to test the installed executables, not the local copies.
+    # So strip the paths, the executables will be located via "which"
+    sed  -i \
+         -e '/^TS_CMD/ s|$top_builddir/||g' \
+         -e '/^TS_HELPER/ s|$top_builddir|${PTEST_PATH}|g' \
+         ${D}${PTEST_PATH}/tests/commands.sh
+
+    # Change 'if [ ! -x "$1" ]' to 'if [ ! -x "`which $1 2>/dev/null`"]'
+    sed -i -e \
+        '/^\tif[[:space:]]\[[[:space:]]![[:space:]]-x[[:space:]]"$1"/s|$1|`which $1 2>/dev/null`|g' \
+         ${D}${PTEST_PATH}/tests/functions.sh
+
+    # Running "kill" without the the complete path would use the shell's built-in kill
+    sed -i -e \
+         '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
+         ${D}${PTEST_PATH}/tests/commands.sh
+
+
+    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/run-ptest
+
+}
-- 
2.28.0

