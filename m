Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 498D2601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 07:07:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5G77T3M027205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 00:07:29 -0700 (PDT)
Received: from obsrwr.corp.ad.wrs.com (128.224.124.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 00:07:28 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jun 2016 10:07:14 +0300
Message-ID: <1466060834-19849-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] squid: don't build squid-conf-tests binary
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
X-List-Received-Date: Thu, 16 Jun 2016 07:07:29 -0000
Content-Type: text/plain

autotools ends up stripping this binary which ends up causing
QA Errors at do_package. Remove it.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 ...squid-don-t-build-squid-conf-tests-binary.patch | 30 ++++++++++++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch

diff --git a/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch b/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch
new file mode 100644
index 0000000..82cd0b0
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-squid-don-t-build-squid-conf-tests-binary.patch
@@ -0,0 +1,30 @@
+From 75f4072e6fc9704713629c87eec750ff708135c4 Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <alexandru.moise@windriver.com>
+Date: Thu, 16 Jun 2016 10:01:41 +0300
+Subject: [PATCH] squid: don't build squid-conf-tests binary
+
+autotools ends up stripping this binary which ends up causing
+QA Errors at do_package. Remove it.
+
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+---
+ test-suite/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
+index b9c412d..0471bf0 100644
+--- a/test-suite/Makefile.am
++++ b/test-suite/Makefile.am
+@@ -43,8 +43,7 @@ TESTS += debug \
+ 	MemPoolTest\
+ 	mem_node_test\
+ 	mem_hdr_test\
+-	$(ESI_TESTS) \
+-	squid-conf-tests
++	$(ESI_TESTS)
+ 
+ ## Sort by alpha - any build failures are significant.
+ check_PROGRAMS += debug \
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
index b571e29..2d243fb 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.7.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://volatiles.03_squid \
            file://CVE-2016-3947.patch \
            file://CVE-2016-4553.patch \
+           file://0001-squid-don-t-build-squid-conf-tests-binary.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
-- 
2.7.4


