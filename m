Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED29A7622A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:59:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6TLxv0R024215
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:59:57 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 29 Jul 2015 14:59:39 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 14:59:57 -0700
Message-ID: <1438207197-1793-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1][v2] nss: advance to version 3.19.1
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
X-List-Received-Date: Wed, 29 Jul 2015 21:59:59 -0000
Content-Type: text/plain

Picks up fixes for CVE-2015-2721 and CVE-2015-2730.  Specify previously
overlooked license file COPYING.  Fold nss.inc into recipe.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/nss/nss_3.17.3.bb             |    7 -------
 .../recipes-support/nss/{nss.inc => nss_3.19.1.bb} |   14 ++++++++++----
 2 files changed, 10 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss_3.17.3.bb
 rename meta/recipes-support/nss/{nss.inc => nss_3.19.1.bb} (93%)

diff --git a/meta/recipes-support/nss/nss_3.17.3.bb b/meta/recipes-support/nss/nss_3.17.3.bb
deleted file mode 100644
index e7d0780..0000000
--- a/meta/recipes-support/nss/nss_3.17.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require nss.inc
-
-SRC_URI += "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_3_RTM/src/${BP}.tar.gz \
-"
-SRC_URI[md5sum] = "fba7489e1b26f2a0bfe5527430fd61e1"
-SRC_URI[sha256sum] = "f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5"
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss_3.19.1.bb
similarity index 93%
rename from meta/recipes-support/nss/nss.inc
rename to meta/recipes-support/nss/nss_3.19.1.bb
index 665e4e6..66b9d60 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss_3.19.1.bb
@@ -10,18 +10,23 @@ SECTION = "libs"
 
 LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
 
-LIC_FILES_CHKSUM = "file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
-                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc859"
+LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
+                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
 SRC_URI = "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_1_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
-"
-SRC_URI_append = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
+
+SRC_URI[md5sum] = "68a9c01c987b9bd92066b4e0041f3e58"
+SRC_URI[sha256sum] = "b7be709551ec13206d8e3e8c065b894fa981c11573115e9478fa051029c52fff"
+
 inherit siteinfo
 
 DEPENDS = "sqlite3 nspr zlib nss-native"
@@ -215,3 +220,4 @@ FILES_${PN}-dev = "\
 # FILES_${PN}-dbg is populated automatically
 
 BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.9.5


