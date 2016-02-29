Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18598759B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TMAd5I027309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 14:10:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:27 -0500
Message-ID: <f3f810483d9c5d433d0e5527bd44c3043e14e574.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 7/8] linux-yocto/4.1: iwlwifi: mvm: don't allow sched scans without matches to be started
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:40 -0000
Content-Type: text/plain

Integrating the following commit:

    iwlwifi: mvm: don't allow sched scans without matches to be started

    commit 5e56276e7555b34550d51459a801ff75eca8b907 upstream.

    The firmware can perform a scheduled scan with not matchsets passed,
    but it can't send notification that results were found.  Since the
    userspace then cannot know when we got new results and the firmware
    wouldn't trigger a wake in case we are sleeping, it's better not to
    allow scans without matchsets.

    This fixes https://bugzilla.kernel.org/show_bug.cgi?id=110831

    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
    Signed-off-by: Wu Zheng <wu.zheng@intel.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 33fbb45272ab..4a6928a7d1fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "73c76150065091f6cc1751a3c8ec2d8a8cf8b6af"
+SRCREV_machine ?= "2a4c22b03d434f7695e607b6ad30f77671985a6d"
 SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index c802df797f54..41a79f17b7f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
 SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 82cfb7422325..9663966d8e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2af5b3dff27887af8ffbc700a6a09a9d75c2b05f"
-SRCREV_machine_qemuarm64 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_machine_qemumips ?= "deab449b07a79b9a108f1c94e3dabef34135517a"
-SRCREV_machine_qemuppc ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_machine_qemux86 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_machine_qemux86-64 ?= "dd6492b44151164242718855d6c9eebbf0018eac"
-SRCREV_machine_qemumips64 ?= "4984422b4cd3deb6d68f46d010fb8eb007468677"
-SRCREV_machine ?= "dd6492b44151164242718855d6c9eebbf0018eac"
+SRCREV_machine_qemuarm ?= "96b21aab2adf2c9396f8cf579420a2e497923eae"
+SRCREV_machine_qemuarm64 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
+SRCREV_machine_qemumips ?= "e0a6ffb62a4d28659e0e1be7b1a42a8ef499aa3b"
+SRCREV_machine_qemuppc ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
+SRCREV_machine_qemux86 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
+SRCREV_machine_qemux86-64 ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
+SRCREV_machine_qemumips64 ?= "1b1349ca5a642086d4b92347fb9d1de1c6eab742"
+SRCREV_machine ?= "ec18b0b3bd6befd416078e81d775dab37b3f9124"
 SRCREV_meta ?= "56dcb623ebf5e83d65fdb4eb270f23676bb000a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


