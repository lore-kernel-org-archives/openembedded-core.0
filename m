Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E758E6B511
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Dec 2018 21:43:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2018 13:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,336,1539673200"; d="scan'208";a="126455598"
Received: from chiron.jf.intel.com ([10.54.74.39])
	by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2018 13:43:25 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Dec 2018 13:43:22 -0800
Message-Id: <20181209214322.35220-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] liberror-perl: upgrade 0.17026 -> 0.17027
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Dec 2018 21:43:25 -0000
Content-Transfer-Encoding: 8bit

* add RDEPENDS
* add RDEPENDS for ptest
  - tested on qemux86 with glibc and musl
* drop do_compile, not obvious why LIBC needed to be set
* Added HOMEPAGE:
  https://bitbucket.org/shlomif/perl-error.pm
  - Repository used to be github.com/shlomif (deadlink)

Upstream release notes:
"""
0.17027         2018-10-28
- Documentation and examples enhancements.
  - https://bitbucket.org/shlomif/perl-error.pm/pull-requests/1/october-prc-some-minor-mostly-doc-changes/diff
  - Thanks to https://metacpan.org/author/JMERELO .
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...rl_0.17026.bb => liberror-perl_0.17027.bb} | 30 ++++++++++++++-----
 1 file changed, 22 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17026.bb => liberror-perl_0.17027.bb} (55%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17026.bb b/meta/recipes-devtools/perl/liberror-perl_0.17027.bb
similarity index 55%
rename from meta/recipes-devtools/perl/liberror-perl_0.17026.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17027.bb
index 6f42b47298..cf1f6d685f 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17026.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17027.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Error package provides two interfaces. Firstly \
 Error provides a procedural interface to exception handling. \
 Secondly Error is a base class for errors/exceptions that can \
 either be thrown, for subsequent catch, or can simply be recorded."
-
+HOMEPAGE = "https://bitbucket.org/shlomif/perl-error.pm"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
@@ -11,20 +11,34 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
 DEPENDS += "perl"
 
+RDEPENDS_${PN} += " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-scalar-util \
+    perl-module-overload \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-base \
+    perl-module-file-spec \
+    perl-module-io-handle \
+    perl-module-ipc-open3 \
+    perl-module-lib \
+    perl-module-test-more \
+"
+
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0dcd94640f617df02b6d6c1e4e92018c"
-SRC_URI[sha256sum] = "37590a962cd73ae03470e1ff16459a6cbc5273fc57626b8981dab9c2433155d9"
+SRC_URI[md5sum] = "4ef9b2890fb144d804527ba32573dd56"
+SRC_URI[sha256sum] = "07b2ac8275dfa04144745a6c1900a596280f862b97d22bab0c5ce02682ebd3be"
 
 S = "${WORKDIR}/Error-${PV}"
 
 inherit cpan ptest-perl
 
-do_compile() {
-	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
-	cpan_do_compile
-}
-
 do_install_prepend() {
 	# test requires "-T" (taint) command line option
 	rm -rf ${B}/t/pod-coverage.t
-- 
2.19.2


