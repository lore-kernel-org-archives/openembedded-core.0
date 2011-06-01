Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNa-0007IR-0I
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jun 2011 06:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; d="scan'208";a="11944665"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2011 06:19:22 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:43 +0800
Message-Id: <086ec028392862da34949cb461cbf546d58823e8.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 12/16] cpan.bbclass, cpan-base.bbclas: update them for the perlnative change
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:34 -0000

Since perl-native now populates into its own dir, here we need
change accordingly.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/cpan-base.bbclass |   10 +++++++---
 meta/classes/cpan.bbclass      |   12 ++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 6cd2aa3..b5dbdae 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -7,10 +7,12 @@ FILES_${PN} += "${libdir}/perl ${datadir}/perl"
 DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
 RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
 
+PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
+
 # Determine the staged version of perl from the perl configuration file
 def get_perl_version(d):
 	import re
-    	cfg = bb.data.expand('${STAGING_LIBDIR}/perl/config.sh', d)
+    	cfg = bb.data.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh', d)
 	try:
 		f = open(cfg, 'r')
 	except IOError:
@@ -27,8 +29,10 @@ def get_perl_version(d):
 # Determine where the library directories are
 def perl_get_libdirs(d):
 	libdir = bb.data.getVar('libdir', d, 1)
-	libdirs = libdir + '/perl'
-	return libdirs
+	if is_target(d) == "no":
+		libdir += '/perl-native'
+	libdir += '/perl'
+	return libdir
 
 def is_target(d):
     if not bb.data.inherits_class('native', d):
diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 9b8431b..cbf428d 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -1,7 +1,7 @@
 #
 # This is for perl modules that use the old Makefile.PL build system
 #
-inherit cpan-base
+inherit cpan-base perlnative
 
 EXTRA_CPANFLAGS ?= ""
 EXTRA_PERLFLAGS ?= ""
@@ -10,16 +10,16 @@ EXTRA_PERLFLAGS ?= ""
 export PERLCONFIGTARGET = "${@is_target(d)}"
 
 # Env var which tells perl where the perl include files are
-export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
-export PERL_LIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
-export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}/"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 
 cpan_do_configure () {
 	export PERL5LIB="${PERL_ARCHLIB}"
 	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL ${EXTRA_CPANFLAGS}
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
-		. ${STAGING_LIBDIR}/perl/config.sh
+		. ${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh
 		# Use find since there can be a Makefile generated for each Makefile.PL
 		for f in `find -name Makefile.PL`; do
 			f2=`echo $f | sed -e 's/.PL//'`
-- 
1.7.2



