Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D949E72027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:56:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA78ub06008741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:56:37 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:56:36 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:27 +0800
Message-ID: <5fe1473f72c72b6e21d45b68be1fde7d5f1821e0.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 22/24] linux-yocto: Fixup linux-yocto for aarch64
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
X-List-Received-Date: Fri, 07 Nov 2014 08:56:38 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

linux-yocto is updated to pass the sysroot path to the compiler when necessary.

linux-yocto_ver.bb are updated to reference the correct linux-yocto branchs and
SRCREVs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
---
 meta/recipes-kernel/linux/linux-yocto.inc     | 2 ++
 meta/recipes-kernel/linux/linux-yocto_3.14.bb | 4 +++-
 meta/recipes-kernel/linux/linux-yocto_3.17.bb | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 9018985..7416af9 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -8,6 +8,8 @@ INC_PR = "r4"
 
 DEPENDS += "xz-native bc-native"
 DEPENDS_append_aarch64 = " libgcc"
+KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
+KERNEL_LD_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index a2f4b4d..2213884 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -4,6 +4,7 @@ require recipes-kernel/linux/linux-yocto.inc
 
 # board specific branches
 KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/common-pc/base"
@@ -11,6 +12,7 @@ KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "127b621f2a4d3b1111e24423c12fac001e047c1c"
+SRCREV_machine_qemuarm64 ?= "902f34d36102a4b2008b776ecae686f80d307e12"
 SRCREV_machine_qemumips ?= "c3b9f1b2397f0847ab4844d1cdb8e02574434d78"
 SRCREV_machine_qemuppc ?= "73e2411cdd91764d0601c0869857f53381c2a177"
 SRCREV_machine_qemux86 ?= "e19a1b40de44e756defdfb40349342d8037609bd"
@@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index 3838dbf..15c9b24 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -4,6 +4,7 @@ require recipes-kernel/linux/linux-yocto.inc
 
 # board specific branches
 KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "standard/qemuarm64"
 KBRANCH_qemumips ?= "standard/mti-malta32"
 KBRANCH_qemuppc  ?= "standard/qemuppc"
 KBRANCH_qemux86  ?= "standard/common-pc"
@@ -11,6 +12,7 @@ KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
 SRCREV_machine_qemuarm ?= "e86f70699655d1f5bf2518c8dcdb949a39161c86"
+SRCREV_machine_qemuarm64 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
 SRCREV_machine_qemumips ?= "0acaa5991a61fbab0d897157049ac2e638e9c7bf"
 SRCREV_machine_qemuppc ?= "50e33fec112527de12c2833cd8a283dd4a75ae33"
 SRCREV_machine_qemux86 ?= "1a6dd1205de5b7c6135a42fec00550738ff777b5"
@@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.9.1


