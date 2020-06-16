Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.5734.1592293433022337949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 00:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05G7hVUd023641
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 00:43:41 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 00:43:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] bitbake.conf: support persistent /var/tmp
Date: Tue, 16 Jun 2020 15:41:24 +0800
Message-ID: <20200616074124.3321017-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Steps:
1. build out rootfs core-image-minimal-qemux86-64-20200514073622.rootfs.tar.bz2
2. docker import
./core-image-minimal-qemux86-64-20200514073622.rootfs.tar.bz2 poky:1.0
3. docker run -it --rm poky:1.0 /bin/sh
4. cd /var; ls -al
   there is link: tmp -> volatile/tmp
5. cd ./volatile; ls -al
   empty dir, this make link in step 4 is dad link.

in step3, since we don't launch container with init system,
volatile/tmp is not created, and the dad link may cause
error. support persistent /var/tmp can resolve this problem

And we can also resolve the problem by run with init system:
docker run -it --rm poky:1.0 /sbin/init
but maybe provide a selection to use persistent storeage is better.

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
 meta/recipes-core/initscripts/initscripts_1.0.bb       |  8 +++++++-
 meta/recipes-core/systemd/systemd_245.6.bb             |  4 +++-
 meta/recipes-core/udev/eudev_3.2.9.bb                  |  3 +++
 7 files changed, 23 insertions(+), 14 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f7700f1191..fad3b4e998 100644
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
@@ -350,7 +352,7 @@ FILESEXTRAPATHS ?= "__default:"
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
index 3a7cf3ab94..9ca9571e6e 100644
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
index 4080c4a495..70bce0cf71 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -105,8 +105,14 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		echo "d root root 0755 /var/volatile/log none" >> ${D}${sysconfdir}/default/volatiles/00_core
+		echo "d root root 1777 /var/volatile/tmp none" >> ${D}${sysconfdir}/default/volatiles/00_core
 		echo "l root root 0755 /var/log /var/volatile/log" >> ${D}${sysconfdir}/default/volatiles/00_core
+		echo "l root root 0755 /var/tmp /var/volatile/tmp" >> ${D}${sysconfdir}/default/volatiles/00_core
+	else
+		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
+                    ${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
diff --git a/meta/recipes-core/systemd/systemd_245.6.bb b/meta/recipes-core/systemd/systemd_245.6.bb
index b6681b2069..01c8866f08 100644
--- a/meta/recipes-core/systemd/systemd_245.6.bb
+++ b/meta/recipes-core/systemd/systemd_245.6.bb
@@ -231,7 +231,9 @@ do_install() {
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-core/udev/eudev_3.2.9.bb
index f96f8cbe78..d88bce0780 100644
--- a/meta/recipes-core/udev/eudev_3.2.9.bb
+++ b/meta/recipes-core/udev/eudev_3.2.9.bb
@@ -41,6 +41,9 @@ do_install_append() {
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

