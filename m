Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.2387.1628213046376413675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 18:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1761O5nh026875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Aug 2021 18:24:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 5 Aug 2021 18:24:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 5 Aug 2021 18:24:04 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bitbake.conf: support persistent /var/tmp
Date: Fri, 6 Aug 2021 09:21:31 +0800
Message-ID: <20210806012131.47282-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Steps:
1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
3. docker run -it --rm poky:latest /bin/sh
4.
/var # ls -al
drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatile/tmp
drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
/var # cd log
/bin/sh: cd: can't cd to log: No such file or directory
/var # cd tmp
/bin/sh: cd: can't cd to tmp: No such file or directory
/var # cd volatile/
/var/volatile # ls -al
drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
drwxr-xr-x    8 root     root          4096 Mar  9  2018 ..

In step3, because we don't launch container with init system,
volatile/tmp is not created during startup, and the dad link will cause
error. Supporting persistent /var/tmp can resolve this problem.

To support persistent /var/tmp, rename VOLATILE_LOG_DIR
to VOLATILE_DIR

Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
to control it separately since it will make things complicated,
we need to make kinds of fs-perms*.txt for kinds of combination
of the two variables.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/bitbake.conf                                 | 10 ++++++----
 ...erms-persistent-log.txt => fs-perms-persistent.txt} |  2 --
 meta/recipes-core/base-files/base-files_3.0.14.bb      |  7 ++++---
 .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
 meta/recipes-core/initscripts/initscripts_1.0.bb       |  7 +++++--
 meta/recipes-core/systemd/systemd_249.1.bb             |  5 +++--
 meta/recipes-core/udev/eudev_3.2.10.bb                 |  3 +++
 7 files changed, 21 insertions(+), 16 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 821dae2ba6..e93c0b7893 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = "/usr/bin"
 # Root home directory
 ROOT_HOME ??= "/home/root"
 
-# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
-# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
-VOLATILE_LOG_DIR ?= "yes"
+# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
+# /var/volatile/log, /var/tmp links to /var/volatile/tmp
+# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
+# is on persistent storage.
+VOLATILE_DIR ?= "yes"
 
 ##################################################################
 # Architecture-dependent build variables.
@@ -349,7 +351,7 @@ FILESEXTRAPATHS ?= "__default:"
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
-FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
+FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_DIR')) else 'files/fs-perms-persistent.txt'}"
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
similarity index 95%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-persistent.txt
index 518c1be3c9..326c0ed092 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 94299431f6..0e06629bbd 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -29,7 +29,7 @@ S = "${WORKDIR}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 docdir_append = "/${P}"
-dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
+dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}tmp"
 dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${localstatedir}/backups ${localstatedir}/lib \
            ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
+           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}log \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
 
@@ -53,7 +53,8 @@ dirs755-lsb = "/srv  \
                ${prefix}/lib/locale"
 dirs2775-lsb = "/var/mail"
 
-volatiles = "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
+volatiles = "${@'log' if oe.types.boolean('${VOLATILE_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_DIR}') else ''}"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/issue.net \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..eeeb8905da 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -24,11 +24,8 @@
 # a link will be created at /var/test pointing to /tmp/testfile and due to this
 # link the file defined as /var/test will actually be created as /tmp/testfile.
 d root root 1777 /run/lock none
-d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 65f9c0ae8d..cc079024f4 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -105,9 +105,12 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
-		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+                sed -i -e '\@^# link the file@ a\d root root 0755 /var/volatile/log none\nd root root 1777 /var/volatile/tmp none\nl root root 0755 /var/tmp /var/volatile/tmp\nl root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
+	else
+		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
+			${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.1.bb
index 9bfb12249c..0914b7e0b2 100644
--- a/meta/recipes-core/systemd/systemd_249.1.bb
+++ b/meta/recipes-core/systemd/systemd_249.1.bb
@@ -251,8 +251,9 @@ do_install() {
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index a5d2115f80..3761fd748e 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -42,6 +42,9 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = False ]; then
+		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /var/tmp%g' ${D}${sysconfdir}/init.d/udev
+	fi
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
-- 
2.17.1

