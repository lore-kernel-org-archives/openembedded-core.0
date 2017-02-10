Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D23077240
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NOrT003830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:13 -0800
Message-ID: <b428fd8f645f3accb7edfcbf288a7702fa044c1b.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] strace: fix gawk's path
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:23 -0000
Content-Type: text/plain

Fixed:
strace-4.15: /usr/lib/strace/ptest/tests/caps-abbrev.awk contained in package strace-ptest requires /bin/gawk, but no providers found in RDEPENDS_strace-ptest? [file-rdeps]

The path should be /usr/bin/gawk as other scripts use in this package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     | 49 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.15.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
new file mode 100644
index 00000000000..4f13706161d
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
@@ -0,0 +1,49 @@
+From 83757523c50748ea845c1e220b1c3b2080d3cc49 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 9 Feb 2017 01:27:49 -0800
+Subject: [PATCH] caps-abbrev.awk: fix gawk's path
+
+It should be /usr/bin/gawk as other scripts use in this package.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tests-m32/caps-abbrev.awk  | 2 +-
+ tests-mx32/caps-abbrev.awk | 2 +-
+ tests/caps-abbrev.awk      | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
+index 86de7f2..0535cac 100644
+--- a/tests-m32/caps-abbrev.awk
++++ b/tests-m32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
+index 86de7f2..0535cac 100644
+--- a/tests-mx32/caps-abbrev.awk
++++ b/tests-mx32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
+index 86de7f2..0535cac 100644
+--- a/tests/caps-abbrev.awk
++++ b/tests/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/strace/strace_4.15.bb b/meta/recipes-devtools/strace/strace_4.15.bb
index 2b9d19a42b8..c5983e9c394 100644
--- a/meta/recipes-devtools/strace/strace_4.15.bb
+++ b/meta/recipes-devtools/strace/strace_4.15.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            file://mips-SIGEMT.patch \
+           file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            "
 
 SRC_URI[md5sum] = "1ff96209fec19914c920608ed0791864"
-- 
2.11.0.rc2.dirty


