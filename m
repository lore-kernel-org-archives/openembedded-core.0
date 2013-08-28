Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B80336BBDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 20:12:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7SKCXbc024667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2013 13:12:33 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 28 Aug 2013 13:12:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Aug 2013 16:12:19 -0400
Message-ID: <f272c7d8e790e4e47212a283fb7384617e1b5c51.1377720350.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377720350.git.bruce.ashfield@windriver.com>
References: <cover.1377720350.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.10: fix ssh login and restore CC_OPTIMIZE_FOR_SIZE
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
X-List-Received-Date: Wed, 28 Aug 2013 20:12:39 -0000
Content-Type: text/plain

Updating the BSP SRCREVs with the following changes:

  7144bcc Revert "timer_list: Split timer_list_show_tickdevices"
  1c0d1d8 Revert "timer_list: Convert timer list to be a proper seq_file"

To temporarily fix the ability to log in via ssh on some host/image combinations.

Updating the meta SRCREV for:

  cd502a8 meta/standard: standard configuration fragment must be first

Which was incorrectly overriding feature and arch configuration values.

[YOCTO #5064]
[YOCTO #5062]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index eb34491..0e137ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "77c5842818867366c3d08ca1dec19dc43aee0e91"
-SRCREV_machine_qemuppc ?= "7be83bc1124d2a2c75f99df94baaf718659722ea"
-SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
+SRCREV_machine ?= "8a9b4902683f586f7d656c2e6747e314a5e1ed0e"
+SRCREV_machine_qemuppc ?= "655d20d4f64dc053b40ac8d8fe44b82dec5e130a"
+SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 2a30b82..82dea9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.10.9"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
-SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
+SRCREV_machine ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index ea6ad2a..cacb873 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "8675d3d0a3c17135f70ef474d5c362397c02e62a"
-SRCREV_machine_qemumips  ?= "992b743b905edd21d3a4a27c92b5c6a9e44d7d73"
-SRCREV_machine_qemuppc ?= "09388c3572e26c78b34554e46e077f12be7b2401"
-SRCREV_machine_qemux86 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
-SRCREV_machine_qemux86-64 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
-SRCREV_machine_qemumips64 ?= "203679cb23c752fdcbc0180a55a81728d7462561"
-SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
-SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
+SRCREV_machine_qemuarm ?= "24d53cd6ca4c3ae8f5dd2ff840f9275327d955ee"
+SRCREV_machine_qemumips  ?= "0480771238bb87031b79ecb1ee6bce7bfe6ffb1c"
+SRCREV_machine_qemuppc ?= "a9c383957f69e70fd2cb27d885160303a305cf57"
+SRCREV_machine_qemux86 ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_machine_qemux86-64 ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_machine_qemumips64 ?= "10a8db0603d7186633a6bf90e2308710763e718e"
+SRCREV_machine ?= "7144bcc4b8091675bfcf1941479067857b6242da"
+SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4


