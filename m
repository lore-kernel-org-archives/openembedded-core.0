Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CDB437706A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3209U8h009223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Apr 2016 17:09:30 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:20 -0400
Message-ID: <7a4f8ea83a69f03e272844204f1a5fb91df3bc7f.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/4.4: gpio-pca953x: add PCAL9535 interrupt support
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:30 -0000
Content-Type: text/plain

Reverting two previous gpio commits to allow the application of proper
upstream ready patches to add this support:

  08943f2bbd50 gpio-pca953x: add "drive" property
  a517d5b72e76 gpio: pca953x: provide GPIO base based on _UID
  c91063f44368 gpio-pca953x: add PCAL9535 interrupt support
  58f3c9f0ac6d Revert "gpio-pca953x: add "drive" property"
  7abbd5fec15d Revert "gpio: pca953x: provide GPIO base based on _UID"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 48025c48af02..e6a03928b9b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "5ff13cb449701bfeb30ea4a0c4c0b86dc680e219"
+SRCREV_machine ?= "56434a6d9850fd3642bab5cab63d22c6f56d2eae"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 7583f8019f07..2b7e1cb4d723 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 3d6991e8998a..49038caf943e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "19185ca77bc28b0198868f65d6c6c2a92a7ee24c"
-SRCREV_machine_qemuarm64 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_machine_qemumips ?= "0921347362bc9a4f63a62774a68a1b013cdfc5c4"
-SRCREV_machine_qemuppc ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_machine_qemux86 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_machine_qemux86-64 ?= "c43425f73287757a166d74464fddf1f5389c9f59"
-SRCREV_machine_qemumips64 ?= "b09e103786fc1a0622e89bac9df4254e6cb96baa"
-SRCREV_machine ?= "c43425f73287757a166d74464fddf1f5389c9f59"
+SRCREV_machine_qemuarm ?= "03f244ec7482dbc1c924af73a317dd3d12f00132"
+SRCREV_machine_qemuarm64 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine_qemumips ?= "4cd732b14cf4bdb51b7b565783bbc2ce5ab9a943"
+SRCREV_machine_qemuppc ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine_qemux86 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine_qemux86-64 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine_qemumips64 ?= "699473bc2476afa85e47833f0f47aaf44a799257"
+SRCREV_machine ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


