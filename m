Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1TxDGy-0004ZE-QS
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 10:02:33 +0100
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0L8l5c2024920 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 03:47:05 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0L8l44o026485 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 03:47:04 -0500
Received: (qmail 6986 invoked by uid 0); 21 Jan 2013 08:47:03 -0000
Received: from unknown (HELO phenom.lan) (mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 21 Jan 2013 08:47:03 -0000
From: mike.looijmans@topic.nl
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 09:46:59 +0100
Message-Id: <1358758019-21074-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.5.4
Cc: MiLo <milo-software@users.sourceforge.net>
Subject: [PATCH v2] gcc: Enable OpenMP compiling and library
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
X-List-Received-Date: Mon, 21 Jan 2013 09:02:33 -0000

From: MiLo <milo-software@users.sourceforge.net>

Multicore embedded systems are getting more and more common.

Remove "--disable-openmp" from the GCC configuration options and
always build libgomp. This only creates a "bigger" compiler but
has no effect on the compiled binaries that don't use openmp.

Tested a clean build on mips32el and arm7a, no problems encountered.

Autoconf will not detect OpenMP after this change, because it will
build and run a target binary on the build system. In order to use
OpenMP, the variable ac_cv_prog_c_openmp=-fopenmp must be set.
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 -
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    4 +---
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 08a0103..2548f84 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -88,7 +88,6 @@ JAVA = ""
 EXTRA_OECONF_BASE = " --enable-lto \
 			--enable-libssp \
 			--disable-bootstrap \
-			--disable-libgomp \
 			--disable-libmudflap \
 			--with-system-zlib \
 			--with-linker-hash-style=${LINKER_HASH_STYLE} \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index d40383c..1c9155f 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -7,9 +7,7 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-RUNTIMETARGET = "libssp libstdc++-v3"
-RUNTIMETARGET_append_powerpc = " libgomp"
-RUNTIMETARGET_append_powerpc64 = " libgomp"
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
 #  ?
 # libiberty
 # libmudflap
-- 
1.7.5.4



