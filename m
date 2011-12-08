Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhL-0007fJ-LH
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987725"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:17 -0800
Message-Id: <744c3cb0900eecc34b50195a9c1eb89d616f33cc.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/17] ncurses: libcurses.so should link to libncurses.so
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:23 -0000

The current libcurses (backward compat) links to libncurses.so.5.9,
this causes a problem since this library also needs libtinfo, the
libncurses.so, uses a "ld script" to include both, libcurses.so
should point to libncurses.so (the script) not the library.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index df9252a..54876ca 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools binconfig multilib_header
 
@@ -161,6 +161,10 @@ do_install() {
                 echo '/* GNU ld script */'  >$f
                 echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
         done
+	# Make sure that libcurses is linked so that it gets -ltinfo
+	# also, this should be addressed upstream really.
+	rm -f ${D}${libdir}/libcurses.so
+	ln -s ${D}${libdir}/libncurses.so ${D}${libdir}/libcurses.so
 
         # create libtermcap.so linker script for backward compatibility
         f=${D}${libdir}/libtermcap.so
-- 
1.7.6.4



