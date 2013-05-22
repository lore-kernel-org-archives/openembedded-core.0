Return-Path: <net147@gmail.com>
Received: from mail-da0-f42.google.com (mail-da0-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id EE12960420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 01:34:34 +0000 (UTC)
Received: by mail-da0-f42.google.com with SMTP id r6so799292dad.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0yzgSFECZ5orovBiG28KyIxSGFJr5IU8xqctrIMaIbM=;
	b=lBCUX9y0Yycnl4lejRe+vtISBjd0qyH9QwpDPjp+eecQM5dROdiP6ZTTflXw6xV/UE
	HykLLzmRu6YyMwAE2Cd45dYlx4b6POhjX2CfiNT9rC005+rqRvdr7782J+Meo0N/o2gS
	DY1gzWrhv/b1kE4seVJZU/9cm6v0+2bVu3MhNbJOoY3u9l0i3GBTNUPSB8JvB2KeLUOA
	0gCjWzQLokTza56sDp02ewuB9JeqflLR9QPHNXz96zw/Cjo5O2rEVJrvDX4lJzE51NL3
	tKirqikDYquF/NWaNHv3097T+YASTjXCz8N1IlquPVm0Xv/XZfvQMIaXGjpP2XPBp+Ld
	5mRg==
X-Received: by 10.66.100.231 with SMTP id fb7mr5722341pab.162.1369186475492;
	Tue, 21 May 2013 18:34:35 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id v7sm4877768pbq.32.2013.05.21.18.34.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 18:34:34 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 11:47:36 +1000
Message-Id: <1369187256-31043-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v3] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Wed, 22 May 2013 01:34:35 -0000

This adds the /run directory from the Filesystem Hierarchy Standard 3.0
Draft [1] and refactors the filesystem as follows:
- Remove creation of /var/volatile/run
- Remove creation of /var/volatile/lock
- Remove symbolic link from /var/run to /var/volatile/run
- Remove symbolic link from /var/lock to /var/volatile/lock
- Add symbolic link from /var/run to /run
- Add symbolic link from /var/lock -> /run/lock
- Add /run to /etc/fstab for sysvinit compatibility

The systemd init script has been modified as follows:
- Do not create /var/volatile/run
- Do not create symbolic link from /run to /var/run if /run doesn't
  exist

A few things have also been cleaned up:
- Remove udev workaround to ensure /run exists
- Remove clearing of /var/run as it points to a tmpfs anyway
- Remove permissions workaround for /var/run/utmp as
  systemd-update-utmp-runlevel.service starts correctly without it
- Remove /var/run from dbus package as it is created on startup
- Remove /var/volatile/run/resolvconf/interface from resolvconf package
  as resolvconf package uses /etc/resolvconf/run/interface

[1] http://www.linuxbase.org/betaspecs/fhs/fhs.html#runRuntimeVariableData

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/files/fs-perms.txt                                   |  5 ++---
 meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb   |  3 ++-
 meta/recipes-core/base-files/base-files/fstab             |  1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb         | 12 ++++++------
 meta/recipes-core/dbus/dbus.inc                           |  9 ++++++---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles   |  7 +++----
 meta/recipes-core/initscripts/initscripts_1.0.bb          |  2 +-
 meta/recipes-core/systemd/systemd/00-create-volatile.conf |  2 --
 meta/recipes-core/systemd/systemd/init                    |  4 ----
 meta/recipes-core/systemd/systemd/var-run.conf            |  4 ----
 meta/recipes-core/systemd/systemd_199.bb                  |  5 +----
 meta/recipes-core/udev/udev.inc                           |  6 +-----
 meta/recipes-core/udev/udev/init                          |  1 -
 meta/recipes-core/udev/udev/volatiles                     |  1 -
 meta/recipes-core/udev/udev_182.bb                        |  2 +-
 15 files changed, 24 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 delete mode 100644 meta/recipes-core/udev/udev/volatiles

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index becb85c..c829bec 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -45,15 +45,14 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 
 # Items from base-files
 # Links
-${localstatedir}/run	link	volatile/run
+${localstatedir}/run	link	/run
 ${localstatedir}/log	link	volatile/log
-${localstatedir}/lock	link	volatile/lock
+${localstatedir}/lock	link	/run/lock
 ${localstatedir}/tmp	link	volatile/tmp
 
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/lock	01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 2775
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
index d342a6e..a788bb2 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
@@ -23,7 +24,7 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index f0eed36..dd613a1 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -4,6 +4,7 @@ rootfs               /                    auto       defaults              1  1
 proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
+tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
 tmpfs                /var/volatile        tmpfs      defaults              0  0
 tmpfs                /media/ram           tmpfs      defaults              0  0
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index a56450d..6befba7 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Miscellaneous files for the base system."
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r73"
+PR = "r74"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
@@ -31,10 +31,10 @@ S = "${WORKDIR}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir_append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/lock ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
 dirs2775 = "/home ${prefix}/src ${localstatedir}/local"
 dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /sbin \
+           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
@@ -42,9 +42,7 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            ${localstatedir}/backups ${localstatedir}/lib \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/volatile/lock/subsys \
            ${localstatedir}/volatile/log \
-           ${localstatedir}/volatile/run \
            /mnt /media /media/card /media/cf /media/net /media/ram \
            /media/union /media/realroot /media/hdd \
            /media/mmc1"
@@ -54,7 +52,7 @@ dirs3755 = "/srv  \
             ${prefix}/local/share ${prefix}/local/src"
 dirs4775 = "/var/mail"
 
-volatiles = "run log lock tmp"
+volatiles = "log tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
@@ -83,6 +81,8 @@ do_install () {
 	for d in card cf net ram; do
 		ln -sf /media/$d ${D}/mnt/$d
 	done
+	ln -sf /run ${D}${localstatedir}/run
+	ln -sf /run/lock ${D}${localstatedir}/lock
 
 	${BASEFILESISSUEINSTALL}
 
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2be5bda..08b8731 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -12,7 +12,7 @@ DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_class-native = ""
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -101,9 +101,9 @@ do_install() {
 	     > ${D}${sysconfdir}/default/volatiles/99_dbus
 
 
-	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+	mkdir -p ${D}${localstatedir}/lib/dbus
 
-	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
 
 	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
 	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
@@ -113,6 +113,9 @@ do_install() {
 
 	# Remove empty testexec directory as we don't build tests
 	rm -rf ${D}${libdir}/dbus-1.0/test
+
+	# Remove /var/run as it is created on startup
+	rm -rf ${D}${localstatedir}/run
 }
 
 do_install_class-native() {
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 270f128..297245d 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -21,13 +21,12 @@
 # This explains the order of "link before object" as in the example above, where
 # a link will be created at /var/test pointing to /tmp/testfile and due to this
 # link the file defined as /var/test will actually be created as /tmp/testfile.
-d root root 1777 /var/volatile/lock none
+d root root 1777 /run/lock none
 d root root 0755 /var/volatile/log none
-d root root 0755 /var/volatile/run none
 d root root 1777 /var/volatile/tmp none
-l root root 1777 /var/lock /var/volatile/lock
+l root root 1777 /var/lock /run/lock
 l root root 0755 /var/log /var/volatile/log
-l root root 0755 /var/run /var/volatile/run
+l root root 0755 /var/run /run
 l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 531b2b6..89fd98b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r140"
+PR = "r141"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 6163a9c..9ffa88e 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -4,6 +4,4 @@
 
 
 d		/var/volatile/log		-	-	-	-
-d		/var/volatile/lock		-	-	-	-
-d		/var/volatile/run		-	-	-	-
 d		/var/volatile/tmp		-	-	-	-
diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index ac56cca..7e67a50 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -42,10 +42,6 @@ case "$1" in
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
-    mkdir -p /var/volatile/run
-    if [ ! -e /run ]; then
-        ln -s /var/run /run
-    fi
 
     # cache handling
     if [ "$DEVCACHE" != "" ]; then
diff --git a/meta/recipes-core/systemd/systemd/var-run.conf b/meta/recipes-core/systemd/systemd/var-run.conf
deleted file mode 100644
index c2c18e2..0000000
--- a/meta/recipes-core/systemd/systemd/var-run.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-# empty /var/run
-R	/var/run/*	-	-	-	-	-
-# systemd-update-utmp-runlevel.service fails to start without this
-f /var/run/utmp 0644 root root - -
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index b1cc046..5530528 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -21,7 +21,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-altern
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
            file://modprobe.rules \
-           file://var-run.conf \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
            file://0002-readahead-chunk-on-spinning-media.patch \
@@ -110,8 +109,6 @@ do_install() {
 
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
-	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
-
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 
 	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 769d861..92485f5 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -26,8 +26,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://local.rules \
            file://udev-cache \
            file://udev-cache.default \
-           file://init \
-           file://volatiles"
+           file://init"
 
 inherit autotools pkgconfig update-rc.d
 
@@ -85,9 +84,6 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
 
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/00_udev
-
 	touch ${D}${sysconfdir}/udev/cache.data
 
 	install -d ${D}${sysconfdir}/udev/rules.d/
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index cd87f50..95f9c03 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -50,7 +50,6 @@ case "$1" in
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
-    mkdir -p /var/volatile/run
     mkdir -p /var/volatile/tmp
 
     # cache handling
diff --git a/meta/recipes-core/udev/udev/volatiles b/meta/recipes-core/udev/udev/volatiles
deleted file mode 100644
index e33561b..0000000
--- a/meta/recipes-core/udev/udev/volatiles
+++ /dev/null
@@ -1 +0,0 @@
-l root root 0755 /run /var/run
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index d66292e..a90c289 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r7"
+PR = "r8"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.8.2.3


