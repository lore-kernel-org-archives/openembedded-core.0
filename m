Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UcDbz-0003ls-UN
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 13:41:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2013 04:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,670,1363158000"; d="scan'208";a="337334995"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2013 04:23:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 14:23:29 +0300
Message-Id: <1368530609-11218-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: make udev-hwdb postinstall run on host
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
X-List-Received-Date: Tue, 14 May 2013 11:42:08 -0000

Run udevadm inside qemu in order to create the HW database index on
host.

The alternative would be to build a native version
of udevadm which would imply several things: split out systemd recipe,
create a common inc file and create a new recipe for udevadm native.

However, this latter solution might also add up to the build time
(the native recipe would need to run configure, make udevadm, install),
besides the time spent in the actual postinstall...

So, having the postinstall run through qemu is a good trade-off.

[YOCTO #4341]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/systemd/systemd_199.bb |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index fadc385..b1cc046 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -11,12 +11,12 @@ PROVIDES = "udev"
 PE = "1"
 PR = "r4"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -280,10 +280,11 @@ ALTERNATIVE_PRIORITY[poweroff] ?= "300"
 
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		exit 1
+		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+			--root $D
+	else
+		udevadm hwdb --update
 	fi
-
-	udevadm hwdb --update
 }
 
 pkg_prerm_udev-hwdb () {
-- 
1.7.9.5



