Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A56D678412
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:56:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 08:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; d="scan'208";a="22121374"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2018 08:56:10 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 08:56:07 -0800
Message-Id: <1515344168-80832-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/2] perl-dbg: improve reproducibility
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
X-List-Received-Date: Sun, 07 Jan 2018 16:56:10 -0000

Remove various build host references scattered within
comments in numerous files that are distributed in the package.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 6b27b22..ab04624 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -188,6 +188,19 @@ do_compile() {
         oe_runmake perl LD="${CCLD}"
 }
 
+do_compile_append_class-target() {
+        # Remove build host references from numerous comments...
+        find "${S}/cpan/Encode" -type f \
+            \( -name '*.exh' -o -name '*.c' -o -name '*.h' \)\
+            -exec sed -i -e 's:${RECIPE_SYSROOT_NATIVE}::g' {} +
+        sed -i -e 's:${RECIPE_SYSROOT}::g' ${S}/perl.h ${S}/pp.h
+        sed -i -e 's:${RECIPE_SYSROOT_NATIVE}/usr/bin/perl-native/perl${PV}.real:/usr/bin/perl${PV}:g'  \
+            ${S}/cpan/Compress-Raw-Bzip2/constants.h \
+            ${S}/cpan/Compress-Raw-Zlib/constants.h \
+            ${S}/cpan/IPC-SysV/const-c.inc \
+            ${S}/dist/Time-HiRes/const-c.inc
+}
+
 do_install() {
 	#export hostperl="${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
 	oe_runmake install DESTDIR=${D}
-- 
2.7.4


