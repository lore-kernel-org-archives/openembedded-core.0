Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE7065D58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 15:16:50 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id sfGn1o00R0BVjqb01fGnSl; Thu, 18 Sep 2014 08:16:48 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Sep 2014 10:16:39 -0500
Message-Id: <1411053399-15548-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH] systemd: disable resolv.conf symlink unless resolved is enabled
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
X-List-Received-Date: Thu, 18 Sep 2014 15:16:58 -0000

The tmpfiles configuration in systemd unconditionally creates a symlink
from /etc/resolv.conf to the location where systemd's resolved service
will place the real file.  This link is only appropriate when resolved
is enabled and running: its presence prevents connman or other systems
from providing a working resolv.conf when systemd is not assigned that
responsibility.  OE has not yet enabled systemd's networkd or resolved
by default.

There is a TODO in the systemd source to fix this, but it has not been
addressed upstream.  This patch comments out the corresponding line when
resolved is not enabled in the package configuration.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 ...es.d-etc.conf-disable-resolv.conf-symlink.patch | 35 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
new file mode 100644
index 0000000..7218322
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
@@ -0,0 +1,35 @@
+From f0ab1600fb56d680e6aba3d0d51dfb9ffa3d9403 Mon Sep 17 00:00:00 2001
+From: "Peter A. Bigot" <pab@pabigot.com>
+Date: Thu, 18 Sep 2014 08:36:54 -0500
+Subject: [PATCH] tmpfiles.d/etc.conf: disable resolv.conf symlink
+
+This link is valid only if ENABLE_RESOLVED is configured for systemd.
+If left unconditional, the symlink is created preventing connman from
+storing the configuration it received from DHCP or other sources.
+
+Upstream has a TODO to fix this, but has not done so as of this date.
+Provide a temporary workaround for OE until this is done properly
+upstream.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+---
+ tmpfiles.d/etc.conf | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tmpfiles.d/etc.conf b/tmpfiles.d/etc.conf
+index b23272c..5364dd8 100644
+--- a/tmpfiles.d/etc.conf
++++ b/tmpfiles.d/etc.conf
+@@ -10,6 +10,7 @@
+ L /etc/os-release - - - - ../usr/lib/os-release
+ L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
+ L+ /etc/mtab - - - - ../proc/self/mounts
+-L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
++# TODO: conditional on ENABLE_RESOLVED
++#L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
+ C /etc/nsswitch.conf - - - -
+ C /etc/pam.d - - - -
+-- 
+1.8.5.5
+
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index 331da99..ebf9395 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '', 'file://0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch', d)} \
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.5.5


