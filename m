Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A17460169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLchl012414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:38 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:30 -0400
Message-ID: <abe9a3d086c368f8870609f8afafd058b2c510e5.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/3.14: fix common clock framework support in PCI glue layer
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:41 -0000
Content-Type: text/plain

The initial version of "spi/pxa2xx: Add common clock framework support in PCI glue layer"
enables the baytrail series of processors, but breaks some existing users of
the framework.

There's a new version of the patch out for review, so we revert the broken one and
udpate to the latest.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index f827dabe5422..22895275ba82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "1275afa7dabab618d705c2708518fc84b54b8f21"
-SRCREV_machine_qemuppc ?= "88ef131d9825e3f356d632bdd341106f986b230c"
+SRCREV_machine ?= "a334a20f77b8f2063d13fc87a56485f7a2fca6f4"
+SRCREV_machine_qemuppc ?= "a9c0ad109be109f00752be0cf085d6c8c8758d84"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 50a742f88861..9c0f133287f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
+SRCREV_machine ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index b14674f1b170..8c40433b2562 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cb29a7b2d69ec89d851c9ad5a44b69c62feb7963"
-SRCREV_machine_qemumips ?= "b9a7220e0dbe4faac06bedff201102d1642e32d1"
-SRCREV_machine_qemuppc ?= "9ae4c4cdc2737f2570b7f71314be68c065179b53"
-SRCREV_machine_qemux86 ?= "5542d96bf43c6c9f7c81cf36259e03d21ed5c210"
-SRCREV_machine_qemux86-64 ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
-SRCREV_machine_qemumips64 ?= "a779a38ca4a1cf78c6f07071ff51937214ff063d"
-SRCREV_machine ?= "6cfe9c448741ab317d70a8ded3a953a0e66bb0a5"
+SRCREV_machine_qemuarm ?= "ac43643f8f35e4f5f068a9bb8c74c88a6ed7d447"
+SRCREV_machine_qemumips ?= "a8b3d0215f52c1e7e1c241323ed393e4f4c37162"
+SRCREV_machine_qemuppc ?= "9f92eada918f43ff6c06532aaba69718c20bb189"
+SRCREV_machine_qemux86 ?= "a89b66bba2c9c77d21b8ba519981df2137a8f6e3"
+SRCREV_machine_qemux86-64 ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
+SRCREV_machine_qemumips64 ?= "862e58b06d5fdc67f7b2c636d6b5b179def5c10e"
+SRCREV_machine ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


