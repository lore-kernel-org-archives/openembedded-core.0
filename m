Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4316978872
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 00:25:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 17:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,332,1517904000"; d="scan'208";a="43512820"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2018 17:25:19 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 17:25:11 -0700
Message-Id: <20180320002511.17233-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] xserver-xorg: import distro patch to use modesetting driver on newer hardware
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
X-List-Received-Date: Tue, 20 Mar 2018 00:25:18 -0000

Debian and Fedora both carry this patch, and the xf86-video-modesetting
driver seems better on recent hardware.

As an example, on a NUC6CAYS, the x11perf -aa10text and -rgb10text tests
see around a 20x increase.

[YOCTO #12019]
[YOCTO #12390]

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 ...c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 53 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.6.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
new file mode 100644
index 00000000000..d05eec5bb92
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -0,0 +1,53 @@
+From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From: California Sullivan <california.l.sullivan@intel.com>
+Date: Fri, 16 Mar 2018 17:23:11 -0700
+Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
+
+Use intel ddx only on pre-gen4 hw, newer ones will fall back to modesetting
+Author: Timo Aaltonen <tjaalton@debian.org>
+
+Instead of defaulting to the Intel driver for all Intel hardware, only
+default it for older hardware for which it has shown to be better for.
+
+Others fall through to the -modesetting default.
+
+Upstream-Status: Pending [Debian/Fedora patch
+https://src.fedoraproject.org/rpms/xorg-x11-server/c/ee515e44b07e37689abf48cf2fffb41578f3bc1d]
+
+Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
+---
+ hw/xfree86/common/xf86pciBus.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xfree86/common/xf86pciBus.c b/hw/xfree86/common/xf86pciBus.c
+index e61ae0cd4..d70c99197 100644
+--- a/hw/xfree86/common/xf86pciBus.c
++++ b/hw/xfree86/common/xf86pciBus.c
+@@ -1173,7 +1173,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev,
+ 		case 0x0bef:
+ 			/* Use fbdev/vesa driver on Oaktrail, Medfield, CDV */
+ 			break;
+-		default:
++		/* Default to intel only on pre-gen4 chips */
++		case 0x3577:
++		case 0x2562:
++		case 0x3582:
++		case 0x358e:
++		case 0x2572:
++		case 0x2582:
++		case 0x258a:
++		case 0x2592:
++		case 0x2772:
++		case 0x27a2:
++		case 0x27ae:
++		case 0x29b2:
++		case 0x29c2:
++		case 0x29d2:
++		case 0xa001:
++		case 0xa011:
+ 			driverList[0] = "intel";
+ 			break;
+         }
+-- 
+2.14.3
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
index 76a4990427b..c680cf9e89b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
+            file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             "
 SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
 SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
-- 
2.14.3


