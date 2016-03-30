Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBD4865CB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCPC5p006946
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:01 -0400
Message-ID: <853bb0f56dcb7aff4d5e256862a7b3e5878d3b12.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] linux-yocto/4.1: device property backports
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:12 -0000
Content-Type: text/plain

Integrating the following 4.4 backports:

  630b726098c9 mfd: make mfd_remove_devices() iterate in reverse order
  aab24907568b driver core: Do not overwrite secondary fwnode with NULL if it is set
  89775462ef50 device property: return -EINVAL when property isn't found in ACPI
  a9eebae4a2c0 device property: check fwnode type in to_of_node()

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 0e25536538e5..15a63fc445e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "d84b3cdc2d04fe42efb94b6f1e67c2d84af20bde"
+SRCREV_machine ?= "b0b9b44cd66a067ac026b2a3db764d1e9b4dbb30"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 8300319e7ea7..9dca92287cdd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine ?= "630b726098c95111a41336de04a5b7e201b012e9"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index e3f2e6445078..01708ddcc540 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "55edd4698b9d54da4e648783918f2ee9ab7693ad"
-SRCREV_machine_qemuarm64 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
-SRCREV_machine_qemumips ?= "2c794fb0c6e6dec146e9d99018016da9bb04018d"
-SRCREV_machine_qemuppc ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
-SRCREV_machine_qemux86 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
-SRCREV_machine_qemux86-64 ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
-SRCREV_machine_qemumips64 ?= "28bf6a37b7600979593be2ee922361acd83d1617"
-SRCREV_machine ?= "49b34899e7caa4237e6efbdf2e8f68e578707cee"
+SRCREV_machine_qemuarm ?= "1582fc5caa4957ef6a1349c0ae4178c2846c1af1"
+SRCREV_machine_qemuarm64 ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine_qemumips ?= "9406ef8745f90c401e3551f45e2945d1f7408327"
+SRCREV_machine_qemuppc ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine_qemux86 ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine_qemux86-64 ?= "630b726098c95111a41336de04a5b7e201b012e9"
+SRCREV_machine_qemumips64 ?= "c29ac79ffc2957612e789ac7a5fe4919f99bf99f"
+SRCREV_machine ?= "630b726098c95111a41336de04a5b7e201b012e9"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


