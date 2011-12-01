Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RW2w3-0006Zy-VU
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:28:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 01:21:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,277,1320652800"; d="scan'208";a="81007321"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 01:21:24 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 17:21:25 +0800
Message-Id: <f0005eed49592dca75bd49a1cfc043d8dc252b37.1322731182.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
Subject: [PATCH 1/3] make: expand MAKEFLAGS before we re-exec after rebuilding makefiles.
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
X-List-Received-Date: Thu, 01 Dec 2011 09:28:08 -0000

This patch was got from the upstream cvs repo of make to fix the bug of
make-3.82: http://savannah.gnu.org/bugs/?30723

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../make/make-3.82/expand_MAKEFLAGS.patch          |   39 ++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |    4 ++-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch

diff --git a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
new file mode 100644
index 0000000..4184937
--- /dev/null
+++ b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Inappropriate [The fix is already in upstream cvs repo, but not in the stable release]
+
+When working on the self-hosted-image work, I found in the target
+"bitbake eglibc-initial -c install" always failed:
+
+make[1]: Entering directory `/raid/pe2/build/tmp/work/i586-poky-linux/eglibc-initial-2.13-r18+svnr14157/eglibc-2_13/libc'
+/usr/bin/install -c -m 644 include/limits.h /usr/include/limits.h
+/usr/bin/install: cannot remove `/usr/include/limits.h': Permission denied
+make[1]: *** [/usr/include/limits.h] Error 1
+make[1]: Leaving directory `/raid/pe2/build/tmp/work/i586-poky-linux/eglibc-initial-2.13-r18+svnr14157/eglibc-2_13/libc'
+make: *** [install-headers] Error 2
+ERROR: oe_runmake faile
+
+Debugging shows the install_root variable in eglibc's makefiles is strangely
+reset at some place.
+
+Further investigation shows this is a bug of make-3.82:
+
+http://savannah.gnu.org/bugs/?30723
+http://cvs.savannah.gnu.org/viewvc/make/main.c?root=make&r1=1.243&r2=1.244
+http://old.nabble.com/-bug--30723--implicit-re-executing-of-subdirs-breaks-$(origin)-with-make-3.82-td29394353.html
+
+The patch was got from the second link above(the upstream cvs repo of make).
+
+Thu Dec  1 16:05:59 CST 2011
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
+diff -Nru make-3.82.orig//main.c make-3.82/main.c
+--- make-3.82.orig//main.c	2010-07-19 15:10:53.000000000 +0800
++++ make-3.82/main.c	2011-12-01 16:04:11.818522186 +0800
+@@ -2093,7 +2093,7 @@
+             const char *pv = define_makeflags (1, 1);
+             char *p = alloca (sizeof ("MAKEFLAGS=") + strlen (pv) + 1);
+             sprintf (p, "MAKEFLAGS=%s", pv);
+-            putenv (p);
++            putenv (allocated_variable_expand (p));
+           }
+ 
+ 	  if (ISDB (DB_BASIC))
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index 61fbb32..bea3339 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -1,8 +1,10 @@
-PR = "r0"
+PR = "r1"
 LICENSE="GPLv3&LGPLv2"
 LIC_FILES_CHKSUM = "file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc
 
+SRC_URI += "file://expand_MAKEFLAGS.patch"
+
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
 SRC_URI[sha256sum] = "e2c1a73f179c40c71e2fe8abf8a8a0688b8499538512984da4a76958d0402966"
-- 
1.7.6



