Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 5353A6D74B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 04:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E04440A58;
	Thu, 21 Mar 2019 04:50:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Np5Q0LhfsERR; Thu, 21 Mar 2019 04:50:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 098E9409E0;
	Thu, 21 Mar 2019 04:50:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4AAA016C6EB;
	Thu, 21 Mar 2019 00:50:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 00:50:52 -0400
Message-Id: <1553143852-41839-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] linux-yocto: fix wrongfully used qemuarma15 in place of qemuarmv5
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
X-List-Received-Date: Thu, 21 Mar 2019 04:50:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Commit 6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988 changes "qemuarm" machine from
old ARMv5 to a newer Cortex-A15, moving the old platform under "qemuarmv5" name.
When adding this new "old" platform name to COMPATIBLE_MACHINE in linux-yocto
recipes, mistakes were made referring it by "qemuarma15", as discussed in [1].
This change fixes those mistakes.

[1]http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280292.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 36761b9..c3f9d5f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 52dbabd..2d85817 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarma15"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index aca9f15..340e950 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -38,7 +38,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.7.4


