Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6245D78AAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBPj5012041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:25 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:52 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:14 -0500
Message-ID: <611596343329dd4266a55d32181518b48943cd8b.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/4.12: memleak and build warning fixes
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:25 -0000
Content-Type: text/plain

Integrating the warning/leak fixes:

  73873cb152c brd: remove unused brd_mutex
  912c53b1b346 audit: fix memleak in auditd_send_unicast_skb.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 722315e84372..d6ffcc86a5ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7a02176b872012f95036453dfd2e12dc0c02a612"
-SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
+SRCREV_machine ?= "27c21aed67a28d08b13c5cc1fe4287b2cf389ede"
+SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 998c017515c0..860b68cda6af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
+SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index ca664fec5de0..e1ec88bdc920 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6155fbae7a6b42a7608b9f251fa46cef28c0fe67"
-SRCREV_machine_qemuarm64 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_machine_qemumips ?= "d46a4aebe29dcced0fea9718c249c536ab06977f"
-SRCREV_machine_qemuppc ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_machine_qemux86 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_machine_qemux86-64 ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_machine_qemumips64 ?= "10216660f9d902f76f36514ea4ef04530e87702d"
-SRCREV_machine ?= "392959d6dad698bfb62de561164c2d19e17841dd"
-SRCREV_meta ?= "ca1bda8dfd3325db04dda19a531edeb66ac0d84b"
+SRCREV_machine_qemuarm ?= "c9f0aa61969279f3ff36f2bc5dcad333f1e6fe59"
+SRCREV_machine_qemuarm64 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_machine_qemumips ?= "c327b2ea91c97957e865f90e7555aa4689cb5787"
+SRCREV_machine_qemuppc ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_machine_qemux86 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_machine_qemux86-64 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_machine_qemumips64 ?= "d25e0aa3f09dff2b8b908c7764c3c5244134d1a4"
+SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
+SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


