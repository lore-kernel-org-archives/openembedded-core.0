Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 423 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 May 2017 14:21:19 UTC
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1C59777CCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 14:21:19 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:34172]
	helo=ih3-development-ubuntu-vm.melinkcorp.local)
	by cdptpa-omsmta03 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.6.9.48312 r(Core:3.6.9.0)) with ESMTP
	id C2/36-11165-83CAD195; Thu, 18 May 2017 14:14:18 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 10:10:49 -0400
Message-Id: <1495116649-29398-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 1.9.1
X-RR-Connecting-IP: 107.14.168.88:25
Subject: [PATCH] eudev: Add RREPLACES/RCONFLICTS/PE for udev migration
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
X-List-Received-Date: Thu, 18 May 2017 14:21:21 -0000

Commit e5e540513665105b963262c2eaf33f197a0a36c replaced
udev with eudev on system's using sysvinit for init.
For clean upgrades, some extra variables are needed to
appropriately mark eudev as an update to udev.

 * Add RREPLACES/RCONFLICTS for udev so udev is removed on
   upgrade and the new files are replaced.
 * Commit ca2948a1d4e408bccdfcd43fc8833ea356a74bca added
   RREPLACES/RCONFLICTS for udev-utils when the udev-utils
   package was merged into udev.  Inherit this RREPLACES
   and RCONFLICTS so older systems with udev-utils will
   still upgrade cleanly.
 * The version numbering changed with eudev from a single
   version number to an x.y.z format with a lower version
   number.  The RREPLACES/RCONFLICTS takes care of upgrading
   udev to eudev, but both eudev and udev add the udev-cache
   package.  Since udev-cache can't replace/conflict with
   itself, the PE needs to be incremented for udev-cache
   to upgrade.

Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
---
 meta/recipes-core/udev/eudev_3.2.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/udev/eudev_3.2.1.bb b/meta/recipes-core/udev/eudev_3.2.1.bb
index bdfb544..539945e 100644
--- a/meta/recipes-core/udev/eudev_3.2.1.bb
+++ b/meta/recipes-core/udev/eudev_3.2.1.bb
@@ -8,6 +8,8 @@ DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
 
 PROVIDES = "udev"
 
+PE = "1"
+
 SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
@@ -86,6 +88,10 @@ RRECOMMENDS_${PN} += "udev-cache"
 RPROVIDES_${PN} = "hotplug udev"
 RPROVIDES_eudev-hwdb += "udev-hwdb"
 
+RCONFLICTS_${PN} += "udev udev-utils"
+
+RREPLACES_${PN} += "udev udev-utils"
+
 python () {
     if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
-- 
1.9.1


