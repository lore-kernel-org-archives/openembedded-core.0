Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 943AF77AC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7VJV8Fr006860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 12:31:08 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:07 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:30:59 -0400
Message-ID: <52a4853953250d1f68c9d96775a923346e3c0b78.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yoct/4.12: fix yaffs2 build
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:08 -0000
Content-Type: text/plain

Yaffs2 needs some tweaks to build against the 4.12 kernel, we
import the following two commits:

  084d8ae2f349 fs: yaffs2: includes the missing header file
  595f7d1759d9 fs: yaffs2: replace CURRENT_TIME by other appropriate apis

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 49f5bf3522ad..1b1bf9f76270 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
+SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index ff395e0ad7e3..bdf660e6ce9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.7"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
+SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index ce223ca081f3..964dbce3e79e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dc7fc6edebaa6d20967c953a2cd27bac5e955463"
-SRCREV_machine_qemuarm64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_machine_qemumips ?= "ff11a70047bbab2c801f9b4f7b9d4bc1d38dbed1"
-SRCREV_machine_qemuppc ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_machine_qemux86 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_machine_qemux86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_machine_qemumips64 ?= "a4d6ef2c5428e57f7f9982d230b09459683ddb1d"
-SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
-SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
+SRCREV_machine_qemuarm ?= "a5227887cfadd94068717e8166879bf88d00ef73"
+SRCREV_machine_qemuarm64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_machine_qemumips ?= "a6983bac4e93ba7e892f666ad8c58b32c2d10945"
+SRCREV_machine_qemuppc ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_machine_qemux86 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_machine_qemux86-64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_machine_qemumips64 ?= "b344c1888b03e40683ba109bb45b44e9cf4d1eb4"
+SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
+SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


