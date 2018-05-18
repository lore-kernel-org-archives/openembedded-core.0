Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B78E74825
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 08:42:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4I8goHw009366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 01:42:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 01:42:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2018 16:42:48 +0800
Message-ID: <1526632968-107460-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gmp: do the multilib_header magic for gmp.h
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
X-List-Received-Date: Fri, 18 May 2018 08:42:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Add multilib support feature for this recipe

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/gmp/gmp.inc      | 2 +-
 meta/recipes-support/gmp/gmp_6.1.2.bb | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index abac8cf..948b892 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GMP is a free library for arbitrary precision arithmetic, operati
 HOMEPAGE = "http://gmplib.org/"
 SECTION = "devel"
 
-inherit autotools texinfo
+inherit autotools texinfo multilib_header
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
diff --git a/meta/recipes-support/gmp/gmp_6.1.2.bb b/meta/recipes-support/gmp/gmp_6.1.2.bb
index b008710..c745dbb 100644
--- a/meta/recipes-support/gmp/gmp_6.1.2.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.2.bb
@@ -25,6 +25,10 @@ EXTRA_OECONF_mipsarchr6_append = " --disable-assembly"
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
 
+do_install_append() {
+	oe_multilib_header gmp.h
+}
+
 do_install_prepend_class-target() {
         sed -i \
         -e "s|--sysroot=${STAGING_DIR_HOST}||g" \
-- 
2.7.4


