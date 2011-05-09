Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUG-0003hP-5l
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="919810321"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2011 23:59:53 -0700
Message-Id: <c0d6ba1ead3e68509718bea09d0b4d5a49a5f73e.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 12:26:12 -0700
Date: Sun, 08 May 2011 23:59:53 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 15/20] gcc-package-target: Switch to TARGET_PREFIX in symlinks
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
X-List-Received-Date: Mon, 09 May 2011 07:02:36 -0000

From: Tom Rini <tom_rini@mentor.com>

When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks we made
were invalid.  TARGET_PREFIX is what we use when configuring so it's what we
should be using here.

This is 05143e9b5d0a42e32ee0dd3c7fde482ff8d63f63 from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/gcc/gcc-package-target.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index d61e96b..e7f1b80 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -91,13 +91,13 @@ do_install () {
 	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
 
 	# Symlinks so we can use these trivially on the target
-	ln -sf ${TARGET_SYS}-g77 g77 || true
-	ln -sf ${TARGET_SYS}-gfortran gfortran || true
-	ln -sf ${TARGET_SYS}-g++ g++
-	ln -sf ${TARGET_SYS}-gcc gcc
+	ln -sf ${TARGET_PREFIX}g77 g77 || true
+	ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+	ln -sf ${TARGET_PREFIX}g++ g++
+	ln -sf ${TARGET_PREFIX}gcc gcc
 	ln -sf g77 f77 || true
 	ln -sf gfortran f95 || true
 	ln -sf g++ c++
 	ln -sf gcc cc
-	ln -sf ${bindir}/${TARGET_SYS}-cpp ${D}${bindir}/cpp
+	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${bindir}/cpp
 }
-- 
1.7.1.1



