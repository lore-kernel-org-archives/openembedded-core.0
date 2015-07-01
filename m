Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5EC65C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 21:03:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jul 2015 14:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,388,1432623600"; d="scan'208";a="598450684"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2015 14:02:24 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 12:57:48 +0000
Message-Id: <1435755468-33642-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] gcc-target.inc: Remove non-related gcc headers from include_fixed folder
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 21:03:26 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Without this patch, the D's include_fixed folder may change after building it
(due to the gcc's fixinc.sh script, executed on the do_compile task) and changes
depend on the current sysroot headers, making the gcc's builds non-deterministic.

[YOCTO #7882]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 5d31446..1f91107 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -168,6 +168,37 @@ do_install () {
 	chown -R root:root ${D}
 }
 
+do_install_append () {
+        #
+        # Thefixinc.sh script, run on the gcc's compile phase, looks into sysroot header
+        # files and places the modified files into
+        # {D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed folder. This makes the
+        # build not deterministic. The following code prunes all those headers
+        # except those under include-fixed/linux, *limits.h and README, yielding
+        # the same include-fixed folders no matter what sysroot
+
+        include_fixed="${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed"
+        for f in $(find ${include_fixed} -type f); do
+                case $f in
+                */include-fixed/linux/*)
+                    continue
+                    ;;
+                */include-fixed/*limits.h)
+                    continue
+                    ;;
+                */include-fixed/README)
+                    continue
+                    ;;
+                *)
+                    # remove file and directory if empty
+                    bbdebug 2 "Pruning $f"
+                    rm $f
+                    find $(dirname $f) -maxdepth 0 -empty -exec rmdir {} \;
+                    ;;
+                esac
+        done
+}
+
 # Installing /usr/lib/gcc/* means we'd have two copies, one from gcc-cross
 # and one from here. These can confuse gcc cross where includes use #include_next
 # and builds track file dependencies (e.g. perl and its makedepends code).
-- 
1.8.4.5


