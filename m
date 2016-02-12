Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 018EC70101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 18:55:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 12 Feb 2016 10:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,436,1449561600"; d="scan'208";a="910925099"
Received: from vagarw3-mobl1.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.252.133.144])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2016 10:55:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 12 Feb 2016 10:55:36 -0800
Message-Id: <1455303337-2957-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/2] rng-tools: Import recipe from meta-openembedded
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
X-List-Received-Date: Fri, 12 Feb 2016 18:55:54 -0000

Adding this recipe to oe-core will allow it to be used by qemu to
provide a way to generate additional entropy needed to fix hangs
with getrandom().

Additional kernel config options have already been added to the
default qemu kernel configs.

[YOCTO #8681]
[YOCOT #8816]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/rng-tools/rng-tools/default |  3 ++
 meta/recipes-support/rng-tools/rng-tools/init    | 49 ++++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb    | 38 ++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/default
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/init
 create mode 100644 meta/recipes-support/rng-tools/rng-tools_5.bb

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
new file mode 100644
index 0000000..7aede9b
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -0,0 +1,3 @@
+# Specify rng device
+#RNG_DEVICE=/dev/hwrng
+RNG_DEVICE=/dev/urandom
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
new file mode 100644
index 0000000..7cf7839
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -0,0 +1,49 @@
+#! /bin/sh 
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/rng-tools and type
+# > update-rc.d rng-tools defaults 60
+#
+
+rngd=/usr/sbin/rngd
+test -x "$rngd" || exit 1
+
+if [ -e /etc/default/rng-tools ]; then
+    . /etc/default/rng-tools
+fi
+
+if [ -n "$RNG_DEVICE" ]; then
+    EXTRA_ARGS="-- -r $RNG_DEVICE"
+fi
+
+
+case "$1" in
+  start)
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    ;;
+  reload|force-reload)
+    echo -n "Signalling rng daemon restart"
+    start-stop-daemon -K -q -s 1 -x $rngd
+    start-stop-daemon -K -q -s 1 -x $rngd
+    ;;
+  restart)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
new file mode 100644
index 0000000..67f53f2
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Random number generator daemon"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0b6f033afe6db235e559456585dc8cdc"
+DEPENDS_append_libc-uclibc = " argp-standalone"
+
+SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
+           file://init \
+           file://default"
+
+SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
+SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
+
+# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
+# manually to avoid unnecessary postinst/preinst generated.
+python () {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+inherit autotools update-rc.d
+
+RDEPENDS_${PN} = "libgcrypt"
+
+do_install_append() {
+    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d "${D}${sysconfdir}/init.d"
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
+            ${D}${sysconfdir}/init.d/rng-tools
+
+        install -d "${D}${sysconfdir}/default"
+        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
+    fi
+}
+
+INITSCRIPT_NAME = "rng-tools"
+INITSCRIPT_PARAMS = "start 30 S . stop 30 0 6 1 ."
-- 
2.5.0


