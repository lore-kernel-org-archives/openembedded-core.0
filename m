Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1DF165CB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2UCP94b026644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:10 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:24:59 -0400
Message-ID: <18b1af74515e3bf41089af269679acf8b04a5cb4.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] linux-yocto/4.1: SMBus/iTCO backports
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:10 -0000
Content-Type: text/plain

Backporting the following mainline commits to add Intel Broxton and Denverton
support:

  49b34899e7ca i2c: i801: Add support for Intel Broxton
  69f6eeceb5b1 i2c: i801: Add support for Intel DNV
  b131e3e13838 watchdog: iTCO_wdt: Add support for TCO on Intel Sunrisepoint
  fce230a538de mfd: watchdog: iTCO_wdt: Expose watchdog properties using platform data
  a1a2140e856d intel_pmc_ipc: Update kerneldoc formatting
  e407caf0a583 intel_pmc_ipc: Fix compiler casting warnings
  909588e549d7 intel_pmc_ipc: Add Intel Apollo Lake PMC IPC driver
  1cd89340c1a9 mfd: lpc_ich: Assign subdevice ids automatically
  729025b3e8d3 i2c: i801: Create iTCO device on newer Intel PCHs

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index f217f78daf0f..0e25536538e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8a1c72b29b63604b45ef13aed04f7bfe6d4fc277"
+SRCREV_machine ?= "d84b3cdc2d04fe42efb94b6f1e67c2d84af20bde"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 0af568509a22..8300319e7ea7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index caf71ae96a22..e3f2e6445078 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e6b84f3f0c7292a7d3453e6bebd9987e08678a4b"
-SRCREV_machine_qemuarm64 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
-SRCREV_machine_qemumips ?= "c70a6ad907f0f9ffd4d911b6413e509766fba07b"
-SRCREV_machine_qemuppc ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
-SRCREV_machine_qemux86 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
-SRCREV_machine_qemux86-64 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
-SRCREV_machine_qemumips64 ?= "a023db1f6f40280d3e254aed327f61f6d138992e"
-SRCREV_machine ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine_qemuarm ?= "55edd4698b9d54da4e648783918f2ee9ab7693ad"
+SRCREV_machine_qemuarm64 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine_qemumips ?= "2c794fb0c6e6dec146e9d99018016da9bb04018d"
+SRCREV_machine_qemuppc ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine_qemux86 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine_qemux86-64 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine_qemumips64 ?= "28bf6a37b7600979593be2ee922361acd83d1617"
+SRCREV_machine ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


