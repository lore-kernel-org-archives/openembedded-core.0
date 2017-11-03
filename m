Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD5578332
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jeuc022628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:40 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:30 -0400
Message-ID: <c9b18af9335b25ddf9575fd4159285c8bf83d5d9.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/4.12: stable backports and bug fixes
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:39 -0000
Content-Type: text/plain

Integrating the following bugfixes to the 4.12 tree:

 26c1863a7448 ALSA: hda: Fix regression of hdmi eld control created based on invalid pcm
 2b020e00dd49 arm64: mm: select CONFIG_ARCH_PROC_KCORE_TEXT
 abcf00d7171c fs/proc: kcore: use kcore_list type to check for vmalloc/module address

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index d890e6c8b17c..d7510b8069ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
+SRCREV_machine ?= "f792c32d8f19a31874ec40c033f36ef250e596ae"
+SRCREV_meta ?= "8bbce61f5d3a063725c09fe4bc5afe3f227e9060"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 87c04a5fb87b..6c9fed6ad605 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.14"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
+SRCREV_machine ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_meta ?= "8bbce61f5d3a063725c09fe4bc5afe3f227e9060"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 52af3b3009b0..bc1ee97237c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "63eabe4fc5b8645a2a1258ee9b2ec0e5c62b4236"
-SRCREV_machine_qemuarm64 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_machine_qemumips ?= "64ac80375bc1c2e87002994c3112f30aa614d73e"
-SRCREV_machine_qemuppc ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_machine_qemux86 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_machine_qemux86-64 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_machine_qemumips64 ?= "d481a271022e211857045b48d595826d8df051c4"
-SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
-SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
+SRCREV_machine_qemuarm ?= "afd1340d4b7c2180ee0e5dbf79499fedf1a023a6"
+SRCREV_machine_qemuarm64 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine_qemumips ?= "6d0052275c433f5a66282ad9f53525a7b6d36dfd"
+SRCREV_machine_qemuppc ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine_qemux86 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine_qemux86-64 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine_qemumips64 ?= "c8adcd782e648cb70780443ee90e2f56e2209c5a"
+SRCREV_machine ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_meta ?= "8bbce61f5d3a063725c09fe4bc5afe3f227e9060"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


