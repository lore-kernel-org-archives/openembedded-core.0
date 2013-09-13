Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2545461586
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:18:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2013 14:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,900,1371106800"; d="scan'208";a="403075398"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2013 14:18:09 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Fri, 13 Sep 2013 21:16:44 +0000
Message-Id: <10c0d68751b1addbc8992f8fd1c94a6414cb6991.1379106339.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1379106339.git.nitin.a.kamble@intel.com>
References: <cover.1379106339.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] udev: avoid autosuspend of USB input devices
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
X-List-Received-Date: Fri, 13 Sep 2013 21:18:19 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Some of the external USB devices has internal USB hub, which
make them look like "fixed" rather than "removable". And USB
autosuspend does not work with some of these devices resulting
in inoperable pointing device.

Now the code detect these false "fixed" devices by looking at their
parents.  If any of their parent is "removable", then USB autosuspend
is not enabled for that device, which keeps the pointing device
functional.

Fixes bug:
[YOCTO #5166]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/udev.inc                    |  1 +
 .../udev/udev/avoid-mouse-autosuspend.patch        | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 6606707..2ff8f00 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -17,6 +17,7 @@ RPROVIDES_${PN} = "hotplug"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
+           file://avoid-mouse-autosuspend.patch \
            file://run.rules \
            file://udev.rules \
            file://devfs-udev.rules \
diff --git a/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch b/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
new file mode 100644
index 0000000..2c31b33
--- /dev/null
+++ b/meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
@@ -0,0 +1,25 @@
+Source: http://cgit.freedesktop.org/systemd/systemd/commit/rules/42-usb-hid-pm.rules?id=e0386cf2809219bbdd30895f46f1f567b56902b6
+
+Some USB ports on external hubs may be reported as "fixed". We only want
+to auto-enable this on ports that are internal to the machine, so check
+the parent state as well.
+
+Upstream-Status: backport
+
+Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+2013/09/13
+
+Index: udev-182/rules/42-usb-hid-pm.rules
+===================================================================
+--- udev-182.orig/rules/42-usb-hid-pm.rules
++++ udev-182/rules/42-usb-hid-pm.rules
+@@ -46,4 +46,9 @@ ACTION=="add", SUBSYSTEM=="usb", ATTRS{i
+ ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="14dd", ATTR{idProduct}="0002", TEST=="power/control", ATTR{power/control}="auto"
+
+ # USB HID devices that are internal to the machine should also be safe to autosuspend
++# And skip it for devices which are external but say "fixed"
++ACTION=="add", SUBSYSTEM=="usb", SUBSYSTEMS=="usb", ATTRS{removable}=="removable", GOTO="usb_hid_pm_end"
++ACTION=="add", SUBSYSTEM=="usb", SUBSYSTEMS=="usb", ATTRS{removable}=="unknown", GOTO="usb_hid_pm_end"
+ ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="03", ATTRS{removable}=="fixed", TEST=="../power/control", ATTR{../power/control}="auto"
++LABEL="usb_hid_pm_end"
++
-- 
1.8.1.4


