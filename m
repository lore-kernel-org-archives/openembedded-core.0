Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0664C71B9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:26:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1KEQcb1027027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 20 Feb 2018 06:26:38 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 20 Feb 2018 06:26:19 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 20 Feb 2018 09:26:37 -0500
Message-ID: <1519136797-16434-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][rocko] linux-yocto/4.12: fix qemuarm64 boot failure
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
X-List-Received-Date: Tue, 20 Feb 2018 14:26:39 -0000
Content-Type: text/plain

The -stable update to 4.12 needs one more commit to fix the boot of
qemuarm64. This will be part of the next 4.12 -stable series, but for
now, we merge the patch directly.

  40146055677a mm/sparsemem: Fix ARM64 boot crash when CONFIG_SPARSEMEM_EXTREME=y

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index b182173733b2..e6a45fd66302 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8bade20d734f0b5e6ed13414b96cecaabe0c8039"
+SRCREV_machine ?= "33aa1a4ea44399f12dfb26146ea06db5cd02ca69"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index f1a9c1d9fd06..3ff2e1ce1928 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c4ad569af3e23a77994235435040e322908687f"
+SRCREV_machine ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 3916c6c39d10..b10b82b77199 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9728502c1fc96a1348ff06e1be8df75bee168032"
-SRCREV_machine_qemuarm64 ?= "1c4ad569af3e23a77994235435040e322908687f"
-SRCREV_machine_qemumips ?= "b04e654320e56fa42e477698dbf61d99f0bb4501"
-SRCREV_machine_qemuppc ?= "1c4ad569af3e23a77994235435040e322908687f"
-SRCREV_machine_qemux86 ?= "1c4ad569af3e23a77994235435040e322908687f"
-SRCREV_machine_qemux86-64 ?= "1c4ad569af3e23a77994235435040e322908687f"
-SRCREV_machine_qemumips64 ?= "7a297c3848d02c46acd40e3d2f285c7905f8134c"
-SRCREV_machine ?= "1c4ad569af3e23a77994235435040e322908687f"
+SRCREV_machine_qemuarm ?= "6e5a99db3a495e023041a30d43262047795e645a"
+SRCREV_machine_qemuarm64 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine_qemumips ?= "43dc47f90007d54c7086cc03b28e946e30135f1c"
+SRCREV_machine_qemuppc ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine_qemux86 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine_qemux86-64 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine_qemumips64 ?= "69f0c96d8e47b0dccfb374809d729f0042c77868"
+SRCREV_machine ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


