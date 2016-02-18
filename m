Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF71F731A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 21:56:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1ILuOA7026525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 13:56:24 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 18 Feb 2016 13:56:24 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 16:56:23 -0500
Message-ID: <5c474443530545e9527c4dde835cbb5da59cd192.1455832352.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455832352.git.bruce.ashfield@windriver.com>
References: <cover.1455832352.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/4.1: capabilities backports
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
X-List-Received-Date: Thu, 18 Feb 2016 21:56:26 -0000
Content-Type: text/plain

Backporting the following upstream commits to the 4.1 yocto tree:

   bdf4565e5dcc capabilities: add a securebit to disable PR_CAP_AMBIENT_RAISE
   2483c95caedc selftests/capabilities: Add tests for capability evolution
   4c274aa74e5d capabilities: ambient capabilities

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 52a8a7f33542..3dd8959895df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "c0e9b50e9f871ae73a3efafebf2fe1ceb0adbe85"
+SRCREV_machine ?= "132d72a980837eccc082d5dfb9c5eb5596611b0b"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index d0970cb4c86d..4fde066eebbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.17"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 12e1b82029ed..9f3ad5c66381 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5f2bc8d122ac2247d5a01025f73d09ae723efb21"
-SRCREV_machine_qemuarm64 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
-SRCREV_machine_qemumips ?= "6e4bc756e0289b9f1869bfb5d84f033df2437d0b"
-SRCREV_machine_qemuppc ?= "a5327464dad92042f79dd5fb12523d16780980fb"
-SRCREV_machine_qemux86 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
-SRCREV_machine_qemux86-64 ?= "a5327464dad92042f79dd5fb12523d16780980fb"
-SRCREV_machine_qemumips64 ?= "e83d6e6fcfc04591109e470e55532d25a2a1bef1"
-SRCREV_machine ?= "a5327464dad92042f79dd5fb12523d16780980fb"
+SRCREV_machine_qemuarm ?= "fc38bc54e15ab2943507b63e740c576f5537fbc0"
+SRCREV_machine_qemuarm64 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine_qemumips ?= "d7d76bf246979d635990a05961886292ddcb5600"
+SRCREV_machine_qemuppc ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine_qemux86 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine_qemux86-64 ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
+SRCREV_machine_qemumips64 ?= "84dd3ffed15ebb59e6d396343ced2450f0f10379"
+SRCREV_machine ?= "bdf4565e5dcc1ad65e26cebdff7bf427289f1d61"
 SRCREV_meta ?= "79dbb64d9e179718369a7a5c7b364fda9936571f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


