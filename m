Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK2CU-0006Sa-6m
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 22:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="641075148"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 22:40:21 -0700
Message-Id: <d35a76a500aaa6e56645292e87834b71e92e38e9.1305092349.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305092348.git.nitin.a.kamble@intel.com>
References: <cover.1305092348.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 22:35:38 -0700
Date: Tue, 10 May 2011 22:40:20 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 5/5] dtc: fix compilation with gcc 4.6.0
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
X-List-Received-Date: Wed, 11 May 2011 05:43:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../dtc/fix_for_compilation_with_gcc_4.6.0.patch   |   51 ++++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_git.inc                |    5 +-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch

diff --git a/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch b/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
new file mode 100644
index 0000000..b34894d
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/fix_for_compilation_with_gcc_4.6.0.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Pending
+
+Fix following compilation errors with gcc 4.6.0
+| dtc.c: In function 'main':
+| dtc.c:100:17: error: variable 'check' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make: *** [dtc.o] Error 1
+| make: *** Waiting for unfinished jobs....
+| flattree.c: In function 'flat_read_mem_reserve':
+| flattree.c:700:14: error: variable 'p' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make: *** [flattree.o] Error 1
+| ERROR: oe_runmake failed
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
+
+Index: git/dtc.c
+===================================================================
+--- git.orig/dtc.c
++++ git/dtc.c
+@@ -97,7 +97,7 @@ int main(int argc, char *argv[])
+ 	const char *inform = "dts";
+ 	const char *outform = "dts";
+ 	const char *outname = "-";
+-	int force = 0, check = 0;
++	int force = 0, __attribute__((__unused__)) check = 0;
+ 	const char *arg;
+ 	int opt;
+ 	FILE *outf = NULL;
+Index: git/flattree.c
+===================================================================
+--- git.orig/flattree.c
++++ git/flattree.c
+@@ -697,7 +697,6 @@ static struct reserve_info *flat_read_me
+ {
+ 	struct reserve_info *reservelist = NULL;
+ 	struct reserve_info *new;
+-	const char *p;
+ 	struct fdt_reserve_entry re;
+ 
+ 	/*
+@@ -706,7 +705,6 @@ static struct reserve_info *flat_read_me
+ 	 *
+ 	 * First pass, count entries.
+ 	 */
+-	p = inb->ptr;
+ 	while (1) {
+ 		flat_read_chunk(inb, &re, sizeof(re));
+ 		re.address  = fdt64_to_cpu(re.address);
diff --git a/meta/recipes-kernel/dtc/dtc_git.inc b/meta/recipes-kernel/dtc/dtc_git.inc
index 6b7acd5..2400cfe 100644
--- a/meta/recipes-kernel/dtc/dtc_git.inc
+++ b/meta/recipes-kernel/dtc/dtc_git.inc
@@ -1,7 +1,8 @@
-SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git"
+SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
+	file://fix_for_compilation_with_gcc_4.6.0.patch"
 
 SRCREV = "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
 PV = "1.2.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
-- 
1.7.3.4



