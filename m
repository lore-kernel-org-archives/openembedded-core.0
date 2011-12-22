Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6y-00026J-JQ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:51:05 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so5528251yho.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=FSKX89U4jbu3nkFujtNp0S2J5oFa3sajd72Y8uFZ5nM=;
	b=R/KFdj0j2GEzKblB0wLIgVE/UgOnQhyONkYnzkrZl7Q7VOKSOfDPfC75VqLpWcaN4P
	iejKCi0p8MQ41iaZBIfDaHZVs8B5GW4L57A221HsT6Pu9fHwBgdrZgBj8rZicd/iTUk9
	WPVJUAbVKwJS6J3qOzE5EFiCaliA1SlaWRnkY=
Received: by 10.236.191.39 with SMTP id f27mr14676730yhn.91.1324557839578;
	Thu, 22 Dec 2011 04:43:59 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:58 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:26 +0000
Message-Id: <fa4a69c82a9009444b2bd57772c5afc51d11061c.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 6/9] udev: improve udev-cache robustness
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
X-List-Received-Date: Thu, 22 Dec 2011 12:51:06 -0000

 * allow udev-cache to be disabled at runtime (using
   /etc/default/udev-cache);

 * make cache invalidated if kernel, bootparams or device list
   changes;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc                |   11 ++++++++++-
 meta/recipes-core/udev/udev/init               |   18 +++++++++++++++---
 meta/recipes-core/udev/udev/udev-cache         |   20 +++++++++++++++-----
 meta/recipes-core/udev/udev/udev-cache.default |    4 ++++
 meta/recipes-core/udev/udev_164.bb             |    2 +-
 5 files changed, 45 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index e302c03..0fc418b 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://network.sh \
            file://local.rules \
            file://udev-cache \
+           file://udev-cache.default \
            file://init"
 
 inherit autotools pkgconfig update-rc.d
@@ -56,7 +57,7 @@ FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
 FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
-FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
+FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
@@ -68,6 +69,14 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
 
+	install -d ${D}${sysconfdir}/default
+	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
+
+	touch ${D}${sysconfdir}/udev/saved.uname
+	touch ${D}${sysconfdir}/udev/saved.cmdline
+	touch ${D}${sysconfdir}/udev/saved.devices
+	touch ${D}${sysconfdir}/udev/saved.atags
+
 	install -d ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d0d7e5d..bcd5a79 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,6 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
@@ -34,9 +35,20 @@ LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /pro
 	mkdir -m 1777 /dev/shm
 }
 
-if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-	not_first_boot=1
+if [ "$DEVCACHE" != "" ]; then
+	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
+	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
+	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
+	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
+	if [ -e $DEVCACHE ] && \
+		cmp -s /tmp/uname /etc/udev/saved.uname && \
+		cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
+		cmp -s /tmp/devices /etc/udev/saved.devices && \
+		cmp -s /tmp/atags /etc/udev/saved.atags; then
+		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+		not_first_boot=1
+	fi
 fi
 
 # make_extra_nodes
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 77bbda6..0eedcc2 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -9,12 +9,22 @@
 # Short-Description: cache /dev to speedup the udev next boot
 ### END INIT INFO
 
-[ -d /sys/class ] || exit 1
-[ -r /proc/mounts ] || exit 1
-[ -x /sbin/udevd ] || exit 1
+export TZ=/etc/localtime
 
-if [ ! -e /etc/dev.tar ]; then
-	(cd /; tar cf /etc/dev.tar dev)
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
+
+if [ "$DEVCACHE" != "" ]; then
+	echo "Populating dev cache"
+	(cd /; tar cf $DEVCACHE dev)
+	mv /tmp/uname /etc/udev/saved.uname
+	mv /tmp/cmdline /etc/udev/saved.cmdline
+	mv /tmp/devices /etc/udev/saved.devices
+	mv /tmp/atags /etc/udev/saved.atags
+else
+	rm -f /tmp/uname
+	rm -f /tmp/cmdline
+	rm -f /tmp/devices
+	rm -f /tmp/atags
 fi
 
 exit 0
diff --git a/meta/recipes-core/udev/udev/udev-cache.default b/meta/recipes-core/udev/udev/udev-cache.default
new file mode 100644
index 0000000..5c4937a
--- /dev/null
+++ b/meta/recipes-core/udev/udev/udev-cache.default
@@ -0,0 +1,4 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+DEVCACHE="/etc/dev.tar"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index f952c90..c89eab4 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.2.5



