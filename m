Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id DFEB16BF59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:42:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EDg8wF022769
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:42:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EDg8bM029188
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:42:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 08:42:08 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EDg4pn003229;
	Mon, 14 Oct 2013 08:42:06 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Oct 2013 09:31:19 -0500
Message-ID: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Mon, 14 Oct 2013 13:42:07 -0000
Content-Type: text/plain

* While working with a new capacitive touchscreen it was found
  that the existing udev rule that creates the
  /dev/input/touchscreen0 symlink was too restrictive and did not
  match the MODALAIS entry for this touchscreen. which is:

  MODALIAS=input:b0018v0000p0000e0000-e0,1,3,k14A,ra0,1,2F,35,36,39,mlsfw

* By looking at the input_print_modalias function in the Linux
  kernel drivers/input/input.c file and referencing the meaning
  of the evbits and attributes of the input_dev structure it seems
  that for identification of a touchscreen the match with ,18
  which was matching part of the absbit structure is overkill.

* It seems that the absbit entry is used for devices like
  touchscreens and if that the the "a" is followed by 0 and 1 this
  is sufficient.

* So the logic has now been changed to check for the "e" 0 and 3
  values which correspond to EV_SYN and EV_ABS, then check for
  the "a" attribute with 0 and 1.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-core/udev/udev/local.rules |    4 +++-
 meta/recipes-core/udev/udev_182.bb      |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
index 72d92ef..d0cbf91 100644
--- a/meta/recipes-core/udev/udev/local.rules
+++ b/meta/recipes-core/udev/udev/local.rules
@@ -17,5 +17,7 @@
 ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
 
 # Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
+# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
+# has an EV_ABS value (-a) which is used for touchscreen type devices.
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
 
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index d66292e..a90c289 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r7"
+PR = "r8"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.0.4


