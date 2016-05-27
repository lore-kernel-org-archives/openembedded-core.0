Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01AD5731C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:18:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4RGIb3n019702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 May 2016 09:18:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 May 2016 09:18:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 27 May 2016 12:18:35 -0400
Message-ID: <1464365915-8522-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.1: fix musb compilation error
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
X-List-Received-Date: Fri, 27 May 2016 16:18:39 -0000
Content-Type: text/plain

We had a partial musb change merged into the 4.1 tree, which resulted in:

  | kernel-source/drivers/usb/musb/musb_dsps.c:
  In function 'dsps_create_musb_pdev':
  | kernel-source/drivers/usb/musb/musb_dsps.c:750:8:
  error: 'struct musb_hdrc_config' has no member named 'maximum_speed'
  |   config->maximum_speed = usb_get_maximum_speed(&parent->dev);
  |         ^~

By backporting commit:

  9b7537642cb6a [usb: musb: set the controller speed based on the config setting]

We get our missing structure field, and we can once again build musb.

[YOCTO: #9680]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 1d4c404ef0ca..24cc0ac07703 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "320892013ad33ab41f530ad321939aec07d09d22"
+SRCREV_machine ?= "e22280e8c2905d96c7cc5917df202b6ed904d042"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 9757c4d02067..bf7d6c5959e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index e0d288b6e93c..c325bc59c6c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d11c336b38ab0d4e55eb683aca5ca9c6b6cd8b42"
-SRCREV_machine_qemuarm64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_machine_qemumips ?= "f8e363f638b283738369155b4a9990b5d0f902a7"
-SRCREV_machine_qemuppc ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_machine_qemux86 ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_machine_qemux86-64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_machine_qemumips64 ?= "1db47ec6c39071b29f82a040b9b9a81584f50461"
-SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
+SRCREV_machine_qemuarm ?= "cadb80aa4bcee282f1b0798ef35ad8b96ec44931"
+SRCREV_machine_qemuarm64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine_qemumips ?= "737eda6388a529d0937e9d91daa3644b11f322dc"
+SRCREV_machine_qemuppc ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine_qemux86 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine_qemux86-64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
+SRCREV_machine_qemumips64 ?= "f276d128428b031521d766bfbfe84f9f9f992930"
+SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
 SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


