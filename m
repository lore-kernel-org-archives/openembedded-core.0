Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8p-000071-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:12 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mi020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:08:58 -0700
Message-Id: <b2e18527dbbf1d99d64cdb08dee1d9764cac2a14.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
Subject: [PATCH 3/5] perl-native: Add a perl-native wrapper in the normal bindir
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
X-List-Received-Date: Wed, 20 Jul 2011 20:13:12 -0000

We need this to allow for scripts to do #!/usr/bin/env perl-native
and not require an 'inherit perlnative' per user of a package.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/perl/perl-native_5.12.3.bb |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index 63f7e13..945ebd4 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -102,3 +102,18 @@ do_install () {
 	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
 	create_wrapper ${D}${bindir}/perl${PV} PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
 }
+
+SYSROOT_PREPROCESS_FUNCS += "perl_sysroot_create_wrapper"
+
+perl_sysroot_create_wrapper () {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	# Create a wrapper that /usr/bin/env perl will use to get perl-native.
+	# This MUST live in the normal bindir.
+	cat > ${SYSROOT_DESTDIR}${bindir}/../nativeperl << EOF
+#!/bin/sh
+realpath=\`readlink -fn \$0\`
+exec \`dirname \$realpath\`/perl-native/perl "\$@"
+EOF
+	chmod 0755 ${SYSROOT_DESTDIR}${bindir}/../nativeperl
+	cat ${SYSROOT_DESTDIR}${bindir}/../nativeperl
+}
-- 
1.7.0.4



