Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D21971633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 17:22:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 03 Nov 2015 09:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,239,1444719600"; d="scan'208";a="593317222"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2015 09:22:36 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D36FF6A4083;
	Tue,  3 Nov 2015 09:21:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Nov 2015 19:22:30 +0200
Message-Id: <1446571350-7902-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemu-native: fix build on Ubuntu 15.10
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
X-List-Received-Date: Tue, 03 Nov 2015 17:22:39 -0000

Build of qemu-native on Ubuntu 15.10 fails on configure step.
The reason for this is that system dbus version is higher than
oe dbus version and system pulseaudio libraries require newer dbus.

It causes configure to break with a lot of errors similar to this:
  libpulsecommon-6.0.so: undefined reference to dbus_watch_get_enabled@LIBDBUS_1_3

Fixed by building qemu-native with the system dbus on Ubuntu 15.10

Note: This is a workaround. It must be removed when oe dbus is upgraded
to the version >= system dbus version (1.10.0 at the moment).

[YOCTO #8553]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index abbace8..b17da2f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,12 @@ do_configure_prepend_class-native() {
 	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
 	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
 		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+		# link with system dbus on Ubuntu 15.10
+		# FIXME: remove below 4 lines when oe dbus is upgraded
+		if [ -r /etc/lsb-release -a "$(lsb_release -is)$(lsb_release -rs)" = "Ubuntu15.10" ] ; then
+			libs=$(PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_PATH=$BHOST_PKGCONFIG_PATH PATH=/usr/bin:/bin pkg-config --libs dbus-1 || echo "")
+			[ -n "$libs" ] && export LDFLAGS="$libs $LDFLAGS"
+		fi
 	fi
 }
 
-- 
2.1.4


