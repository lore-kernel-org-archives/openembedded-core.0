Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id BB8D26D094
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 19:30:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJUidX027857
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:30:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJUin8008312
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:30:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:30:44 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJUfZX007553;
	Mon, 14 Oct 2013 14:30:42 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Oct 2013 15:20:01 -0500
Message-ID: <1381782001-9897-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Mon, 14 Oct 2013 19:30:45 -0000
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

* More information and history for this can be found at:
    http://patchwork.openembedded.org/patch/25093/
    http://thread.gmane.org/gmane.comp.handhelds.openembedded.core

* This patch mirrors a patch done by:
    Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2:
    * Removed the PR bump
---
 meta/recipes-core/udev/udev/local.rules |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
 
-- 
1.7.0.4


