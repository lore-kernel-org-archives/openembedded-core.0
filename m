Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA1078282
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7VJVAXx032074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 31 Aug 2017 12:31:10 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:31:01 -0400
Message-ID: <0ecdccab284d8c9191d039923452d87ed92769c4.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.12: silence qeumarma9 config warnings
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:10 -0000
Content-Type: text/plain

When building the qemuarma9 BSP, we get the following warnings:

 ---------- CONFIG_VGA_CONSOLE -----------------
 Config: CONFIG_VGA_CONSOLE
 From:
  tmp/work-shared/qemuarma9/kernel-source/.kernel-meta/configs/standard/arm-versatile-926ejs/bsp/qemuarma9/qemuarma9.cfg
 Requested value:  # CONFIG_VGA_CONSOLE is not set
 Actual value:

 ---------- CONFIG_USB_ISP1760_HCD -----------------
 Config: CONFIG_USB_ISP1760_HCD
 From:
  tmp/work-shared/qemuarma9/kernel-source/.kernel-meta/configs/standard/arm-versatile-926ejs/bsp/qemuarma9/qemuarma9.cfg
 Requested value:  CONFIG_USB_ISP1760_HCD=y
 Actual value:

Both of these options no longer need to be in the BSP fragments
for qemuarma9, we fix them with these meta data changes:

  a2edeff915b9 qemuarma9: remove USB_ISP1760_HCD
  5f76e8f64fa5 qemuarma9: drop VGA console disable

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 1b1bf9f76270..ffaa26d3d3b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
+SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index bdf660e6ce9e..56cd8ed29fe4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
+SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 964dbce3e79e..6f806c2bec4c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
 SRCREV_machine_qemux86-64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
 SRCREV_machine_qemumips64 ?= "b344c1888b03e40683ba109bb45b44e9cf4d1eb4"
 SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
+SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


