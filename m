Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07BBA7832A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jhCp022631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:33 -0400
Message-ID: <f1c08a1b2f14826c298f07c76db66b88dd6f6adf.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.12: ide:ide-cd: fix kernel panic resulting from missing scsi_req_init
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:42 -0000
Content-Type: text/plain

Integrating a backport of upstream commit:

    ide:ide-cd: fix kernel panic resulting from missing scsi_req_init

    commit 79d73346ac05bc31 upstream

    Since we split the scsi_request out of struct request, while the
    standard prep_rq_fn builds 10 byte cmds, it missed to invoke
    scsi_req_init() to initialize certain fields of a scsi_request
    structure (.__cmd[], .cmd, .cmd_len and .sense_len but no other
    members of struct scsi_request).

    An example panic on virtual machines (qemu/virtualbox) to boot
    from IDE cdrom:
    ...
    [    8.754381] Call Trace:
    [    8.755419]  blk_peek_request+0x182/0x2e0
    [    8.755863]  blk_fetch_request+0x1c/0x40
    [    8.756148]  ? ktime_get+0x40/0xa0
    [    8.756385]  do_ide_request+0x37d/0x660
    [    8.756704]  ? cfq_group_service_tree_add+0x98/0xc0
    [    8.757011]  ? cfq_service_tree_add+0x1e5/0x2c0
    [    8.757313]  ? ktime_get+0x40/0xa0
    [    8.757544]  __blk_run_queue+0x3d/0x60
    [    8.757837]  queue_unplugged+0x2f/0xc0
    [    8.758088]  blk_flush_plug_list+0x1f4/0x240
    [    8.758362]  blk_finish_plug+0x2c/0x40
    ...
    [    8.770906] RIP: ide_cdrom_prep_fn+0x63/0x180 RSP: ffff92aec018bae8
    [    8.772329] ---[ end trace 6408481e551a85c9 ]---
    ...

    Fixes: 82ed4db499b8 ("block: split scsi_request out of struct request")

    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
    [bva: modified for 4.12 context]
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 0a60fc53aa98..983c1cc758d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f792c32d8f19a31874ec40c033f36ef250e596ae"
+SRCREV_machine ?= "2143b758ad622a73c7c0b3fc8890b81000187635"
 SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index c7f1b8dc8108..658ecc0d6ddf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.14"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
 SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 1bdb0db3c819..a7dd7635131f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "afd1340d4b7c2180ee0e5dbf79499fedf1a023a6"
-SRCREV_machine_qemuarm64 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
-SRCREV_machine_qemumips ?= "6d0052275c433f5a66282ad9f53525a7b6d36dfd"
-SRCREV_machine_qemuppc ?= "26c1863a744836d9171dff262b864cb67f4d537c"
-SRCREV_machine_qemux86 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
-SRCREV_machine_qemux86-64 ?= "26c1863a744836d9171dff262b864cb67f4d537c"
-SRCREV_machine_qemumips64 ?= "c8adcd782e648cb70780443ee90e2f56e2209c5a"
-SRCREV_machine ?= "26c1863a744836d9171dff262b864cb67f4d537c"
+SRCREV_machine_qemuarm ?= "03489013c6844bf3f911e51c5b8cd3bd5c1dc6e9"
+SRCREV_machine_qemuarm64 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
+SRCREV_machine_qemumips ?= "c22264e2e3340eb8affa9a9fc0b86decb2be26c6"
+SRCREV_machine_qemuppc ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
+SRCREV_machine_qemux86 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
+SRCREV_machine_qemux86-64 ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
+SRCREV_machine_qemumips64 ?= "ead3f1c16e85d1b1074acdd13084b5cdf1104e23"
+SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
 SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


