Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrW-0004pi-Vg
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752298"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:22 -0800
Message-Id: <f401afe62d82de32addf115e912fa44d9b8bfa29.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 096/113] lttng-ust: upgrade from 0.15 to the latest 0.16
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:47 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-kernel/lttng/fix-powerpc64.patch      |   17 -----------------
 .../lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} |    9 ++++-----
 2 files changed, 4 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} (79%)

diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipes-kernel/lttng/fix-powerpc64.patch
deleted file mode 100644
index 3c3484c..0000000
--- a/meta/recipes-kernel/lttng/fix-powerpc64.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Submitted
-
-Add bit to detect if we are running on powerpc64 and treat it the
-same as ppc64
-
-Index: ust-0.15/configure.ac
-===================================================================
---- ust-0.15.orig/configure.ac
-+++ ust-0.15/configure.ac
-@@ -111,6 +111,7 @@ changequote([,])dnl
- 	x86_64) LIBFORMAT="elf64-x86-64" ;;
- 	powerpc) LIBFORMAT="elf32-powerpc" ;;
- 	ppc64) LIBFORMAT="elf64-powerpc" ;;
-+	powerpc64) LIBFORMAT="elf64-powerpc" ;;
- 	s390) LIBFORMAT="elf32-s390" ;;
- 	s390x) LIBFORMAT="elf64-s390" ;;
-         armv5) LIBFORMAT="elf32-littlearm"; NO_UNALIGNED_ACCESS=1 ;;
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
similarity index 79%
rename from meta/recipes-kernel/lttng/lttng-ust_0.15.bb
rename to meta/recipes-kernel/lttng/lttng-ust_0.16.bb
index 9dd4658..701bda9 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux Trace Toolkit Userspace Tracer"
 DESCRIPTION = "The LTTng Userspace Tracer (UST) is a library accompanied by a set of tools to trace userspace code"
 HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "n/a"
+BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
 
 DEPENDS = "liburcu"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
-SRC_URI_append_powerpc64 = " file://fix-powerpc64.patch"
 
-SRC_URI[md5sum] = "86c71486a70695dc0b2171ad16fc82b3" 
-SRC_URI[sha256sum] = "7ff7ecdc051c0649d5fd21b5ceff4895ca95dc34f14cdc04e50de13cfd1903c5"
+SRC_URI[md5sum] = "8e5d5de47bfff29f50439d192ad1e478"
+SRC_URI[sha256sum] = "88167741b1fbf335e006f0208d8c41784705e28adac84df71d3d9f6c58191dab"
 
 
 S = "${WORKDIR}/ust-${PV}"
-- 
1.7.6.4



