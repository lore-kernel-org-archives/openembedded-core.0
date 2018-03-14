Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2C757892A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:10:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2EFAYBF027970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 14 Mar 2018 08:10:34 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 14 Mar 2018 08:09:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 14 Mar 2018 11:10:29 -0400
Message-ID: <f8f6919f64d5cafd5954659fcb02147a660221bd.1521040068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1521040068.git.bruce.ashfield@windriver.com>
References: <cover.1521040068.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.12: backport bugfixes for x86
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
X-List-Received-Date: Wed, 14 Mar 2018 15:10:34 -0000
Content-Type: text/plain

Integrating the following commits:

  60b649971940 x86/hibernate/64: Mask off CR3's PCID bits in the saved CR3
  cec3c008ec8f drm/i915/cfl: Coffee Lake works on Kaby Lake PCH.
  073873cb152c brd: remove unused brd_mutex
  912c53b1b346 audit: fix memleak in auditd_send_unicast_skb.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index a100f7d4a9f9..ad0981296f5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b103a20d4b507ede60adc8478dade56a4bdaffad"
+SRCREV_machine ?= "da775aa9aab41e8a2b4e9b44ffe268446c51759f"
 SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index c306db292b2e..0bbd8e28db86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
 SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 78a291acf0a6..fabf0f554bbf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4fb13c0d7254fe9753bebdfcfe47fd1ba4487386"
-SRCREV_machine_qemuarm64 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
-SRCREV_machine_qemumips ?= "9eb1f72874eeadb1f17e59faaca331971d522e12"
-SRCREV_machine_qemuppc ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
-SRCREV_machine_qemux86 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
-SRCREV_machine_qemux86-64 ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
-SRCREV_machine_qemumips64 ?= "710cc1cb7ba1384b9b0f43fc811a18a7c5a4e03f"
-SRCREV_machine ?= "cec3c008ec8f7acdb01b95fceb1ef7dff35d1877"
+SRCREV_machine_qemuarm ?= "42cf4d6a1bc84b90681cb82ad95c129387d76b4b"
+SRCREV_machine_qemuarm64 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
+SRCREV_machine_qemumips ?= "571315a5526b9e22262cf99bae7c0dd6e5bd204c"
+SRCREV_machine_qemuppc ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
+SRCREV_machine_qemux86 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
+SRCREV_machine_qemux86-64 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
+SRCREV_machine_qemumips64 ?= "e7889ba18f060368d4ab35e70b076728d73ba622"
+SRCREV_machine ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
 SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


