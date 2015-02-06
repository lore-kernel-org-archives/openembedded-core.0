Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89A8372E50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t16GVDO5011232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:13 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:13 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:05 -0500
Message-ID: <5482e6456a0d8cd5608b055cf2d5743e5ef9779a.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto: basic octeon III support
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:16 -0000
Content-Type: text/plain

Importing the following commits to add basic octeon III support to the
3.14 linux-yocto kernel:

   1e0bbd1dd68e MIPS:OCTEON: More OCTEONIII support
   f51a5843ee2d MIPS: Octeon: CVMSEG LM loads may cause dcache parity errors
   58bcba842781 MIPS: Octeon: Implement the core-16057 workaround
   ba5a219685e8 MIPS Override assembler ISA for kernel FPU instruction.
   7759a0511965 MIPS donot build fast TLB refill handler with 32-bit kernels.
   3f51e46ff641 MIPS Add minimal support for OCTEON3 to c-r4k.c
   bbde024d903a MIPS Add function get ebase cpunum
   9f18310679cb MIPS OCTEON Enable use of FPU
   d24496ee8fc8 MIPS OCTEON Add OCTEON3 to get cpu type

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index fbd331f38e74..342debe2c930 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "367c3b9712a6e469aed0cb5deebd5d3bfab12b79"
-SRCREV_machine_qemuppc ?= "4e827a9b658b6381f6706490e40b6a069a0c4b64"
+SRCREV_machine ?= "c9291eb73e9729480c651cca73babdb29e193ad4"
+SRCREV_machine_qemuppc ?= "35bfb41271634b66522164efeb424822993899c7"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 2d1bc2117145..0808d1bf1a23 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.29"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
+SRCREV_machine ?= "1e0bbd1dd68e255a9af7c36930debc6dd4885d0c"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index f218a91b48f0..19b7c126bada 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c0ed33beda334dcd387dff89da9804c03e24d648"
-SRCREV_machine_qemuarm64 ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
-SRCREV_machine_qemumips ?= "808071c5f72dc98ed2192de28bdd4e9ba2f7e820"
-SRCREV_machine_qemuppc ?= "0f93713ce91cc93f055ae6bcf1bf728d4036d097"
-SRCREV_machine_qemux86 ?= "f6aa7aaca80e8532316bfb6e8dd2fbf9ab4f8b8e"
-SRCREV_machine_qemux86-64 ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
-SRCREV_machine_qemumips64 ?= "f44eb151dc53822f4f94f50b2ec67a0a1aab041b"
-SRCREV_machine ?= "21ba402e0a5286baf0b8960da132e2d56f020c88"
+SRCREV_machine_qemuarm ?= "4af8557eb8576ba957980705a3719aca0e27836e"
+SRCREV_machine_qemuarm64 ?= "1e0bbd1dd68e255a9af7c36930debc6dd4885d0c"
+SRCREV_machine_qemumips ?= "520d5d89434c61b4a95ac0c68d8e74fc8068e35b"
+SRCREV_machine_qemuppc ?= "73e4399fd8db810cb59423767f9ca82a54311c7b"
+SRCREV_machine_qemux86 ?= "19e871b55f80d4cbd406b64d3d5fabf6103e6f1c"
+SRCREV_machine_qemux86-64 ?= "1e0bbd1dd68e255a9af7c36930debc6dd4885d0c"
+SRCREV_machine_qemumips64 ?= "6a469761ad8b3a0e585e53b842ea8d55d05089e3"
+SRCREV_machine ?= "1e0bbd1dd68e255a9af7c36930debc6dd4885d0c"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


