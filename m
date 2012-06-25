Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjCoh-0000V3-Ga
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 19:11:11 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5PH09tL017802;
	Mon, 25 Jun 2012 10:00:15 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 25 Jun 2012 12:59:48 -0400
Message-Id: <45d34fbe3cc7443ea43dc8aee2515c65e99ee08d.1340643139.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 5/5] linux-yocto/3.4: -rt build fixes + configuration audit (part2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 17:11:11 -0000

Updating the 3.4 SRCREVs to pickup build fixes for -rt, feature backports,
and a second set of 3.4 configuration audit results.

  d65afd9 profiling: delete reference of obsolete CONFIG_X86_UP_APIC
  9431490 meta: fix net_sched.cfg include
  242149d meta: add CONFIG_VIRTIO_CONSOLE to virtio configuration
  671a822 meta: resync series -> branches
  e044ee1 rt: integrate patch to fix compile fail on certain configs
  edac822 ktest: update with v3.5 content
  182b8da net_sched: Add CODEL queue management algorithm.
  c6adcd9 net_sched: move content out of cgroups dir
  c8edb3e sys940x: branch before merge
  6d06257 ext3: delete duplicate enablement settings.
  6a5a2f8 ipv6: build in the core support vs. it being modular
  e106230 ipv6: make standard and RT share a common config block
  42996fb netfilter: coalesce bridge settings for standard and RT into a common file.
  2b62fea netfilter: coalesce IPv6 settings for standard and RT into a common file.
  d1c38c8 netfilter: coalesce IPv4 settings for standard and RT into a common file.
  b5f9c7c preempt-rt: align with standard kernel type for basic cfg
  ea33e01 cfg: move devtmpfs cfg/scc to cfg/fs dir
  517eda4 preempt-rt: combine two config fragments into one
  171a30a cgroups: re-enable net_traffic config fragment
  86a599d cgroups: delete old blkio patches
  8be6e5b netfilter: add comment documenting external bb use case
  90e06bf x86[_64]: align with korg on HOTPLUG_PCI, HOTPLUG_PCI_PCIE and PCI_MSI
  e103f7c seccomp: backport of BPF syscall filtering from v3.5

[YOCTO #1694]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 295fe27..9b77186 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -9,9 +9,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e1247309cd90fbdb17479f909a7172e4b0b622d0"
-SRCREV_machine_qemuppc ?= "10ba85000bd4e32ea9e5557bf6d9166b12651c02"
-SRCREV_meta ?= "ef03644fe33f7fd6f50a36b85701fdc6d73e2c96"
+SRCREV_machine ?= "4a688295a1c6d44f3eea409d51a0344c8830d829"
+SRCREV_machine_qemuppc ?= "83843542dd524007547eddba507690cd4bab393b"
+SRCREV_meta ?= "d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index d859c29..7d14967 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,13 +10,13 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "5a282e8b7138174389b64846ea993240c8b1f869"
-SRCREV_machine_qemumips  ?= "7db36332a033ab89988dfcb7b563cbcd83b93663"
-SRCREV_machine_qemuppc ?= "74f0e62044042a7e7abdbac83c6bf160b0c12c58"
-SRCREV_machine_qemux86 ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
-SRCREV_machine_qemux86-64 ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
-SRCREV_machine ?= "aa9621f0955723c71821cc25e711a6d8fe80caf9"
-SRCREV_meta ?= "ef03644fe33f7fd6f50a36b85701fdc6d73e2c96"
+SRCREV_machine_qemuarm ?= "4e354f7fa345464f284525a27eb1544cbc60968d"
+SRCREV_machine_qemumips  ?= "c65bc98cd501459bb6ffc7b5ec5a7e72c41dceef"
+SRCREV_machine_qemuppc ?= "ee3475b4ca8c9e26f55f6e107101d832e7dec7ac"
+SRCREV_machine_qemux86 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
+SRCREV_machine_qemux86-64 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
+SRCREV_machine ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
+SRCREV_meta ?= "d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



