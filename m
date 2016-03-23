Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E457865CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2NF9B7q018503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Mar 2016 08:09:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 08:09:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Mar 2016 11:09:02 -0400
Message-ID: <91fea20c704ef164d6bd69d5ea8f028d9c443a68.1458745322.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458745322.git.bruce.ashfield@windriver.com>
References: <cover.1458745322.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.1: MFD backports
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
X-List-Received-Date: Wed, 23 Mar 2016 15:09:12 -0000
Content-Type: text/plain

Integrating the following series of MFD backports:

  e9b00f938e99 driver core: platform: Add support for built-in device properties
  a63ef2c57b90 mfd: core: propagate device properties to sub devices drivers
  a7e1dabefaf8 klist: implement klist_prev()
  2da2857b20b9 PM / QoS: Make it possible to expose device latency tolerance to userspace
  36b2a287373a driver core: implement device_for_each_child_reverse()
  a6c7cb3da8e7 mfd: intel-lpss: Pass HSUART configuration via properties
  1f0da901349b mfd: intel-lpss: Pass SDA hold time to I2C host controller driver
  391ec7713003 mfd: intel-lpss: Add support for passing device properties
  fe9fb6da9164 mfd: lpss: Add Broxton ACPI IDs
  702a4f1f13fd mfd: lpss: Add Intel Broxton PCI IDs
  982bcf977be4 mfd: intel-lpss: Use writeq() helper
  d35dbf0dbaa7 mfd: Add support for Intel Sunrisepoint LPSS devices

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index cb9ecd877732..f217f78daf0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "147f03e2a95452d67185375e1f037696cb9b8f10"
+SRCREV_machine ?= "8a1c72b29b63604b45ef13aed04f7bfe6d4fc277"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index af8228525a72..0af568509a22 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 093fd894c045..caf71ae96a22 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "608b0ecfc5c2ab27bfa6622eefa3c0948c3a2f44"
-SRCREV_machine_qemuarm64 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
-SRCREV_machine_qemumips ?= "aced73e93690206a16e77b9b5dbb633690a8ea98"
-SRCREV_machine_qemuppc ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
-SRCREV_machine_qemux86 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
-SRCREV_machine_qemux86-64 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
-SRCREV_machine_qemumips64 ?= "83e5af8217dc0a4e867b8a0d1d85aaf393ecb9c7"
-SRCREV_machine ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine_qemuarm ?= "e6b84f3f0c7292a7d3453e6bebd9987e08678a4b"
+SRCREV_machine_qemuarm64 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine_qemumips ?= "c70a6ad907f0f9ffd4d911b6413e509766fba07b"
+SRCREV_machine_qemuppc ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine_qemux86 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine_qemux86-64 ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
+SRCREV_machine_qemumips64 ?= "a023db1f6f40280d3e254aed327f61f6d138992e"
+SRCREV_machine ?= "e9b00f938e9971cf84dd33f317719c91135246e9"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


