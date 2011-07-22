Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABl-0008Se-5o
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084141"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:56 -0700
Message-Id: <933337038742caea8e102c55e26fc7d65470b3e3.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/16] task-core-tools.bb: Exclude lttng-ust for x86_64/uclibc
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:26 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index eed4afb..b0eb7d4 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -58,6 +58,15 @@ RRECOMMENDS_task-core-tools-profile = "\
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 
+# lttng-ust uses sched_getcpu() which is not there on uclibc
+# for some of the architectures it can be patched to call the
+# syscall directly but for x86_64 __NR_getcpu is a vsyscall
+# which means we can not use syscall() to call it. So we ignore
+# it for x86_64/uclibc
+
+LTTNGUST = "lttng-ust"
+LTTNGUST_libc-uclibc = ""
+
 #    exmap-console
 #    exmap-server
 
@@ -66,7 +75,7 @@ SYSTEMTAP_libc-uclibc = ""
 # (which is required by lttng-ust) may not build on other platforms, like
 # MIPS.
 RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
-RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust ${SYSTEMTAP}"
+RDEPENDS_task-core-tools-profile_append_qemux86-64 = " ${LTTNGUST} ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuarm = " lttng-ust"
 
-- 
1.7.3.4



