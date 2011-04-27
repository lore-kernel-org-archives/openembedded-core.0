Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzET-0005Ol-EJ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683289"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:49 -0700
Message-Id: <877ce168510cded8f23ea173c33c882f966ebe49.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 21:13:38 -0700
Date: Wed, 27 Apr 2011  0:29:49 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 28/52] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:21 -0000

From: Khem Raj <raj.khem@gmail.com>

Perf wants elfutils and elfutils on uclibc does not work due to
its usage of obstack_printf functionality missing from uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-tools.inc |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
index d64c9be..ef81650 100644
--- a/meta/recipes-kernel/linux/linux-tools.inc
+++ b/meta/recipes-kernel/linux/linux-tools.inc
@@ -1,6 +1,11 @@
 # included by kernel recipes if they want to build/provide
 # perf functionality from their tree.
-
+do_compile_perf_libc-uclibc () {
+	:
+}
+do_install_perf_libc-uclibc () {
+	:
+}
 do_compile_perf() {
 	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
 }
@@ -14,6 +19,10 @@ do_install_perf() {
 addtask compile_perf after do_compile before do_install
 addtask install_perf after do_install before do_package
 
-do_compile_perf[depends] =  "virtual/libc:do_populate_sysroot"
-do_compile_perf[depends] =+ "elfutils:do_populate_sysroot"
-RDEPENDS_perf += "python perl elfutils"
+
+PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
+PERFDEPENDS_libc-uclibc = ""
+PERFRDEPENDS = "python perl elfutils"
+PERFRDEPENDS_libc-uclibc = ""
+do_compile_perf[depends] = "${PERFDEPENDS}"
+RDEPENDS_perf += "${PERFRDEPENDS}"
-- 
1.7.1.1



