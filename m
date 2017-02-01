Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 016D677352
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUjL6026948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:45 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:33 -0500
Message-ID: <3283e4921cfccaf6736eb33e03cbf322fd9ab4a6.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] kernel-yocto/meta: common-pc: add pci-siov to feature fragments
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:45 -0000
Content-Type: text/plain

The common-pc ethernet selection has drivers that depend on pci_iov
being defined. As such, we should include that feature fragment
or we get build warnings:

    ---------- CONFIG_BNX2X_SRIOV -----------------
    Config: CONFIG_BNX2X_SRIOV
    From:   work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-eth.cfg
    Requested value:  CONFIG_BNX2X_SRIOV=y
    Actual value:

    Config 'BNX2X_SRIOV' has the following conditionals:
    BNX2X && PCI_IOV (value: "n")
    BNX2X && PCI_IOV (value: "n")
    Dependency values are:
      BNX2X [m] PCI_IOV [n] y [y]

    ---------- CONFIG_BNXT_SRIOV -----------------
    Config: CONFIG_BNXT_SRIOV
    From: work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-eth.cfg
    Requested value:  CONFIG_BNXT_SRIOV=y
    Actual value:

    Config 'BNXT_SRIOV' has the following conditionals:
    BNXT && PCI_IOV (value: "n")
    BNXT && PCI_IOV (value: "n")
    Dependency values are:
      y [y] BNXT [m] PCI_IOV [n]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index e85d7c7b18c0..155815e5df09 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1d5e0d6f25c65f2404c47de11bef86f3dbc7f29d"
-SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
+SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index a052dad5d1fa..beb2d4de30e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
+SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index a61bb137b999..241eb94f6ab0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
 SRCREV_machine_qemux86-64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
 SRCREV_machine_qemumips64 ?= "06fff8284bbec52a36fb3d054354db2f593376ac"
 SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
+SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


