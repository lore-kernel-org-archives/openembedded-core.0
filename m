Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6B1673192
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5DFufiG005635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 08:56:42 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:34 -0400
Message-ID: <5f8bc19adb927eed28e4701ad4d1419866eef01e.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.1: Always Running Timer Support
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:43 -0000
Content-Type: text/plain

Backporting mainline patches to add always running timer support (ART).

The main advantage of ART is that ART can be captured
simultaneous to the capture of audio and network device clocks,
allowing a correlation between timebases to be constructed.

   Arnd Bergmann (1):
     ntp/pps: replace getnstime_raw_and_real with 64-bit version

   Christopher S. Hall (4):
     time: Add cycles to nanoseconds translation
     time: Add timekeeping snapshot code capturing system time and counter
     time: Add driver cross timestamp interface for higher precision time synchronization
     x86/tsc: Always Running Timer (ART) correlated clocksource

   DengChao (1):
     timekeeping: Provide internal function __ktime_get_real_seconds

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index ce19bd43459b..c609ddc92c3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0ebcfeb720baaf05db903467d544c88238ef85f2"
+SRCREV_machine ?= "e34d6198589347504e6c8451fc999908f9ce4752"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 54a932377b1d..acdb0dc3c52a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index c1d9f093449c..c785354695a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5e6960c60bf7c107978312f7e590bdec6676ceb2"
-SRCREV_machine_qemuarm64 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
-SRCREV_machine_qemumips ?= "9c00d4cf09030ff438033ae094615894f3290628"
-SRCREV_machine_qemuppc ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
-SRCREV_machine_qemux86 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
-SRCREV_machine_qemux86-64 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
-SRCREV_machine_qemumips64 ?= "9aaa4d26a05a1816383a1e1dbc11de5830458eec"
-SRCREV_machine ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine_qemuarm ?= "5049ec1a05cf7c9ff19c892b42d67f17974d3a96"
+SRCREV_machine_qemuarm64 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine_qemumips ?= "c01dfca5d22960a5b9e4aa47d9c062ecbded5857"
+SRCREV_machine_qemuppc ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine_qemux86 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine_qemux86-64 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine_qemumips64 ?= "b8342b84b3a914651c86f3ae463e4f8c6de36da0"
+SRCREV_machine ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


