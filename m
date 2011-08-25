Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qwh24-0007a8-D6
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 23:00:12 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7PKsVoX001887;
	Thu, 25 Aug 2011 13:54:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 25 Aug 2011 16:54:17 -0400
Message-Id: <24f39ccaa8033ada37d2a5a888f8dd1e6d36b79e.1314305555.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314305555.git.bruce.ashfield@windriver.com>
References: <cover.1314305555.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314305555.git.bruce.ashfield@windriver.com>
References: <cover.1314305555.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto-rt: qemumips: fix boot panic
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
X-List-Received-Date: Thu, 25 Aug 2011 21:00:12 -0000

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
1.7.4.1



