Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7kP-0003nW-Em
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:22:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 11:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163668616"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2012 11:10:37 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:28 -0500
Message-Id: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 1/9] perl: keep original libperl location
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
X-List-Received-Date: Tue, 03 Jul 2012 18:22:49 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Things like ExtTools expect to find libperl at the original
(${libdir}/perl/${PV}/CORE/libperl.so) location, so keep it there but
symlink to it for the original (?) reason.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 2452a44..a50fedb 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r7"
+PR = "r8"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -200,6 +200,7 @@ do_install() {
         # Fix up shared library
         mv ${D}/${libdir}/perl/${PV}/CORE/libperl.so ${D}/${libdir}/libperl.so.${PV}
         ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
+        ln -sf ../../../libperl.so.${PV} ${D}/${libdir}/perl/${PV}/CORE/libperl.so
 
         # target config, used by cpan.bbclass to extract version information
         install config.sh ${D}${libdir}/perl
-- 
1.7.0.4



