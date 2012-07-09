Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SoHbN-0006KZ-IE
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:18:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Jul 2012 10:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="163398940"
Received: from unknown (HELO localhost) ([10.255.13.39])
	by orsmga001.jf.intel.com with ESMTP; 09 Jul 2012 10:07:14 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Mon,  9 Jul 2012 12:07:10 -0500
Message-Id: <e92762b44c400f4a01f85fac481468fdb568018e.1341852059.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <60e821b5a17b9199ba65f4bd6480c858cc351109.1341852059.git.tom.zanussi@intel.com>
References: <60e821b5a17b9199ba65f4bd6480c858cc351109.1341852059.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341852059.git.tom.zanussi@intel.com>
References: <cover.1341852059.git.tom.zanussi@intel.com>
Subject: [PATCH 2/3] perf: add perf-scripting feature
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
X-List-Received-Date: Mon, 09 Jul 2012 17:18:25 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a new feature named 'perf-scripting'.  Adding this into the
PERF_FEATURES variable in perf.inc will enable perf scripting on a
target, which will turn on all the language bindings currently
available in perf (Perl and Python), if perf is included in an image.

If 'perf-scripting' isn't named as a feature (the default), all perf
language bindings will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index d494243..e96552c 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r1"
+PR = "r2"
 
 require perf.inc
 
@@ -21,7 +21,8 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}binutils \
           "
 
-RDEPENDS_${PN} += "elfutils perl perl-modules python"
+SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
+RDEPENDS_${PN} += "elfutils ${SCRIPTING_RDEPENDS}"
 
 PROVIDES = "virtual/perf"
 
@@ -45,6 +46,8 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
+SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
+
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
 		O=${B} \
@@ -53,7 +56,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		prefix=/usr \
-		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
+		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
 do_compile() {
@@ -62,6 +65,9 @@ do_compile() {
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ]; then
+		oe_runmake DESTDIR=${D} install-python_ext
+	fi
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.0.4



