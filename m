Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TCOAZ-00037E-Gr
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 07:10:23 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8E4viTm010274;
	Thu, 13 Sep 2012 21:57:45 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 14 Sep 2012 00:57:27 -0400
Message-Id: <5f0da99ea0b685191dc7b8fd5fd633783ed92664.1347597967.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347597967.git.bruce.ashfield@windriver.com>
References: <cover.1347597967.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347597967.git.bruce.ashfield@windriver.com>
References: <cover.1347597967.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: make uprobes select perf events
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
X-List-Received-Date: Fri, 14 Sep 2012 05:10:23 -0000

uprobes depends on functionality provided by perf events. After
uprobes was enabled in the standard kernel the mpc8315 board showed
link errors due to missing perf event functions.

This problem isn't isolated to the board or powerpc arch, but all
other boards have PERF_EVENTS enabled. To fix this, we make UPROBE_EVENT
select PERF_EVENTS, and any new boards will be protected from the
same failure.

We also update the configuration fragments since CONFIG_UPROBES depends on
CONFIG_PERF_EVENTS being set, so PERF_EVENTS needs to be added whenever
uprobes are enabled.

[YOCTO #3111]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 3b6b4e7..e42216b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
-SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
-SRCREV_meta ?= "79947f1eb9f695c374ba63672f94deaa1de75561"
+SRCREV_machine ?= "dcecefa43e05f5450886648a93e2fda2ec35e2dc"
+SRCREV_machine_qemuppc ?= "5e8709c4777f07a12b0a05a22f0864f552ef9449"
+SRCREV_meta ?= "7c50e572635d356f0b66d9ab90823f127f835744"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 0812cff..7c082e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "b15e7b1e9b58b9863bd87778775f86cd8d8880ea"
-SRCREV_machine_qemumips  ?= "8d5b98f263b5119af2dc30223f311be17173bab9"
-SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
-SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
-SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
-SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
-SRCREV_meta ?= "79947f1eb9f695c374ba63672f94deaa1de75561"
+SRCREV_machine_qemuarm ?= "679978b4fd1ef8cfea97d4ee4b4cd7c51bc62ee2"
+SRCREV_machine_qemumips  ?= "9c7810609ff37a77e8d39680f98f1baefee18a80"
+SRCREV_machine_qemuppc ?= "cf4bad14983753ad4b592c40fb36466b202b24a4"
+SRCREV_machine_qemux86 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
+SRCREV_machine_qemux86-64 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
+SRCREV_machine ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
+SRCREV_meta ?= "7c50e572635d356f0b66d9ab90823f127f835744"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



