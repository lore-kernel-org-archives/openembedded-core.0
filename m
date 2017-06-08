Return-Path: <denys.zagorui@globallogic.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7A97278203
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:42:17 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id p189so18211607lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=PIEzv/By33kjR9gwVmesq8sRSCs+N1IxnwZKuCLrn0A=;
	b=SxHOIHqg+Z9IiiE0N9392LahtGIs7+NUNefZv1THHQw+Ud0h4DmlodhiBoH5M6bvKz
	jueUZ5Nr1glk0ItHJCEQH8rSJPsp62oyfNeuNJqs85yD7RDMZzqo+HsuSupcSU8NYrC8
	Wt0XF6HnYqvykITNUsyKRN68E+eR9ixVhkl4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PIEzv/By33kjR9gwVmesq8sRSCs+N1IxnwZKuCLrn0A=;
	b=iA/uQMMdoGEgJcU0WXi4caDuvMsBUq5VPcBhAi8YrsxXk9jzPuNMAS2VTGwZnwifkb
	wiaDw1sLxQOTD0qjXFujfcocq3ywCiDhNWgbCp7Y1OlvnUILHiCKAHPk6ptcwMNLDgC2
	1vSgk3ZPlUs+n/qZj89H79JAxaZTKFK2ZwQlzT5r3y4rm3qq3OyYmDMQsQygnuT75APk
	nqdSkvPtf1ejtBhd6mNYJ8VHh6PU9t4dXQD3gmNRzWfUv5OqEYQuj+6bJH2tdC5tAqSq
	d1+d8j3DWv831LPXRdy+ryRdxK22ZPOETdfOkdFqoREflfZf3yt6TTHmhDMxBAXB+Uu+
	oN0w==
X-Gm-Message-State: AODbwcCfqzNl8rS2bU93jshAFCK8IF6ZrLjW27QXLySUYGMC29bV9avr
	Mr9h4hU7VagmE0cj+5rR/w==
X-Received: by 10.46.20.76 with SMTP id 12mr11570753lju.11.1496929338001;
	Thu, 08 Jun 2017 06:42:18 -0700 (PDT)
Received: from kbp1-ldl-f65370.synapse.com ([195.238.92.168])
	by smtp.gmail.com with ESMTPSA id
	h10sm1036501ljb.50.2017.06.08.06.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 06:42:17 -0700 (PDT)
From: Denys Zagorui <denys.zagorui@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 16:42:02 +0300
Message-Id: <1496929322-29788-1-git-send-email-denys.zagorui@globallogic.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v4] gzip: add ptest
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
X-List-Received-Date: Thu, 08 Jun 2017 13:42:21 -0000

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


