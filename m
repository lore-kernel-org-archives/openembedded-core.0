Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SEp8N-0003sE-AC
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:49:55 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD08DE8485; Mon, 2 Apr 2012 23:35:15 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 23:35:13 +0200
Message-Id: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Mon, 02 Apr 2012 21:49:55 -0000

* The actual rule only works for devices reporting ts pressure
* and ignores the other touchscreens (happens e.g. on ipaq h1940).
* a0,1,*18   a = absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE 0x18)
* (see include/linux/input.h)
*
* Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y are mandatory
* (http://kernel.org/doc/Documentation/input/event-codes.txt)
*
* Bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/udev/udev/local.rules |    3 +--
 meta/recipes-core/udev/udev_164.bb      |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
index 625e49a..49e8d28 100644
--- a/meta/recipes-core/udev/udev/local.rules
+++ b/meta/recipes-core/udev/udev/local.rules
@@ -31,5 +31,4 @@ KERNEL=="rtc0", SYMLINK+="rtc"
 ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
-
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index c5813ec..0462ff2 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.3.4



