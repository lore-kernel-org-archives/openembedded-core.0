Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TdLoH-0001K3-3x
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 15:06:49 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qARCvTFE031277;
	Tue, 27 Nov 2012 06:57:31 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:57:18 +0500
Message-Id: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
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
X-List-Received-Date: Tue, 27 Nov 2012 14:06:49 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

From udev 174 changelog:
"The udev daemon moved to /lib/udev/udevd. Non-systemd init systems
and non-dracut initramfs image generators need to change the init
scripts. Alternatively the udev build needs to move udevd back to
/sbin or create a symlink in /sbin, which is not done by default."

Also for 64 bit architectures there exists /lib64/udev instead of
/lib/udev and current init script fails to start udev.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-core/udev/udev.inc    |    4 ++++
 meta/recipes-core/udev/udev/init   |    4 ++--
 meta/recipes-core/udev/udev_182.bb |    2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..a882efe 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -96,5 +96,9 @@ do_install_append () {
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
+        # Create a symlink of /lib/udev/udevd in /sbin
+        install -d ${D}${base_sbindir}
+        ln -s ..${base_libdir}/udev/udevd ${D}${base_sbindir}/udevd
+
 	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 74449fe..84631ac 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -13,7 +13,7 @@ export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
-[ -x /lib/udev/udevd ] || exit 1
+[ -x /sbin/udevd ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
@@ -69,7 +69,7 @@ kill_udevd > "/dev/null" 2>&1
 
 # trigger the sorted events
 echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-/lib/udev/udevd -d
+/sbin/udevd -d
 
 /usr/bin/udevadm control --env=STARTUP=1
 if [ "$not_first_boot" != "" ];then
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index c41de9f..0ae9f8c 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r2"
+PR = "r3"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.9.5



