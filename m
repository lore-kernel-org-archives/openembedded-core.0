Return-Path: <denys.zagorui@globallogic.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71D6271B04
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:11:55 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id v20so17195006lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=fOg2u7jZj62LBNkqiLIVA/KiQ3EFKGj2aY4jwqCD3xg=;
	b=CcgltnaPJ6/CFazBJq//hrmteKEcUT4ZhXQ6ysFvmiQNu5gZYgUEn5zeNE1tKGZXUw
	Cd589kQ84heo9HiQ550LWLMjil6Q5rPL6LEJy5SzkYDhtmrY//SYUZZiwwpt/z0czqvi
	u4ihrqV9st9Jak6HtONBJMAoMtnZGRMma8u48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fOg2u7jZj62LBNkqiLIVA/KiQ3EFKGj2aY4jwqCD3xg=;
	b=clZgDfE6zUk8YxY2n3thKtkfdijMaJsht6laZc4aZCAouL5byNBuI62h/EwDjQXwou
	UCpK5Qrxff4P+Sdxwsm/nbc5w1/SfLMbiIo4nEU6NB2u5Di9lTp2sn+ZnovWNwRcBnNP
	9oTvvWGOZEQ7YVrHuML7dwwECZfmNIE9+fO0mD4yhD/PD5ITJiEWCULmZ3zN35NaqW44
	6B/Nl9AgchZc4HxVv26gv90C2vJtuWcsxBVT2QdoCeplrnAMCU/BKh2ADk3q1k2ZNuUA
	+se79t0UZ8lcA+JQS+UXvQrZZlTOnBRZkk2mCJhuUTDXnEjs7AUvYHZE39L0qTf+KY3l
	WPqw==
X-Gm-Message-State: AODbwcBvWuzYG6UoeT456Hr7gJLnOcuhK6R1GjrcakibsP1FlhGG4Fc4
	8pMjeUE5CGN9NxzQD8POAQ==
X-Received: by 10.46.22.66 with SMTP id 2mr7631654ljw.35.1496923915763;
	Thu, 08 Jun 2017 05:11:55 -0700 (PDT)
Received: from kbp1-ldl-f65370.synapse.com ([195.238.92.168])
	by smtp.gmail.com with ESMTPSA id
	i127sm989761lfg.40.2017.06.08.05.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 05:11:55 -0700 (PDT)
From: Denys Zagorui <denys.zagorui@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 15:11:39 +0300
Message-Id: <1496923899-18870-1-git-send-email-denys.zagorui@globallogic.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] gzip: add ptest
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
X-List-Received-Date: Thu, 08 Jun 2017 12:11:57 -0000

Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
---
 ...eturns_-rather-than-explicit-comparison-w.patch | 48 +++++++++++++++++++
 .../0002-gzip-port-zdiff-zless-to-Busybox.patch    | 55 ++++++++++++++++++++++
 meta/recipes-extended/gzip/files/run-ptest         |  6 +++
 meta/recipes-extended/gzip/gzip_1.8.bb             | 20 +++++++-
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gzip/files/0001-maint-use-returns_-rather-than-explicit-comparison-w.patch
 create mode 100644 meta/recipes-extended/gzip/files/0002-gzip-port-zdiff-zless-to-Busybox.patch
 create mode 100644 meta/recipes-extended/gzip/files/run-ptest

diff --git a/meta/recipes-extended/gzip/files/0001-maint-use-returns_-rather-than-explicit-comparison-w.patch b/meta/recipes-extended/gzip/files/0001-maint-use-returns_-rather-than-explicit-comparison-w.patch
new file mode 100644
index 0000000..e5e8dca
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/0001-maint-use-returns_-rather-than-explicit-comparison-w.patch
@@ -0,0 +1,48 @@
+From 9994edfb55cc58c02e4a4b7308a3f514fd971d96 Mon Sep 17 00:00:00 2001
+From: Jim Meyering <meyering@fb.com>
+Date: Sun, 30 Oct 2016 12:16:42 -0700
+Subject: [PATCH 1/2] maint: use "returns_" rather than explicit comparison
+ with "$?"
+
+* tests/zdiff: Use "returns_ 1" rather than testing $? = 1.
+* tests/hufts: Likewise.
+* tests/timestamp: Likewise, but s/1/2/.
+
+[Denys Zagorui <denys.zagorui@globallogic.com>] remove part of
+this patch that applied to tests/timestamp (not exist)
+---
+ tests/hufts | 3 +--
+ tests/zdiff | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/tests/hufts b/tests/hufts
+index 5832a21..1793b89 100755
+--- a/tests/hufts
++++ b/tests/hufts
+@@ -23,8 +23,7 @@ printf '\n...: invalid compressed data--format violated\n' > exp \
+   || framework_failure_
+
+ fail=0
+-gzip -dc "$abs_srcdir/hufts-segv.gz" > out 2> err
+-test $? = 1 || fail=1
++returns_ 1 gzip -dc "$abs_srcdir/hufts-segv.gz" > out 2> err || fail=1
+
+ compare /dev/null out || fail=1
+
+diff --git a/tests/zdiff b/tests/zdiff
+index 0bb7c7d..eee47b3 100755
+--- a/tests/zdiff
++++ b/tests/zdiff
+@@ -32,8 +32,7 @@ cat <<EOF > exp
+ EOF
+
+ fail=0
+-zdiff a.gz b.gz > out 2>&1
+-test $? = 1 || fail=1
++returns_ 1 zdiff a.gz b.gz > out 2>&1 || fail=1
+
+ compare exp out || fail=1
+
+--
+1.9.1
+
diff --git a/meta/recipes-extended/gzip/files/0002-gzip-port-zdiff-zless-to-Busybox.patch b/meta/recipes-extended/gzip/files/0002-gzip-port-zdiff-zless-to-Busybox.patch
new file mode 100644
index 0000000..6ae1809
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/0002-gzip-port-zdiff-zless-to-Busybox.patch
@@ -0,0 +1,55 @@
+From 2c3577657e79445493211d7f58a6038b672e4f62 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 13 Mar 2017 16:35:55 -0700
+Subject: [PATCH 2/2] gzip: port zdiff, zless to Busybox
+
+Problem reported by Denys Zagorui (Bug#26088).
+* tests/zdiff: Check that diff uses POSIX-format output.
+* zless.in (less_version): Don't exit merely because 'less -V'
+fails; instead, assume 'less' is compatible with an old version of
+the original 'less'.  Busybox 'less -V' fails, but apparently its
+'less' works anyway somehow.
+---
+ tests/zdiff | 4 +++-
+ zless.in    | 2 +-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tests/zdiff b/tests/zdiff
+index eee47b3..944e4c4 100755
+--- a/tests/zdiff
++++ b/tests/zdiff
+@@ -22,7 +22,6 @@
+
+ echo a > a || framework_failure_
+ echo b > b || framework_failure_
+-gzip a b || framework_failure_
+
+ cat <<EOF > exp
+ 1c1
+@@ -31,7 +30,10 @@ cat <<EOF > exp
+ > b
+ EOF
+
++diff a b | diff exp - || skip_ "diff output format is incompatible with POSIX"
++
+ fail=0
++gzip a b || fail=1
+ returns_ 1 zdiff a.gz b.gz > out 2>&1 || fail=1
+
+ compare exp out || fail=1
+diff --git a/zless.in b/zless.in
+index e634af6..9759ae6 100644
+--- a/zless.in
++++ b/zless.in
+@@ -47,7 +47,7 @@ if test "${LESSMETACHARS+set}" != set; then
+   export LESSMETACHARS
+ fi
+
+-less_version=`less -V` || exit
++less_version=`less -V 2>/dev/null`
+ case $less_version in
+ less' '45[1-9]* | \
+ less' '4[6-9][0-9]* | \
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
index 11be846..ab467be 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -2,7 +2,10 @@ require gzip.inc
 
 LICENSE = "GPLv3+"
 
-SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
+            file://0001-maint-use-returns_-rather-than-explicit-comparison-w.patch \
+            file://0002-gzip-port-zdiff-zless-to-Busybox.patch \
+            file://run-ptest"
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -12,6 +15,21 @@ PROVIDES_append_class-native = " gzip-replacement-native"
 
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


