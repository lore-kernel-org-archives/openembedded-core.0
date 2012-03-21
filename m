Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAOdw-0003r2-RJ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 17:44:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2012 09:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131571765"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2012 09:35:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org, eric@eukrea.com, fcooper@ti.com,
	Martin.Jansa@gmail.com, richard.purdie@linuxfoundation.org
Date: Wed, 21 Mar 2012 09:35:16 -0700
Message-Id: <bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1332347414.git.nitin.a.kamble@intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Wed, 21 Mar 2012 16:44:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This reverts commit 1cb4614f1d5e482b88ea372d1841a6c313a49941.

and bump PR

This fixes this bug:
[YOCTO #2077] - memory buffer mess up of i586-poky-linux-gdb in meta-toolchain
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2077

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   20 +-------------------
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index a7cac61..ec0748e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -4,22 +4,4 @@ DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk python-nativesdk"
-RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
-             python-nativesdk-codecs python-nativesdk-netclient"
-
-EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
-
-do_configure_prepend() {
-cat > ${WORKDIR}/python << EOF
-#! /bin/sh
-case "\$2" in
-        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}/" ;;
-        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
-        --exec-prefix) echo "/usr" ;;
-        *) exit 1 ;;
-esac
-exit 0
-EOF
-        chmod +x ${WORKDIR}/python
-}
+DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index dbcffde..dfb7d81 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.6.4



