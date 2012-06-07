Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2b-0004r8-8T
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:45 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07Dc018923;
	Thu, 7 Jun 2012 13:00:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:47 -0400
Message-Id: <aa7a41ce0da88bacb6261af9a1a442eadb65b051.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 6/9] linux-yocto: add 3.4 recipe
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:45 -0000

Introducing the 3.4 kernel recipe. At this point there are three
supported kernel 3.4, 3.2 and 3.0.

Build and boot tested on qemux86, qemux86-64, qemuarm, qemumips and
qemuppc

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |   38 ++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
new file mode 100644
index 0000000..81816b1
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -0,0 +1,38 @@
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+KBRANCH = "standard/base"
+KBRANCH_qemux86  = "standard/common-pc/base"
+KBRANCH_qemux86-64  = "standard/common-pc-64/base"
+KBRANCH_qemuppc  = "standard/qemuppc"
+KBRANCH_qemumips = "standard/mti-malta32"
+KBRANCH_qemumips64 = "standard/mti-malta64"
+KBRANCH_qemumips64el = "standard/mti-malta64"
+KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
+
+SRCREV_machine_qemuarm ?= "bc7dd2ebe7f5443fb9d89d46106053cfc69b5d7f"
+SRCREV_machine_qemumips ?= "5a2ad0078de3d24a6e8e3f3c9a7426a08a86717d"
+SRCREV_machine_qemuppc ?= "f92ab2a332627c0213ecfdfc873d470be008f86b"
+SRCREV_machine_qemux86 ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
+SRCREV_machine_qemux86-64 ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
+SRCREV_machine ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
+SRCREV_meta ?= "3fd089debe624c642d7b4d9363f853021d1675b2"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+
+LINUX_VERSION ?= "3.4.1"
+
+PR = "r0"
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "meta"
+
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+
+# Functionality flags
+KERNEL_REVISION_CHECKING=""
+KERNEL_FEATURES="features/netfilter"
+KERNEL_FEATURES_append_qemux86=" cfg/sound"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+
+require recipes-kernel/linux/linux-tools.inc
-- 
1.7.5.4



