Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6911D6041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:20:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5IFK4k3008055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2013 08:20:04 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 08:20:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Jun 2013 11:20:01 -0400
Message-ID: <6fc162ab32d8b9097f22b0b2e52a0f93175dd921.1371567827.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371567827.git.bruce.ashfield@windriver.com>
References: <cover.1371567827.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.8: fix gcc 4.8 ARM boot issues
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
X-List-Received-Date: Tue, 18 Jun 2013 15:20:06 -0000
Content-Type: text/plain

Updating the linux-yocto-3.8 SRCREVs to fix a boot issue with ARM boards
when gcc 4.8 is used.

Without the following mainline backports:

  f200475 ARM: 7670/1: fix the memset fix
  8215b0e ARM: 7668/1: fix memset-related crashes caused by recent GCC (4.7.2) optimizations

The following trap will be seen on boot:

    [<c00fc3b8>] (kmem_cache_alloc_trace+0x54/0x210) from [<c039f074>] (con_insert_unipair+0xcc/0x11c)
    [<c039f074>] (con_insert_unipair+0xcc/0x11c) from [<c039fec8>] (con_set_default_unimap+0xfc/0x198)
    [<c039fec8>] (con_set_default_unimap+0xfc/0x198) from [<c07ee258>] (console_map_init+0x44/0x58)
    [<c07ee258>] (console_map_init+0x44/0x58) from [<c07ee738>] (vty_init+0x16c/0x1b0)
    [<c07ee738>] (vty_init+0x16c/0x1b0) from [<c07edb68>] (tty_init+0x108/0x148)
    [<c07edb68>] (tty_init+0x108/0x148) from [<c07eead0>] (chr_dev_init+0xb4/0xd8)
    [<c07eead0>] (chr_dev_init+0xb4/0xd8) from [<c0008a18>] (do_one_initcall+0x11c/0x18c)
    [<c0008a18>] (do_one_initcall+0x11c/0x18c) from [<c07d89d0>] (kernel_init_freeable+0x16c/0x254)
    [<c07d89d0>] (kernel_init_freeable+0x16c/0x254) from [<c05a3810>] (kernel_init+0x18/0x160)
    [<c05a3810>] (kernel_init+0x18/0x160) from [<c000e530>] (ret_from_fork+0x14/0x20)
    Code: e593a000 e35a0000 0a000020 e5943014 (e79a1003)
    ---[ end trace e6c62de166779f86 ]---
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

Moderate stress and board testing shows the fix to hold, and it is good for
broader testing.

[YOCTO #4549]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index c156be7..a3001ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e0ac9992f1bf4830de49df884a3d2f273d02637b"
-SRCREV_machine_qemuppc ?= "ea4de76a916dd3620e74e565ff42fafb5bb40843"
-SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
+SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
+SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
+SRCREV_meta ?= "c0851dfb8535635e1e31d4a5146d3f021e30506c"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 2073ee3..d9cc82a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -12,8 +12,8 @@ LINUX_VERSION ?= "3.8.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
-SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
+SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
+SRCREV_meta ?= "c0851dfb8535635e1e31d4a5146d3f021e30506c"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 1517f40..0c21f7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "e267fe88798892416828d89bde7f778380b87a90"
-SRCREV_machine_qemumips  ?= "813bae2e17db9310f220935e87d168c8e52fafaf"
-SRCREV_machine_qemuppc ?= "f90923775f9bcec3ce23246e8fb59d8f9551e566"
-SRCREV_machine_qemux86 ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
-SRCREV_machine_qemux86-64 ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
-SRCREV_machine ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
-SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
+SRCREV_machine_qemuarm ?= "aa76cc28408376814752bd36fb0dcf0e25aa5ba3"
+SRCREV_machine_qemumips  ?= "aa0affda03c955678b26b2fb586f1d9505127871"
+SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
+SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
+SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
+SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
+SRCREV_meta ?= "c0851dfb8535635e1e31d4a5146d3f021e30506c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4


