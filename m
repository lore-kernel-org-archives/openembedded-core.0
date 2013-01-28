Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Tzvua-0004ob-Qc
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 22:06:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 12:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="253767426"
Received: from unknown (HELO localhost) ([10.255.12.52])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 12:51:00 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:57 -0600
Message-Id: <6b7e1009b3a011ffc035f611f28cdedcef0527b4.1359405784.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <a0ec6e8cff3eac14c1ed44836efae553e6cf05a8.1359405784.git.tom.zanussi@linux.intel.com>
References: <a0ec6e8cff3eac14c1ed44836efae553e6cf05a8.1359405784.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1359405784.git.tom.zanussi@linux.intel.com>
References: <cover.1359405784.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/2] oprofile: remove AX_KERNEL_VERSION from acinclude.m4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 21:06:42 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The version of this macro in acinclude.m4 is preventing the correct
version in the package's kernelversion.m4 from being used.

Since the version in acinclude.m4 includes the obsolete config.h, any
test that uses it with newer (> 2.6.19) kernels fails.  In the case of
oprofile it means that perf_events support is never detected and thus
'legacy oprofile' is always built.

Fixing this allows the new perf_events 'operf' support to be built.

Fixes [YOCTO #3447]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc          |  2 +-
 meta/recipes-kernel/oprofile/oprofile/acinclude.m4 | 19 -------------------
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index d6d20ae..c275110 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,7 +19,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
diff --git a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4 b/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
index ffaa828..95ecd91 100644
--- a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
+++ b/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
@@ -104,25 +104,6 @@ AC_SUBST(OPROFILE_MODULE_ARCH)
 ]
 )
 
-dnl AX_KERNEL_VERSION(major, minor, level, comparison, action-if-true, action-if-false)
-AC_DEFUN([AX_KERNEL_VERSION], [
-SAVE_CFLAGS=$CFLAGS
-CFLAGS="-I$KINC -D__KERNEL__ -Werror"
-AC_TRY_COMPILE( 
-  [
-  #include <linux/version.h>
-  #include <linux/config.h>
-  ],
-  [
-  #if LINUX_VERSION_CODE $4 KERNEL_VERSION($1, $2, $3)
-  break_me_hard(\\\);
-  #endif
-  ],
-[$5],[$6],)
-CFLAGS=$SAVE_CFLAGS
-])
-
-
 dnl AX_MSG_RESULT_YN(a)
 dnl results "yes" iff a==1, "no" else
 AC_DEFUN([AX_MSG_RESULT_YN], [x=no
-- 
1.7.11.4



