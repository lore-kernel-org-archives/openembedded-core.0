Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIE-0003rc-2u
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045438"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:28 -0800
Message-Id: <28b9ad27eba2c12b28f40cf9de58f3e2d7664522.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/26] ncurses: libcurses.so should link to libncurses.so
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:50 -0000

The current libcurses (backward compat) links to libncurses.so.5.9,
this causes a problem since this library also needs libtinfo, the
libncurses.so, uses a "ld script" to include both, libcurses.so
should point to libncurses.so (the script) not the library.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index df9252a..98f45a4 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools binconfig multilib_header
 
@@ -161,6 +161,9 @@ do_install() {
                 echo '/* GNU ld script */'  >$f
                 echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
         done
+	# Make sure that libcurses is linked so that it gets -ltinfo
+	# also, this should be addressed upstream really.
+	ln -sf libncurses.so ${D}${libdir}/libcurses.so
 
         # create libtermcap.so linker script for backward compatibility
         f=${D}${libdir}/libtermcap.so
-- 
1.7.6.4



