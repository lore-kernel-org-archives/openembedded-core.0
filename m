Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7kQ-0003nW-W8
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:22:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2012 11:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163668655"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2012 11:10:47 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:34 -0500
Message-Id: <0856ecabc55e047a8d4aeb67bf213a8d11cf385a.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 7/9] perf: add perf-scripting MACHINE_FEATURE
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
X-List-Received-Date: Tue, 03 Jul 2012 18:22:51 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a new MACHINE_FEATURE named 'perf-scripting'.  Adding this into
any machine configuration will enable perf scripting on the target,
which will turn on all the language bindings currently aavailable in
perf (Perl and Python), if perf is included in an image.

If 'perf-scripting' isn't named as a feature (the default), all perf
language bindings will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index a1628bb..81121c1 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -19,7 +19,8 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}binutils \
           "
 
-RDEPENDS_${PN} += "elfutils perl perl-modules python"
+SCRIPTING_RDEPENDS = "${@base_contains('MACHINE_FEATURES', 'perf-scripting', 'perl perl-modules python', '',d)}"
+RDEPENDS_${PN} += "elfutils ${SCRIPTING_RDEPENDS}"
 
 PROVIDES = "virtual/perf"
 
@@ -43,6 +44,8 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
+SCRIPTING_DEFINES = "${@base_contains('MACHINE_FEATURES', 'perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
+
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
 		O=${B} \
@@ -51,7 +54,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		prefix=/usr \
-		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
+		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
 do_compile() {
@@ -60,7 +63,9 @@ do_compile() {
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
-	oe_runmake DESTDIR=${D} install-python_ext
+	if [ "${@base_contains('MACHINE_FEATURES', 'perf-scripting', 1, 0, d)}" = "1" ]; then
+		oe_runmake DESTDIR=${D} install-python_ext
+	fi
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.0.4



