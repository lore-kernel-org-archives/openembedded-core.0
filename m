Return-Path: <denys.zagorui@globallogic.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id D7B327827D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:58:59 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id v20so19180075lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=2cs6Ha0xUe+XPE1mhUirrMScKCspt8dPYMKxNxk8Cls=;
	b=TOXxF/40NORQTmpNQG0FDxM92IBxHl3Pr+ZZcoNzlN28bKRghiIqZX5o7Mt6gCOktB
	WN+P+PCpXNaJgGJ3CKMDyrmL4ci4zfO4NcZr4Obkq7rrfMIZ2vXLxcU9yIalV5bWuCuW
	CfPgYLHDWRthp9Pu1xSyEU5hHT6g/ggAV43pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2cs6Ha0xUe+XPE1mhUirrMScKCspt8dPYMKxNxk8Cls=;
	b=cMoEmJkY16NmLOpmfdIZxBscaYO0ClEXqu960+Ilpawy2Hb3Uc/XfOapwh5Z2tzhwB
	BR1bO3SzfeIPEUbfMwFWuIXq185Fe7I8fdvNAvWnBBWeBESiQc7nTVPu/go4BXt0cx7t
	dn8mmJJOorGTzrI3cUjGeyDPV+G3Xd46OTZHTbkWV51GCBl3sNvcVUmsTvXhP1nANpEk
	bFavY8aQSQH3UEVIKrMLBSD76dag5vgGGiWUZ05kWr3okDVEN/F18SED2rB8pemZfglR
	Tk94wZEiGtsXAMjI8LoT9LKGy0C8l9DBCDJDXcy18YAptZEDz5FtynP8AJF8TD4Wm3w8
	qApg==
X-Gm-Message-State: AODbwcD1d7PqRKMWxlOdK+sKrYu4yramWmKYj6V3CXr8Yg0hGD6N8Gse
	/2el7RkyhSMGePdQ0ZonEw==
X-Received: by 10.46.20.73 with SMTP id 9mr1599151lju.51.1496933939616;
	Thu, 08 Jun 2017 07:58:59 -0700 (PDT)
Received: from kbp1-ldl-f65370.synapse.com ([195.238.92.168])
	by smtp.gmail.com with ESMTPSA id w2sm1080706ljd.52.2017.06.08.07.58.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 07:58:58 -0700 (PDT)
From: Denys Zagorui <denys.zagorui@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 17:58:52 +0300
Message-Id: <1496933932-11914-1-git-send-email-denys.zagorui@globallogic.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v6] gzip: add ptest
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
X-List-Received-Date: Thu, 08 Jun 2017 14:59:00 -0000

Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
---
 .../0001-gzip-port-zdiff-zless-to-Busybox.patch    | 59 ++++++++++++++++++++++
 meta/recipes-extended/gzip/files/run-ptest         |  6 +++
 meta/recipes-extended/gzip/gzip_1.8.bb             | 20 +++++++-
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
 create mode 100644 meta/recipes-extended/gzip/files/run-ptest

diff --git a/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch b/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
new file mode 100644
index 0000000..20d5a19
--- /dev/null
+++ b/meta/recipes-extended/gzip/files/0001-gzip-port-zdiff-zless-to-Busybox.patch
@@ -0,0 +1,59 @@
+From 5f712621829ed81a758077431226a86df37fbc3b Mon Sep 17 00:00:00 2001
+From: Denys Zagorui <denys.zagorui@globallogic.com>
+Date: Thu, 8 Jun 2017 16:05:50 +0300
+Subject: [PATCH] gzip: port zdiff, zless to Busybox
+
+Problem reported by Denys Zagorui (Bug#26088).
+* tests/zdiff: Check that diff uses POSIX-format output.
+* zless.in (less_version): Don't exit merely because 'less -V'
+fails; instead, assume 'less' is compatible with an old version of
+the original 'less'.  Busybox 'less -V' fails, but apparently its
+'less' works anyway somehow.
+
+Signed-off-by: Denys Zagorui <denys.zagorui@globallogic.com>
+
+Upstream-Status: Accepted
+---
+ tests/zdiff | 4 +++-
+ zless.in    | 2 +-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tests/zdiff b/tests/zdiff
+index 0bb7c7d..9cd4fd4 100755
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
+ zdiff a.gz b.gz > out 2>&1
+ test $? = 1 || fail=1
+ 
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
index 11be846..a0dec14 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -2,7 +2,9 @@ require gzip.inc
 
 LICENSE = "GPLv3+"
 
-SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
+            file://0001-gzip-port-zdiff-zless-to-Busybox.patch \
+            file://run-ptest"
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -12,6 +14,22 @@ PROVIDES_append_class-native = " gzip-replacement-native"
 
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
+            -e 's/^GREP = ..*/GREP = grep/'             \
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


