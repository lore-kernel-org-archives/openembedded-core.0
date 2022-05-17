Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430BFC4321E
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:17:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.4715.1652775412324686588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24H8Gm07031049
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24H8Gb37011459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:42 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 01:16:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 01:16:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 01:16:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH 3/7] python3-aspectlib: move from meta-python
Date: Tue, 17 May 2022 16:16:29 +0800
Message-ID: <20220517081633.2992360-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517081633.2992360-1-mingli.yu@windriver.com>
References: <20220516104506.3d383183@melee>
 <20220517081633.2992360-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165717

From: Mingli Yu <mingli.yu@windriver.com>

aspectlib is an aspect-oriented programming, monkey-patch and
decorators library. It is useful when changing behavior in
existing code is desired. It includes tools for debugging and
testing: simple mock/record and a complete capture/replay
framework.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve-tornado-6-test-constraint.-Ref-15.patch | 45 +++++++++++++++++++
 .../python/python3-aspectlib/run-ptest        |  3 ++
 .../python/python3-aspectlib_1.5.2.bb         | 29 ++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
 create mode 100644 meta/recipes-devtools/python/python3-aspectlib/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-aspectlib_1.5.2.bb

diff --git a/meta/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch b/meta/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
new file mode 100644
index 0000000000..174f088e9e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-aspectlib/0001-Remove-tornado-6-test-constraint.-Ref-15.patch
@@ -0,0 +1,45 @@
+From d3ae6ac951cc5bbce29b9c987741e0a557c9b777 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ionel=20Cristian=20M=C4=83rie=C8=99?= <contact@ionelmc.ro>
+Date: Sun, 2 May 2021 09:50:43 +0300
+Subject: [PATCH] Remove tornado<6 test constraint. Ref #15.
+
+Upstream-Status: Backport [https://github.com/ionelmc/python-aspectlib/commit/7dccb198dfb426f529b81a28a755f3c02f8b50cb]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_integrations_py3.py | 5 ++++-
+ tox.ini                        | 3 ++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_integrations_py3.py b/tests/test_integrations_py3.py
+index e025eac..596589d 100644
+--- a/tests/test_integrations_py3.py
++++ b/tests/test_integrations_py3.py
+@@ -36,7 +36,10 @@ def test_decorate_tornado_coroutine():
+     @gen.coroutine
+     @debug.log(print_to=buf, module=False, stacktrace=2, result_repr=repr)
+     def coro():
+-        yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
++        if hasattr(gen, 'Task'):
++            yield gen.Task(loop.add_timeout, timedelta(microseconds=10))
++        else:
++            yield gen.sleep(0.01)
+         return "result"
+ 
+     loop = ioloop.IOLoop.current()
+diff --git a/tox.ini b/tox.ini
+index 8c607de..08c31b3 100644
+--- a/tox.ini
++++ b/tox.ini
+@@ -55,7 +55,8 @@ deps =
+     pytest-clarity
+     pytest-cov
+     pytest-travis-fold
+-    tornado<6.0
++    six
++    tornado
+ commands =
+     {posargs:pytest --cov --cov-report=term-missing -vv --ignore=src}
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/python/python3-aspectlib/run-ptest b/meta/recipes-devtools/python/python3-aspectlib/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-aspectlib/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta/recipes-devtools/python/python3-aspectlib_1.5.2.bb
new file mode 100644
index 0000000000..0cbeca21c7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-aspectlib_1.5.2.bb
@@ -0,0 +1,29 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "``aspectlib`` is an aspect-oriented programming, monkey-patch and decorators library. It is useful when changing"
+HOMEPAGE = "https://github.com/ionelmc/python-aspectlib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d58b3f20fd10347a9458b8a03793b62e"
+
+SRC_URI[sha256sum] = "d275ec82c4c2712e564bb760e4accff8f061f648e38774feabeb8b241cf3a4aa"
+
+inherit ptest pypi setuptools3
+
+SRC_URI += "file://run-ptest \
+            file://0001-Remove-tornado-6-test-constraint.-Ref-15.patch \
+           "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}-ptest += "\
+    python3-tornado \
+    python3-process-tests \
+"
+
+RDEPENDS:${PN} += "python3-core python3-fields"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


