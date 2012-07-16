Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhV-0006st-1r
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443376"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:33 -0700
Message-Id: <9dd4cbd84c38d6d5e1f4338b9ce7399c48cf18f5.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/30] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:09 -0000

From: Ting Liu <b28495@freescale.com>

lsof tries to compile a temp c source file and execute the binary to
determine linux C library type (file Configure, line 2689-2717).
It is inpracticable for cross-compilation and may have build issue on
some distros since it depends on host settings.

Fix below error when building for 64bit target on 64bit host:
[...]
| dsock.c:481:44: error: 'TCP_LISTEN' undeclared (first use in this function)
| dsock.c:482:45: error: 'TCP_CLOSING' undeclared (first use in this function)
[...]
| make: *** [dsock.o] Error 1

The actual issue exists in do_configure:
[...]
Testing C library type with cc ... done
Cannot determine C library type; assuming it is not glibc.

Which is in turn caused by missing 'gnu/stubs-32.h" when compiling
the temp c source file on host:
[...]
fatal error: gnu/stubs-32.h: No such file or directory compilation terminated.

file gnu/stubs-32.h is provided by 32bit glibc.

Signed-off-by: Ting Liu <b28495@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/lsof/lsof_4.85.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb b/meta/recipes-extended/lsof/lsof_4.85.bb
index 5823725..de7ff68 100644
--- a/meta/recipes-extended/lsof/lsof_4.85.bb
+++ b/meta/recipes-extended/lsof/lsof_4.85.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
@@ -31,6 +31,11 @@ export LSOF_INCLUDE = "${STAGING_INCDIR}"
 do_configure () {
 	export LSOF_AR="${AR} cr"
 	export LSOF_RANLIB="${RANLIB}"
+        if [ "x${EGLIBCVERSION}" != "x" ];then
+                LINUX_CLIB=`echo ${EGLIBCVERSION} |sed -e 's,\.,,g'`
+                LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
+                export LINUX_CLIB
+        fi
 	yes | ./Configure ${LSOF_OS}
 }
 
-- 
1.7.7.6



