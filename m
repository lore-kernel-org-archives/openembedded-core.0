Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19uQi35hmEvxwGUC0QbZ+wVcrjEPqB8pZI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1RLVpj-00028b-Re
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 09:06:04 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id pA27NEL9020817
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 02:23:15 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 02:23:14 -0500
Message-Id: <1320218594-13009-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] udev-164: Update init script to do an explicit add action
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
X-List-Received-Date: Wed, 02 Nov 2011 08:06:04 -0000

With udev 152 or greater the default action for 'udevadm trigger' was
modified to be 'change' instead of 'add.

To ensure initial coldplug events at boot are seen be scripts the are
expecting them as 'add' events we invoke udevadm with an explicit
'--action=add'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-core/udev/udev-164/init |    4 ++--
 meta/recipes-core/udev/udev_164.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev-164/init
index 9ce95ee..073942f 100644
--- a/meta/recipes-core/udev/udev-164/init
+++ b/meta/recipes-core/udev/udev-164/init
@@ -48,10 +48,10 @@ kill_udevd > "/dev/null" 2>&1
 
         /sbin/udevadm control --env=STARTUP=1
 		if [ "$not_first_boot" != "" ];then
-			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+			/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
 			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
 		else
-			/sbin/udevadm trigger
+			/sbin/udevadm trigger --action=add
 			/sbin/udevadm settle
 		fi
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 7cbe4d8..d487add 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.3.4



