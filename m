Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlZ-0001ob-8w
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 00:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="632520101"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 00:24:37 -0700
Message-Id: <39b875bdd34b34a6847b99e24d49a453f911465c.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 15:36:37 +0200
MIME-Version: 1.0
Date: Fri, 22 Apr 2011  0:24:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 08/33] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>

In the current state, udev init script is loaded as 3rd and modutils.sh as
20th, so udevadm called in udev init script loads all kernel modules in some
unpredictable order, not honoring in any way specified order of modules in
/etc/modules. This causes some troubles mainly in the first boot. So to fix
this we now move loading of the kernel modules just before we exec udev init
script. Example of the current state:

	Starting udev
	rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc0
	rtc-m48t86 rtc-m48t86: battery ok
	ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc1

	root@ts72xx:~# cat /etc/modules
	rtc-ep93xx
	ohci-hcd
	ts72xx_sbcinfo
	rtc-m48t86

As you can guess, this is really wrong behaviour, because I've rtc1 as the
main time source for my system.

	root@ts72xx:~# cat /etc/default/hwclock
	HWCLOCKACCESS=yes
	HWCLOCKDEVICE=/dev/rtc1

Expected behaviour with this patch applied:

	Please wait: booting...
	ep93xx-rtc ep93xx-rtc: rtc core: registered ep93xx-rtc as rtc0
	usbcore: registered new device driver usb
	ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
	...
	rtc-m48t86 rtc-m48t86: rtc core: registered m48t86 as rtc1
	rtc-m48t86 rtc-m48t86: battery ok
	Starting udev

Signed-off-by: Petr Štetiar <ynezz@true.cz>

(based on http://patches.openembedded.org/patch/1917/)
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../modutils/modutils-initscripts.bb               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/modutils/modutils-initscripts.bb b/meta/recipes-kernel/modutils/modutils-initscripts.bb
index 1665955..5ae34b4 100644
--- a/meta/recipes-kernel/modutils/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils/modutils-initscripts.bb
@@ -4,10 +4,10 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
 SRC_URI = "file://modutils.sh \
 	   file://PD.patch"
-PR = "r4"
+PR = "r5"
 
 INITSCRIPT_NAME = "modutils.sh"
-INITSCRIPT_PARAMS = "start 20 S ."
+INITSCRIPT_PARAMS = "start 2 S ."
 
 inherit update-rc.d
 
-- 
1.7.1



