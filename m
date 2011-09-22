Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6YQR-0001Bm-Iq
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 03:50:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8M1imFr011003
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:44:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 21 Sep 2011 18:44:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 20:47:03 -0500
Message-ID: <6ee052f54df893132cc9c8dc1c6dedd7515eb3af.1316655855.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316655855.git.mark.hatle@windriver.com>
References: <cover.1316655855.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6] perl: Fix a few perl binaries to use target interpreter paths
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
X-List-Received-Date: Thu, 22 Sep 2011 01:50:08 -0000
Content-Type: text/plain

A small number of target installed programs, "${bindir}/pod*",
were incorrectly using the perl-native paths to access perl.  This
caused a dependency failure during RPM rootfs install, and also
prevented those specific components from functioning.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.12.3.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index d286564..e4769a4 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r4"
+PR = "r5"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -216,9 +216,17 @@ perl_package_preprocess () {
                -e "s,${STAGING_LIBDIR},${libdir},g" \
                -e "s,${STAGING_BINDIR},${bindir},g" \
                -e "s,${STAGING_INCDIR},${includedir},g" \
+               -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
             ${PKGD}${bindir}/h2xs \
             ${PKGD}${bindir}/h2ph \
+            ${PKGD}${bindir}/pod2html \
+            ${PKGD}${bindir}/pod2latex \
+            ${PKGD}${bindir}/pod2man \
+            ${PKGD}${bindir}/pod2text \
+            ${PKGD}${bindir}/pod2usage \
+            ${PKGD}${bindir}/podchecker \
+            ${PKGD}${bindir}/podselect \
             ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
             ${PKGD}${libdir}/perl/${PV}/cacheout.pl \
             ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
-- 
1.7.3.4



