Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47F90731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TMAZrv027306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 14:10:35 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:35 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:24 -0500
Message-ID: <28315e56b0b5edcfc3186a9b6f74eb281ceccac3.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 4/8] linux-yocto/4.4: yaffs2 build fixes
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:36 -0000
Content-Type: text/plain

Integrating fixes for yaffs2 on the 4.4.x kernel:

  d4eb3ab036f8 yaffs2: using new ->follow_link() and ->put_link() calling conventions
  da1c7fd61d13 yaffs2: NULL ->read/->write
  b4c6a6aca7e7 yaffs2: replace f_dentry to f_path.dentry

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 35c4e2fa05f4..29752413b930 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "b90e0f8ee29395bbeb1d4b1dc06d4a78063f2c36"
-SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
+SRCREV_machine ?= "10a99cd2bfbbea9fa82b5a988eb8cb9c5f7b6600"
+SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index beeab9d14389..71a64d87fe7d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4.1"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
+SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index c0edcf13c341..104fe664acd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fae04a40c8bcdf27b237d7d288ddcad71976a7b3"
-SRCREV_machine_qemuarm64 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_machine_qemumips ?= "beedcf740b175cdd0ecc7a8c473c0b518f329c33"
-SRCREV_machine_qemuppc ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_machine_qemux86 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_machine_qemux86-64 ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_machine_qemumips64 ?= "25c3d2617df1947b3d69e480e88ba75881c7ca71"
-SRCREV_machine ?= "0194c765861157b95de80fa7c27ebb6b51c16dd6"
-SRCREV_meta ?= "4940c6e551c1eea41a5dbc69a90b23d5f835fa5b"
+SRCREV_machine_qemuarm ?= "1505f695c60842fa591ca6bc1e3cb0bba1be0055"
+SRCREV_machine_qemuarm64 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine_qemumips ?= "257ab9142b29e01b257977f5a3afe7f40f79f7bc"
+SRCREV_machine_qemuppc ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine_qemux86 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine_qemux86-64 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine_qemumips64 ?= "de5aa76a9b909645533b44018bed0aa110e2dbd0"
+SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_meta ?= "39d849b041409ddd8fa4f8102f6adb2d57c1fb60"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


