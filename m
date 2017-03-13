Return-Path: <denys.zagorui@globallogic.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB36B730E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 16:37:35 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id y193so65974226lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=hMEPYcj9cMrA3Yqe08NU0emYA8sqCqDI7x6C4xAqJMU=;
	b=E7TUZe+Q7UOfKGQ0mUUEPAiHBtyJOg7JbFU2xfJ0RS36GXU2JP6bZw9TfTJtljptsa
	NUITRiDFwYSHiIMuuUjuWqVnCrHZBi3GbGeP7TjEL2dYdnf9dM9OW5bJABf9bJY4nXub
	L15/mz5oFaNVJ0QFtM0Gx4gFQgLcrcs9wvJ7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hMEPYcj9cMrA3Yqe08NU0emYA8sqCqDI7x6C4xAqJMU=;
	b=Lah5Qpwb240sVgZGXco0iecMVIQ4QowNjJRXEfMH7FbeF2EhQHaJvp4i8IanOcgFiN
	lZXIAkjS9RnEKfPcPTwJwwxSlrcnxR1JmY8k68OdzJY56I48CaASU7yK1Alfy6+Rt8RH
	VhsLk2JOI1Y/aFU3tILamnoHACpe3KKvmc+wPOcJPoHZaoZUFtfMadhAL7au+FFVVfEQ
	47UM1AjBdZCyvVyDhJmjiUqbkQ6E9XHXMOZ0xYDGoqsdEyne619h2wRSdji6u/NOdaU+
	nsd3/4dsPFRUquTRtjlPqdT1sLnCp6zhldo0aS3HZuHjYLMj+UYmPQtr8ATLfiRO/gUd
	Sr3g==
X-Gm-Message-State: AMke39m+IdKGd2scK3IQuAMBWWRcOuFQTqg9/ENqOwLKy95BuZzsR2ywFirGPXdkY1VM3/BH
X-Received: by 10.25.29.66 with SMTP id d63mr9211190lfd.163.1489423055031;
	Mon, 13 Mar 2017 09:37:35 -0700 (PDT)
Received: from kbp1-ldl-f65370.synapse.com ([195.238.93.36])
	by smtp.gmail.com with ESMTPSA id
	t19sm3644627ljd.30.2017.03.13.09.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Mar 2017 09:37:34 -0700 (PDT)
From: Denys Zagorui <denys.zagorui@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 18:37:01 +0200
Message-Id: <1489423021-5195-1-git-send-email-denys.zagorui@globallogic.com>
X-Mailer: git-send-email 1.9.1
Cc: Denys Zagorui <denys.zagorui@globallogic.com>
Subject: [PATCH v2] gzip: add ptest
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
X-List-Received-Date: Mon, 13 Mar 2017 16:37:37 -0000

'zless' don't work with less from busybox. In this case test 'help-version'
fails. First of all 'zless' tries to figure out version of 'less' launching
'less -V', 'less' from busybox don't understand key -V. So 'zless' needs
to be fixed so that it can use 'less' from busybox.

'zdiff' test fixed so that it can use 'diff' from busybox
('diff' from busybox and 'diff' from diffutils has different output)

Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
---
 ...zdiff-add-diff-from-busybox-compatibility.patch | 40 ++++++++++++++++++++++
 meta/recipes-extended/gzip/files/run-ptest         |  6 ++++
 meta/recipes-extended/gzip/gzip_1.8.bb             | 19 +++++++++-
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gzip/files/0001-tests-zdiff-add-diff-from-busybox-compatibility.patch
 create mode 100644 meta/recipes-extended/gzip/files/run-ptest

diff --git a/meta/recipes-extended/gzip/files/0001-tests-zdiff-add-diff-from-busybox-compatibility.patch b/meta/recipes-extended/gzip/files/0001-tests-zdiff-add-diff-from-busybox-compatibility.patch
new file mode 100644
index 0000000..e64bf82
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/0001-tests-zdiff-add-diff-from-busybox-compatibility.patch
@@ -0,0 +1,40 @@
+From 93673d1bc2af38dec512b05bc6d9262c6b45b5ad Mon Sep 17 00:00:00 2001
+From: Denys Zagorui <denys.zagorui@globallogic.com>
+Date: Fri, 10 Mar 2017 22:59:48 +0200
+Subject: [PATCH] tests/zdiff: add diff from busybox compatibility.
+
+Diff from busybox has another output than diff from diffutils
+
+Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
+Upstream-Status: Pending
+---
+ tests/zdiff | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/tests/zdiff b/tests/zdiff
+index 7ed2f34..2567d1a 100755
+--- a/tests/zdiff
++++ b/tests/zdiff
+@@ -24,12 +24,13 @@ echo a > a || framework_failure_
+ echo b > b || framework_failure_
+ gzip a b || framework_failure_
+
+-cat <<EOF > exp
+-1c1
+-< a
+----
+-> b
+-EOF
++diff -v 2>&1 > /dev/null | grep BusyBox
++
++if [ $? == 0 ];then
++    echo -e '--- /dev/fd/5\n+++ -\n@@ -1 +1 @@\n-a\n+b' > exp
++else
++    echo -e '1c1\n< a\n---\n> b' >exp
++fi
+
+ fail=0
+ returns_ 1 zdiff a.gz b.gz > out 2>&1 || fail=1
+--
+1.9.1
+
diff --git a/meta/recipes-extended/gzip/files/run-ptest b/meta/recipes-extended/gzip/files/run-ptest
new file mode 100644
index 0000000..cf7c649
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+cd src/tests
+
+make check
+
diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb b/meta/recipes-extended/gzip/gzip_1.8.bb
index 11be846..a4a39a6 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -2,7 +2,9 @@ require gzip.inc
 
 LICENSE = "GPLv3+"
 
-SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
+            file://0001-tests-zdiff-add-diff-from-busybox-compatibility.patch \
+            file://run-ptest"
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -12,6 +14,21 @@ PROVIDES_append_class-native = " gzip-replacement-native"
 
 BBCLASSEXTEND = "native"
 
+inherit ptest
+
+do_install_ptest() {
+	mkdir -p ${D}${PTEST_PATH}/src/build-aux
+	cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/src/build-aux/
+	mkdir -p ${D}${PTEST_PATH}/src/tests
+	cp -r ${S}/tests/* ${D}${PTEST_PATH}/src/tests
+	sed -e 's/^abs_srcdir = ..*/abs_srcdir = \.\./' \
+            -e 's/^top_srcdir = ..*/top_srcdir = \.\./' \
+            -e 's/^AWK = ..*/AWK = awk/'                \
+            -e 's/^srcdir = ..*/srcdir = \./'           \
+            -e 's/^Makefile: ..*/Makefile: /'           \
+            ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
+}
+
 SRC_URI[md5sum] = "732553152814b22dc35aa0267df5286c"
 SRC_URI[sha256sum] = "1ff7aedb3d66a0d73f442f6261e4b3860df6fd6c94025c2cb31a202c9c60fe0e"
 
-- 
1.9.1


