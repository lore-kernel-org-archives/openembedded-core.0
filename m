Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPbNq-0006CZ-B0
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:26:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Apr 2013 09:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="316668807"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.7])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2013 09:08:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 09:08:50 -0700
Message-Id: <1365523730-15141-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] udev: fix init script for the location of udevd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 16:27:00 -0000

Ensure we can update the script base don the location of the udevd installation

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev.inc        | 2 ++
 meta/recipes-core/udev/udev/init       | 4 ++--
 meta/recipes-core/udev/udev/udev-cache | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index c4d2ce4..d025458 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -79,6 +79,8 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
+	sed -i s%@UDEVD@%${base_sbindir}/udev/udevd% ${D}${sysconfdir}/init.d/udev
+	sed -i s%@UDEVD@%${base_sbindir}/udev/udevd% ${D}${sysconfdir}/init.d/udev-cache
 
 	install -d ${D}${sysconfdir}/default
 	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 95d2672..37b5231 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -15,7 +15,7 @@ export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
-[ -x /lib/udev/udevd ] || exit 1
+[ -x @UDEVD@ ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
@@ -71,7 +71,7 @@ case "$1" in
 
     # trigger the sorted events
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-    /lib/udev/udevd -d
+    @UDEVD@ -d
 
     /usr/bin/udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 0f3d7cd..01fec6e 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -12,7 +12,7 @@
 export TZ=/etc/localtime
 
 [ -r /proc/mounts ] || exit 1
-[ -x /lib/udev/udevd ] || exit 1
+[ -x @UDEVD@ ] || exit 1
 [ -d /sys/class ] || exit 1
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
-- 
1.8.0.2



