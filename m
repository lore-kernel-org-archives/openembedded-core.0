Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43B977887D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 15:49:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLFnOO4026831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 07:49:24 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 07:49:24 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 Dec 2017 10:49:13 -0500
Message-ID: <3bc9442ae8263d6dd1a4037dad52ecde5821c62b.1513871125.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1513871125.git.bruce.ashfield@windriver.com>
References: <cover.1513871125.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.12: bug fixes and VRF feature addition
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
X-List-Received-Date: Thu, 21 Dec 2017 15:49:24 -0000
Content-Type: text/plain

Integrating two bug fixes (functionality regressions):

  1d685baca196 iwlwifi: bump max FW API to 31
  cb8ce8c4ad0f tty: fix __tty_insert_flip_char regression

And the following configuration fragment:

  vrf: Add feature

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 6431ffbfe342..adbb0ccbad5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1a58be8c58386b680d6086ca527acf5c6d173a74"
-SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
+SRCREV_machine ?= "82dfc739621af193e6b5cb8f27f55c66db8e631b"
+SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 2e749950654e..4e18d413ce5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.16"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
+SRCREV_machine ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 20e2fd37957f..0df702e4703f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d28b66327c41ded21f49bd1b4bf35e8d3a5684c3"
-SRCREV_machine_qemuarm64 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_machine_qemumips ?= "2e6d1d8f4d63400aac07dcadfd94c1337d4b7e2f"
-SRCREV_machine_qemuppc ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_machine_qemux86 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_machine_qemux86-64 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_machine_qemumips64 ?= "5ad067fb6b042cc68252ba746a244d7a97be75fc"
-SRCREV_machine ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
-SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
+SRCREV_machine_qemuarm ?= "9f857972035c7e3ae237d25a581eb695ffe78249"
+SRCREV_machine_qemuarm64 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_machine_qemumips ?= "6527cf00278f043ba8f874ac7262261dd57e9a79"
+SRCREV_machine_qemuppc ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_machine_qemux86 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_machine_qemux86-64 ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_machine_qemumips64 ?= "ad347d33914f66c4b2aa6fca0c9f0a92773885cc"
+SRCREV_machine ?= "1d685baca196583254d75f5cc7bc0ffedb8753ad"
+SRCREV_meta ?= "e3c9041f48ae980cc4461f969d0e3ed9bb43be5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


