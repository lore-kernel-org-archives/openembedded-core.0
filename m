Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzir-0007os-EG
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:40 +0100
Received: by ghrr17 with SMTP id r17so5465093ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=L3q/2BbEr9G5wsawJOA5WteLB/YIGKwd50ravnoFTOU=;
	b=Se6953QP687Yy20dxtu20DYHccj3QT+OkwTdt6sug2KbWXsoiSOZ9UQgO+28sFwHtU
	FMGfz5Nka+m255DYcUXBWCyCe1QtR3rDSp4UGX5De0djVhQFYM/LmFOuR6g/Dr+GxiHJ
	sYftB2QvaoabExYDESqAsQPDKucWHT8Bmmd1g=
Received: by 10.236.91.67 with SMTP id g43mr44231115yhf.68.1325102182926;
	Wed, 28 Dec 2011 11:56:22 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:33 +0000
Message-Id: <434061cd08c919cbabd78bf875d5f3e24233ef84.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 12/16] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:40 -0000

 * allow udev-cache to be disabled at runtime (using
   /etc/default/udev-cache);

 * make cache invalidated if kernel, bootparams or device list
   changes;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc                |   11 ++++++++++-
 meta/recipes-core/udev/udev/init               |   18 +++++++++++++++---
 meta/recipes-core/udev/udev/udev-cache         |   20 +++++++++++++++++---
 meta/recipes-core/udev/udev/udev-cache.default |    4 ++++
 meta/recipes-core/udev/udev_164.bb             |    2 +-
 5 files changed, 47 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 198336b..a228e5f 100644
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
index c2b491e..5468bd9 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,6 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
@@ -35,9 +36,20 @@ mkdir -p -m 0755 /dev/pts
 mkdir -p -m 1777 /dev/shm
 
 
-if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-	not_first_boot=1
+if [ "$DEVCACHE" != "" ]; then
+	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
+	[ -x /bin/uname ] && /bin/uname -mrspv > /dev/shm/uname || touch /dev/shm/uname
+	[ -r /proc/cmdline ] && cat /proc/cmdline > /dev/shm/cmdline || touch /dev/shm/cmdline
+	[ -r /proc/devices ] && cat /proc/devices > /dev/shm/devices || touch /dev/shm/devices
+	[ -r /proc/atags ] && cat /proc/atags > /dev/shm/atags || touch /dev/shm/atags
+	if [ -e $DEVCACHE ] && \
+		cmp -s /dev/shm/uname /etc/udev/saved.uname && \
+		cmp -s /dev/shm/cmdline /etc/udev/saved.cmdline && \
+		cmp -s /dev/shm/devices /etc/udev/saved.devices && \
+		cmp -s /dev/shm/atags /etc/udev/saved.atags; then
+		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+		not_first_boot=1
+	fi
 fi
 
 # make_extra_nodes
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 77bbda6..d3a7dee 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -9,12 +9,26 @@
 # Short-Description: cache /dev to speedup the udev next boot
 ### END INIT INFO
 
-[ -d /sys/class ] || exit 1
+export TZ=/etc/localtime
+
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -d /sys/class ] || exit 1
+
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 
-if [ ! -e /etc/dev.tar ]; then
-	(cd /; tar cf /etc/dev.tar dev)
+if [ "$DEVCACHE" != "" ]; then
+	echo "Populating dev cache"
+	(cd /; tar cf $DEVCACHE dev)
+	mv /dev/shm/uname /etc/udev/saved.uname
+	mv /dev/shm/cmdline /etc/udev/saved.cmdline
+	mv /dev/shm/devices /etc/udev/saved.devices
+	mv /dev/shm/atags /etc/udev/saved.atags
+else
+	rm -f /dev/shm/uname
+	rm -f /dev/shm/cmdline
+	rm -f /dev/shm/devices
+	rm -f /dev/shm/atags
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



