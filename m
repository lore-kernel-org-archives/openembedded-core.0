Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61B297067B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA6FdX65004835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:34 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:33 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:26 +0800
Message-ID: <2f6ddb8c0603c8ec5bfe5532dbd2b2e5519656f2.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 23/25] linux-yocto: Fixup linux-yocto for aarch64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:34 -0000
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
index 02f10a3..1101c3d 100644
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
 
 SRCREV_machine_qemuarm ?= "d156e4658a13349f7a30adafd436e32fb722d248"
+SRCREV_machine_qemuarm64 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
 SRCREV_machine_qemumips ?= "5aa58a6ca9d4efe79ddf66c9d09695b42c84a3b6"
 SRCREV_machine_qemuppc ?= "cc4943bf3b93f9c424b63c357ab2c9f71384f3ac"
 SRCREV_machine_qemux86 ?= "268b7677421eef003a84f31c6bd0b8ec3acc1e36"
@@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.9.1


