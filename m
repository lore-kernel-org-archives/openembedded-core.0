Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q8BuO-0001NC-HR
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:39:32 +0200
Received: by wye20 with SMTP id 20so3339051wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Apr 2011 06:37:23 -0700 (PDT)
Received: by 10.216.240.197 with SMTP id e47mr1987155wer.11.1302269801713;
	Fri, 08 Apr 2011 06:36:41 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w12sm1714045wby.41.2011.04.08.06.36.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 06:36:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Apr 2011 15:36:37 +0200
Message-Id: <1302269797-10600-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Fri, 08 Apr 2011 13:39:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Štetiar <ynezz@true.cz>

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
1.6.6.1



