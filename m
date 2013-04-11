Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UQHno-0005ZN-NR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 15:44:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3BDRDIk013666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 06:27:13 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Apr 2013 06:27:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Apr 2013 06:27:04 -0700
Message-ID: <80ab72bcef4083cd50c348efc1fcae9fe7b9f4c0.1365686481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365686481.git.bruce.ashfield@windriver.com>
References: <cover.1365686481.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] linux-yocto/3.8: aufs, config processing, tiny, mips boot fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 13:44:57 -0000
Content-Type: text/plain

Updating the SRCREVs to fix a number of bugs, boot issues and ktype support
additions.

standard/*:

   Aufs support was misplaced on the move from the -dev to release kernel, this
   commit restores the support. This is not active unless the aufs configuration
   items are enabled via the aufs-enable.scc feature.

   11998bd aufs: core support
   f2ea9f4 aufs: standalone support
   bf529b6 aufs: aufs proc_map
   b6f0a04 aufs: aufs base support
   55b0bc2 aufs: kbuild patch

meta:

   The meta branch has updates for aufs enablement, tiny BSP configs, preempt-rt
   fixes and a wifi config audit fix.

   4c567e0 meta/aufs: add -enable feature and patches
   059fe88 meta/aufs: create aufs configuration fragment
   7d672cd0 meta: add fri2 tiny BSP config.

mti-malta32:

   This fixes the graphical boot of qemumips, the offending commit is breaking
   dynamic patching of ftrace on the simulation, so we revert the commit for now.

   18c71ab Revert "ftrace/x86: Have x86 ftrace use the ftrace_modify_all_code()"

mti-malta64:

   This enables the boot of qemumips64 by reverting the broken ftrace support for
   mips64 and by stubbing out inavlid oprofile register writes.

   0ec615c Revert "ftrace/x86: Have x86 ftrace use the ftrace_modify_all_code()"
   bbefde3 oprofile/mips: do not set perf_irq for qemu mips 64
   eb6cb79 Revert "MIPS: Function tracer: Fix broken function tracing"

[YOCTO #4052]
[YOCTO #4129]
[YOCTO #2410]

(From OE-Core rev: 3d88f61b59f0a07e199306bf3a15ab023e77e17d)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 36943cc..1929796 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "abd0728b164f651292374e96251ee197b50e3c02"
-SRCREV_machine_qemuppc ?= "1619988b773840ec546292a9cd65dda99d55b96c"
-SRCREV_meta ?= "a601ed4fb7b68db2fb0198993f85590b1b90f758"
+SRCREV_machine ?= "0f7d294a9d07713059af345188f9cd4f549b4e77"
+SRCREV_machine_qemuppc ?= "82cdb00523b3f86219706d9f12dc80ff8d1c747a"
+SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 07b620c..b6d112c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -12,8 +12,8 @@ LINUX_VERSION ?= "3.8.4"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_meta ?= "f86199dd4c142fae61517a993b3f7162bb6d4f94"
+SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index c9b286c..ddafd26 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "bf458ca0e48f4f57cbb02b52070a000f361eec84"
-SRCREV_machine_qemumips  ?= "c7297b41016919c95a2c779cafc0aad736f6a400"
-SRCREV_machine_qemuppc ?= "f8848d222d1fcd1ebc517d28f289735621708449"
-SRCREV_machine_qemux86 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_machine_qemux86-64 ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_machine ?= "42ddf06111efe45f3c36012d5a04a1eeb9781f42"
-SRCREV_meta ?= "a601ed4fb7b68db2fb0198993f85590b1b90f758"
+SRCREV_machine_qemuarm ?= "ec3299eaa89a7302009e3d46c9570f633ff32e9a"
+SRCREV_machine_qemumips  ?= "e5e37d6aab5d82398f874f623ec9b37a8274f41a"
+SRCREV_machine_qemuppc ?= "223428bbc1a355200bd9a8046fd272c1b9b13e67"
+SRCREV_machine_qemux86 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_machine_qemux86-64 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_meta ?= "4c567e02266ebe383abc6755b4f7908696ac099d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4



