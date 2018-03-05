Return-Path: <quentin.schulz@bootlin.com>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Mar 2018 08:33:02 UTC
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 945277897C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 08:33:02 +0000 (UTC)
Received: by mail.bootlin.com (Postfix, from userid 110)
	id EE8FD207CA; Mon,  5 Mar 2018 09:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost.localdomain
	(LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
	by mail.bootlin.com (Postfix) with ESMTPSA id B4FE92046F;
	Mon,  5 Mar 2018 09:23:03 +0100 (CET)
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 09:22:33 +0100
Message-Id: <20180305082233.8493-1-quentin.schulz@bootlin.com>
X-Mailer: git-send-email 2.14.1
Cc: thomas.petazzoni@bootlin.com
Subject: [PATCH] busybox: mdev: make mdev auto load modules at boot
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
X-List-Received-Date: Mon, 05 Mar 2018 08:33:02 -0000

Thanks to the MODALIAS line at the beginning of mdev.conf, mdev supports
module auto probing on hotplug.

However, this does not work for cold plugged modules (i.e. modules for
devices that were probed before mdev is added as hotplug handler).
Running mdev -s to replay hotplug events does not work in that case.

Let's manually modprobe all modules in the rootfs.

Taken from:
 - https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a6176039c90be67e66c4c2e42
 - https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c595844331684c14f51

We need xargs to support zero termination of args so let's enable this
configuration in the fragment for mdev.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 meta/recipes-core/busybox/busybox/mdev.cfg | 2 ++
 meta/recipes-core/busybox/files/mdev       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-core/busybox/busybox/mdev.cfg
index 6aefe90e43..0d60fc9560 100644
--- a/meta/recipes-core/busybox/busybox/mdev.cfg
+++ b/meta/recipes-core/busybox/busybox/mdev.cfg
@@ -9,3 +9,5 @@ CONFIG_SETSID=y
 CONFIG_CTTYHACK=y
 
 CONFIG_FEATURE_SHADOWPASSWDS=y
+
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index 8c9c06e96c..165b275256 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -9,6 +9,7 @@ touch /dev/mdev.seq
 #sysctl -w kernel.hotplug=/sbin/mdev
 echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
+find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modprobe -abq
 
 #
 # We might have mounted something over /dev, see if /dev/initctl is there.
-- 
2.14.1


