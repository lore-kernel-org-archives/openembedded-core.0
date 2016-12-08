Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4647C71C4C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:02:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB8I2PrQ017315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Dec 2016 10:02:26 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 09:59:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:48 -0500
Message-ID: <87075566e28d6d6e8c9c1ab9ef5f66ca0b79684e.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/4.8: aufs warning and ixgbe calltrace
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
X-List-Received-Date: Thu, 08 Dec 2016 18:02:26 -0000
Content-Type: text/plain

Integrating the following commits to fix aufs/ixgbe issues:

   Author: Liwei Song <liwei.song@windriver.com>
   Date:   Mon Dec 5 00:50:16 2016 -0500

       ixgbe: initialize u64_stats_sync structures early at ixgbe_probe

       Fix the following CallTrace:
       INFO: trying to register non-static key.
       the code is fine but needs lockdep annotation.
       turning off the locking correctness validator.
       CPU: 71 PID: 1 Comm: swapper/0 Not tainted 4.8.8-WR9.0.0.1_standard #11
       Hardware name: Intel Corporation S2600WTT/S2600WTT,
       BIOS GRNDSDP1.86B.0036.R05.1407140519 07/14/2014
        00200086 00200086 eb5e1ab8 c144dd70 00000000 00000000 eb5e1af8 c10af89a
        c1d23de4 eb5e1af8 00000009 eb5d8600 eb5d8638 eb5e1af8 c10b14d8 00000009
        0000000a c1d32911 00000000 00000000 e44c826c eb5d8000 eb5e1b74 c10b214e
       Call Trace:
        [<c144dd70>] dump_stack+0x5f/0x8f
        [<c10af89a>] register_lock_class+0x25a/0x4c0
        [<c10b14d8>] ? check_irq_usage+0x88/0xc0
        [<c10b214e>] __lock_acquire+0x5e/0x17a0
        [<c1abdb9b>] ? _raw_spin_unlock_irqrestore+0x3b/0x70
        [<c10cf14a>] ? rcu_read_lock_sched_held+0x8a/0x90
        [<c10b3c5f>] lock_acquire+0x9f/0x1f0
        [<c1922dcf>] ? dev_get_stats+0x5f/0x110
        [<c176e6b3>] ixgbe_get_stats64+0x113/0x320
        [<c1922dcf>] ? dev_get_stats+0x5f/0x110
        [<c1922dcf>] dev_get_stats+0x5f/0x110
        [<c1ab5415>] rtnl_fill_stats+0x40/0x105
        [<c193dd45>] rtnl_fill_ifinfo+0x4c5/0xd20
        [<c11c5115>] ? __kmalloc_node_track_caller+0x1a5/0x410
        [<c1917487>] ? __kmalloc_reserve.isra.42+0x27/0x80
        [<c191754f>] ? __alloc_skb+0x6f/0x270
        [<c1942291>] rtmsg_ifinfo_build_skb+0x71/0xd0
        [<c194230a>] rtmsg_ifinfo.part.23+0x1a/0x50
        [<c1923dad>] ? call_netdevice_notifiers_info+0x2d/0x60
        [<c194236b>] rtmsg_ifinfo+0x2b/0x40
        [<c192f997>] register_netdevice+0x3d7/0x4d0
        [<c192faa7>] register_netdev+0x17/0x30
        [<c177b83d>] ixgbe_probe+0x118d/0x1610
        [<c1498202>] local_pci_probe+0x32/0x80
        [<c1498172>] ? pci_match_device+0xd2/0x100
        [<c14991e0>] pci_device_probe+0xc0/0x110
        [<c1652cc5>] driver_probe_device+0x1c5/0x280
        [<c1498172>] ? pci_match_device+0xd2/0x100
        [<c1652e09>] __driver_attach+0x89/0x90
        [<c1652d80>] ? driver_probe_device+0x280/0x280
        [<c165114f>] bus_for_each_dev+0x4f/0x80
        [<c165269e>] driver_attach+0x1e/0x20
        [<c1652d80>] ? driver_probe_device+0x280/0x280
        [<c1652317>] bus_add_driver+0x1a7/0x220
        [<c1653a79>] driver_register+0x59/0xe0
        [<c1f897b8>] ? igb_init_module+0x49/0x49
        [<c1497b2a>] __pci_register_driver+0x4a/0x50
        [<c1f8985d>] ixgbe_init_module+0xa5/0xc4
        [<c1000485>] do_one_initcall+0x35/0x150
        [<c107e818>] ? parameq+0x18/0x70
        [<c1f395d8>] ? repair_env_string+0x12/0x51
        [<c107ead0>] ? parse_args+0x260/0x3b0
        [<c1074f73>] ? __usermodehelper_set_disable_depth+0x43/0x50
        [<c1f39e90>] kernel_init_freeable+0x19b/0x267
        [<c1f395c6>] ? set_debug_rodata+0xf/0xf
        [<c10b1e7b>] ? trace_hardirqs_on+0xb/0x10
        [<c1abdc02>] ? _raw_spin_unlock_irq+0x32/0x50
        [<c1085f0b>] ? finish_task_switch+0xab/0x1f0
        [<c1085ec9>] ? finish_task_switch+0x69/0x1f0
        [<c1ab6a30>] kernel_init+0x10/0x110
        [<c108bd65>] ? schedule_tail+0x25/0x80
        [<c1abe422>] ret_from_kernel_thread+0xe/0x24
        [<c1ab6a20>] ? rest_init+0x130/0x130

       This CallTrace occurred on 32-bit kernel with CONFIG_PROVE_LOCKING
       enabled.

       This happens at ixgbe driver probe hardware stage, when comes to
       ixgbe_get_stats64, the seqcount/seqlock still not initialize, although
       this was initialize in TX/RX resources setup routin, but it was too late,
       then lockdep give this Warning.

       To fix this, move the u64_stats_init function to driver probe stage,
       which before we get the status of seqcount and after the RX/TX ring
       was finished init.

       Signed-off-by: Liwei Song <liwei.song@windriver.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

   Author: Kexin(Casey) Chen <Casey.Chen@windriver.com>
   Date:   Tue Nov 29 14:14:07 2016 -0800

       aufs: fix compile warning

       fs/aufs/debug.h:95:19: warning: comparison of constant '0'
       with boolean expression is always false [-Wbool-compare]
          if (unlikely((e) < 0)) \
                           ^

       fs/aufs/vdir.c:852:2: note: in expansion of macro 'AuTraceErr'
          AuTraceErr(!valid);
          ^~~~~~~~~~

       In expansion of AuTraceErr(!valid), comparison of (!valid)
       and constant '0' always passes unlikely(x) false. function
       'static int seek_vdir(struct file *file, struct dir_context *ctx)'
       is to find whether there is a valid vd_deblk following ctx->pos.
       return 1 means valid, 0 for not. Change to AuTraceErr(valid - 1)
       makes more sense.

       Signed-off-by: Kexin(Casey) Chen <Casey.Chen@windriver.com>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 3d9ff393fdd0..fe663b1711f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4b6a2814a1ac2a917a8334748b3168315e678041"
+SRCREV_machine ?= "df64f1041f15871cffb254d7136072d1d4859284"
 SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 870a3487f3d3..0ff18b8d8cea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.8.10"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "96ea072413fb386598a62c77ed202a6de08085f6"
+SRCREV_machine ?= "78e5c86c1c194e2045e8eb2c948d00f2dbb1f31c"
 SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index a4dd9adc7162..16058ed83329 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a0241e756033146b308e94e262f0c434d4d5dcdc"
-SRCREV_machine_qemuarm64 ?= "72e32211033cff873824d944470d06f590f66a85"
-SRCREV_machine_qemumips ?= "b17c74d6df96711a98c48515b6c171dfe492a4a6"
-SRCREV_machine_qemuppc ?= "15c034ae478c08219aaefaf8a9b57ee2939715a9"
-SRCREV_machine_qemux86 ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
-SRCREV_machine_qemux86-64 ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
-SRCREV_machine_qemumips64 ?= "7688c6f57bc68c6b39f0bd7a20ea84419ebfaf50"
-SRCREV_machine ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
+SRCREV_machine_qemuarm ?= "a004864814e34348c6dc5f745af3f775c55c0510"
+SRCREV_machine_qemuarm64 ?= "eb61693c773924d742aeea5e03b88d7554db61c3"
+SRCREV_machine_qemumips ?= "89f99732db8a8082898a396e67a34472a1017032"
+SRCREV_machine_qemuppc ?= "e03132839bac2cef030ff70b3e19c0fb4816a9fd"
+SRCREV_machine_qemux86 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
+SRCREV_machine_qemux86-64 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
+SRCREV_machine_qemumips64 ?= "ff92ef8e2b67415b5e6fd4cd15489cb43de8c932"
+SRCREV_machine ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
 SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


