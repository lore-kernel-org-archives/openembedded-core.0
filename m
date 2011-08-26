Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Ke-0006Xw-3k
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450531"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:41 -0700
Message-Id: <7ceb78a42f7d9b6aa4b984d04ac13f8dc23a9095.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/21] linux-yocto-rt: qemumips: fix boot panic
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:49 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Fixes [YOCTO #1392]

Updating the SRCREVs to pickup:

[
    mips/rt: convert cascade interrupt non threaded

    The preempt_rt kernel forces all irq interrupts to be threaded,
    but special interrupts can be excluded from this conversion.
    The cascade interrupt should be part of these exceptions.

    In this case, irq2 is initialized before "kthreadd" task, which
    converts irq interrupt to threaded.

    If this irq is threaded, the kernel calls "try_to_wake_up" function
    to wake up "kthreadd" task, but at that moment, "kthreadd" task
    has no been initialize and try_to_wake_up wakes up a NULL task.

    Signed-off-by: Liming Wang <liming.wang@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 16daddf..2bee543 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -14,8 +14,8 @@ KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.0.3"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "67ce0924042a2faa12b71ac3e92175c789c32af6"
-SRCREV_machine_qemuppc ?= "839638f4efda0c70c6f491161ab2c042f5bc3e66"
+SRCREV_machine ?= "c86423d29c94525d18ef1c9b6c025f733c1e8252"
+SRCREV_machine_qemuppc ?= "ccb47c9e8d85dc00ccd28bc6819d7769e2c11cb3"
 SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
 
 PR = "r0"
-- 
1.7.6



