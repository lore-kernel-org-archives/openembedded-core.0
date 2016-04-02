Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA04A770A6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3209Vw2023858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 1 Apr 2016 17:09:31 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:30 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:21 -0400
Message-ID: <1a74913d6a656dcb4e2031348fccc0c6f687bcd5.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/4.1: ahci: backport AHCI runtime PM
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:31 -0000
Content-Type: text/plain

enabling AHCI runtime PM support via the following commits:

  f5b08e95bc03 ahci: Add runtime PM support for the host controller
  e05e05973f39 ahci: Add functions to manage runtime PM of AHCI ports
  558571930e2d ahci: Convert driver to use modern PM hooks
  4a2c2074f209 ahci: Cache host controller version
  21641413456c scsi: Drop runtime PM usage count after host is added
  254ab69f652d scsi: Set request queue runtime PM status back to active on resume
  61c02cb167ed block: Add blk_set_runtime_active()
  7bcfbac98f3c ahci: Store irq number in struct ahci_host_priv
  a5a093b7f6e4 ahci: Move interrupt enablement code to a separate function

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 468358b08a4b..304b0dd2ef0e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "7ffcde760a73f672bccb1c43130667d30ba7195c"
+SRCREV_machine ?= "8380fdf86b5d1ff542153e647f2ded0026a91852"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 12f572cc405e..4c79bfdcbeb5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 5f0559f0683d..5682b66a1240 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ecabd4f1cf9b1e6279943c8e93eff58095296fb6"
-SRCREV_machine_qemuarm64 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
-SRCREV_machine_qemumips ?= "8fd9efe95598ddf89ec432a967a38f02b2906a8b"
-SRCREV_machine_qemuppc ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
-SRCREV_machine_qemux86 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
-SRCREV_machine_qemux86-64 ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
-SRCREV_machine_qemumips64 ?= "cb16b5365e26e106d56a6f8ed23eb8b57905ecf8"
-SRCREV_machine ?= "96c0e80f4007cce8d4f559a23f7a22da156ccbe2"
+SRCREV_machine_qemuarm ?= "75d5fa3b94efe0eb2101946d51015ce5bdc126cf"
+SRCREV_machine_qemuarm64 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine_qemumips ?= "5b7969dfff341c7d81b3726e0bb100cafa1cbfa1"
+SRCREV_machine_qemuppc ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine_qemux86 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine_qemux86-64 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine_qemumips64 ?= "a3a35132a724752464ee13b10432cbdb2a110404"
+SRCREV_machine ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


