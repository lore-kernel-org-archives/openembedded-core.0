Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rs3Ir-000079-P3
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:18:38 +0100
Received: by ghbf19 with SMTP id f19so59523ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 18:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5H6nXA0idOnMpVTmXOXuvrXvpqm+mlid2U8ifx5PzZ0=;
	b=Oz1U229BZNfclVzemDrgoPy2Q6M/nHUEMPCHNoAnkN0/dJUEguqMcNcJtF3Z5Ncnys
	RpDtij8NGP6rXpaQ20ASrFOUTAO7oPI7Z9K0sVuaVXF61PepKlu865mJrCw8D5Vc/7F+
	p92dZw5dBwhx9OesoF4JAoOJRfEYnLG51WKEQ=
Received: by 10.236.201.169 with SMTP id b29mr29906872yho.75.1327975844340;
	Mon, 30 Jan 2012 18:10:44 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id m18sm51408634ann.0.2012.01.30.18.10.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 18:10:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 02:10:30 +0000
Message-Id: <ddaf0e6f05439011bf5f04950922d0a6d5cd60b6.1327975625.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
Subject: [PATCH 1/2] udev: improve udev-cache robustness
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
X-List-Received-Date: Tue, 31 Jan 2012 02:18:38 -0000

 * allow udev-cache to be disabled at runtime (using
   /etc/default/udev-cache);

 * make cache invalidated if kernel, bootparams or device list
   changes;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc                |    8 +++++++-
 meta/recipes-core/udev/udev/init               |   15 ++++++++++++---
 meta/recipes-core/udev/udev/udev-cache         |   14 +++++++++++---
 meta/recipes-core/udev/udev/udev-cache.default |    4 ++++
 4 files changed, 34 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 0e571d6..e5fbe40 100644
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
 
@@ -72,6 +73,11 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
 
+	install -d ${D}${sysconfdir}/default
+	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
+
+	touch ${D}${sysconfdir}/udev/cache.data
+
 	install -d ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 6a4464c..f2c7f87 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,6 +14,7 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
 kill_udevd() {
@@ -35,9 +36,17 @@ LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /pro
 [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
 
 
-if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-	not_first_boot=1
+if [ "$DEVCACHE" != "" ]; then
+	# Ensure we are consistent to use the cache
+	echo -n > /dev/shm/cache.data
+	[ -x /bin/uname ] && /bin/uname -mrspv >> /dev/shm/cache.data
+	[ -r /proc/cmdline ] && cat /proc/cmdline >> /dev/shm/cache.data
+	[ -r /proc/devices ] && cat /proc/devices >> /dev/shm/cache.data
+	[ -r /proc/atags ] && cat /proc/atags >> /dev/shm/cache.data
+	if [ -e $DEVCACHE ] && cmp -s /dev/shm/cache.data /etc/udev/cache.data; then
+		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+		not_first_boot=1
+	fi
 fi
 
 # make_extra_nodes
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 77bbda6..f6a43bf 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -9,12 +9,20 @@
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
+	(cd /; tar cf "$DEVCACHE" dev)
+	mv /dev/shm/cache.data /etc/udev/cache.data
+else
+	rm -f /dev/shm/cache.data
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
1.7.2.5



