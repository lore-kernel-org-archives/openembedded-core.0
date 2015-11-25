Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3DBF6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:42:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPDg1ko029533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Nov 2015 05:42:02 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 05:42:01 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 25 Nov 2015 08:41:56 -0500
Message-ID: <7d37b391bff6cbd7836c3c2fefef39c5e589afa3.1448458595.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448458595.git.bruce.ashfield@windriver.com>
References: <cover.1448458595.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/4.1: Bluetooth:Fix the connection fail of 6lowpan over BT LE
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
X-List-Received-Date: Wed, 25 Nov 2015 13:42:07 -0000
Content-Type: text/plain

Backporting the 4.4 fix for 6lowpan:

   Author: Wu Zheng <wu.zheng@intel.com>
   Date:   Fri Nov 20 13:25:57 2015 +0800

       Bluetooth:Fix the connection fail of 6lowpan over BT LE

       When two devices with 6lowpan over BT LE connect each other,
       6lowpan over BT LE channel is set up between the two devices.
       However, the status of channel is not right.
       It always is set to CONNECTED and the channel can't be created.

       The status of channel need to be removed when connection is created.

       (The patch's reference from
       b0c09f94ff1660a1873549b788c998284ea5fb8a)

       Signed-off-by: Wu Zheng <wu.zheng@intel.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index d4ac038dd33e..e569d1658105 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "45780656ed0c04f0e70a089ff229a7b0a9af3414"
+SRCREV_machine ?= "44fb75fd4731d1169725ac49a305e0913440974f"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 1d8086c96018..fe04f51d15ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 99c73ddcd8d1..9553f3d2a7f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5039adac938a19aa547f94551126a8421ce62745"
-SRCREV_machine_qemuarm64 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
-SRCREV_machine_qemumips ?= "203b315e50e32ce39f9831b0518ef18f16f61025"
-SRCREV_machine_qemuppc ?= "ec44c165aa1d30bde477196ee428d82530e55485"
-SRCREV_machine_qemux86 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
-SRCREV_machine_qemux86-64 ?= "ec44c165aa1d30bde477196ee428d82530e55485"
-SRCREV_machine_qemumips64 ?= "9223cd7daecddcbdb0818aaa6edfbd90060d1b84"
-SRCREV_machine ?= "ec44c165aa1d30bde477196ee428d82530e55485"
+SRCREV_machine_qemuarm ?= "817a421e7c1be9c1136da5772f351e77513a1ed2"
+SRCREV_machine_qemuarm64 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_qemumips ?= "9f244d964a5910244fc82c261c48e1dc0862654b"
+SRCREV_machine_qemuppc ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_qemux86 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_qemux86-64 ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
+SRCREV_machine_qemumips64 ?= "7fdfaf2387d7896c1ead6a000616e01ce72f0764"
+SRCREV_machine ?= "c22dc676d6d560d0b2a316283a514d65d2a510e4"
 SRCREV_meta ?= "30c4b4bd79c5d774de6dcf23d0deab554e31f3d4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


