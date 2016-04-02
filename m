Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A503A770C5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 00:09:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3209Y68023862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 1 Apr 2016 17:09:34 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 1 Apr 2016 17:09:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 1 Apr 2016 20:09:24 -0400
Message-ID: <2e144560aeea9f162dd69bf0a665bc53f0c4781e.1459555221.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459555221.git.bruce.ashfield@windriver.com>
References: <cover.1459555221.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/4.4: fix PAT for 32bit x86
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
X-List-Received-Date: Sat, 02 Apr 2016 00:09:35 -0000
Content-Type: text/plain

Integrating the following mainline destined commits to fix PAT issues with
32bit x86 and qemu:

  bc22b90fb583 x86/pat: Document the PAT initialization sequence
  c534b1ec1991 x86/xen, pat: Remove PAT table init code from Xen
  cd47692e804f x86/mtrr: Fix PAT init handling when MTRR is disabled
  039434bdc165 x86/mtrr: Fix Xorg crashes in Qemu sessions
  c08196e8064c x86/mm/pat: Replace cpu_has_pat with boot_cpu_has()
  6928fce8c766 x86/mm/pat: Add pat_disable() interface
  3163c8d5468d x86/mm/pat: Add support of non-default PAT MSR setting

With this change applied, we once again have working graphics and no special
work arounds.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index e6a03928b9b0..a3b743b1d984 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "56434a6d9850fd3642bab5cab63d22c6f56d2eae"
+SRCREV_machine ?= "1970b2704b881effa78c3e5f79c0fd3bff1fd028"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 2b7e1cb4d723..67e261c6a6c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5280777f80c0..0494564a5bdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "03f244ec7482dbc1c924af73a317dd3d12f00132"
-SRCREV_machine_qemuarm64 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
-SRCREV_machine_qemumips ?= "4cd732b14cf4bdb51b7b565783bbc2ce5ab9a943"
-SRCREV_machine_qemuppc ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
-SRCREV_machine_qemux86 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
-SRCREV_machine_qemux86-64 ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
-SRCREV_machine_qemumips64 ?= "699473bc2476afa85e47833f0f47aaf44a799257"
-SRCREV_machine ?= "08943f2bbd507f8b7f5ef101ccc4755cbec79aad"
+SRCREV_machine_qemuarm ?= "8abee78b727ce6a4df262d1befcbecfa26742ae0"
+SRCREV_machine_qemuarm64 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine_qemumips ?= "475e28c3240610c26ee0b7866dc0ce701d0c27e1"
+SRCREV_machine_qemuppc ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine_qemux86 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine_qemux86-64 ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
+SRCREV_machine_qemumips64 ?= "8d34fd84b9c53507b3d10a4a44294c479237319c"
+SRCREV_machine ?= "bc22b90fb5834ead65c31ca0d1e117239d4b545d"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


