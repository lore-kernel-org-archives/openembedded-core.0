Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3E537D30C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 03:08:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3H385CR002792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 20:08:22 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 16 Apr 2019 20:08:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 11:18:51 +0800
Message-ID: <673566f129a6a14962aa4bfd86edf728891fe9c6.1555471115.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1555471115.git.Qi.Chen@windriver.com>
References: <cover.1555471115.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: fix ptest failure about 'dc'
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
X-List-Received-Date: Wed, 17 Apr 2019 03:08:31 -0000
Content-Type: text/plain

Fix the following two failure of busybox ptest:

  FAIL: dc read
  FAIL: dc read string

These two test cases relies on the functionalities enabled by
CONFIG_FEATURE_DC_BIG.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ix-two-test-case-to-also-depend-on-DC_BIG.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.30.1.bb        |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch b/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
new file mode 100644
index 0000000..d22db4a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
@@ -0,0 +1,39 @@
+From a4e03fbb4d82f91069d96005405f89c45b8fd157 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 17 Apr 2019 09:24:37 +0800
+Subject: [PATCH] dc.tests: fix two test case to also depend on DC_BIG
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2019-April/087205.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/dc.tests | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testsuite/dc.tests b/testsuite/dc.tests
+index 1708a48..8c3af41 100755
+--- a/testsuite/dc.tests
++++ b/testsuite/dc.tests
+@@ -41,6 +41,9 @@ testing "dc complex without spaces (multiple args)" \
+ 	"16\n" \
+ 	"" ""
+ 
++optional FEATURE_DC_BIG
++# All tests below depend on FEATURE_DC_BIG
++
+ testing "dc read" \
+ 	"dc -finput" \
+ 	"2\n9\n1\n" \
+@@ -51,9 +54,6 @@ testing "dc read string" \
+ 	"2\nstr\n1\n" \
+ 	"1?2\nf" "[str]\n"
+ 
+-optional FEATURE_DC_BIG
+-# All tests below depend on FEATURE_DC_BIG
+-
+ testing "dc '>a' (conditional execute string) 1" \
+ 	"dc" \
+ 	"1\n9\n" \
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.30.1.bb b/meta/recipes-core/busybox/busybox_1.30.1.bb
index 164f3ab..ba76755 100644
--- a/meta/recipes-core/busybox/busybox_1.30.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.30.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
+           file://0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


