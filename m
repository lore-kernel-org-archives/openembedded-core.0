Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDY-0001Zu-SF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753353"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:35 -0700
Message-Id: <c8e181edc6af7a536412ea05d88899beeabcd93e.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 48/50] task-core-tools: Exclude systemtap for uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:23 -0000

From: Khem Raj <raj.khem@gmail.com>

systemtap needs full fledged elfutils which cant be
built on uclibc therefore we live without systemtap
on uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 44520a7..eed4afb 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -53,6 +53,11 @@ RRECOMMENDS_task-core-tools-profile = "\
     sysprof \
     "
 
+# systemtap needs elfutils which is not fully buildable on uclibc
+# hence we exclude it from uclibc based builds
+SYSTEMTAP = "systemtap"
+SYSTEMTAP_libc-uclibc = ""
+
 #    exmap-console
 #    exmap-server
 
@@ -60,9 +65,9 @@ RRECOMMENDS_task-core-tools-profile = "\
 # qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream liburcu
 # (which is required by lttng-ust) may not build on other platforms, like
 # MIPS.
-RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust systemtap"
-RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust systemtap"
-RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust systemtap"
+RDEPENDS_task-core-tools-profile_append_qemux86 = " valgrind lttng-ust ${SYSTEMTAP}"
+RDEPENDS_task-core-tools-profile_append_qemux86-64 = " lttng-ust ${SYSTEMTAP}"
+RDEPENDS_task-core-tools-profile_append_qemuppc = " lttng-ust ${SYSTEMTAP}"
 RDEPENDS_task-core-tools-profile_append_qemuarm = " lttng-ust"
 
 RDEPENDS_task-core-tools-testapps = "\
-- 
1.7.3.4



