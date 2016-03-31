Return-Path: <william.c.randle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 257496011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 05:11:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2016 22:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,420,1455004800"; d="scan'208";a="76344392"
Received: from wcrandle-mobl1.amr.corp.intel.com ([10.254.181.220])
	by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2016 22:11:41 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 22:11:35 -0700
Message-Id: <1459401095-24585-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] man: use BUILD_CC and target include files for configure
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
X-List-Received-Date: Thu, 31 Mar 2016 05:11:42 -0000

The configure script was using the cross-compiler for feature tests,
which fails to execute when the target is different than the host.
Change the script to use the build compiler instead, but use the
target include files to check for the target features.

[YOCTO #9359]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
[Note: this should be applied after previous man patch "fix several
annoying compile/build warnings".]

 .../man/man/man-1.6g-configure.patch               | 68 ++++++++++++++++++++++
 meta/recipes-extended/man/man_1.6g.bb              |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/man/man/man-1.6g-configure.patch

diff --git a/meta/recipes-extended/man/man/man-1.6g-configure.patch b/meta/recipes-extended/man/man/man-1.6g-configure.patch
new file mode 100644
index 0000000..106cc98
--- /dev/null
+++ b/meta/recipes-extended/man/man/man-1.6g-configure.patch
@@ -0,0 +1,68 @@
+Use BUILD_CC and target include files for configuration tests.
+If cross-compiling, force pathnames for helper programs, since
+autodiscovery by the configure script will not work.
+
+Upstream-Status: Pending
+
+Signed-off-by: Bill Randle <william.c.randle at intel.com>
+
+--- man-1.6g/configure.orig	2016-03-28 17:46:12.734910976 -0700
++++ man-1.6g/configure	2016-03-30 21:47:45.110572908 -0700
+@@ -216,7 +216,8 @@
+ INCLUDEDIR=${INCLUDEDIR-/usr/include}
+ 
+ rm -f conftest conftest.c
+-compile="$CC $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
++# since we are interested in target feature support, use that sysroot
++compile="$BUILD_CC -isystem/${PKG_CONFIG_SYSROOT_DIR}/usr/include $DEFS conftest.c -o conftest $LIBS >/dev/null 2>&1"
+ 
+ # Check for various header files.
+ 
+@@ -455,19 +456,23 @@
+       fi
+     done
+   done
+-  Fgroff=/usr/bin/groff
+-  Fnroff=/usr/bin/nroff
+-  Fjnroff=/usr/bin/nroff
+-  Fgeqn=/usr/bin/geqn
+-  Fgtbl=/usr/bin/gtbl
+-  Fcol=/usr/bin/col
+-  Fgrefer=/usr/bin/grefer
+-  Fgpic=/usr/bin/gpic
+-  Fmore=/bin/more
+-  Fless=/usr/bin/less
+-  Fcmp=/usr/bin/cmp
+-  Fcat=/bin/cat
+-  Fgawk=/bin/gawk
++  if [ $BUILD_CC != $CC ]; then
++    # cross compiling => target fs not available, so force defaults
++    Fgroff=/usr/bin/groff
++    Fnroff=/usr/bin/nroff
++    Fjnroff=/usr/bin/nroff
++    Fgeqn=/usr/bin/eqn
++    Fgneqn=/usr/bin/neqn
++    Fgtbl=/usr/bin/tbl
++    Fcol=/usr/bin/col
++    Fgrefer=/usr/bin/refer
++    Fgpic=/usr/bin/pic
++    Fmore=/bin/more
++    Fless=/usr/bin/less
++    Fcmp=/usr/bin/cmp
++    Fcat=/bin/cat
++    Fgawk=/usr/bin/gawk
++  fi
+ 
+ 
+   for i in eqn tbl refer pic
+@@ -507,8 +512,8 @@
+     jnroff="$Fjnroff -Tutf8 -mandocj"
+   fi
+   eqn="$Fgeqn -Tps"
+-  neqn="$Fgeqn -Tutf8"
+-  jneqn="$Fgeqn -Tutf8"
++  neqn="$Fgneqn -Tutf8"
++  jneqn="$Fgneqn -Tutf8"
+   tbl="$Fgtbl"
+   col="$Fcol"
+   vgrind="$Fvgrind"
diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index efdf565..e78aa18 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -54,6 +54,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
            file://configure_sed.patch \
            file://man-1.6g-parallel.patch \
            file://man-1.6g-compile-warnings.patch \
+           file://man-1.6g-configure.patch \
 "
 
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
-- 
2.5.0


