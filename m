Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3000AC4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:16:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4607.1652775410682549540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24H8Gmwo031048
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 01:16:38 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 01:16:37 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH 4/7] python3-py-cpuinfo: move from meta-python
Date: Tue, 17 May 2022 16:16:30 +0800
Message-ID: <20220517081633.2992360-4-mingli.yu@windriver.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:16:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165713

From: Mingli Yu <mingli.yu@windriver.com>

Py-cpuinfo gets CPU info with pure Python. Py-cpuinfo should
work without any extra programs or libraries, beyond what your
OS provides. It does not require any compilation(C/C++, assembly,
et cetera) to use. It works with Python 2 and 3.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-py-cpuinfo/run-ptest       |  3 +++
 .../python/python3-py-cpuinfo_8.0.0.bb        | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-py-cpuinfo/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb

diff --git a/meta/recipes-devtools/python/python3-py-cpuinfo/run-ptest b/meta/recipes-devtools/python/python3-py-cpuinfo/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-py-cpuinfo/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb b/meta/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
new file mode 100644
index 0000000000..6de2f17459
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-py-cpuinfo_8.0.0.bb
@@ -0,0 +1,27 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Get CPU info with pure Python 2 & 3"
+HOMEPAGE = "https://github.com/workhorsy/py-cpuinfo"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b0b97c022f12b14d9e02de0b283ee9e9"
+
+SRC_URI[sha256sum] = "5f269be0e08e33fd959de96b34cd4aeeeacac014dd8305f70eb28d06de2345c5"
+
+inherit ptest pypi setuptools3
+
+SRC_URI += "file://run-ptest \
+           "
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+"
+
+RDEPENDS:${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-io python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


