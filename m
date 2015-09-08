Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C508065CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t88Dikpk012982
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Sep 2015 06:44:46 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 06:44:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 8 Sep 2015 09:44:45 -0400
Message-ID: <1441719885-22787-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/3.14: fix edgerouter (octeon) build
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
X-List-Received-Date: Tue, 08 Sep 2015 13:44:58 -0000
Content-Type: text/plain

Upating the SRCREVs to import the following commit:

    Author: Kevin Hao <kexin.hao@windriver.com>
    Date:   Mon Aug 31 19:34:48 2015 +0800

        mips: octeon: use ll/sc for the atomic ops for all the predecessor
        of octeon2

        Even the octeon plus has the support of the 'saa' instruction, but
        we
        don't have a way to distinguish between octeon and octeon plus at
        compile time and pass "-march=octeon" to all the predecessor of
        octeon2. So it will cause the following error when trying to
        assemble
        the "saa" instruction with option "-march=octeon":
          {standard input}: Assembler messages:
          {standard input}:360: Error: Unrecognized opcode `saa $2,($4)'
          scripts/Makefile.build:308: recipe for target
        'arch/mips/cavium-octeon/executive/cvmx-lap.o' failed

        Forcing to use the "ll/sc" for the atomic ops for all the
        predecessor
        of octeon2 to fix this issue.

        Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
        Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index d59f06b81c04..4d3d5c88df07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
-SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
+SRCREV_machine ?= "8281915527ba8d79e59906c02f28e7aa11424723"
+SRCREV_machine_qemuppc ?= "5e7d372ebc327f28656fc972fab55605eea8aec3"
 SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index f65e0e0ed74f..412c817ff5ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
 SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 1ed9d00b1687..b6b2e5a9b672 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9d0a4947dc7117e393dc3b8c07246d26e22ecdec"
-SRCREV_machine_qemuarm64 ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
-SRCREV_machine_qemumips ?= "9c6fdae47597756042a1d4ed613dff96e430e8e9"
-SRCREV_machine_qemuppc ?= "14679c588669b4b78b329c5858b7aea1791eb451"
-SRCREV_machine_qemux86 ?= "550f5379bc4b001f656e7c98165606e543d0858c"
-SRCREV_machine_qemux86-64 ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
-SRCREV_machine_qemumips64 ?= "9b203f1aff41f7b713ec973cdcc7d016db4ffc26"
-SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_machine_qemuarm ?= "4817747912b5c50ce5c31ef25658340ca615e1b4"
+SRCREV_machine_qemuarm64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
+SRCREV_machine_qemumips ?= "6ed76ec26b120f65f8547c8612b7334bd2745ec9"
+SRCREV_machine_qemuppc ?= "a86ade84b2e142c0fd7536d96477107b6d07db5c"
+SRCREV_machine_qemux86 ?= "af1f7f586bd32d39c057f17606991b887eadb389"
+SRCREV_machine_qemux86-64 ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
+SRCREV_machine_qemumips64 ?= "a63d40b860a6d255005a541894d53729090b40ea"
+SRCREV_machine ?= "578602a722dbfb260801f3b37c6eafd2abb2340d"
 SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
-- 
2.1.0


