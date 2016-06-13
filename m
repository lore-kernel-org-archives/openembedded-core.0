Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17C8E60248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5DFueqj014934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 08:56:40 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:33 -0400
Message-ID: <ea4dd48011587de4c9f9b08e3dc54d8f43aa9870.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/4.1: intel_idle: backport BXT CPU support
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:41 -0000
Content-Type: text/plain

Integrating upstream changes for intel_idle to support BXT CPU.

   Dasaratharaman Chandramouli (1):
     intel_idle: Support for Intel Xeon Phi Processor x200 Product Family

   Len Brown (4):
     intel_idle: Skylake Client Support
     intel_idle: Skylake Client Support - updated
     intel_idle: prevent SKL-H boot failure when C8+C9+C10 enabled
     intel_idle: add BXT support

Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 7cd18e0c7b66..ce19bd43459b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec9e847b58017b62931bc4fbf7c968da5b0297cf"
+SRCREV_machine ?= "0ebcfeb720baaf05db903467d544c88238ef85f2"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 5b1b87f82840..54a932377b1d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 4023c9b98ece..c1d9f093449c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fa1f75003687404ebe8a07c967db1714c700f9ff"
-SRCREV_machine_qemuarm64 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
-SRCREV_machine_qemumips ?= "0e2b4693ec90691494752ff7854493f3c7f3fc2f"
-SRCREV_machine_qemuppc ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
-SRCREV_machine_qemux86 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
-SRCREV_machine_qemux86-64 ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
-SRCREV_machine_qemumips64 ?= "ca5c9e5ee5e3b569a55beb05e2f81078d3db2cef"
-SRCREV_machine ?= "f1069e0dbbc09f930ba8941e38859378ccc22f96"
+SRCREV_machine_qemuarm ?= "5e6960c60bf7c107978312f7e590bdec6676ceb2"
+SRCREV_machine_qemuarm64 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine_qemumips ?= "9c00d4cf09030ff438033ae094615894f3290628"
+SRCREV_machine_qemuppc ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine_qemux86 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine_qemux86-64 ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
+SRCREV_machine_qemumips64 ?= "9aaa4d26a05a1816383a1e1dbc11de5830458eec"
+SRCREV_machine ?= "49719d35dca0562ab3e67f37de0d4430dad68a78"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


