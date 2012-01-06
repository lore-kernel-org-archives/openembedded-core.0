Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mX-0004Ld-DE
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004484"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:28 -0800
Message-Id: <00b5db24487ea0206bd82e332006ee0af6c0f21a.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325836241.git.sgw@linux.intel.com>
References: <cover.1325836241.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/25] udev: improve udev-cache robustness
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
X-List-Received-Date: Fri, 06 Jan 2012 08:04:12 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

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
 4 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 0e571d6..65000b7 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://network.sh \
            file://local.rules \
            file://udev-cache \
+           file://udev-cache.default \
            file://init"
 
 inherit autotools pkgconfig update-rc.d
@@ -58,7 +59,7 @@ FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
 FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
-FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
+FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
 FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
 
@@ -72,6 +73,14 @@ do_install_append () {
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
index 6a4464c..3e6e062 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,6 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
@@ -35,9 +36,20 @@ LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /pro
 [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
 
 
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
-- 
1.7.6.4



