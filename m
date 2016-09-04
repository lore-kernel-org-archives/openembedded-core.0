Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C61927725D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:26:09 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown
	[IPv6:2601:602:8802:504f:3e97:eff:fe92:db3b])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8AED65C0644;
	Sun,  4 Sep 2016 22:21:00 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Sep 2016 13:25:55 -0700
Message-Id: <20160904202555.30636-1-stefan@agner.ch>
X-Mailer: git-send-email 2.9.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1473020461; bh=qt1NboPhGJPafb3iDpOJ9fESrEOyv1YdcxSJ4U+qDD8=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=hiiE7N5hwCAhtGABNZer1eP50+aJzZvbeLcBpurM4emnstO0A9J6pTUUrpCt9FCARmwOF1FoGSMRQByu50FXoB316YbQ+oNsRAasVRWCPLsBV1yfybi1i8kgzkysuPxX1plerMeK5rAMNJwL1hg9m5qrLaf/WVXp5CKbG1k8qgU=
Subject: [PATCH] busybox: avoid circular dependency when using initramfs
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
X-List-Received-Date: Sun, 04 Sep 2016 20:26:13 -0000

The kernel does not automatically mount devtmpfs when using initramfs
based booting (even when using CONFIG_DEVTMPFS_MOUNT). If the rootfs
is built with USE_DEVFS=1 (which is the default), the system ends up
with a completely empty /dev to begin with.

Busybox uses the first entry in inittab slightly different than
other init systems:
<id>: WARNING: This field has a non-traditional meaning for BusyBox init!

The id field is used by BusyBox init to specify the controlling tty for
the specified process to run on.  The contents of this field are
appended to "/dev/" and used as-is.

Since /dev/null is not there yet, Busybox throws errors instead of
executing the commands, and hence never mounts devtmpfs:
init started: BusyBox v1.24.1 (2016-09-04 11:53:14 PDT)
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory
can't open /dev/null: No such file or directory

Avoid this circular dependency by not specifing <id>. With that
Busybox ends up using the stdio of the init process and executes
the inittab just fine.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 meta/recipes-core/busybox/files/inittab | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
index bfec4a7..2bc831c 100644
--- a/meta/recipes-core/busybox/files/inittab
+++ b/meta/recipes-core/busybox/files/inittab
@@ -1,13 +1,13 @@
 # This is run first except when booting in single-user mode.
 
 # Startup the system
-null::sysinit:/bin/mount -t proc proc /proc
-null::sysinit:/bin/mount -t sysfs sysfs /sys
-null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
-null::sysinit:/bin/mount -o remount,rw /
-null::sysinit:/bin/mkdir -p /dev/pts
-null::sysinit:/bin/mount -t devpts devpts /dev/pts
-null::sysinit:/bin/mount -a
+::sysinit:/bin/mount -t proc proc /proc
+::sysinit:/bin/mount -t sysfs sysfs /sys
+::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
+::sysinit:/bin/mount -o remount,rw /
+::sysinit:/bin/mkdir -p /dev/pts
+::sysinit:/bin/mount -t devpts devpts /dev/pts
+::sysinit:/bin/mount -a
 
 ::sysinit:/etc/init.d/rcS
 
-- 
2.9.0


