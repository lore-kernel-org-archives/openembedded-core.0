Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Te9Mo-00073y-J6
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 20:01:46 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qATIlSG8007682;
	Thu, 29 Nov 2012 10:47:28 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 29 Nov 2012 13:47:10 -0500
Message-Id: <95dea7dbc322061f976f9462bd8806c3193105f6.1354214590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354214590.git.bruce.ashfield@windriver.com>
References: <cover.1354214590.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1354214590.git.bruce.ashfield@windriver.com>
References: <cover.1354214590.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: move PREEMPT_NONE to beagleboard standard kernel only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 19:01:47 -0000

A recent report of the preempt-rt beagleboard kernel not enabling full
-rt preemption out of the box revealed that the existing fix for SD
boot issues (which were fixed by disabling preemption) was the root
cause for the options not being enabled.

Although the fix for the SD card detection issues is still valid, it
also doesn't make sense to apply it to a kernel type that only exists
to support enhanced preemption. Since many variants of the board boot
with preemption enabled, opening the possibility of a boot problem is
acceptable, given that it allows the -rt kernel to be used.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 76ee542..e0800ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "2572b13999da8129c37eb2bf7e9a8fa68dc2a4bf"
 SRCREV_machine_qemuppc ?= "2004632314104d4f31bb1577e955da53796f517c"
-SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
+SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 50890a3..ab214c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.18"
 KMETA = "meta"
 
 SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
+SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 647244a..bb3c860 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "ae8e2cd14e47bceb9c2bdcb927b3a0ea61f6c311"
 SRCREV_machine_qemux86 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine_qemux86-64 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "1c5980714d482f8ccb72909b40f3e1467a3fd590"
+SRCREV_meta ?= "4e5f2b43acfbdb924edbdf42a816e3e2b15203b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4



