Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D89F973F63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 03:36:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t483aIvx028683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 20:36:18 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 20:36:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 May 2015 23:36:13 -0400
Message-ID: <17b65966a5cf7324c3a2e7ecfebd724c293c6227.1431055930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431055930.git.bruce.ashfield@windriver.com>
References: <cover.1431055930.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.14: fix qemumips build error
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
X-List-Received-Date: Fri, 08 May 2015 03:36:22 -0000
Content-Type: text/plain

Updating the SRCREVs to import the following fix:

    mips: define cpu_has_saa in common features include

    To avoid build failures such as the following on non-cavium
    platforms:

     | arch/mips/include/asm/atomic.h: In function 'atomic_add':
     | arch/mips/include/asm/atomic.h:52:6: error: 'cpu_has_saa'
     | undeclared (first use in this function)
     |   if (cpu_has_saa) {
     |       ^

    We define a disabled cpu_has_saa unless the machine specific feature
    overrides define a value.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 23e1688daeda..86b31738b609 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "91dc6afcecd47c08e7e13e674d8d7e9dcede5aca"
-SRCREV_machine_qemuppc ?= "2655b44cfe839f6f9ba15b061e1b4d386d5821f6"
+SRCREV_machine ?= "0c641a6c0e38137364535b99e43657a0cbc07cd4"
+SRCREV_machine_qemuppc ?= "cfc4e296efcaa84358c9ab1cdeee6ce7c378436f"
 SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 1d999650611c..d0b71c4859b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_machine ?= "b991a586470900e3de824f5ea75653aa2150594d"
 SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index fa433b61c821..d4ea55a2398e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "90f1033d72d422b4e4a8125f68cd1623d6788870"
-SRCREV_machine_qemuarm64 ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
-SRCREV_machine_qemumips ?= "bc927927f774c9d12f6c4689dbfba9f5578d0b62"
-SRCREV_machine_qemuppc ?= "e4dfdbf1a059e0edb1be677973f8e2c73e012c8a"
-SRCREV_machine_qemux86 ?= "594bfbce3133d75d9aa569883bdeaed15eeadc8f"
-SRCREV_machine_qemux86-64 ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
-SRCREV_machine_qemumips64 ?= "ea8b5406c6ec027d0475146ac84f24eb34196b78"
-SRCREV_machine ?= "2a2be8720802fae73fbdf1da37f61d7843332ba3"
+SRCREV_machine_qemuarm ?= "e4f91293908648d495b4f9735768633569e39b9f"
+SRCREV_machine_qemuarm64 ?= "b991a586470900e3de824f5ea75653aa2150594d"
+SRCREV_machine_qemumips ?= "6623389731309b0ac591736d5b438de833f195c7"
+SRCREV_machine_qemuppc ?= "3217fbcd002914fba4914d2e61dabb378081fd25"
+SRCREV_machine_qemux86 ?= "8794bd6a473199b2baa7a405d44cdbfa5351b60b"
+SRCREV_machine_qemux86-64 ?= "b991a586470900e3de824f5ea75653aa2150594d"
+SRCREV_machine_qemumips64 ?= "6649ef219b3bf6da1678547b9da376367520e80a"
+SRCREV_machine ?= "b991a586470900e3de824f5ea75653aa2150594d"
 SRCREV_meta ?= "46df2668fa657162d11f96a6f1af138c562a03aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


