Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E72C607B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 03:47:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9M3letY015008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Oct 2016 20:47:41 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 20:47:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Oct 2016 23:47:37 -0400
Message-ID: <c373a06c011e22b3150daab8907ffe2473b0445f.1477107618.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1477107618.git.bruce.ashfield@windriver.com>
References: <cover.1477107618.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/4.1: fix CVE-2016-5195 (dirtycow)
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
X-List-Received-Date: Sat, 22 Oct 2016 03:47:42 -0000
Content-Type: text/plain

Backporting commit 19be0eaffa [mm: remove gup_flags FOLL_WRITE games
from __get_user_pages()] to address the dirtycow exploit.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index ed7a916be948..b95fb5857725 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "71daecbcd3f3e8fa73aa036a5539722004e7759c"
-SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
+SRCREV_machine ?= "966ddde490030166010c5770f8f86cdd0e961c76"
+SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 78600427b375..ba01702cb63e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.33"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
-SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
+SRCREV_machine ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
+SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 413234b6d559..788a8eaaa8be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "89241b98386f752ab073d3ab5518cb69bacbd97e"
-SRCREV_machine_qemuarm64 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
-SRCREV_machine_qemumips ?= "e00505a0c07a352d1dd57adb8da1768863022979"
-SRCREV_machine_qemuppc ?= "d5ef1ced9d019d20d986e205bddc317961407188"
-SRCREV_machine_qemux86 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
-SRCREV_machine_qemux86-64 ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
-SRCREV_machine_qemumips64 ?= "ac476ecd7a56288e3e8ed1ef3872554de661e823"
-SRCREV_machine ?= "a38cb202738a2b055ac216b3699cc9377edea45a"
-SRCREV_meta ?= "322fa5b2796bfcff7bfbbde1d76c73636ecf5857"
+SRCREV_machine_qemuarm ?= "d67ef485ce1420df11bda2d9f6fb78ef50c1adff"
+SRCREV_machine_qemuarm64 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
+SRCREV_machine_qemumips ?= "65116339cfd210990c9c4710cdfec3ebd59abb0e"
+SRCREV_machine_qemuppc ?= "30816907653b57f1f3d5f9a7a2f6339bab14a680"
+SRCREV_machine_qemux86 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
+SRCREV_machine_qemux86-64 ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
+SRCREV_machine_qemumips64 ?= "f7a0b532b6ac81757d85b0c9a928f45a87c9e364"
+SRCREV_machine ?= "f4d0900b2851e829e990e0f64b09ed3b8e355fae"
+SRCREV_meta ?= "3c3197e65b6f2f5514853c1fe78ae8ffc131b02c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.5.0


