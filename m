Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D718F7BDA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3d0Pt021374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:00 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:00 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:15 -0500
Message-ID: <26b3fb6b688b403439813a75e82f8d21be27f6a9.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/17] linux-yocto/4.18: -rt sync and config cleanups
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:00 -0000
Content-Type: text/plain

Integrating the following -rt patches:

  cab37ca8426b rt: update localversion to match latest content
  186274b2b6dc tty: serial: pl011: explicitly initialize the flags variable
  ac121b7124a0 mm/kasan: make quarantine_lock a raw_spinlock_t
  6100773500e7 watchdog: prevent deferral of watchdogd wakeup on RT
  ce594291c4eb kthread: convert worker lock to raw spinlock

And the following configuration tweaks:

  e39413ec2bdd sound.cfg: enable SND_SOC_INTEL_SKYLAKE

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index b30c9ac14960..2a92a69b5f02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8e00c30ce22f378ecb7f243b1df3d209b8ee29bc"
-SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
+SRCREV_machine ?= "cab37ca8426b490e995a9614f15448e135399993"
+SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index a7fe7e9a0e1d..e94dcd5bb34f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
+SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 5dc772addb0d..da0f076c9295 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_machine_qemux86-64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_machine_qemumips64 ?= "6d91dc62811f4688efc67845185858645b4ccfb8"
 SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
+SRCREV_meta ?= "e39413ec2bdda10cdfb7e7e4df228be8d39e6639"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


