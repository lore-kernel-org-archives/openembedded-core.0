Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81B8076FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 14:31:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8TEVd8L024747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 07:31:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 07:31:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 29 Sep 2015 10:31:34 -0400
Message-ID: <3c3719ce59f68c32f0d173121420b4131cc043a8.1443536748.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443536748.git.bruce.ashfield@windriver.com>
References: <cover.1443536748.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/4.1: braswell bug fixes
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
X-List-Received-Date: Tue, 29 Sep 2015 14:31:41 -0000
Content-Type: text/plain

Updating the 4.1 SRCREVs to integrate the following DRM backports:

  a8abc111a96d drm/i915: Only wait for required lanes in vlv_wait_port_ready()
  81354180432b Revert "drm/i915: Hack to tie both common lanes together on chv"
  d660fc117731 drm/i915: Work around DISPLAY_PHY_CONTROL register corruption on CHV
  0e797e9cb717 drm/i915: Implement chv display PHY lane stagger setup

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index a133b3bd972f..e02c06b84d1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8a50af5664351a10657275e8f3196ae0aad04623"
+SRCREV_machine ?= "29257e529f968d17a5238624f27ddc76f759dc9d"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 84606cb52374..9fb5eb894b87 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.8"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index d01101a4ad94..157c1c21fa9a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bbd539ee6f9c8e7871e9c55607dc15807e4da492"
-SRCREV_machine_qemuarm64 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
-SRCREV_machine_qemumips ?= "8027a8514b7c56334ab2414b36f3eed751f1977d"
-SRCREV_machine_qemuppc ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
-SRCREV_machine_qemux86 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
-SRCREV_machine_qemux86-64 ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
-SRCREV_machine_qemumips64 ?= "808d3efb9d8f94c0c5d3d316938679a7583f52ef"
-SRCREV_machine ?= "cf940efcae03adea9f17be3a21406f7a2a385b72"
+SRCREV_machine_qemuarm ?= "c92614c6b90f8ab1202b20cc843a9782c9f8f8d5"
+SRCREV_machine_qemuarm64 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine_qemumips ?= "6b4b777e8467f01b00c4494ffedf1e9134bc52c5"
+SRCREV_machine_qemuppc ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine_qemux86 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine_qemux86-64 ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
+SRCREV_machine_qemumips64 ?= "90222ca39af5a3252fcba24baec341140e9e7c07"
+SRCREV_machine ?= "a8abc111a96dd07a2884ebbba668ef8dec15f264"
 SRCREV_meta ?= "3d8f1378d07dbc052ca8a7c22297339ad7998b5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.1.0


