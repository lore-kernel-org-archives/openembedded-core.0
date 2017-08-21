Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C28DA77E12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L2wPf7017258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 19:58:25 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:15 -0400
Message-ID: <08355fa7c404728430e09c3355ee270738e3f5ca.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.1: fix fsl-ls10xx sdhci
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:25 -0000
Content-Type: text/plain

    mmc: sdhci: fix two compile errors

    | CC drivers/mmc/host/sdhci.o
    | drivers/mmc/host/sdhci.c: In function 'sdhci_execute_tuning':
    | drivers/mmc/host/sdhci.c:1990:4: error: implicit
    | declaration of function 'sdhci_do_reset'
    | [-Werror=implicit-function-declaration]
    | sdhci_do_reset(host, SDHCI_RESET_CMD);
    | ^
    | drivers/mmc/host/sdhci.c:2006:7: error: 'struct
    | mmc_command' has no member named 'busy_timeout'
    | cmd.busy_timeout = 50;
    |        ^

    In function sdhci_execute_tuning, replace sdhci_do_reset
    with sdhci_reset, replace busy_timeout with cmd_timeout_ms.

    Commit a629a90ba0 adds eMMC DDR mode support for t2080qds and
    modified some data structures and function name. Later
    commit a2080cc280 just backport upstream commit 61e53bd004
    without aligning the current source tree thus cause
    these build errors. Fix them.

    Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4d40fd1b02bf..c12b403652d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "798e2cbf3dec954f37cb84463bc0b0a95cb54c8f"
+SRCREV_machine ?= "091d8c17b1ba75344ed88a909ead563139de68b3"
 SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 4f2f647975d9..44e6816063a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.42"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_machine ?= "f905fdd5da150ea809f847f00f3476220606c0ff"
 SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b5a3cc8a9fd8..4e85a3eacf81 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f100a3d840596ac0dc47416336f34d8bf7b5ffa8"
-SRCREV_machine_qemuarm64 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
-SRCREV_machine_qemumips ?= "4005321dfa890df693c12e902e48fd0dde88fee7"
-SRCREV_machine_qemuppc ?= "1e29490accfb0547e3a854ac6ec9a6754cd47204"
-SRCREV_machine_qemux86 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
-SRCREV_machine_qemux86-64 ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
-SRCREV_machine_qemumips64 ?= "87c0f4d5bec646565e493d39bf57c3500151ed68"
-SRCREV_machine ?= "e2bea2e96fcbbbb9b1efc3bc7505ac42e39bb5c0"
+SRCREV_machine_qemuarm ?= "b7334672abf08f9dc9e277969e9266785580fa80"
+SRCREV_machine_qemuarm64 ?= "f905fdd5da150ea809f847f00f3476220606c0ff"
+SRCREV_machine_qemumips ?= "664fb3764bc804bfc9fd8ff582b374299e1fc016"
+SRCREV_machine_qemuppc ?= "7392e713c9eb1c67e9e6f8f2d14cae44467c1fbe"
+SRCREV_machine_qemux86 ?= "f905fdd5da150ea809f847f00f3476220606c0ff"
+SRCREV_machine_qemux86-64 ?= "f905fdd5da150ea809f847f00f3476220606c0ff"
+SRCREV_machine_qemumips64 ?= "85e973a2366e2a42d5082f5cd57852f8086502f4"
+SRCREV_machine ?= "f905fdd5da150ea809f847f00f3476220606c0ff"
 SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


