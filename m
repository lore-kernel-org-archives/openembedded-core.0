Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDV-0001ZS-Dy
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753333"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:27 -0700
Message-Id: <bb40d5c61e69e62cc1cadd97e34c89c5ade9eae6.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 40/50] oprofile: Fix build when query_module is not there
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:19 -0000

From: Khem Raj <raj.khem@gmail.com>

on 2.6 kernels we do not have query_module so warn
about it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oprofile/oprofile-no-query-modules.patch       |   29 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
new file mode 100644
index 0000000..c9d7cd6
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
@@ -0,0 +1,29 @@
+disable portions which use query_module on 2.6 kernel this is not available
+in OE we dont support 2.4 anyway
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: oprofile-0.9.6/daemon/liblegacy/opd_kernel.c
+===================================================================
+--- oprofile-0.9.6.orig/daemon/liblegacy/opd_kernel.c	2009-11-24 07:25:17.000000000 -0800
++++ oprofile-0.9.6/daemon/liblegacy/opd_kernel.c	2011-07-18 10:08:39.863798825 -0700
+@@ -270,6 +270,9 @@
+  */
+ static void opd_drop_module_sample(unsigned long eip)
+ {
++	verbprintf(vmodule, "query_module not available on linux-2.6: %s\n", strerror(EPERM));
++
++#if	0
+ 	char * module_names;
+ 	char * name;
+ 	size_t size = 1024;
+@@ -307,6 +310,7 @@
+ 
+ 	if (module_names)
+ 		free(module_names);
++#endif
+ }
+ 
+ 
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
index 603500d..0f154c8 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
@@ -19,10 +19,11 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*.so.* ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.so ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/oprofile/oprofile-${PV}.tar.gz \
            file://opstart.patch \
+           file://oprofile-no-query-modules.patch \
            file://acinclude.m4"
 
 SRC_URI[md5sum] = "4e407093ac06200185d5a5e6437d7242"
-- 
1.7.3.4



