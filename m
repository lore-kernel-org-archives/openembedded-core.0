Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RW9Vt-0004j2-R3
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:29:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2011 08:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81800434"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 08:22:53 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  1 Dec 2011 08:22:27 -0800
Message-Id: <7fa549f9fba48488138a21ec70fc4d16d74d228a.1322756466.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322756466.git.dvhart@linux.intel.com>
References: <cover.1322756466.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1322756466.git.dvhart@linux.intel.com>
References: <cover.1322756466.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] trace-cmd: Add blktrace_api compatibility for TC_BARRIER
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
X-List-Received-Date: Thu, 01 Dec 2011 16:29:34 -0000

From: Darren Hart <dvhart@linux.intel.com>

Newer kernels replace TC_BARRIER with TC_FLUSH. Ensure trace-cmd
can build regardless of the linux-kernel-headers version.

This is intended as a stop-gap to get the builds working again. A
proper fix will need to be discussed with the trace-cmd community.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    3 +-
 .../trace-cmd/blktrace-api-compatibility.patch     |   29 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    3 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index aa070a9..beb203f 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -14,7 +14,8 @@ inherit pkgconfig
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
            file://addldflags.patch \
-           file://make-docs-optional.patch"
+           file://make-docs-optional.patch \
+           file://trace-cmd/blktrace-api-compatibility.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
new file mode 100644
index 0000000..0789e9f
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
@@ -0,0 +1,29 @@
+trace-cmd: Add blktrace_api compatibility for TC_BARRIER
+
+Newer kernels replace TC_BARRIER with TC_FLUSH. Ensure trace-cmd
+can build regardless of the linux-kernel-headers version.
+
+Upstream-Status: Innapropriate [Stop gap]
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+diff --git a/plugin_blk.c b/plugin_blk.c
+index 9327b17..c8e5e1c 100644
+--- a/plugin_blk.c
++++ b/plugin_blk.c
+@@ -44,6 +44,15 @@ struct blk_data {
+ 	unsigned short		pdu_len;
+ };
+ 
++/*
++ * Newer kernels don't define BLK_TC_BARRIER and have replaced it with
++ * BLK_TC_FLUSH. In this case, define it here and report FLUSHES as BARRIERS as
++ * a workaround, as described in:
++ * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=c09c47caedc9854d59378d6e34c989e51cfdd2b4
++ */
++#ifndef BLK_TC_BARRIER
++#define BLK_TC_BARRIER 1<<2
++#endif
+ static void fill_rwbs(char *rwbs, int action, unsigned int bytes)
+ {
+ 	int i = 0;
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 1b9231b..38bfbb5 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -11,7 +11,8 @@ inherit pkgconfig
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
            file://addldflags.patch \
-           file://make-docs-optional.patch"
+           file://make-docs-optional.patch \
+           file://trace-cmd/blktrace-api-compatibility.patch"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'prefix=${prefix}'"
-- 
1.7.6.4



