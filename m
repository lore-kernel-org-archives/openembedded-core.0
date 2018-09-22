Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6962B79485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8MHKMtT023463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:20:33 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:20:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:54 -0400
Message-ID: <f4f6c364c3e16cef948c4a3db7cb496a9a625418.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto: enable pci and CRYPTO_DEV_VIRTIO
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:57 -0000
Content-Type: text/plain

With recent kernels and the latest openssl we observe hangs when there
is not sufficient entropy in the system before crypto is used
(i.e. OpenVSwitch or openssh server).

This was mainly observed on qemuarm64, but can happen elsewhere. So
we enable CRYPTO_DEV_VIRTIO in the main virtio fragment and enable
PCI for qemuarm64 to ensure that entropy is available.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 605dc6958931..24a2c593281e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c37a14708f5b618602f84f83f902346e055824c3"
-SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
+SRCREV_meta ?= "46a547fa5195c2990e513ae3050376b7670e8287"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 6658adee36d7..1a5392764794 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "f9cb6c0852260b119014a339332c9f4bee4c074b"
-SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
+SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 20be3c18f3e0..de220313013e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3218be18094b7dfb4471b083c469452c8c7709ce"
-SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
+SRCREV_meta ?= "46a547fa5195c2990e513ae3050376b7670e8287"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index bb2445160fbf..69ca1dc0e08b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
+SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index c931cf807076..7c97d53da164 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
 SRCREV_machine_qemux86-64 ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
 SRCREV_machine_qemumips64 ?= "f074d718736e95e8ed5460bf8e85c7e77ff7df87"
 SRCREV_machine ?= "78a16a4d8cfd58f91be412797aac248e811d083b"
-SRCREV_meta ?= "c35dd5cbbdb08dcc4fe35b8e9c0a62d1a157aeaf"
+SRCREV_meta ?= "46a547fa5195c2990e513ae3050376b7670e8287"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 79d3046bd20a..948ce3bb9554 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
 SRCREV_machine_qemux86-64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
 SRCREV_machine_qemumips64 ?= "766c469b1707fd3101116f572052a7b8d5ac0658"
 SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
-SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
+SRCREV_meta ?= "607726b2d0b8e1d8c5653003448a24353a88c63b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


