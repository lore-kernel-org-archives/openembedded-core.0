Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B55F76968F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:43 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q11so5620344pdj.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4c/kaM12+HB0/uVca7xB8SQo99L4VKUbcbXQKW/dUmI=;
	b=xrLSauLJkUENYZ5XOJoh0f0kIusSFFop7/51wa+Q4U37SpgH9MsnL+tRjAqLJSbysH
	+xDnCMQt5Re6vYdljZ5Sl2Ing3La1BYI+SPWr185hnRhDPDK2cDLN2GmXeqFUTQpsaFX
	XBdKntFYa+I6ZEdaz+u1t9yixthg6ktuzXglm3vflwG6UJa97voroGQtrIiJ06tRFuVY
	jxLBiRfr1rjhY6cqyuOvrjbK4BZ/GD5vKerIIJ5YUpiv9C+34aCxYw9drzTqSdAjItEi
	qNDhY8DCdwXmOaieJ63gpZcrdMl4HwE02rgi5OKPCGNzKLhZfHapyx27jtWGgcNtrkgV
	OOsA==
X-Received: by 10.68.95.101 with SMTP id dj5mr25487949pbb.100.1369565985008;
	Sun, 26 May 2013 03:59:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kv2sm24028521pbc.28.2013.05.26.03.59.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:43 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:01 +1000
Message-Id: <1369566786-20341-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/6] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Sun, 26 May 2013 10:59:43 -0000

This adds the /run directory from the Filesystem Hierarchy Standard 3.0
Draft [1] and refactors the filesystem as follows:
- Remove creation of /var/volatile/run
- Remove creation of /var/volatile/lock
- Remove symbolic link from /var/run to /var/volatile/run
- Remove symbolic link from /var/lock to /var/volatile/lock
- Add symbolic link from /var/run to /run
- Add symbolic link from /var/lock -> /run/lock
- Add /run to /etc/fstab for sysvinit compatibility

[1] http://www.linuxbase.org/betaspecs/fhs/fhs.html#runRuntimeVariableData

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/files/fs-perms.txt                                 |  5 ++---
 meta/recipes-core/base-files/base-files/fstab           |  1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb       | 10 +++++-----
 meta/recipes-core/initscripts/initscripts-1.0/volatiles |  7 +++----
 4 files changed, 11 insertions(+), 12 deletions(-)

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
index a56450d..ac85ed9 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
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
+	ln -snf ../run ${D}${localstatedir}/run
+	ln -snf ../run/lock ${D}${localstatedir}/lock
 
 	${BASEFILESISSUEINSTALL}
 
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
-- 
1.8.2.3


