Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7kQ-0003nX-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:22:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 11:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118580744"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2012 11:10:44 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:32 -0500
Message-Id: <1bba3963df77d4de0479ed85d87122be6342b87a.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 5/9] perf: enable Perl binding
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
X-List-Received-Date: Tue, 03 Jul 2012 18:22:50 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add support to enable the perf Perl binding.

The build depends on perl-native to retrieve the configuration
settings needed for the binding.  cpan-base adds some useful functions
like is_target() and get_perl_version() that we need for
PERLCONFIGTARGET and related settings, which allow us to use the
target's Config_heavy.pl settings for ExtUtils:Embed when building for
the target.

Also adds the perl-modules dependency to give the target the perl
modules that scripts using the binding need.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 9f36484..514876b 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -18,7 +18,8 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}elfutils \
            ${MLPREFIX}binutils \
           "
-RDEPENDS_${PN} += "elfutils perl python"
+
+RDEPENDS_${PN} += "elfutils perl perl-modules python"
 
 PROVIDES = "virtual/perf"
 
@@ -31,6 +32,14 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
+# needed for building the tools/perf Perl binding
+inherit perlnative cpan-base
+# Env var which tells perl if it should use host (no) or target (yes) settings
+export PERLCONFIGTARGET = "${@is_target(d)}"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.7.0.4



