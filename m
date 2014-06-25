Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id C795960424
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 16:20:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7Q007JTG1ESD00@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 25 Jun 2014 11:20:03 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B05432009B; Wed,
	25 Jun 2014 12:20:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2014 12:19:55 -0400
Message-id: <1403713196-22214-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [daisy][PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Wed, 25 Jun 2014 16:20:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Make probing of "platform" bus conditional based on PROBE_PLATFORM_BUS
variable from /etc/default/udev-cache on subsequent boots when udev
cache is used. PROBE_PLATFORM_BUS has to be set to "yes" in order to
force probing on every boot, otherwise it uses the old default behaviour
of probing it just the first time.

This is helpful on modern SoCs where most of the low level peripheral
drivers are registered on the platform bus and need to be probed to load
the necessary modules and enable the connected buses and subsystems.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Backport from OE-Core/master 70a695735e0a7d14448f2f5a9986bfe105210a91]
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-core/udev/udev/init | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 410a650..f2c84d5 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -102,7 +102,12 @@ case "$1" in
 
     udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
-            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            if [ "$PROBE_PLATFORM_BUS" != "yes" ]; then
+                PLATFORM_BUS_NOMATCH="--subsystem-nomatch=platform"
+            else
+                PLATFORM_BUS_NOMATCH=""
+            fi
+            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus --subsystem-nomatch=graphics --subsystem-nomatch=backlight --subsystem-nomatch=video4linux $PLATFORM_BUS_NOMATCH
             (udevadm settle --timeout=3; udevadm control --env=STARTUP=)&
     else
             udevadm trigger --action=add
-- 
2.0.0


