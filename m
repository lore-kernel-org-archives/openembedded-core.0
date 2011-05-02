Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QGyXa-0005Vi-MH
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 21:12:19 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2199733gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=qjs17XOxbGYzuCggkwXC1zFiG44S0UWRm+0NGfkEVXk=;
	b=ve2tnyIVLE76FP6KgwoTp5n1kxrFP9KexZS59BQwLaUjtbifdWnwX7A3LhJtba+Xzw
	4j8bs+yXnd6be6kqMgSh1n5edfu2Z/sa2rVeRu7tV8FuRUksbMkKa0j4aJru3OU57Vn0
	nvpwcUfmUmSC90pppAKLmYeK4eSazcTZmv7JM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=dSjGwcb1WGdkrzqGIb7LafjdA8WoAadaEex9CyICP9hSQ5OKAw4ewAB9GHy66yhIbb
	C+xxlyU7hYQ2E7PlvMtDsx8rcnJ7CPQxyoiEmYoPz3J/AlhYG0rh3ifYNuPuiohi0j1j
	Gn2NjIREslClmmjeeEDUAwzDMwo/b2CtHaBzc=
Received: by 10.151.134.30 with SMTP id l30mr6719939ybn.136.1304363383821;
	Mon, 02 May 2011 12:09:43 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm856452yba.16.2011.05.02.12.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 12:09:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2011 19:09:16 +0000
Message-Id: <1304363356-27535-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
References: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 4/4] busybox: add support to mdev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2011 19:12:19 -0000

This changes the packaging only if the configuration used has mdev
support enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/busybox/busybox.inc       |   15 ++++++++++-
 meta/recipes-core/busybox/busybox_1.17.3.bb |    4 ++-
 meta/recipes-core/busybox/files/mdev        |    7 +++++
 meta/recipes-core/busybox/files/mdev.conf   |   35 +++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-core/busybox/files/mdev
 create mode 100644 meta/recipes-core/busybox/files/mdev.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 9f2d64c..164d089 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -12,23 +12,28 @@ SECTION = "base"
 PRIORITY = "required"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog.conf*"
+FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${sysconfdir}/init.d/busybox-udhcpc"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udhcpc"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udhcpc ${PN}-mdev"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
+INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
+CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
+INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
+
 # This disables the syslog startup links in slugos (see slugos-init)
 INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
 
@@ -103,6 +108,12 @@ do_install () {
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 		install -m 0755 ${WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
 	fi
+	if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
+		if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+			install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
+		fi
+	fi
 
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 
diff --git a/meta/recipes-core/busybox/busybox_1.17.3.bb b/meta/recipes-core/busybox/busybox_1.17.3.bb
index 28342fe..2d98ad3 100644
--- a/meta/recipes-core/busybox/busybox_1.17.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.17.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -21,6 +21,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mount.busybox \
            file://syslog \
            file://syslog.conf \
+           file://mdev \
+           file://mdev.conf \
            file://umount.busybox \
            file://defconfig"
 
diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
new file mode 100755
index 0000000..4eba619
--- /dev/null
+++ b/meta/recipes-core/busybox/files/mdev
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
+mkdir /dev/pts /dev/shm
+mount -t devpts devpts /dev/pts
+echo "/sbin/mdev" > /proc/sys/kernel/hotplug
+mdev -s
diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-core/busybox/files/mdev.conf
new file mode 100644
index 0000000..0e1d6bc
--- /dev/null
+++ b/meta/recipes-core/busybox/files/mdev.conf
@@ -0,0 +1,35 @@
+console 0:0 0600 
+cpu_dma_latency 0:0 0660 
+fb0:0 44 0660 
+full 0:0 0666 
+initctl 0:0 0600 
+ircomm[0-9].* 0:20 0660 
+kmem 0:15 0640 
+kmsg 0:0 0660 
+log 0:0 0666 
+loop[0-9].* 0:6 0640 
+mem 0:15 0640 
+network_latency 0:0 0660 
+network_throughput 0:0 0660 
+null 0:0 0666 
+port 0:15 0640 
+ptmx 0:5 0666 
+ram[0-9].* 0:6 0640 
+random 0:0 0666 
+sda 0:6 0640 
+tty 0:5 0666 
+tty.* 0:0 0620 
+urandom 0:0 0666 
+usbdev.* 0:0 0660 */etc/mdev/usb.sh
+vcs.* 0:5 0660 
+zero 0:0 0666 
+ 
+pcm.* 0:0 0660 =snd/ 
+control.* 0:0 0660 =snd/ 
+timer 0:0 0660 =snd/ 
+
+event.* 0:0 0660 =input/ @/etc/mdev/find-touchscreen.sh
+mice 0:0 0660 =input/ 
+mouse.* 0:0 0660 =input/
+
+tun[0-9]* 0:0 0660 =net/
-- 
1.7.2.5



