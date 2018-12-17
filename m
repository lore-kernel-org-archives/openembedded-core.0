Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D14A27BDAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3dS16021418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:28 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:18 -0500
Message-ID: <cb1a1f02d5918ef8b69dd49cb7c613063426cda6.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/17] linux-yocto/4.18: bug fixes and configuration tweaks
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:27 -0000
Content-Type: text/plain

Integrating the following commits:

  2ba9a28434f8 netfilter: use kvmalloc_array to allocate memory for hashtable
  6e1fae5d233a ipv4: net namespace does not inherit network configurations

As well as the following configuration changes:

  ed1978c99214 features/module-signing: add new feature
  a28fd4843381 edac: Drop CONFIG_EDAC_MM_EDAC and add dependency
  8ae63963256e xfs: add xfs support

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 2a92a69b5f02..cd685bd5b6a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cab37ca8426b490e995a9614f15448e135399993"
-SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
+SRCREV_machine ?= "8334c6cfdac2036631caa877ffad8d3ec424a265"
+SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 968b94c2076e..145992e5d75e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
+SRCREV_machine_qemuarm ?= "fad657599d15977f1ecb5cdf1719526dacf5f529"
+SRCREV_machine ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index da0f076c9295..70fadcc10456 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0573ed3c737c82b24fd661cc5ea961cac07ea2fe"
-SRCREV_machine_qemuarm64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_machine_qemumips ?= "465252ba0ec00ae10397cb4623c3d77c89e542a5"
-SRCREV_machine_qemuppc ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_machine_qemux86 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_machine_qemux86-64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_machine_qemumips64 ?= "6d91dc62811f4688efc67845185858645b4ccfb8"
-SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
+SRCREV_machine_qemuarm ?= "285677060e108d00ed786b5347d447807d94a963"
+SRCREV_machine_qemuarm64 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_machine_qemumips ?= "cbfe1fd6157ff4a1497dad50164bd493cb680f17"
+SRCREV_machine_qemuppc ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_machine_qemux86 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_machine_qemux86-64 ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_machine_qemumips64 ?= "090c1efbf5d1e9267f73eec102a53ea7b155d7c1"
+SRCREV_machine ?= "2ba9a28434f83c917ad3cfb8b4f7db6066c26a99"
+SRCREV_meta ?= "ed1978c99214b03740a8989d46f175252435ddc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


