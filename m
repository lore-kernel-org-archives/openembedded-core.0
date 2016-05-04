Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4693D70100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u44HrHuW003312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 May 2016 10:53:17 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:04 -0400
Message-ID: <f8cad13db00c545493ba26ee9dc613bc9e380799.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1462383941.git.bruce.ashfield@windriver.com>
References: <cover.1462383941.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] linux-yocto/uvesafb: print error message when task timeout occurs
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
X-List-Received-Date: Wed, 04 May 2016 17:53:18 -0000
Content-Type: text/plain

Integrating the following commit to have a more informative error
message:

    uvesafb: print error message when task timeout occurs

    The driver waits for response from user space for a pending
        task until a timeout (UVESAFB_TIMEOUT) occurs. But the
            existing error message in later steps is a little obscure.

    This patch throws out an error message when timeout happens.

    Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index a1389572766b..bf69ab7f0883 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "28d8cfdbcb18a6eef202099cca66430fd3b6eae0"
+SRCREV_machine ?= "d62fce1a7030dd2bc9db1f058d95dbac5fce85da"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index d81ca13872c0..c4da9588c8f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "2bc112a6ccd16800a4c45e47ccb3018a1042abdf"
-SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
+SRCREV_machine ?= "a7044110183dad1ac8467c572d6bcdc673c2a217"
+SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 28c72132ae8d..71b18cb4d781 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 684e8809859a..96ed8221d932 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
+SRCREV_machine ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index aecb517ed7bd..b227d767e673 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "232e2d88841c7e20857350275d80f5585ed93734"
-SRCREV_machine_qemuarm64 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_machine_qemumips ?= "7d3690c0762f11e038f14310a50ca1cdc813cc22"
-SRCREV_machine_qemuppc ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_machine_qemux86 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_machine_qemux86-64 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
-SRCREV_machine_qemumips64 ?= "b71e4cd7d45f03048ad31e2a36dfe5a43f021b51"
-SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine_qemuarm ?= "0151a12b692fe02660a7bcf1edda81b2468c016b"
+SRCREV_machine_qemuarm64 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine_qemumips ?= "ea167e2fdb145ef2bccd79234ac43ac3fee0fb67"
+SRCREV_machine_qemuppc ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine_qemux86 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine_qemux86-64 ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
+SRCREV_machine_qemumips64 ?= "5b8d8e6d06206f59662075f74126352a500df106"
+SRCREV_machine ?= "ae89dd60fe3a5fd9a7c2d8e1859e0c860333b863"
 SRCREV_meta ?= "a4f88c3fad887e1c559d03ae1b531ca267137b69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 3c5ee1bd43b2..88c003acbf85 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ec9167bcb0ccd4897177c5e235af68b5890aa326"
-SRCREV_machine_qemuarm64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_machine_qemumips ?= "900f98d3ab6498bc7f4ff6b7a489db3bca4e6417"
-SRCREV_machine_qemuppc ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_machine_qemux86 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_machine_qemux86-64 ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_machine_qemumips64 ?= "4b08dfb1fb3bc7659e8f3e13665597d9a9f0816d"
-SRCREV_machine ?= "1a72cec834de2c80b5563f8afbeea7664fd5ee05"
-SRCREV_meta ?= "bcc65090840f51a6ac937297be5c22fe268d01ab"
+SRCREV_machine_qemuarm ?= "373384988d421dfc209175c1ffc691e12ec55e23"
+SRCREV_machine_qemuarm64 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine_qemumips ?= "87b2d0c1f001650016ec13290c3e2de7b34cf468"
+SRCREV_machine_qemuppc ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine_qemux86 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine_qemux86-64 ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_machine_qemumips64 ?= "ed3c898c537dee36adc713bd30ec3ef6035ed95a"
+SRCREV_machine ?= "5a562b765837414416d609058c4e8dd7a8072dab"
+SRCREV_meta ?= "e1515ef98cec975df218363e28c2abe3a71c6a59"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


