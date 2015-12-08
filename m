Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C322F6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 13:57:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB8DvpHa022547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Dec 2015 05:57:51 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.5.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 8 Dec 2015 05:57:50 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 8 Dec 2015 08:57:48 -0500
Message-ID: <1449583068-5706-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.1: Fix kernel oops on qemuarm boot
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
X-List-Received-Date: Tue, 08 Dec 2015 13:57:52 -0000
Content-Type: text/plain

Backporting two mainline commits to address kernel oops:

   Internal error: Oops: 17 [#1] PREEMPT ARM
   Modules linked in:
   CPU: 0 PID: 42 Comm: jbd2/vda-8 Not tainted 4.1.8-yocto-standard #1
   Hardware name: ARM-Versatile PB
   task: c7223300 ti: c725e000 task.ti: c725e000
   PC is at blk_mq_tag_to_rq+0x24/0x78
   LR is at bt_for_each+0x70/0xc4
   pc : [<c0364458>]    lr : [<c0368118>]    psr: 20000113
   sp : c725fa18  ip : c725fa30  fp : c725fa2c
   r10: c0365ce0  r9 : 00000020  r8 : c7104200
   r7 : c70ee5ac  r6 : 00000001  r5 : 00000021  r4 : c7122da0
   r3 : c7104000  r2 : 00000000  r1 : 00000021  r0 : 00000000
   Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
   Control: 00093177  Table: 072f4000  DAC: 00000017
   Process jbd2/vda-8 (pid: 42, stack limit = 0xc725e190)
   Stack: (0xc725fa18 to 0xc7260000)

[YOCTO #8663]

Signed-off-by: Alimon Limon <anibal.limon@linux.intel.com
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index e569d1658105..6bb38f8c059b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "44fb75fd4731d1169725ac49a305e0913440974f"
+SRCREV_machine ?= "190c42da30140d227cc948ed5fa8fee8467d55f3"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index fe04f51d15ea..cd4f2acff69a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 9553f3d2a7f2..776620261f60 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "817a421e7c1be9c1136da5772f351e77513a1ed2"
-SRCREV_machine_qemuarm64 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
-SRCREV_machine_qemumips ?= "9f244d964a5910244fc82c261c48e1dc0862654b"
-SRCREV_machine_qemuppc ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
-SRCREV_machine_qemux86 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
-SRCREV_machine_qemux86-64 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
-SRCREV_machine_qemumips64 ?= "7fdfaf2387d7896c1ead6a000616e01ce72f0764"
-SRCREV_machine ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_qemuarm ?= "2494184ad34764bdfa1bfd9a57eabfb34d170c0e"
+SRCREV_machine_qemuarm64 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
+SRCREV_machine_qemumips ?= "85a76c24f5aaa99618fdb15d5f3966a2e03cd572"
+SRCREV_machine_qemuppc ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
+SRCREV_machine_qemux86 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
+SRCREV_machine_qemux86-64 ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
+SRCREV_machine_qemumips64 ?= "79181dc5284d9831d240d7ba58a2b574f6528b90"
+SRCREV_machine ?= "2c30f87db7824e90b0b096eee3a5b7f93c84b079"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


