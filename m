Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsguH-00052g-LL
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 21:35:53 +0100
Received: by yhfq46 with SMTP id q46so830227yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=XkUN/GpbaRCsNTCcJ4eTkgUoVV4maGUADVkelSM17gs=;
	b=Nd02fHHyF7uMU2qQXRyRtUd8Z9Oorng3oyd2jLrMIOsakTco0D4b5yayz1LIXuOfvz
	gtzTMMDJFAncR4ZbBg0q/2wki7LRJvD6WC4L/2ORJHfQUclQiavrmWbOTlc6lBuazyp8
	jN1cOdI4kVEH229TMBTKXSewZsv+LSk/aRm8Y=
Received: by 10.236.186.98 with SMTP id v62mr72712yhm.22.1328128078062;
	Wed, 01 Feb 2012 12:27:58 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id a39sm120200yhk.15.2012.02.01.12.27.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 12:27:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 20:27:43 +0000
Message-Id: <34ff170a1283803aae432bf8eb179225aa41c898.1328127940.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 01 Feb 2012 20:35:53 -0000

 * allow udev-cache to be disabled at runtime (using
   /etc/default/udev-cache);

 * make cache invalidated if kernel, bootparams or device list
   changes;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/udev.inc                |    8 +++++-
 meta/recipes-core/udev/udev/init               |   33 +++++++++++++++++++++--
 meta/recipes-core/udev/udev/udev-cache         |   14 ++++++++--
 meta/recipes-core/udev/udev/udev-cache.default |    4 +++
 4 files changed, 52 insertions(+), 7 deletions(-)
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
index 6a4464c..78b5b1c 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -14,8 +14,19 @@ export TZ=/etc/localtime
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
 [ -x /sbin/udevd ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
+readfile () {
+   filename=$1
+   READDATA=""
+   if [ -r $filename ]; then
+       while read line; do
+           READDATA="$READDATA$line"
+       done < $filename
+   fi
+}
+
 kill_udevd() {
 	if [ -x /sbin/pidof ]; then
 		pid=`/sbin/pidof -x udevd`
@@ -34,10 +45,26 @@ LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /pro
 [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
 [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
 
+# cache handling
+if [ "$DEVCACHE" != "" ]; then
+	readfile /proc/version
+	VERSION="$READDATA"
+	readfile /proc/cmdline
+	CMDLINE="$READDATA"
+	readfile /proc/devices
+	DEVICES="$READDATA"
+	readfile /proc/atags
+	ATAGS="$READDATA"
 
-if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
-	not_first_boot=1
+	if [ -e $DEVCACHE ]; then
+		readfile /etc/udev/cache.data
+		if [ "$READDATA" = "$VERSION$CMDLINE$DEVICES$ATAGS" ]; then
+			(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+			not_first_boot=1
+		fi
+
+		echo "$VERSION$CMDLINE$DEVICES$ATAGS" > /dev/shm/udev.cache
+	fi
 fi
 
 # make_extra_nodes
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 77bbda6..9c24e76 100644
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
+	mv /dev/shm/udev.cache /etc/udev/cache.data
+else
+	rm -f /dev/shm/udev.cache
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



