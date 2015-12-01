Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B178660616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 02:13:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB12Dr9J010289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 18:13:53 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 Nov 2015 18:13:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 10:13:55 +0800
Message-ID: <cda0cbdd8370c8b4bc04730d4285d1c57efa8bb9.1448935983.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448935983.git.Qi.Chen@windriver.com>
References: <cover.1448935983.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cpio: fix test case of symlink-bad-length
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
X-List-Received-Date: Tue, 01 Dec 2015 02:13:53 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-fix-testcase-of-symlink-bad-length.patch  | 57 ++++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch b/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
new file mode 100644
index 0000000..642f557
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+
+Subject: fix testcase of symlink-bad-length
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/symlink-bad-length.at | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
+index 74208ce..11fc6ce 100644
+--- a/tests/symlink-bad-length.at
++++ b/tests/symlink-bad-length.at
+@@ -1,5 +1,5 @@
+ # Process this file with autom4te to create testsuite.  -*- Autotest -*-
+-# Copyright (C) 2014 Free Software Foundation, Inc.
++# Copyright (C) 2014-2015 Free Software Foundation, Inc.
+ 
+ # This program is free software; you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
+@@ -35,14 +35,30 @@ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
+ AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
+ ])
+ 
++# The exact error message and exit status depend on the host architecture,
++# therefore strderr is filtered out and error code is not checked.
++
++# So far the only case when cpio would exit with code 0 is when it skips
++# several bytes and encounters a valid record header.  Perhaps it should
++# exit with code 2 (non-critical error), if at least one byte was skipped,
++# but that could hurt backward compatibility.
++
+ AT_CHECK([
+ base64 -d ARCHIVE.base64 > ARCHIVE || AT_SKIP_TEST
+-cpio -ntv < ARCHIVE
+-test $? -eq 2
++TZ=UTC cpio -ntv < ARCHIVE 2>stderr 
++cat stderr | grep -v \
++    -e 'stored filename length is out of range' \
++    -e 'premature end of file' \
++    -e 'archive header has reverse byte-order' \
++    -e 'memory exhausted' \
++    -e 'skipped [[0-9][0-9]*] bytes of junk' \
++    -e '[[0-9][0-9]*] block' \
++    >&2
++echo >&2 STDERR
+ ],
+ [0],
+ [-rw-rw-r--   1 10029    10031          13 Nov 25  2014 FILE
+-],[cpio: premature end of file
++],[STDERR
+ ])
+ 
+ AT_CLEANUP
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 3df1cd5..9a6a50e 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://remove-gets.patch \
         file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
         file://Fix-symlink-bad-length-test-for-64-bit-architectures.patch \
         file://fix-testcase-symlink-bad-lengths.patch \
+        file://0001-fix-testcase-of-symlink-bad-length.patch \
         "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-- 
1.9.1


