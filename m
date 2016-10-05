Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6724D719E4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 03:03:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9533nKn027611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Oct 2016 20:03:49 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 4 Oct 2016 20:03:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Oct 2016 23:03:48 -0400
Message-ID: <1475636628-23762-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.8: fix BUG_ON() in workingset_node_shadows_dec() triggers
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
X-List-Received-Date: Wed, 05 Oct 2016 03:03:50 -0000
Content-Type: text/plain

Paul Gotmaker pointed out that a last minute merge to the 4.8 kernel
has the potential to hard hang a kernel when VM debugging is enabled:

  https://lkml.org/lkml/2016/10/4/1

He also pointed out the fix for it in commit 21f54dda
[Using BUG_ON() as an assert() is _never_ acceptable].

While that fix will loop through -stable into 4.8.1, that will
likely be too late for our release. So I've cherry picked the
change to make it available.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 515f8783e906..90e1a4d74758 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cd97b2cf4bc73316204a5148d2b0f5fc5d2ecc19"
+SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
 SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 8ed52ddbfc58..1f026cf41bfe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.8"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 71dc5ae35a0f..5e01abc8aa94 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fc4881574f295bf2480f95d7c3e279ab32b44d8a"
-SRCREV_machine_qemuarm64 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
-SRCREV_machine_qemumips ?= "013be1e230a0173677dfbfc081aea63fd7c58ec8"
-SRCREV_machine_qemuppc ?= "707621a083512f037f749a711df3f4f1fb3ef842"
-SRCREV_machine_qemux86 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
-SRCREV_machine_qemux86-64 ?= "707621a083512f037f749a711df3f4f1fb3ef842"
-SRCREV_machine_qemumips64 ?= "7496d66804993fcfc569dd062f7e63a7490bc62f"
-SRCREV_machine ?= "707621a083512f037f749a711df3f4f1fb3ef842"
+SRCREV_machine_qemuarm ?= "f46e49344b4c66a6f0917c5a2e9a1d146176519d"
+SRCREV_machine_qemuarm64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
+SRCREV_machine_qemumips ?= "5a299402ae58d61429ab091f94748550efe45858"
+SRCREV_machine_qemuppc ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
+SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
+SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
+SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
+SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


